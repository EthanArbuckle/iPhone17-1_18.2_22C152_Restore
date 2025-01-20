@interface AMSUIMessageViewLayoutContext
- (AMSUIMessageView)messageView;
- (AMSUIMessageViewLayoutContext)initWithMessageView:(id)a3;
- (BOOL)_isAccessoryViewLeading;
- (BOOL)_isFooterButtonPartOfContentFrame;
- (BOOL)_isIconImageTopAligned;
- (BOOL)_isSymbolImage;
- (BOOL)_isTextOnlyBanner;
- (BOOL)_shouldOffsetFooterButtonFromMainContentView;
- (BOOL)_shouldTextViewTextFillUnderCloseButton;
- (BOOL)isDirty;
- (BOOL)isImageViewHidden;
- (BOOL)shouldUseStackedLayout;
- (CGRect)_effectiveTextViewFrame;
- (CGRect)accessorySecondaryViewFrame;
- (CGRect)accessoryViewFrame;
- (CGRect)debugButtonFrame;
- (CGRect)footerContainerViewFrame;
- (CGRect)imageViewFrame;
- (CGRect)lastMessageViewFrame;
- (CGRect)mainContentFrame;
- (CGRect)maskViewFrame;
- (CGRect)textViewFrame;
- (CGSize)_contentSizeThatFits:(CGRect)a3;
- (CGSize)_makeImageViewSize;
- (CGSize)contentSize;
- (CGSize)debugButtonSize;
- (CGSize)lastFittingSize;
- (CGSize)lastSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)textViewContentHuggingSize;
- (NSDirectionalEdgeInsets)contentLayoutMargins;
- (NSMutableArray)footerButtonFrames;
- (NSMutableArray)footerButtonFramesPreFlatten;
- (NSMutableArray)separatorViewFrames;
- (UIBezierPath)textViewExclusionPath;
- (double)_bannerMaxTextWidth;
- (double)_bottomFooterSpacing;
- (double)_footerButtonInterSpacing;
- (double)_footerButtonSpacing;
- (double)_footerMinimumHeight;
- (double)_imageLength;
- (double)_imageToLabelSpacing;
- (double)_interitemSpacing;
- (double)_maxFooterButtonWidth;
- (double)_maxTextContainerWidth;
- (double)_scaledUIValueForValue:(double)a3;
- (double)accessorySpacing;
- (double)leadingContentTextBaseline;
- (double)separatorThickness;
- (double)totalFooterButtonHeight;
- (unint64_t)effectiveImageStyle;
- (void)_calculateFooterButtonSizes;
- (void)_updateWithRootFrame:(CGRect)a3;
- (void)calculateAccessorySecondaryViewFrame;
- (void)calculateAccessorySecondaryViewSize;
- (void)calculateAccessoryViewFrame;
- (void)calculateAccessoryViewSize;
- (void)calculateMainContentFrameRootFrame:(CGRect)a3;
- (void)calculateTextViewExclusionFrame;
- (void)calculateTextViewSizeInFrame:(CGRect)a3 dirty:(BOOL)a4;
- (void)invalidate;
- (void)layoutSubviewFrames;
- (void)setAccessorySecondaryViewFrame:(CGRect)a3;
- (void)setAccessoryViewFrame:(CGRect)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDebugButtonFrame:(CGRect)a3;
- (void)setDebugButtonSize:(CGSize)a3;
- (void)setFooterButtonFrames:(id)a3;
- (void)setFooterButtonFramesPreFlatten:(id)a3;
- (void)setFooterContainerViewFrame:(CGRect)a3;
- (void)setImageViewFrame:(CGRect)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setLastFittingSize:(CGSize)a3;
- (void)setLastMessageViewFrame:(CGRect)a3;
- (void)setLastSize:(CGSize)a3;
- (void)setMainContentFrame:(CGRect)a3;
- (void)setMaskViewFrame:(CGRect)a3;
- (void)setMessageView:(id)a3;
- (void)setSeparatorViewFrames:(id)a3;
- (void)setTextViewContentHuggingSize:(CGSize)a3;
- (void)setTextViewExclusionPath:(id)a3;
- (void)setTextViewFrame:(CGRect)a3;
@end

@implementation AMSUIMessageViewLayoutContext

- (AMSUIMessageViewLayoutContext)initWithMessageView:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIMessageViewLayoutContext;
  v5 = [(AMSUIMessageViewLayoutContext *)&v17 init];
  v6 = v5;
  if (v5)
  {
    long long v15 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v16 = *MEMORY[0x263F001A8];
    *(_OWORD *)(v5 + 136) = *MEMORY[0x263F001A8];
    *(_OWORD *)(v5 + 152) = v15;
    *(_OWORD *)(v5 + 200) = v16;
    *(_OWORD *)(v5 + 216) = v15;
    long long v14 = *MEMORY[0x263F001B0];
    *(_OWORD *)(v5 + 56) = *MEMORY[0x263F001B0];
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    v10 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v9;

    *(_OWORD *)(v6 + 328) = v16;
    *(_OWORD *)(v6 + 344) = v15;
    *(_OWORD *)(v6 + 232) = v16;
    *(_OWORD *)(v6 + 248) = v15;
    v6[8] = 1;
    *(_OWORD *)(v6 + 88) = v14;
    *(_OWORD *)(v6 + 360) = v16;
    *(_OWORD *)(v6 + 376) = v15;
    *(_OWORD *)(v6 + 392) = v16;
    *(_OWORD *)(v6 + 408) = v15;
    *(_OWORD *)(v6 + 264) = v16;
    *(_OWORD *)(v6 + 280) = v15;
    *(_OWORD *)(v6 + 104) = v14;
    objc_storeWeak((id *)v6 + 5, v4);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    v12 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v11;

    *(_OWORD *)(v6 + 296) = v16;
    *(_OWORD *)(v6 + 312) = v15;
  }

  return (AMSUIMessageViewLayoutContext *)v6;
}

- (void)invalidate
{
  [(AMSUIMessageViewLayoutContext *)self setIsDirty:1];
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  -[AMSUIMessageViewLayoutContext setLastFittingSize:](self, "setLastFittingSize:", v3, v4);
}

- (void)layoutSubviewFrames
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(AMSUIMessageViewLayoutContext *)self contentSize];
  if (v13 == *MEMORY[0x263F001B0] && v12 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    -[AMSUIMessageViewLayoutContext setContentSize:](self, "setContentSize:", v9, v11);
  }
  long long v15 = [(AMSUIMessageViewLayoutContext *)self messageView];
  int v16 = [v15 isSizing];

  if (v16)
  {
    [(AMSUIMessageViewLayoutContext *)self lastSize];
    double v9 = v17;
    double v11 = v18;
  }
  [(AMSUIMessageViewLayoutContext *)self lastMessageViewFrame];
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  if (!CGRectEqualToRect(v20, v21))
  {
    [(AMSUIMessageViewLayoutContext *)self setIsDirty:1];
    -[AMSUIMessageViewLayoutContext _contentSizeThatFits:](self, "_contentSizeThatFits:", v5, v7, v9, v11);
    -[AMSUIMessageViewLayoutContext setContentSize:](self, "setContentSize:");
  }
  -[AMSUIMessageViewLayoutContext _updateWithRootFrame:](self, "_updateWithRootFrame:", v5, v7, v9, v11);
  -[AMSUIMessageViewLayoutContext setLastMessageViewFrame:](self, "setLastMessageViewFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AMSUIMessageViewLayoutContext *)self lastFittingSize];
  if (width == v7 && height == v6)
  {
    [(AMSUIMessageViewLayoutContext *)self lastSize];
    double width = v11;
    double height = v12;
  }
  else
  {
    -[AMSUIMessageViewLayoutContext setLastFittingSize:](self, "setLastFittingSize:", width, height);
    if (height > 5000.0) {
      double height = 5000.0;
    }
    if (width > 5000.0) {
      double width = 5000.0;
    }
    -[AMSUIMessageViewLayoutContext _contentSizeThatFits:](self, "_contentSizeThatFits:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), width, height);
    if (v9 < width) {
      double width = v9;
    }
    if (v10 < height) {
      double height = v10;
    }
    -[AMSUIMessageViewLayoutContext setLastSize:](self, "setLastSize:", width, height);
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)_contentSizeThatFits:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v9 = [v8 style];
  [(AMSUIMessageViewLayoutContext *)self setIsDirty:1];
  -[AMSUIMessageViewLayoutContext _updateWithRootFrame:](self, "_updateWithRootFrame:", x, y, width, height);
  [(AMSUIMessageViewLayoutContext *)self _effectiveTextViewFrame];
  double v11 = v10;
  if ([(AMSUIMessageViewLayoutContext *)self _isFooterButtonPartOfContentFrame])
  {
    [(AMSUIMessageViewLayoutContext *)self footerContainerViewFrame];
    double v11 = v11 + v12;
  }
  if (![(AMSUIMessageViewLayoutContext *)self isImageViewHidden])
  {
    [(AMSUIMessageViewLayoutContext *)self _makeImageViewSize];
    double v14 = v13;
    if ([(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout])
    {
      long long v15 = [v8 textView];
      int v16 = [v15 hasText];
      double v17 = 0.0;
      if (v16) {
        [(AMSUIMessageViewLayoutContext *)self _imageToLabelSpacing];
      }
      double v11 = v11 + v14 + v17;
    }
    else if (v9 == 5)
    {
      if (v14 + 10.0 + 10.0 >= v11) {
        double v11 = v14 + 10.0 + 10.0;
      }
    }
    else if (v14 >= v11)
    {
      double v11 = v14;
    }
  }
  double v18 = [v8 accessorySecondaryView];

  if (v18)
  {
    [(AMSUIMessageViewLayoutContext *)self accessorySecondaryViewFrame];
    if (v19 >= v11) {
      double v11 = v19;
    }
  }
  [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
  double v21 = v20;
  double v23 = v11 + v22;
  v24 = [(AMSUIMessageViewLayoutContext *)self footerButtonFrames];
  uint64_t v25 = [v24 count];
  double v26 = 0.0;
  double v27 = 0.0;
  if (v25) {
    [(AMSUIMessageViewLayoutContext *)self _footerButtonSpacing];
  }
  double v28 = v23 + v27;
  if (![(AMSUIMessageViewLayoutContext *)self _isFooterButtonPartOfContentFrame])
  {
    [(AMSUIMessageViewLayoutContext *)self footerContainerViewFrame];
    double v26 = v29;
  }
  double v30 = v21 + v28 + v26;

  v31 = [v8 maskShapeView];

  if (v31)
  {
    v32 = [v8 maskShapeView];
    if ([v32 arrowDirection] == 1)
    {
    }
    else
    {
      v33 = [v8 maskShapeView];
      uint64_t v34 = [v33 arrowDirection];

      if (v34 != 2) {
        goto LABEL_26;
      }
    }
    v35 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v36 = [v35 maskShapeView];
    [v36 arrowHeight];
    double v30 = v30 + v37;
  }
LABEL_26:
  if (v9 == 1)
  {
    v38 = [v8 traitCollection];
    uint64_t v39 = [v38 horizontalSizeClass];

    double v40 = 76.0;
    if (v30 >= 76.0) {
      double v40 = v30;
    }
    double v41 = 60.0;
    if (v30 >= 60.0) {
      double v41 = v30;
    }
    if (v39 == 2) {
      double v30 = v40;
    }
    else {
      double v30 = v41;
    }
  }
  else if (v30 < 60.0)
  {
    double v30 = 60.0;
  }

  double v42 = width;
  double v43 = v30;
  result.double height = v43;
  result.double width = v42;
  return result;
}

- (void)_updateWithRootFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v362 = *MEMORY[0x263EF8340];
  -[AMSUIMessageViewLayoutContext calculateMainContentFrameRootFrame:](self, "calculateMainContentFrameRootFrame:");
  if ([(AMSUIMessageViewLayoutContext *)self isDirty])
  {
    [(AMSUIMessageViewLayoutContext *)self calculateAccessoryViewSize];
    [(AMSUIMessageViewLayoutContext *)self calculateAccessorySecondaryViewSize];
  }
  [(AMSUIMessageViewLayoutContext *)self calculateAccessoryViewFrame];
  [(AMSUIMessageViewLayoutContext *)self calculateAccessorySecondaryViewFrame];
  double v327 = height;
  -[AMSUIMessageViewLayoutContext calculateTextViewSizeInFrame:dirty:](self, "calculateTextViewSizeInFrame:dirty:", [(AMSUIMessageViewLayoutContext *)self isDirty], x, y, width, height);
  [(AMSUIMessageViewLayoutContext *)self _calculateFooterButtonSizes];
  [(AMSUIMessageViewLayoutContext *)self setIsDirty:0];
  [(AMSUIMessageViewLayoutContext *)self imageViewFrame];
  [(AMSUIMessageViewLayoutContext *)self maskViewFrame];
  [(AMSUIMessageViewLayoutContext *)self textViewFrame];
  double v9 = v8;
  double v11 = v10;
  double v331 = v12;
  double r1 = v13;
  [(AMSUIMessageViewLayoutContext *)self _effectiveTextViewFrame];
  double v15 = v14;
  double v17 = v16;
  [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
  double v321 = v19;
  double v323 = v18;
  double v317 = v21;
  double v319 = v20;
  [(AMSUIMessageViewLayoutContext *)self accessorySecondaryViewFrame];
  double v23 = v22;
  double v25 = v24;
  double v313 = v27;
  double v315 = v26;
  double v28 = [MEMORY[0x263EFF980] array];
  v309 = [(AMSUIMessageViewLayoutContext *)self footerButtonFramesPreFlatten];
  [(AMSUIMessageViewLayoutContext *)self debugButtonSize];
  double v311 = v29;
  double v307 = v30;
  [(AMSUIMessageViewLayoutContext *)self accessorySpacing];
  double v305 = v31;
  v32 = [(AMSUIMessageViewLayoutContext *)self messageView];
  v33 = [v32 footerButtonViews];

  BOOL v34 = [(AMSUIMessageViewLayoutContext *)self _isAccessoryViewLeading];
  v35 = [(AMSUIMessageViewLayoutContext *)self messageView];
  v36 = [v35 traitCollection];
  uint64_t v306 = [v36 layoutDirection];

  BOOL v37 = [(AMSUIMessageViewLayoutContext *)self isImageViewHidden];
  [(AMSUIMessageViewLayoutContext *)self leadingContentTextBaseline];
  double v345 = v38;
  BOOL v39 = [(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout];
  double v40 = [(AMSUIMessageViewLayoutContext *)self messageView];
  unint64_t v41 = [v40 style];

  [(AMSUIMessageViewLayoutContext *)self totalFooterButtonHeight];
  double v348 = v42;
  double v44 = *MEMORY[0x263F00148];
  double v43 = *(double *)(MEMORY[0x263F00148] + 8);
  [(AMSUIMessageViewLayoutContext *)self _makeImageViewSize];
  double v335 = v45;
  double v337 = v46;
  v47 = [(AMSUIMessageViewLayoutContext *)self messageView];
  [v47 accessoryView];

  if (!v39)
  {
    BOOL v48 = [(AMSUIMessageViewLayoutContext *)self _isIconImageTopAligned];
    BOOL v49 = v48;
    if (!v41)
    {
      double v341 = v17;
      v58 = v33;
      BOOL v59 = v39;
      BOOL v60 = v34;
      BOOL v61 = v37;
      v62 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v63 = [v62 traitCollection];
      uint64_t v64 = [v63 userInterfaceIdiom];

      if (v64 == 1)
      {
        [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
        double v44 = 15.0 - v65;
        double v52 = 0.0;
        BOOL v37 = v61;
        BOOL v34 = v60;
        BOOL v39 = v59;
        v33 = v58;
        unint64_t v41 = 0;
        if (v49) {
          goto LABEL_31;
        }
      }
      else
      {
        double v52 = 11.0;
        BOOL v37 = v61;
        BOOL v34 = v60;
        BOOL v39 = v59;
        v33 = v58;
        unint64_t v41 = 0;
        if (v49) {
          goto LABEL_31;
        }
      }
      goto LABEL_29;
    }
    if ((v41 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      double v350 = v15;
      double v341 = v17;
      double v50 = v44;
      unint64_t v51 = [(AMSUIMessageViewLayoutContext *)self effectiveImageStyle];
      if (v51 == 2) {
        double v52 = 15.0;
      }
      else {
        double v52 = 11.0;
      }
      char v53 = v51 == 2 || v49;
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v55 = v54;
      BOOL v56 = [(AMSUIMessageViewLayoutContext *)self _isSymbolImage];
      BOOL v57 = v337 + v52 < v55 && v56;
      double v44 = v50;
      if (v53)
      {
        double v15 = v350;
LABEL_31:
        [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v52];
        double v43 = v82;
        double v17 = v341;
LABEL_32:
        [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
        double v43 = v43 - v83;
        goto LABEL_33;
      }
      double v15 = v350;
      if (v57) {
        goto LABEL_31;
      }
LABEL_29:
      v68 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v69 = [v68 imageView];
      [v69 alignmentRectInsets];

      v70 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v71 = [v70 imageView];
      objc_msgSend(v71, "alignmentRectForFrame:", v44, v43, v335, v337);
      double v72 = v23;
      double v73 = v9;
      double v74 = v15;
      double v75 = v11;
      double v77 = v76;
      double v79 = v78;

      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v81 = (v80 - v79) * 0.5 - v77;
      double v11 = v75;
      double v15 = v74;
      double v9 = v73;
      double v23 = v72;
      double v43 = v81;
      double v17 = v341;
      goto LABEL_33;
    }
    if (!v48)
    {
      double v341 = v17;
      goto LABEL_29;
    }
    double v66 = 11.0;
    if (v41 == 5) {
      double v66 = 10.0;
    }
    [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v66];
    double v43 = v67;
    if (v41 != 5) {
      goto LABEL_32;
    }
  }
LABEL_33:
  double v333 = v44;
  v84 = (double *)MEMORY[0x263F001A8];
  if (v33)
  {
    [(AMSUIMessageViewLayoutContext *)self _maxFooterButtonWidth];
    double v351 = v85;
  }
  else
  {
    double v348 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v351 = *(double *)(MEMORY[0x263F001A8] + 16);
  }
  double v86 = *v84;
  double v325 = v84[1];
  if ([(AMSUIMessageViewLayoutContext *)self _isFooterButtonPartOfContentFrame])
  {
    if (v39)
    {
      if (!v37)
      {
        [(AMSUIMessageViewLayoutContext *)self _imageToLabelSpacing];
        double v11 = v11 + v337 + v87;
      }
      double v88 = v9;
      double v329 = v11;
      if (v33)
      {
        [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
        double v89 = v25;
        double v91 = v90;
        [(AMSUIMessageViewLayoutContext *)self _footerButtonSpacing];
        double v93 = r1 + v11 + v92;
        double v94 = v91;
        double v25 = v89;
        goto LABEL_78;
      }
      goto LABEL_76;
    }
    BOOL v300 = v37;
    double v303 = v43;
    double v301 = v25;
    double v106 = *MEMORY[0x263F001B0];
    double v107 = *(double *)(MEMORY[0x263F001B0] + 8);
    v108 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v109 = [v108 textView];
    int v110 = [v109 hasText];

    double v111 = -0.0;
    double v342 = v17;
    if (v110) {
      double v112 = v17;
    }
    else {
      double v112 = -0.0;
    }
    double v113 = v107 + v112;
    if (v110) {
      double v111 = v15;
    }
    double v114 = v106 + v111;
    BOOL v115 = v34;
    if (v33)
    {
      if (v114 < v351) {
        double v114 = v351;
      }
      [(AMSUIMessageViewLayoutContext *)self _footerButtonSpacing];
      double v113 = v113 + v348 + v116;
    }
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    double v118 = v117;
    v119 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v120 = [v119 textView];
    [v120 textContainerInset];

    [(AMSUIMessageViewLayoutContext *)self _footerButtonSpacing];
    double v122 = v121;
    v123 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v124 = [v123 textView];
    int v125 = [v124 hasText];
    double v126 = v342 + v122;
    if (v33) {
      int v127 = v125;
    }
    else {
      int v127 = 1;
    }

    if (!v127) {
      double v126 = 0.0;
    }
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
    double v88 = v128;
    double v329 = v129;
    double v331 = v130;
    double r1 = v131;
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", 0.0, v126, v351, v348, v345, (v118 - v113) * 0.5, v114, v113);
    double v348 = v133;
    double v351 = v132;
    double v25 = v301;
    double v43 = v303;
    BOOL v34 = v115;
    BOOL v37 = v300;
  }
  else
  {
    double v95 = v25;
    v96 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v97 = [v96 textView];
    [v97 textContainerInset];
    double v99 = v98;
    double v100 = -v98;

    if ([(AMSUIMessageViewLayoutContext *)self _isTextOnlyBanner])
    {
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v88 = (v101 - v15) * 0.5;
      v102 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v103 = [v102 accessoryView];

      if (v103)
      {
        [(AMSUIMessageViewLayoutContext *)self accessorySpacing];
        v363.origin.double x = v88;
        v363.origin.double y = v100;
        v363.size.double width = v331;
        v363.size.double height = r1;
        v365.size.double width = v321;
        v365.origin.double x = v323;
        v365.size.double height = v317;
        v365.origin.double y = v319;
        CGRect v364 = CGRectIntersection(v363, v365);
        if (v364.size.width > 0.0)
        {
          double v104 = v364.size.width;
          [(AMSUIMessageViewLayoutContext *)self accessorySpacing];
          double v88 = v88 - (v104 + v105);
        }
      }
    }
    else
    {
      if (v39 && !v37)
      {
        [(AMSUIMessageViewLayoutContext *)self _imageToLabelSpacing];
        double v100 = v337 + v134 - v99;
      }
      double v88 = v345;
    }
    char v135 = v41 == 5 || v39;
    if ((v135 & 1) == 0)
    {
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v100 = (v136 - r1) * 0.5;
      v137 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v138 = [v137 textView];
      [v138 textContainerInset];
      double v140 = -v139;

      if (v100 < v140) {
        double v100 = v140;
      }
    }
    double v329 = v100;
    double v25 = v95;
    if (!v33)
    {
LABEL_76:
      double v93 = v325;
      double v94 = v86;
      goto LABEL_78;
    }
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    double v142 = -0.0;
    if (v41 != 5) {
      double v142 = v345;
    }
    double v346 = v142 + v141;
    [(AMSUIMessageViewLayoutContext *)self contentSize];
    double v144 = v143 - v348;
    [(AMSUIMessageViewLayoutContext *)self _bottomFooterSpacing];
    double v93 = v144 - v145;
    if (v41 == 3)
    {
      double v343 = v144 - v145;
      v146 = [(AMSUIMessageViewLayoutContext *)self messageView];
      v147 = [v146 maskShapeView];
      uint64_t v148 = [v147 arrowDirection];

      if (v148 == 2)
      {
        v149 = [(AMSUIMessageViewLayoutContext *)self messageView];
        v150 = [v149 maskShapeView];
        [v150 arrowHeight];
        double v343 = v343 - v151;
      }
LABEL_82:
      double v304 = v86;
      double v152 = v23;
      double v153 = v43;
      double v154 = v25;
      long long v359 = 0u;
      long long v360 = 0u;
      long long v357 = 0u;
      long long v358 = 0u;
      id v155 = v309;
      uint64_t v156 = [v155 countByEnumeratingWithState:&v357 objects:v361 count:16];
      if (v156)
      {
        uint64_t v157 = v156;
        uint64_t v158 = *(void *)v358;
        do
        {
          for (uint64_t i = 0; i != v157; ++i)
          {
            if (*(void *)v358 != v158) {
              objc_enumerationMutation(v155);
            }
            [*(id *)(*((void *)&v357 + 1) + 8 * i) CGRectValue];
            double v161 = v160;
            double v163 = v162;
            double v165 = v164;
            [(AMSUIMessageViewLayoutContext *)self separatorThickness];
            v167 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v161, v163, v165, v166);
            [v28 addObject:v167];
          }
          uint64_t v157 = [v155 countByEnumeratingWithState:&v357 objects:v361 count:16];
        }
        while (v157);
      }

      double v25 = v154;
      double v43 = v153;
      double v23 = v152;
LABEL_90:
      double v86 = v304;
      goto LABEL_91;
    }
    double v94 = v346;
  }
LABEL_78:
  double v343 = v93;
  double v346 = v94;
  if (v41 - 2 < 2) {
    goto LABEL_81;
  }
  if (v41 != 1)
  {
    if (v41 != 5) {
      goto LABEL_91;
    }
LABEL_81:
    if (!v33) {
      goto LABEL_91;
    }
    goto LABEL_82;
  }
  if (!v37 && !v39)
  {
    double v304 = v86;
    [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
    double v289 = v335 + v288;
    double v302 = v25;
    BOOL v290 = v34;
    if ([(AMSUIMessageViewLayoutContext *)self _isSymbolImage]) {
      [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:16.0];
    }
    else {
      [(AMSUIMessageViewLayoutContext *)self _interitemSpacing];
    }
    double v292 = v289 + v291;
    [(AMSUIMessageViewLayoutContext *)self separatorThickness];
    double v294 = v293;
    v295 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v296 = [v295 accessoryView];
    BOOL v297 = v296 != 0;

    double v298 = -0.0;
    if (v297 && v290) {
      double v298 = v323 + v321 + v305;
    }
    v299 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v292 + v298, (v327 - (v327 + -24.0)) * 0.5, v294, v327 + -24.0);
    [v28 addObject:v299];

    double v25 = v302;
    goto LABEL_90;
  }
LABEL_91:
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v333, v43, v335, v337, v168, v169, v170, v171);
  double v334 = v172;
  double v336 = v173;
  double v338 = v174;
  double v176 = v175;
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v88, v329, v331, r1, v177, v178, v179, v180);
  double v328 = v181;
  double v330 = v182;
  double v332 = v183;
  double r1a = v184;
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v86, v325, v311, v307, v185, v186, v187, v188);
  double v190 = v189;
  double v192 = v191;
  double v194 = v193;
  double v308 = v195;
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v323, v319, v321, v317, v196, v197, v198, v199);
  double v320 = v200;
  double v322 = v201;
  double v324 = v202;
  double v326 = v203;
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v23, v25, v315, v313, v204, v205, v206, v207);
  double v312 = v208;
  double v314 = v209;
  double v316 = v210;
  double v318 = v211;
  if ([(AMSUIMessageViewLayoutContext *)self _shouldOffsetFooterButtonFromMainContentView])
  {
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:", v346, v343, v351, v348, v212, v213, v214, v215);
    double v220 = v219;
    unint64_t v221 = 0x263EFF000;
  }
  else
  {
    unint64_t v221 = 0x263EFF000uLL;
    double v218 = v351;
    double v217 = v343;
    double v216 = v346;
    double v220 = v348;
  }
  v222 = *(void **)(v221 + 2432);
  v356[0] = MEMORY[0x263EF8330];
  v356[1] = 3221225472;
  v356[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke;
  v356[3] = &__block_descriptor_64_e26___NSValue_16__0__NSValue_8l;
  double v344 = v217;
  double v347 = v216;
  *(double *)&v356[4] = v216;
  *(double *)&v356[5] = v217;
  double v352 = v218;
  *(double *)&v356[6] = v218;
  *(double *)&v356[7] = v220;
  v223 = objc_msgSend(v309, "ams_mapWithTransform:", v356);
  v224 = [v222 arrayWithArray:v223];

  if (v41 <= 5 && ((1 << v41) & 0x2C) != 0)
  {
    uint64_t v225 = v306;
    if (v33)
    {
      v226 = *(void **)(v221 + 2432);
      v355[0] = MEMORY[0x263EF8330];
      v355[1] = 3221225472;
      v355[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_2;
      v355[3] = &__block_descriptor_64_e26___NSValue_16__0__NSValue_8l;
      *(double *)&v355[4] = v347;
      *(double *)&v355[5] = v344;
      *(double *)&v355[6] = v352;
      *(double *)&v355[7] = v220;
      v227 = objc_msgSend(v28, "ams_mapWithTransform:", v355);
      uint64_t v228 = [v226 arrayWithArray:v227];

      double v28 = (void *)v228;
    }
  }
  else
  {
    uint64_t v225 = v306;
  }
  double v229 = v190 + -12.0;
  double v349 = v220;
  if (v225 == 1)
  {
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v334, v336, v338, v176, v230, v231, v232, v233);
    double v334 = v234;
    double v336 = v235;
    double v338 = v236;
    double v310 = v237;
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v328, v330, v332, r1a, v238, v239, v240, v241);
    double v328 = v242;
    double v330 = v243;
    double v332 = v244;
    double r1a = v245;
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v320, v322, v324, v326, v246, v247, v248, v249);
    double v320 = v250;
    double v322 = v251;
    double v324 = v252;
    double v326 = v253;
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v312, v314, v316, v318, v254, v255, v256, v257);
    double v312 = v258;
    double v314 = v259;
    double v316 = v260;
    double v318 = v261;
    v262 = *(void **)(v221 + 2432);
    v354[0] = MEMORY[0x263EF8330];
    v354[1] = 3221225472;
    v354[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_3;
    v354[3] = &unk_2643E4020;
    v354[4] = self;
    v263 = objc_msgSend(v28, "ams_mapWithTransform:", v354);
    uint64_t v264 = [v262 arrayWithArray:v263];

    v265 = *(void **)(v221 + 2432);
    v353[0] = MEMORY[0x263EF8330];
    v353[1] = 3221225472;
    v353[2] = __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_4;
    v353[3] = &unk_2643E4020;
    v353[4] = self;
    v266 = objc_msgSend(v224, "ams_mapWithTransform:", v353);
    uint64_t v267 = [v265 arrayWithArray:v266];

    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v190 + -12.0, v192 + -10.0, v194, v308, v268, v269, v270, v271);
    double v229 = v272;
    double v274 = v273;
    double v276 = v275;
    double v278 = v277;
    v224 = (void *)v267;
    double v28 = (void *)v264;
  }
  else
  {
    double v310 = v176;
    double v276 = v194;
    double v278 = v308;
    double v274 = v192 + -10.0;
  }
  v279 = [(AMSUIMessageViewLayoutContext *)self messageView];
  [v279 bounds];
  double v281 = v280;
  double v283 = v282;
  double v285 = v284;
  double v287 = v286;

  -[AMSUIMessageViewLayoutContext setImageViewFrame:](self, "setImageViewFrame:", v334, v336, v338, v310);
  -[AMSUIMessageViewLayoutContext setMaskViewFrame:](self, "setMaskViewFrame:", v281, v283, v285, v287);
  -[AMSUIMessageViewLayoutContext setTextViewFrame:](self, "setTextViewFrame:", v328, v330, v332, r1a);
  -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v320, v322, v324, v326);
  -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v312, v314, v316, v318);
  [(AMSUIMessageViewLayoutContext *)self setSeparatorViewFrames:v28];
  -[AMSUIMessageViewLayoutContext setFooterContainerViewFrame:](self, "setFooterContainerViewFrame:", v347, v344, v352, v349);
  [(AMSUIMessageViewLayoutContext *)self setFooterButtonFrames:v224];
  -[AMSUIMessageViewLayoutContext setDebugButtonFrame:](self, "setDebugButtonFrame:", v229, v274, v276, v278);
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 CGRectValue];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
  return objc_msgSend(v2, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 CGRectValue];
  +[AMSUICGRectHelper flattenRect:toParentFrame:](AMSUICGRectHelper, "flattenRect:toParentFrame:");
  return objc_msgSend(v2, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F08D40];
  [a2 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) mainContentFrame];
  +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v5, v7, v9, v11, v12, v13, v14, v15);
  return objc_msgSend(v3, "valueWithCGRect:");
}

uint64_t __54__AMSUIMessageViewLayoutContext__updateWithRootFrame___block_invoke_4(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263F08D40];
  [a2 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) mainContentFrame];
  +[AMSUICGRectHelper rect:withFlippedOriginXRelativeTo:](AMSUICGRectHelper, "rect:withFlippedOriginXRelativeTo:", v5, v7, v9, v11, v12, v13, v14, v15);
  return objc_msgSend(v3, "valueWithCGRect:");
}

- (void)calculateAccessoryViewFrame
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 accessoryView];

  if (v4)
  {
    [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v10 = [v9 accessoryView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v10;
    }
    else {
      id v19 = 0;
    }

    double v15 = 0.0;
    double v16 = 0.0;
    if (([v19 isDefaultCloseButton] & 1) == 0)
    {
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v16 = (v17 - v8) * 0.5;
    }
    if (![(AMSUIMessageViewLayoutContext *)self _isAccessoryViewLeading])
    {
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v15 = v18 - v6;
    }
    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v15, v16, v6, v8);
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v11, v12, v13, v14);
  }
}

- (void)calculateAccessorySecondaryViewFrame
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 accessorySecondaryView];

  if (v4)
  {
    [(AMSUIMessageViewLayoutContext *)self accessorySecondaryViewFrame];
    double v6 = v5;
    double v8 = v7;
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    double v10 = v9 - v6;
    [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
    double v12 = (v11 - v8) * 0.5;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v10, v12, v6, v8);
}

- (void)calculateAccessoryViewSize
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 accessoryView];

  if (v4)
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v8 = [v7 accessoryView];
    objc_msgSend(v8, "sizeThatFits:", 100.0, 1.79769313e308);
    double v10 = v9;
    double v12 = v11;

    -[AMSUIMessageViewLayoutContext setAccessoryViewFrame:](self, "setAccessoryViewFrame:", v5, v6, v10, v12);
  }
}

- (void)calculateAccessorySecondaryViewSize
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 accessorySecondaryView];

  if (v4)
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v8 = [v7 accessorySecondaryView];
    objc_msgSend(v8, "sizeThatFits:", 100.0, 1.79769313e308);
    double v10 = v9;
    double v12 = v11;

    -[AMSUIMessageViewLayoutContext setAccessorySecondaryViewFrame:](self, "setAccessorySecondaryViewFrame:", v5, v6, v10, v12);
  }
}

- (void)calculateMainContentFrameRootFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = height - v6 - v12;
  [(AMSUIMessageViewLayoutContext *)self _bottomFooterSpacing];
  double v15 = v13 - v14;
  double v16 = width - v9 - v11;
  double v17 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v18 = [v17 style];

  if (v18 == 2)
  {
    id v19 = [(AMSUIMessageViewLayoutContext *)self messageView];
    [v19 safeAreaInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    double v15 = v15 - (v21 + v25);
    double v16 = v16 - (v23 + v27);
  }
  double v28 = [(AMSUIMessageViewLayoutContext *)self footerButtonFrames];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    [(AMSUIMessageViewLayoutContext *)self _footerButtonSpacing];
    double v15 = v15 - v30;
  }
  if (![(AMSUIMessageViewLayoutContext *)self _isFooterButtonPartOfContentFrame])
  {
    [(AMSUIMessageViewLayoutContext *)self totalFooterButtonHeight];
    double v15 = v15 - v31;
  }
  v32 = [(AMSUIMessageViewLayoutContext *)self messageView];
  v33 = [v32 maskShapeView];

  if (v33)
  {
    BOOL v34 = [(AMSUIMessageViewLayoutContext *)self messageView];
    v35 = [v34 maskShapeView];
    [v35 arrowHeight];
    double v37 = v36;

    double v38 = [(AMSUIMessageViewLayoutContext *)self messageView];
    BOOL v39 = [v38 maskShapeView];
    uint64_t v40 = [v39 arrowDirection];

    switch(v40)
    {
      case 1:
        double v7 = v7 + v37;
        goto LABEL_10;
      case 2:
LABEL_10:
        double v15 = v15 - v37;
        break;
      case 4:
        double v9 = v9 + v37;
        goto LABEL_12;
      case 8:
LABEL_12:
        double v16 = v16 - v37;
        break;
      default:
        break;
    }
  }
  -[AMSUIMessageViewLayoutContext setMainContentFrame:](self, "setMainContentFrame:", v9, v7, v16, v15);
}

- (void)calculateTextViewSizeInFrame:(CGRect)a3 dirty:(BOOL)a4
{
  BOOL v4 = a4;
  v41[1] = *MEMORY[0x263EF8340];
  double v6 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v7 = [v6 textView];
  int v8 = [v7 hasText];

  if (v8)
  {
    [(AMSUIMessageViewLayoutContext *)self _maxTextContainerWidth];
    double v10 = v9;
    if ([(AMSUIMessageViewLayoutContext *)self _isTextOnlyBanner])
    {
      [(AMSUIMessageViewLayoutContext *)self _bannerMaxTextWidth];
      if (v10 >= v11) {
        double v10 = v11;
      }
    }
    if (v4)
    {
      [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
      double v13 = v12;
      double v14 = [(AMSUIMessageViewLayoutContext *)self messageView];
      double v15 = [v14 textView];
      [v15 textContainerInset];
      double v17 = v16;
      double v19 = v18;

      double v20 = v19 + v13 + v17;
      [(AMSUIMessageViewLayoutContext *)self calculateTextViewExclusionFrame];
      double v21 = [(AMSUIMessageViewLayoutContext *)self textViewExclusionPath];

      if (v21)
      {
        double v22 = [(AMSUIMessageViewLayoutContext *)self textViewExclusionPath];
        v41[0] = v22;
        double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
        double v24 = [(AMSUIMessageViewLayoutContext *)self messageView];
        double v25 = [v24 textView];
        double v26 = [v25 textContainer];
        [v26 setExclusionPaths:v23];
      }
      else
      {
        double v22 = [(AMSUIMessageViewLayoutContext *)self messageView];
        double v23 = [v22 textView];
        double v24 = [v23 textContainer];
        [v24 setExclusionPaths:MEMORY[0x263EFFA68]];
      }

      double v27 = [(AMSUIMessageViewLayoutContext *)self messageView];
      double v28 = [v27 textView];
      objc_msgSend(v28, "sizeThatFits:", v10, v20);
      double v30 = v29;
      double v32 = v31;

      v33 = [(AMSUIMessageViewLayoutContext *)self messageView];
      BOOL v34 = [v33 traitCollection];
      uint64_t v35 = [v34 layoutDirection];

      if (v35 == 1) {
        double v36 = v10;
      }
      else {
        double v36 = v30;
      }
      -[AMSUIMessageViewLayoutContext setTextViewContentHuggingSize:](self, "setTextViewContentHuggingSize:", v36, v32);
    }
    double v37 = *MEMORY[0x263F00148];
    double v38 = *(double *)(MEMORY[0x263F00148] + 8);
    [(AMSUIMessageViewLayoutContext *)self textViewContentHuggingSize];
    -[AMSUIMessageViewLayoutContext setTextViewFrame:](self, "setTextViewFrame:", v37, v38, v39, v40);
  }
}

- (void)calculateTextViewExclusionFrame
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if (![(AMSUIMessageViewLayoutContext *)self _isAccessoryViewLeading]
    || ([v3 accessorySecondaryView],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    double v5 = [v3 accessoryView];
    if (v5)
    {

      goto LABEL_6;
    }
    double v6 = [v3 accessorySecondaryView];

    if (v6)
    {
LABEL_6:
      [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
      double v8 = v7;
      double y = v9;
      double v12 = v11;
      double height = v13;
      double v15 = [v3 accessoryView];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }

      double v17 = [(AMSUIMessageViewLayoutContext *)self messageView];
      double v18 = [v17 accessorySecondaryView];

      if (v18)
      {
        [(AMSUIMessageViewLayoutContext *)self accessorySecondaryViewFrame];
        double v8 = v19;
        double y = v20;
        double v12 = v21;
        double height = v22;
        double v23 = [v3 accessorySecondaryView];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }

        id v16 = v24;
      }
      if ([(AMSUIMessageViewLayoutContext *)self _shouldTextViewTextFillUnderCloseButton])
      {
        if ([(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout]
          && ![(AMSUIMessageViewLayoutContext *)self isImageViewHidden])
        {
          [(AMSUIMessageViewLayoutContext *)self setTextViewExclusionPath:0];
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
        double height = v25;
        double y = 0.0;
      }
      [(AMSUIMessageViewLayoutContext *)self leadingContentTextBaseline];
      double v27 = v8 - v26;
      [(AMSUIMessageViewLayoutContext *)self accessorySpacing];
      double x = v27 - v28;
      double width = v12 + v28;
      double v31 = [v3 traitCollection];
      uint64_t v32 = [v31 layoutDirection];

      if (v32 == 1)
      {
        memset(&v37, 0, sizeof(v37));
        CGAffineTransformMakeScale(&v37, -1.0, 1.0);
        memset(&v36, 0, sizeof(v36));
        [(AMSUIMessageViewLayoutContext *)self _maxTextContainerWidth];
        CGAffineTransform v35 = v37;
        CGAffineTransformTranslate(&v36, &v35, -v33, 0.0);
        CGAffineTransform v35 = v36;
        v38.origin.double x = x;
        v38.origin.double y = y;
        v38.size.double width = width;
        v38.size.double height = height;
        CGRect v39 = CGRectApplyAffineTransform(v38, &v35);
        double y = v39.origin.y;
        double width = v39.size.width;
        double height = v39.size.height;
        if (v39.origin.x >= 0.01) {
          double x = v39.origin.x;
        }
        else {
          double x = 0.0;
        }
      }
      BOOL v34 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", x, y, width, height);
      [(AMSUIMessageViewLayoutContext *)self setTextViewExclusionPath:v34];

      goto LABEL_25;
    }
  }
  [(AMSUIMessageViewLayoutContext *)self setTextViewExclusionPath:0];
LABEL_26:
}

- (void)_calculateFooterButtonSizes
{
  if ([(AMSUIMessageViewLayoutContext *)self isDirty])
  {
    double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
    BOOL v4 = [v3 footerButtonViews];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      double v6 = [(AMSUIMessageViewLayoutContext *)self footerButtonFramesPreFlatten];
      [v6 removeAllObjects];

      [(AMSUIMessageViewLayoutContext *)self _maxFooterButtonWidth];
      uint64_t v8 = v7;
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x2020000000;
      v12[3] = 0;
      double v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
      double v10 = [v9 footerButtonViews];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __60__AMSUIMessageViewLayoutContext__calculateFooterButtonSizes__block_invoke;
      v11[3] = &unk_2643E4048;
      v11[6] = v8;
      v11[7] = 0x4061800000000000;
      v11[4] = self;
      v11[5] = v12;
      [v10 enumerateObjectsUsingBlock:v11];

      _Block_object_dispose(v12, 8);
    }
  }
}

double __60__AMSUIMessageViewLayoutContext__calculateFooterButtonSizes__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v4 = v3;
  [*(id *)(a1 + 32) _footerMinimumHeight];
  if (v4 < v5) {
    double v4 = v5;
  }
  double v6 = *(double *)(a1 + 48);
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v9 = [*(id *)(a1 + 32) footerButtonFramesPreFlatten];
  double v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v7, v8, v6, v4);
  [v9 addObject:v10];

  [*(id *)(a1 + 32) _footerButtonInterSpacing];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v4 + v11 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  return result;
}

- (double)_bottomFooterSpacing
{
  v2 = [(AMSUIMessageViewLayoutContext *)self messageView];
  [v2 style];

  return 0.0;
}

- (NSDirectionalEdgeInsets)contentLayoutMargins
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);

  double v7 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v8 = [v7 style];

  if (v8 == 1)
  {
    int v9 = 1;
    double v12 = 10.0;
    double v10 = 12.0;
    double v11 = 12.0;
  }
  else if (v8)
  {
    int v9 = 1;
    double v12 = 11.0;
    double v10 = 13.0;
    double v11 = 13.0;
  }
  else if (IsAccessibilityCategory)
  {
    int v9 = 0;
    double v10 = 16.0;
    double v11 = 16.0;
    double v12 = 16.0;
  }
  else
  {
    double v13 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v14 = [v13 traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];

    double v12 = 11.0;
    if (v15 == 1) {
      double v10 = 9.0;
    }
    else {
      double v10 = 11.0;
    }
    if (v15 == 1) {
      double v11 = 9.0;
    }
    else {
      double v11 = 14.0;
    }
    int v9 = 1;
  }
  id v16 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v16 style] == 1
    && ![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout])
  {
    BOOL v34 = [(AMSUIMessageViewLayoutContext *)self isImageViewHidden];

    if (!v34)
    {
      if ([(AMSUIMessageViewLayoutContext *)self _isSymbolImage]) {
        double v11 = 16.0;
      }
      else {
        double v11 = 20.0;
      }
    }
  }
  else
  {
  }
  if (v9)
  {
    [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v12];
    double v18 = v17;
    [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v12];
    double v12 = v19;
    [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v11];
    double v11 = v20;
    [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v10];
    double v10 = v21;
  }
  else
  {
    double v18 = v12;
  }
  double v22 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v22 style])
  {
  }
  else
  {
    double v23 = [(AMSUIMessageViewLayoutContext *)self messageView];
    id v24 = [v23 traitCollection];
    uint64_t v25 = [v24 userInterfaceIdiom];

    if (v25 == 1)
    {
      double v26 = [(AMSUIMessageViewLayoutContext *)self messageView];
      [v26 safeAreaInsets];
      double v28 = v27;
      double v30 = v29;

      double v31 = [(AMSUIMessageViewLayoutContext *)self messageView];
      uint64_t v32 = [v31 traitCollection];
      uint64_t v33 = [v32 layoutDirection];

      if (v33 == 1)
      {
        if (v11 < v28) {
          double v11 = v28;
        }
      }
      else if (v10 < v30)
      {
        double v10 = v30;
      }
    }
  }
  double v35 = v18;
  double v36 = v11;
  double v37 = v12;
  double v38 = v10;
  result.trailing = v38;
  result.bottom = v37;
  result.leading = v36;
  result.top = v35;
  return result;
}

- (CGSize)_makeImageViewSize
{
  [(AMSUIMessageViewLayoutContext *)self _imageLength];
  double v4 = v3;
  double v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v6 = [v5 imageView];
  double v7 = [v6 image];

  uint64_t v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
  LODWORD(v6) = [v8 preLayoutImageView];

  if (!v6 || v7)
  {
    if (!v7)
    {
      int v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
      double v10 = [v9 micaPlayer];

      if (!v10)
      {
        double v4 = *MEMORY[0x263F001B0];
        double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
        goto LABEL_7;
      }
    }
    double v11 = [(AMSUIMessageViewLayoutContext *)self messageView];
    [v11 micaPlayer];
  }
  double v12 = v4;
LABEL_7:

  double v13 = v4;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (double)_bannerMaxTextWidth
{
  v2 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v3 = [v2 traitCollection];
  BOOL v4 = [v3 horizontalSizeClass] == 2;

  return dbl_21C2CE2A0[v4];
}

- (unint64_t)effectiveImageStyle
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 imageStyle];

  if (!v4) {
    return 1;
  }
  double v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
  unint64_t v6 = [v5 imageStyle];

  return v6;
}

- (double)_footerButtonInterSpacing
{
  return 0.0;
}

- (double)_footerButtonSpacing
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 style];

  if (v4)
  {
    double v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
    uint64_t v6 = [v5 style];

    double v7 = 0.0;
    if (v6 == 6)
    {
      uint64_t v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
      int v9 = [v8 traitCollection];
      double v10 = [v9 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);

      double v7 = 0.0;
      if (IsAccessibilityCategory) {
        double v7 = 4.0;
      }
    }
  }
  else
  {
    double v7 = 6.0;
  }
  [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v7];
  return result;
}

- (double)_footerMinimumHeight
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if (![v3 style]
    && ![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout])
  {

    return 0.0;
  }
  uint64_t v4 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v5 = [v4 style];

  if (v5 == 6) {
    return 0.0;
  }
  [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:44.0];
  return result;
}

- (CGRect)_effectiveTextViewFrame
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 textView];
  [v4 textContainerInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(AMSUIMessageViewLayoutContext *)self textViewFrame];
  double v16 = v15 - (v6 + v10);
  double v18 = v17 - (v8 + v12);
  result.size.double height = v16;
  result.size.double width = v18;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (double)_imageLength
{
  if (_imageLength_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&_imageLength_ams_once_token___COUNTER__, &__block_literal_global_9);
  }
  id v3 = (id)_imageLength_ams_once_object___COUNTER__;
  uint64_t v4 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v5 = [v4 traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory) {
    goto LABEL_6;
  }
  double v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v9 = [v8 traitCollection];
  double v10 = [v9 preferredContentSizeCategory];
  double v11 = [v3 objectForKeyedSubscript:v10];

  if (!v11 || ([v11 doubleValue], double v13 = v12, v11, v13 == 2.22507386e-308))
  {
LABEL_6:
    double v14 = [(AMSUIMessageViewLayoutContext *)self messageView];
    uint64_t v15 = [v14 style];

    if (v15)
    {
      double v16 = [(AMSUIMessageViewLayoutContext *)self messageView];
      if ([v16 style] == 3)
      {
LABEL_10:

LABEL_11:
        if ([(AMSUIMessageViewLayoutContext *)self effectiveImageStyle] == 2)
        {
LABEL_16:
          *(double *)&uint64_t v20 = 44.0;
LABEL_25:
          double v13 = *(double *)&v20;
          goto LABEL_26;
        }
        if (![(AMSUIMessageViewLayoutContext *)self _isSymbolImage])
        {
          double v18 = [(AMSUIMessageViewLayoutContext *)self messageView];
          if ([v18 style] == 3)
          {
            double v19 = [(AMSUIMessageViewLayoutContext *)self messageView];
            [v19 footerButtonViews];
          }
          goto LABEL_16;
        }
        goto LABEL_19;
      }
      double v17 = [(AMSUIMessageViewLayoutContext *)self messageView];
      if ([v17 style] == 2)
      {

        goto LABEL_10;
      }
      double v21 = [(AMSUIMessageViewLayoutContext *)self messageView];
      uint64_t v22 = [v21 style];

      if (v22 == 6) {
        goto LABEL_11;
      }
      double v23 = [(AMSUIMessageViewLayoutContext *)self messageView];
      uint64_t v24 = [v23 style];

      if (v24 == 5)
      {
LABEL_19:
        double v13 = 45.0;
        goto LABEL_26;
      }
      uint64_t v25 = [(AMSUIMessageViewLayoutContext *)self messageView];
      if ([v25 style] == 4)
      {
        BOOL v26 = [(AMSUIMessageViewLayoutContext *)self _isSymbolImage];

        if (!v26)
        {
          *(double *)&uint64_t v20 = 52.0;
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    *(double *)&uint64_t v20 = 40.0;
    goto LABEL_25;
  }
LABEL_26:

  return v13;
}

void __45__AMSUIMessageViewLayoutContext__imageLength__block_invoke()
{
  v5[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F83418];
  v4[0] = *MEMORY[0x263F83420];
  v4[1] = v0;
  v5[0] = &unk_26CC73B10;
  v5[1] = &unk_26CC73B20;
  uint64_t v1 = *MEMORY[0x263F83408];
  v4[2] = *MEMORY[0x263F83410];
  v4[3] = v1;
  v5[2] = &unk_26CC73B30;
  v5[3] = &unk_26CC73B40;
  v4[4] = *MEMORY[0x263F83400];
  v5[4] = &unk_26CC73B50;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  id v3 = (void *)_imageLength_ams_once_object___COUNTER__;
  _imageLength_ams_once_object___COUNTER__ = v2;
}

- (double)_imageToLabelSpacing
{
  id v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 style];

  double v5 = 4.0;
  if (!v4) {
    double v5 = 6.0;
  }
  [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v5];
  return result;
}

- (double)_interitemSpacing
{
  id v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 style];

  double v5 = 10.0;
  if (v4)
  {
    double v6 = [(AMSUIMessageViewLayoutContext *)self messageView];
    uint64_t v7 = [v6 style];

    if (v7 != 1)
    {
      double v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
      if ([v8 style] != 2)
      {
        double v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
        if ([v9 style] != 6)
        {
          double v10 = [(AMSUIMessageViewLayoutContext *)self messageView];
          [v10 style];
        }
      }

      double v5 = 11.0;
    }
  }
  [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:v5];
  return result;
}

- (BOOL)_isAccessoryViewLeading
{
  id v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 accessoryView];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  double v6 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v7 = [v6 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 6)
  {
    double v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
    if ([v9 style] == 2)
    {
      char v10 = [v5 isDefaultCloseButton];
    }
    else
    {
      double v11 = [(AMSUIMessageViewLayoutContext *)self messageView];
      if ([v11 style] == 6)
      {
        char v10 = [v5 isDefaultCloseButton];
      }
      else
      {
        double v12 = [(AMSUIMessageViewLayoutContext *)self messageView];
        if ([v12 style] == 3) {
          char v10 = [v5 isDefaultCloseButton];
        }
        else {
          char v10 = 0;
        }
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_isIconImageTopAligned
{
  id v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v4 = [v3 style];

  if (v4 == 5) {
    return 1;
  }
  if (v4) {
    return 0;
  }
  id v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v6 = [v5 traitCollection];
  BOOL v7 = [v6 userInterfaceIdiom] != 0;

  return v7;
}

- (BOOL)_isFooterButtonPartOfContentFrame
{
  uint64_t v2 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v3 = [v2 style];

  return (unint64_t)(v3 - 6) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)_isSymbolImage
{
  uint64_t v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v3 isImageSymbolImage])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v6 = [v5 imageView];
    BOOL v7 = [v6 image];
    char v4 = [v7 isSymbolImage];
  }
  return v4;
}

- (BOOL)_isTextOnlyBanner
{
  uint64_t v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v3 style] == 1 && -[AMSUIMessageViewLayoutContext isImageViewHidden](self, "isImageViewHidden")) {
    BOOL v4 = ![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (double)_maxFooterButtonWidth
{
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  double v4 = v3;
  id v5 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v6 = [v5 style];

  if (v6 != 5)
  {
    [(AMSUIMessageViewLayoutContext *)self leadingContentTextBaseline];
    double v4 = v4 - v7;
  }
  uint64_t v8 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v8 style] != 2)
  {
    double v9 = [(AMSUIMessageViewLayoutContext *)self messageView];
    if ([v9 style] != 3)
    {
      double v14 = [(AMSUIMessageViewLayoutContext *)self messageView];
      uint64_t v15 = [v14 style];

      if (v15 != 5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  [(AMSUIMessageViewLayoutContext *)self contentLayoutMargins];
  double v4 = v4 + v10;
LABEL_8:
  double v11 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v11 style]
    || [(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout])
  {
    double v12 = [(AMSUIMessageViewLayoutContext *)self messageView];
    uint64_t v13 = [v12 style];

    if (v13 != 6) {
      return v4;
    }
  }
  else
  {
  }
  [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
  return v4 - v16;
}

- (double)_maxTextContainerWidth
{
  [(AMSUIMessageViewLayoutContext *)self mainContentFrame];
  double v4 = v3;
  [(AMSUIMessageViewLayoutContext *)self leadingContentTextBaseline];
  return v4 - v5;
}

- (double)_scaledUIValueForValue:(double)a3
{
  double v5 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F835F0]];
  uint64_t v6 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v7 = [v6 traitCollection];
  [v5 scaledValueForValue:v7 compatibleWithTraitCollection:a3];
  double v9 = v8;

  return v9;
}

- (BOOL)_shouldOffsetFooterButtonFromMainContentView
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if ([v3 style])
  {
    double v4 = [(AMSUIMessageViewLayoutContext *)self messageView];
    if ([v4 style] == 6) {
      BOOL v5 = ![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    BOOL v5 = ![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout];
  }

  return v5;
}

- (BOOL)_shouldTextViewTextFillUnderCloseButton
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  if (![v3 style])
  {
    char v6 = 0;
LABEL_9:

    return v6;
  }
  double v4 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v5 = [v4 style];

  if (v5 != 1)
  {
    double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
    double v7 = [v3 accessoryView];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    char v6 = [v8 isDefaultCloseButton];
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)shouldUseStackedLayout
{
  uint64_t v2 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v3 = [v2 traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  return IsAccessibilityCategory;
}

- (double)accessorySpacing
{
  return 10.0;
}

- (BOOL)isImageViewHidden
{
  double v3 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v4 = [v3 imageView];
  uint64_t v5 = [v4 image];
  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    double v7 = [(AMSUIMessageViewLayoutContext *)self messageView];
    int v6 = [v7 preLayoutImageView] ^ 1;
  }
  return v6;
}

- (double)leadingContentTextBaseline
{
  double v3 = 0.0;
  if (![(AMSUIMessageViewLayoutContext *)self shouldUseStackedLayout]
    && ![(AMSUIMessageViewLayoutContext *)self isImageViewHidden])
  {
    [(AMSUIMessageViewLayoutContext *)self _makeImageViewSize];
    double v5 = v4 + 0.0;
    int v6 = [(AMSUIMessageViewLayoutContext *)self messageView];
    uint64_t v7 = [v6 style];

    if (v7 == 1)
    {
      if ([(AMSUIMessageViewLayoutContext *)self _isSymbolImage]) {
        [(AMSUIMessageViewLayoutContext *)self _scaledUIValueForValue:16.0];
      }
      else {
        [(AMSUIMessageViewLayoutContext *)self _interitemSpacing];
      }
      double v3 = v5 + v8 * 2.0;
    }
    else
    {
      [(AMSUIMessageViewLayoutContext *)self _interitemSpacing];
      double v3 = v5 + v9;
    }
  }
  double v10 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v11 = [v10 accessoryView];
  if (v11)
  {
    double v12 = (void *)v11;
    BOOL v13 = [(AMSUIMessageViewLayoutContext *)self _isAccessoryViewLeading];

    if (v13)
    {
      [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
      double v15 = v14;
      [(AMSUIMessageViewLayoutContext *)self accessoryViewFrame];
      double v17 = v15 + v16;
      [(AMSUIMessageViewLayoutContext *)self accessorySpacing];
      double v3 = v3 + v18 + v17;
    }
  }
  else
  {
  }
  double v19 = [(AMSUIMessageViewLayoutContext *)self messageView];
  uint64_t v20 = [v19 textView];
  [v20 textContainerInset];
  double v22 = v3 - v21;

  return v22;
}

- (double)separatorThickness
{
  uint64_t v2 = [(AMSUIMessageViewLayoutContext *)self messageView];
  double v3 = [v2 traitCollection];
  [v3 displayScale];
  double v5 = 1.0 / v4;

  return v5;
}

- (double)totalFooterButtonHeight
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v3 = [(AMSUIMessageViewLayoutContext *)self footerButtonFramesPreFlatten];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  [(AMSUIMessageViewLayoutContext *)self _footerButtonInterSpacing];
  double v6 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(AMSUIMessageViewLayoutContext *)self footerButtonFramesPreFlatten];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) CGRectValue];
        double v11 = v11 + v6 + v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
  }

  return v11 - v6;
}

- (CGRect)accessoryViewFrame
{
  double x = self->_accessoryViewFrame.origin.x;
  double y = self->_accessoryViewFrame.origin.y;
  double width = self->_accessoryViewFrame.size.width;
  double height = self->_accessoryViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAccessoryViewFrame:(CGRect)a3
{
  self->_accessoryViewFrame = a3;
}

- (CGRect)accessorySecondaryViewFrame
{
  double x = self->_accessorySecondaryViewFrame.origin.x;
  double y = self->_accessorySecondaryViewFrame.origin.y;
  double width = self->_accessorySecondaryViewFrame.size.width;
  double height = self->_accessorySecondaryViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAccessorySecondaryViewFrame:(CGRect)a3
{
  self->_accessorySecondaryViewFrame = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGRect)debugButtonFrame
{
  double x = self->_debugButtonFrame.origin.x;
  double y = self->_debugButtonFrame.origin.y;
  double width = self->_debugButtonFrame.size.width;
  double height = self->_debugButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDebugButtonFrame:(CGRect)a3
{
  self->_debugButtonFrame = a3;
}

- (CGSize)debugButtonSize
{
  double width = self->_debugButtonSize.width;
  double height = self->_debugButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDebugButtonSize:(CGSize)a3
{
  self->_debugButtonSize = a3;
}

- (NSMutableArray)footerButtonFrames
{
  return self->_footerButtonFrames;
}

- (void)setFooterButtonFrames:(id)a3
{
}

- (CGRect)imageViewFrame
{
  double x = self->_imageViewFrame.origin.x;
  double y = self->_imageViewFrame.origin.y;
  double width = self->_imageViewFrame.size.width;
  double height = self->_imageViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageViewFrame:(CGRect)a3
{
  self->_imageViewFrame = a3;
}

- (CGRect)maskViewFrame
{
  double x = self->_maskViewFrame.origin.x;
  double y = self->_maskViewFrame.origin.y;
  double width = self->_maskViewFrame.size.width;
  double height = self->_maskViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMaskViewFrame:(CGRect)a3
{
  self->_maskViewFrame = a3;
}

- (NSMutableArray)separatorViewFrames
{
  return self->_separatorViewFrames;
}

- (void)setSeparatorViewFrames:(id)a3
{
}

- (CGRect)textViewFrame
{
  double x = self->_textViewFrame.origin.x;
  double y = self->_textViewFrame.origin.y;
  double width = self->_textViewFrame.size.width;
  double height = self->_textViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextViewFrame:(CGRect)a3
{
  self->_textViewFrame = a3;
}

- (NSMutableArray)footerButtonFramesPreFlatten
{
  return self->_footerButtonFramesPreFlatten;
}

- (void)setFooterButtonFramesPreFlatten:(id)a3
{
}

- (CGRect)footerContainerViewFrame
{
  double x = self->_footerContainerViewFrame.origin.x;
  double y = self->_footerContainerViewFrame.origin.y;
  double width = self->_footerContainerViewFrame.size.width;
  double height = self->_footerContainerViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFooterContainerViewFrame:(CGRect)a3
{
  self->_footerContainerViewFrame = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirtdouble y = a3;
}

- (CGSize)lastFittingSize
{
  double width = self->_lastFittingSize.width;
  double height = self->_lastFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastFittingSize:(CGSize)a3
{
  self->_lastFittingSize = a3;
}

- (CGRect)lastMessageViewFrame
{
  double x = self->_lastMessageViewFrame.origin.x;
  double y = self->_lastMessageViewFrame.origin.y;
  double width = self->_lastMessageViewFrame.size.width;
  double height = self->_lastMessageViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastMessageViewFrame:(CGRect)a3
{
  self->_lastMessageViewFrame = a3;
}

- (CGSize)lastSize
{
  double width = self->_lastSize.width;
  double height = self->_lastSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (CGRect)mainContentFrame
{
  double x = self->_mainContentFrame.origin.x;
  double y = self->_mainContentFrame.origin.y;
  double width = self->_mainContentFrame.size.width;
  double height = self->_mainContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMainContentFrame:(CGRect)a3
{
  self->_mainContentFrame = a3;
}

- (AMSUIMessageView)messageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageView);
  return (AMSUIMessageView *)WeakRetained;
}

- (void)setMessageView:(id)a3
{
}

- (CGSize)textViewContentHuggingSize
{
  double width = self->_textViewContentHuggingSize.width;
  double height = self->_textViewContentHuggingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTextViewContentHuggingSize:(CGSize)a3
{
  self->_textViewContentHuggingSize = a3;
}

- (UIBezierPath)textViewExclusionPath
{
  return self->_textViewExclusionPath;
}

- (void)setTextViewExclusionPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewExclusionPath, 0);
  objc_destroyWeak((id *)&self->_messageView);
  objc_storeStrong((id *)&self->_footerButtonFramesPreFlatten, 0);
  objc_storeStrong((id *)&self->_separatorViewFrames, 0);
  objc_storeStrong((id *)&self->_footerButtonFrames, 0);
}

@end