@interface LPCaptionBarView
- (BOOL)hasIconViewEqualToComponentView:(id)a3;
- (BOOL)useProgressSpinner;
- (CGSize)_layoutCaptionBarForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPCaptionBarView)initWithHost:(id)a3;
- (LPCaptionBarView)initWithHost:(id)a3 style:(id)a4 presentationProperties:(id)a5;
- (LPCollaborationFooterView)collaborationFooterView;
- (NSRegularExpression)emphasizedTextExpression;
- (UIEdgeInsets)textSafeAreaInset;
- (id)button;
- (id)layoutExclusionsForView:(id)a3;
- (id)playable;
- (id)primaryIconView;
- (id)subtitleButton;
- (void)_buildViewsForCaptionBarIfNeeded;
- (void)addSubview:(id)a3;
- (void)animateInWithBaseAnimation:(id)a3 currentTime:(double)a4;
- (void)animateOut;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutComponentView;
- (void)setCollaborationFooterView:(id)a3;
- (void)setEmphasizedTextExpression:(id)a3;
- (void)setPlaybackInformation:(id)a3;
- (void)setPresentationProperties:(id)a3;
- (void)setTextSafeAreaInset:(UIEdgeInsets)a3;
- (void)setUseProgressSpinner:(BOOL)a3;
- (void)updateTextStack;
@end

@implementation LPCaptionBarView

- (LPCaptionBarView)initWithHost:(id)a3
{
  return 0;
}

- (LPCaptionBarView)initWithHost:(id)a3 style:(id)a4 presentationProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LPCaptionBarView;
  v11 = [(LPComponentView *)&v18 initWithHost:v8];
  v12 = v11;
  if (v11)
  {
    p_style = (id *)&v11->_style;
    objc_storeStrong((id *)&v11->_style, a4);
    objc_storeStrong((id *)&v12->_presentationProperties, a5);
    v14 = [*p_style backgroundColor];

    if (v14)
    {
      v15 = [*p_style backgroundColor];
      [(UIView *)v12 _lp_setBackgroundColor:v15];
    }
    v16 = v12;
  }

  return v12;
}

- (void)setUseProgressSpinner:(BOOL)a3
{
  self->_useProgressSpinner = a3;
  if (self->_hasEverBuilt) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to update a caption bar after it has been laid out."];
  }
}

- (void)setPlaybackInformation:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, a3);
  if (self->_hasEverBuilt) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to update a caption bar after it has been laid out."];
  }
}

- (void)animateOut
{
  id v15 = [(LPCaptionBarView *)self layer];
  [v15 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 1.0, 600.0, 400.0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1039918957;
  LODWORD(v6) = 1012202996;
  LODWORD(v7) = 1058256454;
  LODWORD(v8) = 1064682127;
  id v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :v6 :v7 :v8];
  [v16 setTimingFunction:v9];

  [v16 setBeginTime:v4];
  [v16 setFromValue:&unk_1EF712870];
  id v10 = (void *)[v16 copy];
  [v10 setKeyPath:@"opacity"];
  [v10 setDelegate:self];
  [v10 setRemovedOnCompletion:0];
  [v10 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v10 setToValue:&unk_1EF712888];
  v11 = [(LPCaptionBarView *)self layer];
  [v11 addAnimation:v10 forKey:@"captionFadeOutSpring"];

  if (self->_useProgressSpinner)
  {
    v12 = (void *)[v16 copy];
    [v12 setKeyPath:@"transform.scale.xy"];
    [v12 setToValue:&unk_1EF712E08];
    v13 = [(LPComponentView *)self->_leftIconView layer];
    [v13 addAnimation:v12 forKey:@"spinnerShrinkOutSpring"];

    v14 = [(LPComponentView *)self->_rightIconView layer];
    [v14 addAnimation:v12 forKey:@"spinnerShrinkOutSpring"];
  }
}

- (void)animateInWithBaseAnimation:(id)a3 currentTime:(double)a4
{
  id v19 = a3;
  [(LPCaptionBarView *)self _buildViewsForCaptionBarIfNeeded];
  double v6 = objc_msgSend(v19, "_lp_copyWithBeginTime:", a4 + 0.28);
  double v7 = objc_msgSend(v19, "_lp_copyWithBeginTime:", a4 + 0.4);
  double v8 = [(LPTextStyleable *)self->_aboveTopCaptionView layer];
  [v8 addAnimation:v6 forKey:@"fadeIn"];

  id v9 = [(LPTextStyleable *)self->_topCaptionView layer];
  [v9 addAnimation:v6 forKey:@"fadeIn"];

  id v10 = [(LPTextStyleable *)self->_bottomCaptionView layer];
  [v10 addAnimation:v7 forKey:@"fadeIn"];

  v11 = [(LPTextStyleable *)self->_belowBottomCaptionView layer];
  [v11 addAnimation:v7 forKey:@"fadeIn"];

  v12 = [(LPComponentView *)self->_leftIconView layer];
  [v12 addAnimation:v7 forKey:@"fadeIn"];

  v13 = [(LPComponentView *)self->_rightIconView layer];
  [v13 addAnimation:v7 forKey:@"fadeIn"];

  v14 = [(LPComponentView *)self->_leftIconBadgeView layer];
  [v14 addAnimation:v7 forKey:@"fadeIn"];

  id v15 = [(LPComponentView *)self->_rightIconBadgeView layer];
  [v15 addAnimation:v7 forKey:@"fadeIn"];

  id v16 = [(LPPlayButtonView *)self->_playButton layer];
  [v16 addAnimation:v7 forKey:@"fadeIn"];

  v17 = [(LPCaptionBarButtonView *)self->_buttonView layer];
  [v17 addAnimation:v7 forKey:@"fadeIn"];

  objc_super v18 = [(LPCollaborationFooterView *)self->_collaborationFooterView layer];
  [v18 addAnimation:v7 forKey:@"fadeIn"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v7 = a3;
  double v5 = [(LPCaptionBarView *)self layer];
  id v6 = [v5 animationForKey:@"captionFadeOutSpring"];

  if (v6 == v7) {
    [(LPCaptionBarView *)self removeFromSuperview];
  }
}

- (void)layoutComponentView
{
  [(LPCaptionBarView *)self bounds];

  -[LPCaptionBarView _layoutCaptionBarForSize:applyingLayout:](self, "_layoutCaptionBarForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPCaptionBarView _layoutCaptionBarForSize:applyingLayout:](self, "_layoutCaptionBarForSize:applyingLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutCaptionBarForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v398 = a4;
  double height = a3.height;
  double width = a3.width;
  [(LPCaptionBarView *)self _buildViewsForCaptionBarIfNeeded];
  BOOL v6 = [(UIView *)self _lp_isLTR];
  style = self->_style;
  if (v6)
  {
    id v407 = [(LPCaptionBarStyle *)style leadingIcon];

    id v406 = [(LPCaptionBarStyle *)self->_style trailingIcon];

    id v373 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconProperties];

    [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconProperties];
  }
  else
  {
    id v407 = [(LPCaptionBarStyle *)style trailingIcon];

    id v406 = [(LPCaptionBarStyle *)self->_style leadingIcon];

    id v373 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconProperties];

    [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconProperties];
  }
  id v372 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_leftIconView)
  {
    double v8 = [v407 margin];
    [v8 asInsetsForLTR:v6];
    double v356 = v9;
    double v408 = v10;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v356 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v408 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (self->_rightIconView)
  {
    id v15 = [v406 margin];
    [v15 asInsetsForLTR:v6];
    double v355 = v16;
    double v378 = v17;
    double v380 = v18;
    double rect1 = v19;
  }
  else
  {
    double v355 = *MEMORY[0x1E4FB2848];
    double v378 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v380 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double rect1 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (self->_playButton)
  {
    v20 = [(LPCaptionBarStyle *)self->_style playButtonPadding];
    [v20 asInsetsForLTR:v6];
    double v392 = v21;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
  }
  else
  {
    double v23 = *MEMORY[0x1E4FB2848];
    double v392 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v25 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v27 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (self->_buttonView)
  {
    v28 = [(LPCaptionBarStyle *)self->_style button];
    v29 = [v28 margin];
    [v29 asInsetsForLTR:v6];
    double v347 = v30;
    double rect2 = v31;
    double v354 = v32;
    double rect2_16 = v33;
  }
  else
  {
    double v347 = *MEMORY[0x1E4FB2848];
    double rect2 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v354 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double rect2_16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v361 = v14;
  double v342 = v25;
  double v343 = v23;
  double rect2_24 = v27;
  if (self->_collaborationFooterView)
  {
    v34 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
    v35 = [v34 margin];
    [v35 asInsetsForLTR:v6];
    double v352 = v36;
    double v333 = v38;
    double v334 = v37;
    double v348 = v39;
  }
  else
  {
    double v352 = *MEMORY[0x1E4FB2848];
    double v348 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v333 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v334 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  double left = self->_textSafeAreaInset.left;
  double right = self->_textSafeAreaInset.right;
  v42 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties button];
  v43 = [v42 requiresInlineButton];
  if (v43)
  {
    v44 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties button];
    v45 = [v44 requiresInlineButton];
    char v46 = [v45 BOOLValue];

    if (v46) {
      goto LABEL_21;
    }
  }
  else
  {
    BOOL v47 = [(LPCaptionBarStyle *)self->_style usesOutOfLineButton];

    if (!v47)
    {
LABEL_21:
      int v396 = 0;
      if (v6) {
        double rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
      }
      else {
        double rect2 = rect2 + self->_textSafeAreaInset.left;
      }
      goto LABEL_32;
    }
  }
  if (![(LPCaptionBarStyle *)self->_style buttonIgnoresTextSafeAreaInsets])
  {
    if (v6) {
      double rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
    }
    else {
      double rect2 = rect2 + self->_textSafeAreaInset.left;
    }
  }
  if ([(LPCaptionBarStyle *)self->_style addFullWidthLineForButton])
  {
    double rect2 = rect2 + self->_textSafeAreaInset.left;
    double rect2_16 = rect2_16 + self->_textSafeAreaInset.right;
  }
  int v396 = 1;
LABEL_32:
  if (self->_collaborationFooterView
    && [(LPCaptionBarStyle *)self->_style positionButtonRelativeToTextStack])
  {
    double v354 = 0.0;
    double v380 = 0.0;
    double v361 = 0.0;
  }
  v48 = self->_style;
  if (v6)
  {
    id v49 = [(LPCaptionBarStyle *)v48 leadingAccessory];

    [(LPCaptionBarStyle *)self->_style trailingAccessory];
  }
  else
  {
    id v49 = [(LPCaptionBarStyle *)v48 trailingAccessory];

    [(LPCaptionBarStyle *)self->_style leadingAccessory];
  }
  id v353 = (id)objc_claimAutoreleasedReturnValue();

  v344 = v49;
  if (self->_leftAccessoryView)
  {
    v50 = [v49 margin];
    [v50 asInsetsForLTR:v6];
    double v340 = v52;
    double v341 = v51;
    double rect2_8 = v53;
    double v55 = v54;
  }
  else
  {
    double v55 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v340 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v341 = *MEMORY[0x1E4FB2848];
    double rect2_8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (self->_rightAccessoryView)
  {
    v56 = [v353 margin];
    [v56 asInsetsForLTR:v6];
    double v338 = v58;
    double v339 = v57;
    double v383 = v59;
    double v61 = v60;
  }
  else
  {
    double v383 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v61 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v338 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v339 = *MEMORY[0x1E4FB2848];
  }
  v62 = [(LPCaptionBarStyle *)self->_style textStack];
  v63 = [v62 captionTextPadding];

  v64 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIcon];
  if (v64)
  {
    v65 = [(LPCaptionBarStyle *)self->_style trailingPaddingForPresenceOfLeadingIcon];

    if (v65)
    {
      v66 = (void *)[v63 copy];

      v67 = [(LPCaptionBarStyle *)self->_style trailingPaddingForPresenceOfLeadingIcon];
      [v66 setTrailing:v67];

      v63 = v66;
    }
  }
  if (self->_playButton || (!self->_buttonView ? (char v68 = 1) : (char v68 = v396), (v68 & 1) == 0))
  {
    v69 = (void *)[v63 copy];

    v70 = +[LPPointUnit zero];
    [v69 setTrailing:v70];

    v63 = v69;
  }
  v349 = v63;
  [v63 asInsetsForLTR:v6];
  double v72 = v71;
  double v74 = v73;
  double v335 = v76 + self->_textSafeAreaInset.bottom;
  double v336 = v75 + self->_textSafeAreaInset.top;
  -[LPVerticalTextStackView setContentInset:](self->_textStackView, "setContentInset:");
  double v351 = v74;
  double v346 = v72;
  uint64_t v77 = MEMORY[0x1E4F1DB28];
  leftAccessoryView = self->_leftAccessoryView;
  double v399 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v376 = v399;
  double v377 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v370 = v377;
  double v404 = *MEMORY[0x1E4F1DB28];
  double v358 = *MEMORY[0x1E4F1DB28];
  if (leftAccessoryView)
  {
    [(LPCaptionBarAccessoryView *)leftAccessoryView size];
    double v376 = v80;
    double v377 = v79;
    double v358 = v55;
  }
  rightAccessoryView = self->_rightAccessoryView;
  double v366 = v399;
  double v367 = v370;
  double v363 = v404;
  if (rightAccessoryView)
  {
    [(LPCaptionBarAccessoryView *)rightAccessoryView size];
    double v366 = v82;
    double v367 = v83;
    double v363 = width - v83 - v61;
  }
  double v403 = *(double *)(v77 + 8);
  double v84 = v12 + left;
  leftIconView = self->_leftIconView;
  if (leftIconView)
  {
    [v407 fixedSize];
    v87 = double v86 = v370;
    [v87 asSize];
    -[LPComponentView sizeThatFits:](leftIconView, "sizeThatFits:");
    double v391 = v88;
    double rect = v89;

    uint64_t v90 = [v373 verticalAlignment];
    if (!v90) {
      uint64_t v90 = [v407 verticalAlignment];
    }
    v91 = [v407 fixedSize];

    if (v91)
    {
      if (v90 == 3 && [v407 canAdjustVerticalPaddingForFixedSize])
      {
        v92 = [v407 fixedSize];
        [v92 asSize];
        double v94 = v93;
        v420.origin.x = v404;
        v420.origin.double y = v403;
        v420.size.double width = v391;
        v420.size.double height = rect;
        double v95 = fmax((v94 - CGRectGetHeight(v420)) * 0.5, 0.0);

        double v356 = v356 + v95;
        double v361 = v361 + v95;
      }
      if ([v373 canAdjustHorizontalPaddingForFixedSize])
      {
        v96 = [v407 fixedSize];
        [v96 asSize];
        double v98 = v97;
        v421.origin.x = v404;
        v421.origin.double y = v403;
        v421.size.double width = v391;
        v421.size.double height = rect;
        double v99 = fmax((v98 - CGRectGetWidth(v421)) * 0.5, 0.0);

        double v84 = v84 + v99;
        double v408 = v408 + v99;
      }
    }
    v100 = [v407 widthForUsingRegularSize];
    if (v100)
    {
      v101 = [v407 widthForUsingRegularSize];
      [v101 value];
      double v103 = v102;

      if (width < v103)
      {
        v104 = self->_leftIconView;
        v105 = [v407 minimumSize];
        [v105 asSize];
        -[LPComponentView sizeThatFits:](v104, "sizeThatFits:");
        double v391 = v106;
        double rect = v107;
      }
    }
    if ([v407 scalesToFitParent])
    {
      int v108 = [v407 preservesEdgeAlignmentWhenScaling];
      double v109 = fmin(width - v84 - v408, height - v356 - v361);
      if (v108)
      {
        -[LPComponentView sizeThatFits:](self->_leftIconView, "sizeThatFits:", v109, v109);
        double v391 = v110;
        double rect = v111;
      }
      else
      {
        double rect = v109;
        double v391 = v109;
      }
    }
    if (self->_leftAccessoryView)
    {
      v422.origin.x = v358;
      v422.origin.double y = v403;
      v422.size.double height = v376;
      v422.size.double width = v377;
      double MaxX = CGRectGetMaxX(v422);
    }
    else
    {
      double MaxX = 0.0;
    }
    double v364 = v84;
    double v112 = v84 + MaxX;
  }
  else
  {
    double v364 = v12 + left;
    double rect = v399;
    double v86 = v370;
    double v391 = v370;
    double v112 = v404;
  }
  double v360 = v112;
  double v114 = rect1 + right;
  rightIconView = self->_rightIconView;
  if (rightIconView)
  {
    v116 = [v406 fixedSize];
    [v116 asSize];
    -[LPComponentView sizeThatFits:](rightIconView, "sizeThatFits:");
    double v394 = v117;
    double v119 = v118;

    uint64_t v120 = [v372 verticalAlignment];
    if (!v120) {
      uint64_t v120 = [v406 verticalAlignment];
    }
    v121 = [v406 fixedSize];

    if (v121)
    {
      if (v120 == 3 && [v406 canAdjustVerticalPaddingForFixedSize])
      {
        v122 = [v406 fixedSize];
        [v122 asSize];
        double v124 = v123;
        v423.origin.x = v404;
        v423.origin.double y = v403;
        v423.size.double width = v394;
        v423.size.double height = v119;
        double v125 = fmax((v124 - CGRectGetHeight(v423)) * 0.5, 0.0);

        double v355 = v355 + v125;
        double v380 = v380 + v125;
      }
      if ([v372 canAdjustHorizontalPaddingForFixedSize])
      {
        v126 = [v406 fixedSize];
        [v126 asSize];
        double v128 = v127;
        v424.origin.x = v404;
        v424.origin.double y = v403;
        v424.size.double width = v394;
        v424.size.double height = v119;
        double v129 = fmax((v128 - CGRectGetWidth(v424)) * 0.5, 0.0);

        double v378 = v378 + v129;
        double v114 = v114 + v129;
      }
    }
    v130 = [v406 widthForUsingRegularSize];
    if (v130)
    {
      v131 = [v406 widthForUsingRegularSize];
      [v131 value];
      double v133 = v132;

      if (width < v133)
      {
        v134 = self->_rightIconView;
        v135 = [v406 minimumSize];
        [v135 asSize];
        -[LPComponentView sizeThatFits:](v134, "sizeThatFits:");
        double v394 = v136;
        double v119 = v137;
      }
    }
    if ([v406 scalesToFitParent])
    {
      double v119 = fmin(width - v378 - v114, height - v355 - v380);
      if ([v406 preservesEdgeAlignmentWhenScaling])
      {
        -[LPComponentView sizeThatFits:](self->_rightIconView, "sizeThatFits:", v119, v119);
        double v394 = v138;
        double v119 = v139;
      }
      else
      {
        double v394 = v119;
      }
    }
    double v142 = v363;
    if (!self->_rightAccessoryView) {
      double v142 = width;
    }
    double v359 = v142 - v394 - v114;
    double v141 = v404;
    double v140 = v399;
  }
  else
  {
    double v140 = v399;
    double v119 = v399;
    double v394 = v86;
    double v141 = v404;
    double v359 = v404;
  }
  double v143 = rect2_24 + right;
  double v374 = v140;
  double v369 = v86;
  double v345 = v141;
  if (self->_playButton)
  {
    v144 = [(LPCaptionBarStyle *)self->_style playButton];
    v145 = [v144 size];
    [v145 asSize];
    double v369 = v146;
    double v374 = v147;

    if (v6) {
      double v148 = width - v369 - v143;
    }
    else {
      double v148 = v392;
    }
    double v345 = v148;
  }
  v149 = self->_leftAccessoryView;
  if (v149)
  {
    [(LPCaptionBarAccessoryView *)v149 size];
    double v376 = v151;
    double v377 = v150;
    double v358 = v55;
  }
  v152 = self->_rightAccessoryView;
  if (v152)
  {
    [(LPCaptionBarAccessoryView *)v152 size];
    double v366 = v153;
    double v367 = v154;
    double v363 = width - v154 - v61;
  }
  buttonView = self->_buttonView;
  v156 = (double *)MEMORY[0x1E4F1DB30];
  double rect1a = v399;
  CGFloat v382 = v404;
  if (buttonView)
  {
    -[LPCaptionBarButtonView sizeThatFits:](buttonView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double rect1a = v157;
    double v86 = v158;
    double v159 = width - v158 - rect2_16;
    if (!v6) {
      double v159 = rect2;
    }
    CGFloat v382 = v159;
  }
  double rect2_24a = width;
  double v160 = 0.0;
  if (self->_leftIconView) {
    double v161 = v408 + v364 + v391;
  }
  else {
    double v161 = 0.0;
  }
  double v162 = v86;
  if (self->_rightIconView) {
    double v163 = v114 + v378 + v394;
  }
  else {
    double v163 = 0.0;
  }
  double v164 = v143 + v392 + v369;
  if (!self->_playButton) {
    double v164 = 0.0;
  }
  double v368 = v162;
  if (self->_buttonView) {
    double v165 = rect2_16 + rect2 + v162;
  }
  else {
    double v165 = 0.0;
  }
  double v166 = rect2_8 + v55 + v377;
  if (!self->_leftAccessoryView) {
    double v166 = 0.0;
  }
  if (self->_rightAccessoryView) {
    double v160 = v61 + v383 + v367;
  }
  double v167 = v161 + v166;
  double v168 = v163 + v160;
  double v331 = v165;
  double v169 = v164 + v165 + v167;
  double v170 = v164 + v165 + v168;
  if (v6) {
    double v169 = v167;
  }
  else {
    double v170 = v168;
  }
  double v171 = v164 + v167;
  double v172 = v164 + v168;
  if (v6)
  {
    double v173 = v167;
  }
  else
  {
    double v172 = v168;
    double v173 = v171;
  }
  if (v396) {
    double v174 = v172;
  }
  else {
    double v174 = v170;
  }
  if (v396) {
    double v175 = v173;
  }
  else {
    double v175 = v169;
  }
  if (v175 == 0.0) {
    double v175 = self->_textSafeAreaInset.left;
  }
  if (v174 == 0.0) {
    double v174 = self->_textSafeAreaInset.right;
  }
  double rect2_8a = rect2_24a - (v175 + v174);
  -[LPVerticalTextStackView sizeThatFits:](self->_textStackView, "sizeThatFits:");
  CGFloat v384 = v176;
  v417[0] = MEMORY[0x1E4F143A8];
  v417[1] = 3221225472;
  v417[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2;
  v417[3] = &unk_1E5B06EE0;
  double v350 = v174;
  v417[4] = self;
  BOOL v418 = v398;
  *(double *)&v417[5] = rect2_24a;
  *(double *)&v417[6] = height;
  double v393 = v174 + v175 + v177;
  *(double *)&v417[7] = v393;
  *(CGFloat *)&v417[8] = v382;
  *(double *)&v417[9] = v403;
  *(double *)&v417[10] = v368;
  *(double *)&v417[11] = rect1a;
  BOOL v178 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2((uint64_t)v417);
  double v179 = v351;
  if (v178)
  {
    -[LPCaptionBarButtonView collapsedSizeThatFits:](self->_buttonView, "collapsedSizeThatFits:", *v156, v156[1]);
    double v182 = v181;
    double v183 = rect2_24a - v181 - rect2_16;
    if (!v6) {
      double v183 = rect2;
    }
    CGFloat v382 = v183;
    double v184 = v174;
    double v368 = v182;
    if ((v396 & 1) == 0)
    {
      double v185 = rect2_16 + rect2 + v182 - v331;
      double v186 = v175 + v185;
      double v187 = v174 + v185;
      if (v6) {
        double v184 = v187;
      }
      else {
        double v175 = v186;
      }
    }
    double v175 = v175 - v161;
    double v188 = v184 - v163;
    if (v175 == 0.0) {
      double v175 = self->_textSafeAreaInset.left;
    }
    double v189 = rect2_24a;
    if (v188 == 0.0) {
      double v188 = self->_textSafeAreaInset.right;
    }
    double rect1a = v180;
    double rect2_8a = rect2_24a - (v175 + v188);
    -[LPVerticalTextStackView sizeThatFits:](self->_textStackView, "sizeThatFits:");
    CGFloat v384 = v190;
    double v191 = v188;
    double v192 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v114 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v408 = v114;
    double v378 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v380 = v192;
    double v364 = v378;
    double v355 = *MEMORY[0x1E4FB2848];
    double v356 = *MEMORY[0x1E4FB2848];
    double v119 = v399;
    double v394 = v370;
    double v350 = v191;
    double v393 = v191 + v175 + v193;
    double v359 = v404;
    double v360 = v404;
    double rect = v399;
    double v391 = v370;
    double v179 = v351;
  }
  else
  {
    double v189 = rect2_24a;
    double v192 = v361;
  }
  v194 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
  double v195 = v189;
  if ((([v194 useFullWidthDuringSizing] | v398) & 1) == 0)
  {
    v196 = [(LPCaptionBarStyle *)self->_style minimumWidth];
    [v196 value];
    double v195 = fmax(v197, v393);
  }
  [(LPCollaborationFooterView *)self->_collaborationFooterView additionalPadding];
  double v329 = v199;
  double v330 = v198;
  double v327 = v201;
  double v328 = v200;
  v415[0] = MEMORY[0x1E4F143A8];
  v415[1] = 3221225472;
  v415[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4;
  v415[3] = &unk_1E5B06F08;
  v415[4] = self;
  BOOL v416 = v6;
  *(double *)&v415[5] = v336;
  *(double *)&v415[6] = v346;
  *(double *)&v415[7] = v335;
  *(double *)&v415[8] = v179;
  *(double *)&v415[9] = v356;
  *(double *)&v415[10] = v364;
  *(double *)&v415[11] = v192;
  *(double *)&v415[12] = v408;
  *(double *)&v415[13] = v355;
  *(double *)&v415[14] = v378;
  *(double *)&v415[15] = v380;
  *(double *)&v415[16] = v114;
  double v379 = v175 + 0.0;
  *(double *)&v415[17] = v175 + 0.0;
  v415[18] = 0;
  *(double *)&v415[19] = rect2_8a;
  *(CGFloat *)&v415[20] = v384;
  *(double *)&v415[21] = v195;
  __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4((uint64_t)v415);
  -[LPCollaborationFooterView setAdditionalPadding:](self->_collaborationFooterView, "setAdditionalPadding:");
  collaborationFooterView = self->_collaborationFooterView;
  double v332 = v195;
  if (collaborationFooterView)
  {
    -[LPCollaborationFooterView sizeThatFits:](collaborationFooterView, "sizeThatFits:", v195, 1.79769313e308);
    double v375 = v203;
    double v205 = v204;
    double v206 = v119;
  }
  else
  {
    double v206 = v119;
    double v205 = v156[1];
    double v375 = *v156;
  }
  v207 = v349;
  double v208 = v354 + v347 + rect1a;
  double v337 = v205;
  v413[0] = MEMORY[0x1E4F143A8];
  v413[1] = 3221225472;
  v413[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5;
  v413[3] = &unk_1E5B06F30;
  char v414 = v396;
  v413[4] = self;
  *(double *)&v413[5] = v208;
  *(double *)&v413[6] = v348 + v352 + v205;
  double v209 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5((uint64_t)v413);
  double v362 = v192;
  double v210 = v192 + v356 + rect;
  double v211 = v380 + v355 + v206;
  v411[0] = MEMORY[0x1E4F143A8];
  v411[1] = 3221225472;
  v411[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6;
  v411[3] = &__block_descriptor_137_e5_d8__0l;
  BOOL v412 = v398;
  *(double *)&v411[4] = v189;
  *(double *)&v411[5] = height;
  double v365 = v209;
  *(double *)&v411[6] = v209;
  *(double *)&v411[7] = v175 + 0.0;
  v411[8] = 0;
  *(double *)&v411[9] = rect2_8a;
  *(CGFloat *)&v411[10] = v384;
  *(double *)&v411[11] = v210;
  *(double *)&v411[12] = v211;
  *(double *)&v411[13] = v342 + v343 + v374;
  *(double *)&v411[14] = v208;
  *(double *)&v411[15] = v340 + v341 + v376;
  *(double *)&v411[16] = v338 + v339 + v366;
  double v409 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6((uint64_t)v411);
  double v213 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v210, v360, v403, v391, rect, v212, v407, v373);
  double v214 = v206;
  double v357 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v211, v359, v403, v394, v206, v215, v406, v372);
  double v216 = v409 * 0.5;
  if (v396)
  {
    if ([(LPCaptionBarStyle *)self->_style alignButtonWithCaptionTextLeadingEdge])
    {
      uint64_t v217 = 0;
      double v218 = v379;
      double v219 = rect2_8a;
      CGFloat v220 = v384;
      if (v6) {
        double v221 = v346 + CGRectGetMinX(*(CGRect *)&v218);
      }
      else {
        double v221 = CGRectGetMaxX(*(CGRect *)&v218) - v368 - v351;
      }
      CGFloat v382 = v221;
    }
    double v222 = v409 - rect1a - v354;
    if ([(LPCaptionBarStyle *)self->_style canAddLineForButton]
      && ![(LPCaptionBarStyle *)self->_style addFullWidthLineForButton])
    {
      if ([(LPCaptionBarStyle *)self->_style positionButtonRelativeToTextStack])
      {
        v425.origin.double y = 0.0;
        v425.origin.x = v379;
        v425.size.double width = rect2_8a;
        v425.size.double height = v384;
        double v222 = v347 + CGRectGetMaxY(v425);
        v426.origin.x = v382;
        v426.origin.double y = v222;
        v426.size.double width = v368;
        v426.size.double height = rect1a;
        double v409 = fmax(v409, v354 + CGRectGetMaxY(v426));
        double v213 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v210, v360, v213, v391, rect, v223, v407, v373);
        double v357 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v211, v359, v357, v394, v214, v224, v406, v372);
        double v216 = v409 * 0.5;
      }
      else
      {
        v441.origin.double y = 0.0;
        v427.origin.x = v382;
        v441.size.double height = v384;
        v427.origin.double y = v409 - rect1a - v354;
        v427.size.double width = v368;
        v427.size.double height = rect1a;
        v441.origin.x = v379;
        v441.size.double width = rect2_8a;
        if (CGRectIntersectsRect(v427, v441))
        {
          if ([(LPCaptionBarStyle *)self->_style buttonRespectsTextStackPadding])
          {
            v428.origin.double y = 0.0;
            v428.origin.x = v379;
            v428.size.double width = rect2_8a;
            v428.size.double height = v384;
            double v208 = CGRectGetMaxY(v428) - v222;
          }
          else
          {
            v429.origin.double y = 0.0;
            v429.origin.x = v379;
            v429.size.double width = rect2_8a;
            v429.size.double height = v384;
            double MaxY = CGRectGetMaxY(v429);
            if (MaxY < fmax(v210, v211))
            {
              v430.origin.x = v360;
              v430.origin.double y = v213;
              v430.size.double width = v391;
              v430.size.double height = rect;
              double v227 = CGRectGetMaxY(v430);
              v431.origin.x = v359;
              v431.origin.double y = v357;
              v431.size.double width = v394;
              v431.size.double height = v214;
              double v208 = v208 + fmax(MaxY - fmax(v227, CGRectGetMaxY(v431)), 0.0) - fmax(v362, v380);
            }
          }
          double v409 = v409 + v208;
          double v213 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v210, v360, v213, v391, rect, v225, v407, v373);
          double v357 = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(v409, v211, v359, v357, v394, v214, v228, v406, v372);
          double v216 = v409 * 0.5;
          double v222 = v409 - rect1a - v354;
        }
      }
    }
    if (v6)
    {
      v432.origin.x = v382;
      v432.origin.double y = v222;
      v432.size.double width = v368;
      v432.size.double height = rect1a;
      double v229 = CGRectGetMaxX(v432);
      double v230 = rect2_16;
    }
    else
    {
      double v229 = v350;
      double v230 = v331;
    }
    double v393 = fmax(v393, v230 + v229);
  }
  else
  {
    double v222 = v216 + rect1a * -0.5;
  }
  if (!self->_collaborationFooterView)
  {
    double v235 = v222;
    goto LABEL_185;
  }
  v231 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
  char v232 = [v231 useFullWidth];
  double v233 = v333 + v334 + v375;

  double v234 = fmax(v393, v233);
  if (v232)
  {
    double v235 = v222;
    double v393 = v234;
LABEL_185:
    double y = v403;
    goto LABEL_192;
  }
  double v237 = fmax(v393, v350 + v233);
  if (!v6) {
    double v234 = v237;
  }
  double v393 = v234;
  double v238 = v368;
  if (self->_buttonView)
  {
    CGFloat v239 = v382;
    double v240 = v222;
    double v241 = rect1a;
    double v242 = CGRectGetMaxY(*(CGRect *)(&v238 - 2));
  }
  else
  {
    v433.origin.double y = 0.0;
    v433.origin.x = v379;
    v433.size.double width = rect2_8a;
    v433.size.double height = v384;
    double v243 = CGRectGetMaxY(v433);
    v434.origin.x = v360;
    v434.origin.double y = v213;
    v434.size.double width = v391;
    v434.size.double height = rect;
    double v244 = CGRectGetMaxY(v434);
    v435.origin.x = v359;
    v435.origin.double y = v357;
    v435.size.double width = v394;
    v435.size.double height = v214;
    double v242 = fmax(fmax(v243, v244), CGRectGetMaxY(v435));
  }
  v436.origin.double y = v352 + v242;
  v436.origin.x = v404;
  double y = v436.origin.y;
  v436.size.double width = v375;
  v436.size.double height = v337;
  double v235 = v222;
  double v409 = fmax(v409, v348 + CGRectGetMaxY(v436));
LABEL_192:
  double v245 = round((v369 - v409) * 0.5);
  double v246 = round((v374 - v409) * 0.5);
  -[LPPlayButtonView setContentInset:](self->_playButton, "setContentInset:", -v245, -v246, -v246, -v245);
  if (v398)
  {
    -[LPComponentView setFrame:](self->_leftIconView, "setFrame:", v360, v213, v391, rect);
    -[LPComponentView setFrame:](self->_rightIconView, "setFrame:", v359, v357, v394, v214);
    -[LPPlayButtonView setFrame:](self->_playButton, "setFrame:", v345 + v245, round(v216 - v374 * 0.5) + v246, v409, v409);
    -[LPCaptionBarAccessoryView setFrame:](self->_leftAccessoryView, "setFrame:", v358, v216 - v376 * 0.5, v377);
    -[LPCaptionBarAccessoryView setFrame:](self->_rightAccessoryView, "setFrame:", v363, v216 - v366 * 0.5, v367);
    blurEffectView = self->_blurEffectView;
    if (blurEffectView) {
      -[UIVisualEffectView setFrame:](blurEffectView, "setFrame:", 0.0, 0.0, rect2_24a, height);
    }
    [(LPCaptionBarButtonView *)self->_buttonView setCollapsed:v178];
    if (v396)
    {
      double v248 = v370;
      double v249 = v384;
      double v250 = rect1a;
      double v251 = v368;
      if ([(LPCaptionBarStyle *)self->_style addFullWidthLineForButton])
      {
        v437.origin.x = v382;
        v437.origin.double y = v235;
        v437.size.double width = v368;
        v437.size.double height = rect1a;
        double v250 = CGRectGetHeight(v437);
        v438.origin.x = rect2;
        double v251 = rect2_24a - (rect2_16 + rect2);
        double v235 = v347 + v409;
        v438.origin.double y = v347 + v409;
        v438.size.double width = v251;
        v438.size.double height = v250;
        double v252 = v347 + v409 + CGRectGetHeight(v438);
        double v253 = rect2;
      }
      else if ([(LPCaptionBarStyle *)self->_style expandButtonToCaptionEdge])
      {
        if (v6)
        {
          double v326 = rect2_24a - rect2_16;
          double v253 = v382;
        }
        else
        {
          v440.origin.x = v382;
          v440.origin.double y = v235;
          v440.size.double width = v368;
          v440.size.double height = rect1a;
          double v326 = CGRectGetMaxX(v440);
          double v253 = rect2;
        }
        double v251 = v326 - v253;
        double v252 = v409;
      }
      else
      {
        double v252 = v409;
        double v253 = v382;
      }
    }
    else
    {
      double v252 = v409;
      double v253 = v382;
      double v249 = v384;
      double v248 = v370;
      double v250 = rect1a;
      double v251 = v368;
    }
    -[LPCaptionBarButtonView setFrame:](self->_buttonView, "setFrame:", v253, v235, v251, v250);
    if (self->_collaborationFooterView)
    {
      v254 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
      int v255 = [v254 useFullWidth];

      if (v255) {
        double y = v352 + v252;
      }
      -[LPCollaborationFooterView setFrame:](self->_collaborationFooterView, "setFrame:", v404, y, v332, v337);
    }
    else
    {
      double v332 = v375;
    }
    char v256 = v396 ^ 1;
    if (!self->_buttonView) {
      char v256 = 1;
    }
    if ((v256 & 1) != 0
      || (BOOL v257 = [(LPCaptionBarStyle *)self->_style addFullWidthLineForButton],
          double v258 = 0.0,
          v257))
    {
      double MinY = v409;
      if (self->_collaborationFooterView)
      {
        v260 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
        char v261 = [v260 useFullWidth];

        double MinY = v409;
        if ((v261 & 1) == 0)
        {
          v439.origin.x = v404;
          v439.origin.double y = y;
          v439.size.double width = v332;
          v439.size.double height = v337;
          double MinY = CGRectGetMinY(v439);
        }
      }
      BOOL v262 = MinY > v249;
      if ([(LPCaptionBarStyle *)self->_style minimumNumberOfLinesToVerticallyCenter])
      {
        -[LPVerticalTextStackView setFrame:](self->_textStackView, "setFrame:", v379, 0.0, rect2_8a, v249);
        [(UIView *)self->_textStackView _lp_layoutIfNeeded];
        uint64_t v263 = [(LPVerticalTextStackView *)self->_textStackView computedNumberOfLines];
        unsigned int v264 = [(LPCaptionBarStyle *)self->_style minimumNumberOfLinesToVerticallyCenter];
        BOOL v262 = MinY > v249 && v263 >= v264;
      }
      double v258 = 0.0;
      if (v262) {
        double v258 = (MinY - v249) * 0.5;
      }
    }
    -[LPVerticalTextStackView setFrame:](self->_textStackView, "setFrame:", v379, v258, rect2_8a, v249);
    v266 = self->_style;
    if (v6)
    {
      [(LPCaptionBarStyle *)v266 leadingIconBadge];
      double v267 = v399;
      id v268 = (id)objc_claimAutoreleasedReturnValue();

      rect1b = v268;
      [(LPCaptionBarStyle *)self->_style trailingIconBadge];
    }
    else
    {
      [(LPCaptionBarStyle *)v266 trailingIconBadge];
      double v267 = v399;
      id v269 = (id)objc_claimAutoreleasedReturnValue();

      rect1b = v269;
      [(LPCaptionBarStyle *)self->_style leadingIconBadge];
    }
    id v270 = (id)objc_claimAutoreleasedReturnValue();

    v271 = [(LPComponentView *)self host];
    int v272 = [v271 allowsBadgingIconEdgeForComponentView:self];

    if (v272)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_8;
      aBlock[3] = &unk_1E5B06F78;
      aBlock[4] = self;
      v273 = _Block_copy(aBlock);
      v274 = (double (**)(void, void, void))v273;
      double v275 = v248;
      double v276 = v403;
      double v277 = v404;
      if (self->_leftIconBadgeView)
      {
        double v277 = (*((double (**)(void *, LPComponentView *, void *))v273 + 2))(v273, self->_leftIconView, rect1b);
        double v276 = v278;
        double v275 = v279;
        double v267 = v280;
      }
      if (self->_rightIconBadgeView)
      {
        double v404 = ((double (**)(void, LPComponentView *, id))v274)[2](v274, self->_rightIconView, v270);
        double v403 = v281;
        double v399 = v282;
        double v248 = v283;
      }
    }
    else
    {
      double v275 = v248;
      double v276 = v403;
      double v277 = v404;
      if (self->_leftIconBadgeView)
      {
        v284 = self->_leftIconView;
        [rect1b offset];
        double v286 = v285;
        [rect1b offset];
        double v288 = v287;
        v289 = [rect1b fixedSize];
        v290 = [v289 width];
        [v290 value];
        double v292 = v291;
        v293 = [rect1b fixedSize];
        v294 = [v293 height];
        [v294 value];
        -[LPComponentView convertRect:toView:](v284, "convertRect:toView:", self, v286, v288, v292, v295);
        double v277 = v296;
        double v276 = v297;
        double v275 = v298;
        double v267 = v299;
      }
      if (self->_rightIconBadgeView)
      {
        v300 = self->_rightIconView;
        [(LPComponentView *)v300 bounds];
        double v302 = v301;
        v397 = [v270 fixedSize];
        v395 = [v397 width];
        [v395 value];
        double v405 = v303;
        [v270 offset];
        double v305 = v304;
        [v270 offset];
        double v307 = v306;
        v308 = [v270 fixedSize];
        v309 = [v308 width];
        [v309 value];
        double v311 = v310;
        v312 = [v270 fixedSize];
        v313 = [v312 height];
        [v313 value];
        -[LPComponentView convertRect:toView:](v300, "convertRect:toView:", self, v302 - v405 - v305, v307, v311, v314);
        double v404 = v315;
        double v403 = v316;
        double v399 = v317;
        double v248 = v318;
      }
    }
    -[LPComponentView setFrame:](self->_leftIconBadgeView, "setFrame:", v277, v276, v275, v267);
    -[LPComponentView setFrame:](self->_rightIconBadgeView, "setFrame:", v404, v403, v248, v399);

    v207 = v349;
  }
  else
  {
    -[LPCollaborationFooterView setAdditionalPadding:](self->_collaborationFooterView, "setAdditionalPadding:", v330, v329, v328, v327);
  }
  v319 = [(LPCaptionBarStyle *)self->_style minimumWidth];
  [v319 value];
  double v321 = -0.0;
  if (!v398) {
    double v321 = v365;
  }
  double v322 = v321 + v409;
  double v323 = fmin(fmax(v320, v393), rect2_24a);

  double v324 = v323;
  double v325 = v322;
  result.double height = v325;
  result.double width = v324;
  return result;
}

BOOL __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 472))
  {
    double v3 = [*(id *)(v1 + 424) button];
    double v4 = [v3 collapsedButton];

    if (v4)
    {
      if (+[LPTestingOverrides forceCollapseButtons])
      {
        BOOL v5 = 1;
LABEL_12:

        return v5;
      }
      if (*(unsigned char *)(a1 + 96))
      {
        double v6 = *(double *)(a1 + 40);
      }
      else
      {
        id v7 = [*(id *)(*(void *)(a1 + 32) + 416) minimumWidth];
        [v7 value];
        double v6 = fmin(fmax(v8, *(double *)(a1 + 56)), *(double *)(a1 + 40));
      }
      if (v6 != 0.0)
      {
        double Width = CGRectGetWidth(*(CGRect *)(a1 + 64));
        [v4 layoutRatioThreshold];
        BOOL v5 = Width / v6 >= v10;
        goto LABEL_12;
      }
    }
    BOOL v5 = 0;
    goto LABEL_12;
  }
  return 0;
}

void __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 416) collaborationFooter];
  int v3 = [v2 useFullWidth];

  if (v3)
  {
    double v4 = [*(id *)(*(void *)(a1 + 32) + 416) collaborationFooter];
    int v5 = [v4 ignoreSafeAreaInset];

    if (!v5)
    {
      double v6 = [*(id *)(*(void *)(a1 + 32) + 416) collaborationFooter];
      [v6 useSafeAreaInsetWithPadding];
    }
  }
  else if (*(unsigned char *)(a1 + 176))
  {
    CGRectGetMinX(*(CGRect *)(a1 + 136));
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)(a1 + 136));
  }
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_5(uint64_t a1)
{
  double v2 = 0.0;
  if (*(unsigned char *)(a1 + 56)
    && [*(id *)(*(void *)(a1 + 32) + 416) addFullWidthLineForButton])
  {
    double v2 = *(double *)(a1 + 40) + 0.0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 560))
  {
    double v4 = [*(id *)(v3 + 416) collaborationFooter];
    int v5 = [v4 useFullWidth];

    if (v5) {
      return v2 + *(double *)(a1 + 48);
    }
  }
  return v2;
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 136)) {
    return *(double *)(a1 + 40) - *(double *)(a1 + 48);
  }
  else {
    return fmax(fmax(fmax(fmax(fmax(fmax(CGRectGetMaxY(*(CGRect *)(a1 + 56)), *(double *)(a1 + 88)), *(double *)(a1 + 96)), *(double *)(a1 + 104)), *(double *)(a1 + 112)), *(double *)(a1 + 120)), *(double *)(a1 + 128));
  }
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_7(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, void *a8, void *a9)
{
  id v13 = a8;
  id v14 = a9;
  uint64_t v15 = [v14 verticalAlignment];
  if (!v15) {
    uint64_t v15 = [v13 verticalAlignment];
  }
  switch(v15)
  {
    case 0:
    case 3:
      a1 = a1 * 0.5 + a6 * -0.5;
      break;
    case 1:
      double v16 = [v13 margin];
      double v17 = [v16 top];
      [v17 value];
      a1 = v18;
      goto LABEL_7;
    case 2:
      double v16 = [v13 margin];
      double v17 = [v16 bottom];
      [v17 value];
      a1 = a1 - a2 - v19;
LABEL_7:

      break;
    default:
      break;
  }

  return a1;
}

double __60__LPCaptionBarView__layoutCaptionBarForSize_applyingLayout___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 bounds];
  objc_msgSend(v5, "convertRect:toView:", *(void *)(a1 + 32));
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  double MaxX = CGRectGetMaxX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRectGetMaxY(v23);
  [v6 offset];
  double v13 = v12;
  id v14 = [v6 fixedSize];
  uint64_t v15 = [v14 width];
  [v15 value];
  double v17 = v16;

  [v6 offset];
  double v18 = [v6 fixedSize];
  double v19 = [v18 height];
  [v19 value];

  v20 = [v6 fixedSize];
  [v20 asSize];

  return MaxX - (v13 + v17 * 0.5);
}

- (void)setPresentationProperties:(id)a3
{
}

- (void)addSubview:(id)a3
{
  double v4 = (UIVisualEffectView *)a3;
  blurEffectView = self->_blurEffectView;
  if (blurEffectView) {
    BOOL v6 = blurEffectView == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)LPCaptionBarView;
    [(LPCaptionBarView *)&v8 addSubview:v4];
  }
  else
  {
    id v7 = [(UIVisualEffectView *)blurEffectView contentView];
    [v7 addSubview:v4];
  }
}

- (void)_buildViewsForCaptionBarIfNeeded
{
  v116[1] = *MEMORY[0x1E4F143B8];
  if (!self->_hasEverBuilt)
  {
    BOOL v3 = [(UIView *)self _lp_isLTR];
    if (!self->_blurEffectView
      && [(LPCaptionBarPresentationProperties *)self->_presentationProperties usesBlurredBackground])
    {
      double v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
      id v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v4];
      blurEffectView = self->_blurEffectView;
      self->_blurEffectView = v5;

      [(LPCaptionBarView *)self addSubview:self->_blurEffectView];
    }
    if (self->_useProgressSpinner)
    {
      id v7 = [LPIndeterminateProgressSpinnerView alloc];
      objc_super v8 = [(LPComponentView *)self host];
      double v9 = objc_alloc_init(LPIndeterminateProgressSpinnerStyle);
      double v10 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties spinner];
      double v11 = [(LPIndeterminateProgressSpinnerView *)v7 initWithHost:v8 style:v9 properties:v10];

      [(LPCaptionBarView *)self addSubview:v11];
      double v12 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIcon];

      if (v12) {
        double v13 = 0;
      }
      else {
        double v13 = v11;
      }
      if (v12) {
        id v14 = v11;
      }
      else {
        id v14 = 0;
      }
      if (v3) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v13;
      }
      if (v3) {
        double v16 = v13;
      }
      else {
        double v16 = v14;
      }
      double v17 = v15;
      leftIconView = self->_leftIconView;
      self->_leftIconView = v17;
      double v19 = v11;

      objc_storeStrong((id *)&self->_rightIconView, v16);
    }
    else
    {
      presentationProperties = self->_presentationProperties;
      if (v3)
      {
        double v114 = [(LPCaptionBarPresentationProperties *)presentationProperties leadingIcon];
        v113 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIcon];
        double v112 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconBadge];
        double v111 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconBadge];
        int v108 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties additionalLeadingIcons];
        double v107 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties additionalTrailingIcons];
        double v21 = [(LPCaptionBarStyle *)self->_style leadingIcon];
        double v110 = (void *)[v21 copy];

        CGRect v22 = [(LPCaptionBarStyle *)self->_style trailingIcon];
        double v109 = (void *)[v22 copy];

        v104 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconProperties];
        double v103 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconProperties];
        v105 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconBadgeProperties];
        double v106 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconBadgeProperties];
        CGRect v23 = [(LPCaptionBarStyle *)self->_style leadingIconBadge];
        double v24 = (void *)[v23 copy];

        double v25 = [(LPCaptionBarStyle *)self->_style trailingIconBadge];
        double v26 = (void *)[v25 copy];

        [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconSize];
      }
      else
      {
        double v114 = [(LPCaptionBarPresentationProperties *)presentationProperties trailingIcon];
        v113 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIcon];
        double v112 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconBadge];
        double v111 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconBadge];
        int v108 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties additionalTrailingIcons];
        double v107 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties additionalLeadingIcons];
        v29 = [(LPCaptionBarStyle *)self->_style trailingIcon];
        double v110 = (void *)[v29 copy];

        double v30 = [(LPCaptionBarStyle *)self->_style leadingIcon];
        double v109 = (void *)[v30 copy];

        v104 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconProperties];
        double v103 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconProperties];
        v105 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconBadgeProperties];
        double v106 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingIconBadgeProperties];
        double v31 = [(LPCaptionBarStyle *)self->_style trailingIconBadge];
        double v24 = (void *)[v31 copy];

        double v32 = [(LPCaptionBarStyle *)self->_style leadingIconBadge];
        double v26 = (void *)[v32 copy];

        [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingIconSize];
      }
      double v33 = v27;
      double v34 = v28;
      double v36 = *MEMORY[0x1E4F1DB30];
      double v35 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (v27 != *MEMORY[0x1E4F1DB30] || v28 != v35)
      {
        double v37 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", v27, v28);
        [v110 setFixedSize:v37];

        if ([v110 filter] == 3 && v33 != v34) {
          [v110 setFilter:1];
        }
      }
      double v38 = self->_presentationProperties;
      if (v3) {
        [(LPCaptionBarPresentationProperties *)v38 trailingIconSize];
      }
      else {
        [(LPCaptionBarPresentationProperties *)v38 leadingIconSize];
      }
      double v41 = v39;
      double v42 = v40;
      if (v39 != v36 || v40 != v35)
      {
        v43 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", v39, v40);
        [v109 setFixedSize:v43];

        if ([v109 filter] == 3 && v41 != v42) {
          [v109 setFilter:1];
        }
      }
      if (v114)
      {
        if (v108)
        {
          v44 = [LPImageStackView alloc];
          v45 = [(LPComponentView *)self host];
          v116[0] = v114;
          char v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
          BOOL v47 = [v46 arrayByAddingObjectsFromArray:v108];
          v48 = [(LPImageStackView *)v44 initWithHost:v45 images:v47 style:v110];
          id v49 = self->_leftIconView;
          self->_leftIconView = v48;
        }
        else
        {
          v50 = [LPImageView alloc];
          double v51 = [(LPComponentView *)self host];
          double v52 = [(LPImageView *)v50 initWithHost:v51 image:v114 properties:v104 style:v110];
          double v53 = self->_leftIconView;
          self->_leftIconView = v52;
        }
        [(LPCaptionBarView *)self addSubview:self->_leftIconView];
      }
      if (v113)
      {
        if (v107)
        {
          double v54 = [LPImageStackView alloc];
          double v55 = [(LPComponentView *)self host];
          v115 = v113;
          v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
          double v57 = [v56 arrayByAddingObjectsFromArray:v107];
          double v58 = [(LPImageStackView *)v54 initWithHost:v55 images:v57 style:v109];
          rightIconView = self->_rightIconView;
          self->_rightIconView = v58;
        }
        else
        {
          double v60 = [LPImageView alloc];
          double v55 = [(LPComponentView *)self host];
          double v61 = [(LPImageView *)v60 initWithHost:v55 image:v113 properties:v103 style:v109];
          v56 = self->_rightIconView;
          self->_rightIconView = v61;
        }

        [(LPCaptionBarView *)self addSubview:self->_rightIconView];
      }
      if (v112)
      {
        v62 = [LPImageView alloc];
        v63 = [(LPComponentView *)self host];
        v64 = [(LPImageView *)v62 initWithHost:v63 image:v112 properties:v105 style:v24];
        leftIconBadgeView = self->_leftIconBadgeView;
        self->_leftIconBadgeView = v64;

        [(LPCaptionBarView *)self addSubview:self->_leftIconBadgeView];
      }
      if (v111)
      {
        v66 = [LPImageView alloc];
        v67 = [(LPComponentView *)self host];
        char v68 = [(LPImageView *)v66 initWithHost:v67 image:v111 properties:v106 style:v26];
        rightIconBadgeView = self->_rightIconBadgeView;
        self->_rightIconBadgeView = v68;

        [(LPCaptionBarView *)self addSubview:self->_rightIconBadgeView];
      }
    }
    [(LPCaptionBarView *)self updateTextStack];
    if (self->_inlinePlaybackInformation)
    {
      v70 = [LPPlayButtonView alloc];
      double v71 = [(LPComponentView *)self host];
      inlinePlaybackInformation = self->_inlinePlaybackInformation;
      double v73 = [(LPCaptionBarStyle *)self->_style playButton];
      double v74 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties playButton];
      double v75 = [(LPPlayButtonView *)v70 initWithHost:v71 playbackInformation:inlinePlaybackInformation style:v73 properties:v74];
      playButton = self->_playButton;
      self->_playButton = v75;

      [(LPCaptionBarView *)self addSubview:self->_playButton];
    }
    uint64_t v77 = self->_presentationProperties;
    if (v3)
    {
      uint64_t v78 = [(LPCaptionBarPresentationProperties *)v77 leadingAccessoryType];
      int64_t v79 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties trailingAccessoryType];
    }
    else
    {
      uint64_t v78 = [(LPCaptionBarPresentationProperties *)v77 trailingAccessoryType];
      int64_t v79 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties leadingAccessoryType];
    }
    int64_t v80 = v79;
    if (v78)
    {
      v81 = [LPCaptionBarAccessoryView alloc];
      double v82 = [(LPComponentView *)self host];
      double v83 = [(LPCaptionBarAccessoryView *)v81 initWithHost:v82 type:v78 side:0];
      leftAccessoryView = self->_leftAccessoryView;
      self->_leftAccessoryView = v83;

      [(LPCaptionBarView *)self addSubview:self->_leftAccessoryView];
    }
    if (v80)
    {
      v85 = [LPCaptionBarAccessoryView alloc];
      double v86 = [(LPComponentView *)self host];
      v87 = [(LPCaptionBarAccessoryView *)v85 initWithHost:v86 type:v80 side:1];
      rightAccessoryView = self->_rightAccessoryView;
      self->_rightAccessoryView = v87;

      [(LPCaptionBarView *)self addSubview:self->_rightAccessoryView];
    }
    double v89 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties button];

    if (v89)
    {
      uint64_t v90 = [LPCaptionBarButtonView alloc];
      v91 = [(LPComponentView *)self host];
      v92 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties button];
      double v93 = [(LPCaptionBarStyle *)self->_style button];
      double v94 = [(LPCaptionBarButtonView *)v90 initWithHost:v91 properties:v92 style:v93];
      buttonView = self->_buttonView;
      self->_buttonView = v94;

      [(LPCaptionBarView *)self addSubview:self->_buttonView];
    }
    v96 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties collaborationFooter];

    if (v96)
    {
      double v97 = [LPCollaborationFooterView alloc];
      double v98 = [(LPComponentView *)self host];
      double v99 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties collaborationFooter];
      v100 = [(LPCaptionBarStyle *)self->_style collaborationFooter];
      v101 = [(LPCollaborationFooterView *)v97 initWithHost:v98 properties:v99 style:v100];
      collaborationFooterView = self->_collaborationFooterView;
      self->_collaborationFooterView = v101;
    }
    if (self->_collaborationFooterView) {
      -[LPCaptionBarView addSubview:](self, "addSubview:");
    }
    self->_hasEverBuilt = 1;
  }
}

- (void)updateTextStack
{
  [(UIView *)self _lp_isLTR];
  textStackView = self->_textStackView;
  if (textStackView)
  {
    [(LPVerticalTextStackView *)textStackView removeFromSuperview];
    double v4 = self->_textStackView;
    self->_textStackView = 0;
  }
  id v5 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties aboveTop];
  BOOL v6 = [(LPCaptionBarStyle *)self->_style textStack];
  id v7 = [v6 aboveTopCaption];
  emphasizedTextExpression = self->_emphasizedTextExpression;
  double v9 = [(LPComponentView *)self host];
  createViewForRow(v5, v7, emphasizedTextExpression, v9);
  double v10 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  aboveTopCaptionView = self->_aboveTopCaptionView;
  self->_aboveTopCaptionView = v10;

  double v12 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties top];
  double v13 = [(LPCaptionBarStyle *)self->_style textStack];
  id v14 = [v13 topCaption];
  uint64_t v15 = self->_emphasizedTextExpression;
  double v16 = [(LPComponentView *)self host];
  createViewForRow(v12, v14, v15, v16);
  double v17 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  topCaptionView = self->_topCaptionView;
  self->_topCaptionView = v17;

  double v19 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties bottom];
  v20 = [(LPCaptionBarStyle *)self->_style textStack];
  double v21 = [v20 bottomCaption];
  CGRect v22 = self->_emphasizedTextExpression;
  CGRect v23 = [(LPComponentView *)self host];
  createViewForRow(v19, v21, v22, v23);
  double v24 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  bottomCaptionView = self->_bottomCaptionView;
  self->_bottomCaptionView = v24;

  double v26 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties belowBottom];
  double v27 = [(LPCaptionBarStyle *)self->_style textStack];
  double v28 = [v27 belowBottomCaption];
  v29 = self->_emphasizedTextExpression;
  double v30 = [(LPComponentView *)self host];
  createViewForRow(v26, v28, v29, v30);
  double v31 = (LPTextStyleable *)objc_claimAutoreleasedReturnValue();
  belowBottomCaptionView = self->_belowBottomCaptionView;
  self->_belowBottomCaptionView = v31;

  if (self->_aboveTopCaptionView || self->_topCaptionView || self->_bottomCaptionView || self->_belowBottomCaptionView)
  {
    double v33 = [LPVerticalTextStackView alloc];
    double v34 = [(LPComponentView *)self host];
    double v35 = [(LPCaptionBarStyle *)self->_style textStack];
    double v36 = [(LPVerticalTextStackView *)v33 initWithHost:v34 style:v35];
    double v37 = self->_textStackView;
    self->_textStackView = v36;

    if (self->_aboveTopCaptionView) {
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    }
    if (self->_topCaptionView) {
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    }
    if (self->_bottomCaptionView) {
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    }
    if (self->_belowBottomCaptionView) {
      -[LPVerticalTextStackView addArrangedSubview:](self->_textStackView, "addArrangedSubview:");
    }
    double v38 = self->_textStackView;
    [(LPCaptionBarView *)self addSubview:v38];
  }
}

- (id)button
{
  BOOL v3 = [(LPCaptionBarPresentationProperties *)self->_presentationProperties button];

  if (v3)
  {
    [(LPCaptionBarView *)self _buildViewsForCaptionBarIfNeeded];
    double v4 = self->_buttonView;
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)subtitleButton
{
  return (id)[(LPTextStyleable *)self->_bottomCaptionView subtitleButton];
}

- (void)setEmphasizedTextExpression:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  [(LPTextStyleable *)self->_aboveTopCaptionView setEmphasizedTextExpression:v5];
  [(LPTextStyleable *)self->_topCaptionView setEmphasizedTextExpression:v5];
  [(LPTextStyleable *)self->_bottomCaptionView setEmphasizedTextExpression:v5];
  [(LPTextStyleable *)self->_belowBottomCaptionView setEmphasizedTextExpression:v5];
}

- (id)playable
{
  return [(LPPlayButtonView *)self->_playButton playable];
}

- (id)primaryIconView
{
  leftIconView = self->_leftIconView;
  if (!leftIconView) {
    leftIconView = self->_rightIconView;
  }
  return leftIconView;
}

- (BOOL)hasIconViewEqualToComponentView:(id)a3
{
  return self->_leftIconView == a3 || self->_rightIconView == a3;
}

- (id)layoutExclusionsForView:(id)a3
{
  id v4 = a3;
  if (*(_OWORD *)&self->_leftIconView == 0)
  {
    id v15 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(LPCaptionBarView *)self frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    leftIconView = self->_leftIconView;
    if (leftIconView)
    {
      [(LPComponentView *)leftIconView frame];
      v22.origin.CGFloat x = 0.0;
      v22.origin.CGFloat y = 0.0;
      v22.size.CGFloat width = 0.0;
      v22.size.CGFloat height = v8;
      CGRect v19 = CGRectUnion(v18, v22);
      double v10 = (void *)MEMORY[0x1E4FB14C0];
      -[LPCaptionBarView convertRect:toView:](self, "convertRect:toView:", v4, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
      double v11 = objc_msgSend(v10, "bezierPathWithRect:");
      [v15 addObject:v11];
    }
    rightIconView = self->_rightIconView;
    if (rightIconView)
    {
      [(LPComponentView *)rightIconView frame];
      v23.origin.CGFloat y = 0.0;
      v23.size.CGFloat width = 0.0;
      v23.origin.CGFloat x = v6;
      v23.size.CGFloat height = v8;
      CGRect v21 = CGRectUnion(v20, v23);
      double v13 = (void *)MEMORY[0x1E4FB14C0];
      -[LPCaptionBarView convertRect:toView:](self, "convertRect:toView:", v4, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
      id v14 = objc_msgSend(v13, "bezierPathWithRect:");
      [v15 addObject:v14];
    }
  }

  return v15;
}

- (BOOL)useProgressSpinner
{
  return self->_useProgressSpinner;
}

- (UIEdgeInsets)textSafeAreaInset
{
  double top = self->_textSafeAreaInset.top;
  double left = self->_textSafeAreaInset.left;
  double bottom = self->_textSafeAreaInset.bottom;
  double right = self->_textSafeAreaInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextSafeAreaInset:(UIEdgeInsets)a3
{
  self->_textSafeAreaInset = a3;
}

- (LPCollaborationFooterView)collaborationFooterView
{
  return self->_collaborationFooterView;
}

- (void)setCollaborationFooterView:(id)a3
{
}

- (NSRegularExpression)emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_collaborationFooterView, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_belowBottomCaptionView, 0);
  objc_storeStrong((id *)&self->_bottomCaptionView, 0);
  objc_storeStrong((id *)&self->_topCaptionView, 0);
  objc_storeStrong((id *)&self->_aboveTopCaptionView, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_rightIconBadgeView, 0);
  objc_storeStrong((id *)&self->_leftIconBadgeView, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_rightAccessoryView, 0);
  objc_storeStrong((id *)&self->_leftAccessoryView, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_rightIconView, 0);
  objc_storeStrong((id *)&self->_leftIconView, 0);
  objc_storeStrong((id *)&self->_presentationProperties, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end