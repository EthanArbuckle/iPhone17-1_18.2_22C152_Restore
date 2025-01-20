@interface CCUIHeaderPocketView
- (BOOL)audioVideoControlsAreEnabled;
- (BOOL)hitTestedViewWantsToBlockGestures:(id)a3;
- (BOOL)isDisplayingSensorStatus;
- (BOOL)isSensorAttributionViewControllerExpanded;
- (CCUIHeaderPocketView)initWithFrame:(CGRect)a3 moduleInstanceManager:(id)a4;
- (CCUIHeaderPocketViewActionsDelegate)actionsDelegate;
- (CCUIHeaderPocketViewSensorAttributionDelegate)headerPocketViewDelegate;
- (CCUIModuleInstanceManager)moduleInstanceManager;
- (CCUIPowerButton)powerButton;
- (CCUIPrivacyAttributionButton)privacyAttributionButton;
- (CCUISensorActivityData)audioVideoModeSelectionAttribution;
- (CCUIStatusBar)statusBar;
- (CCUIStatusBarDelegate)statusBarDelegate;
- (CGAffineTransform)compactScaleTransform;
- (CGAffineTransform)contentTransform;
- (CGRect)compactModeFrameForSensorView;
- (CGRect)contentBounds;
- (NSString)bundleIdentifierUsingAudioVideoControls;
- (UIButton)editButton;
- (UIEdgeInsets)edgeInsets;
- (UIView)customBackgroundView;
- (UIView)statusLabelView;
- (double)_topButtonSymbolPointSize;
- (double)additionalContentAlphaMultiplier;
- (double)additionalHeightForOrientation:(int64_t)a3;
- (double)backgroundAlpha;
- (double)chevronAlpha;
- (double)contentAlphaMultiplier;
- (double)sensorStatusViewAlpha;
- (double)statusBarAlpha;
- (double)verticalContentTranslation;
- (double)yOriginForCompactControlForFrame:(CGRect)a3;
- (id)_newDefaultBackgroundView;
- (id)bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:(id)a3;
- (id)compactSensorAttributionControl;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)interfaceOrientation;
- (unint64_t)chevronState;
- (unint64_t)mode;
- (void)_configureTopButtons;
- (void)_editButtonPrimaryActionTriggered;
- (void)_powerButtonPrimaryActionTriggered;
- (void)_preheatEntityIconsForAttributions:(id)a3;
- (void)_setHeaderBackgroundView:(id)a3;
- (void)_updateAlpha;
- (void)_updateContentTransform;
- (void)addSensorAttributionViewControllerAsChildOfViewController:(id)a3;
- (void)didCloseExpandedSensorAttributionViewController;
- (void)dismissSensorAttributionExpandedView:(BOOL)a3 completion:(id)a4;
- (void)gameModeStateDidChange:(unint64_t)a3;
- (void)handleCompactControlCompactionEvent;
- (void)handleCompactControlExpansionEvent;
- (void)handleCompactControlTouchBeganEvent;
- (void)inactiveMicModeSelectionAttributionChanged:(id)a3;
- (void)layoutSubviews;
- (void)presentSensorAttributionExpandedView:(BOOL)a3;
- (void)privacyButtonTapped;
- (void)sensorAttributionsChanged:(id)a3;
- (void)setActionsDelegate:(id)a3;
- (void)setAdditionalContentAlphaMultiplier:(double)a3;
- (void)setAudioVideoControlsEnabled:(BOOL)a3;
- (void)setAudioVideoControlsEnabled:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setAudioVideoModeSelectionAttribution:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBundleIdentifierUsingAudioVideoControls:(id)a3;
- (void)setChevronAlpha:(double)a3;
- (void)setChevronState:(unint64_t)a3;
- (void)setCompactScaleTransform:(CGAffineTransform *)a3;
- (void)setContentAlphaMultiplier:(double)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setCustomBackgroundView:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEditButton:(id)a3;
- (void)setGameModeActivityDataProvider:(id)a3;
- (void)setHeaderPocketViewDelegate:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setMode:(unint64_t)a3 orientationHint:(int64_t)a4;
- (void)setModuleInstanceManager:(id)a3;
- (void)setPowerButton:(id)a3;
- (void)setPrivacyAttributionButton:(id)a3;
- (void)setSensorAttributionEdgeInsets:(UIEdgeInsets)a3;
- (void)setSensorStatusViewAlpha:(double)a3;
- (void)setStatusBarAlpha:(double)a3;
- (void)setStatusBarDelegate:(id)a3;
- (void)setStatusLabelView:(id)a3;
- (void)setVerticalContentTranslation:(double)a3;
- (void)willOpenExpandedSensorAttributionViewController;
@end

@implementation CCUIHeaderPocketView

- (double)additionalHeightForOrientation:(int64_t)a3
{
  v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    double v10 = 0.0;
    if (v9 != 1) {
      goto LABEL_42;
    }
  }
  CCUIReferenceScreenBounds();
  double Width = CGRectGetWidth(v19);
  if (Width >= 1024.0)
  {
    a3 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([(id)a3 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      double v10 = 44.0;
LABEL_41:

      goto LABEL_42;
    }
  }
  CCUIReferenceScreenBounds();
  double v12 = CGRectGetWidth(v20);
  if (v12 < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 userInterfaceIdiom] != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    double v13 = CGRectGetWidth(v21);
    if (v13 >= 834.0)
    {
      v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v4 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        double v10 = 44.0;
LABEL_37:

LABEL_38:
        if (v12 < 1024.0) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    CCUIReferenceScreenBounds();
    double v14 = CGRectGetWidth(v22);
    if (v14 >= 834.0
      && ([MEMORY[0x1E4FB16C8] currentDevice],
          v5 = objc_claimAutoreleasedReturnValue(),
          [v5 userInterfaceIdiom] == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      double v10 = 44.0;
    }
    else
    {
      v15 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v15 userInterfaceIdiom] == 1)
      {
        double v10 = 44.0;
      }
      else
      {
        CCUIReferenceScreenBounds();
        double v10 = 20.0;
        if (CGRectGetWidth(v23) < 430.0)
        {
          CCUIReferenceScreenBounds();
          double v10 = 0.0;
          if (CGRectGetWidth(v24) < 428.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v25) < 414.0 || (double v10 = -10.0, SBFEffectiveHomeButtonType() != 2))
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v26) >= 414.0)
              {
                double v10 = 49.5;
              }
              else
              {
                CCUIReferenceScreenBounds();
                double v10 = 16.0;
                if (CGRectGetWidth(v27) < 393.0)
                {
                  CCUIReferenceScreenBounds();
                  double v10 = 30.0;
                  if (CGRectGetWidth(v28) < 390.0)
                  {
                    CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v29) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v30) < 375.0) {
                        double v10 = 40.0;
                      }
                      else {
                        double v10 = 30.0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      if (v14 < 834.0)
      {
LABEL_36:
        if (v13 < 834.0) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }

    goto LABEL_36;
  }
  double v10 = 44.0;
LABEL_39:

LABEL_40:
  if (Width >= 1024.0) {
    goto LABEL_41;
  }
LABEL_42:

  if ([(CCUIHeaderPocketView *)self isDisplayingSensorStatus]
    || (double v16 = 0.0, SBFEffectiveHomeButtonType() != 2))
  {
    double v16 = v10;
  }
  [(CCUIStatusBar *)self->_statusBar verticalSecondaryServiceDelta];
  return v16 + v17;
}

- (id)bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:(id)a3
{
  return self->_bundleIdentifierUsingAudioVideoControls;
}

- (CGRect)compactModeFrameForSensorView
{
  CCUIEdgeInsetsRTLSwap();
  CCUIEdgeInsetsRTLSwap();
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl fixedHeight];
  CGFloat v4 = v3;
  [(CCUIHeaderPocketView *)self bounds];
  [(CCUIHeaderPocketView *)self bounds];
  UIRectGetCenter();
  double v6 = v5;
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl sizeThatFitsMaximumAllowableWidth];
  CGFloat v8 = v7;
  double v9 = v6 + v7 * -0.5;
  double v10 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1)
  {
    v27.origin.y = 0.0;
    v27.origin.x = v9;
    v27.size.width = v8;
    v27.size.height = v4;
    double v12 = CGRectGetHeight(v27) * -0.5;
  }
  double v13 = [(CCUIHeaderPocketView *)self traitCollection];
  [v13 displayScale];
  UIRectIntegralWithScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  -[CCUIHeaderPocketView yOriginForCompactControlForFrame:](self, "yOriginForCompactControlForFrame:", v15, v17, v19, v21);
  double v23 = v22;
  double v24 = v15;
  double v25 = v19;
  double v26 = v21;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)CCUIHeaderPocketView;
  [(CCUIHeaderPocketView *)&v84 layoutSubviews];
  [(CCUIHeaderPocketView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CCUIHeaderPocketView *)self contentBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  double v19 = [(CCUIHeaderPocketView *)self subviews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * i), "setFrame:", v12, v14, v16, v18);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v21);
  }

  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:", v4, v6, v8, v10);
  [(SBUIChevronView *)self->_headerChevronView sizeToFit];
  headerChevronView = self->_headerChevronView;
  if (self->_mode == 1)
  {
    UIRectGetCenter();
  }
  else
  {
    double v25 = v12 + v16 * 0.5;
    double v26 = 30.0;
  }
  -[SBUIChevronView setCenter:](headerChevronView, "setCenter:", v25, v26);
  [(SBUIChevronView *)self->_headerChevronView setHidden:[(CCUIHeaderPocketView *)self isDisplayingSensorStatus]];
  CGRect v27 = [MEMORY[0x1E4FB16C8] currentDevice];
  CGFloat v71 = v6;
  CGFloat rect = v8;
  CGFloat v76 = v10;
  CGFloat v70 = v4;
  if ([v27 userInterfaceIdiom]) {
    BOOL v28 = 0;
  }
  else {
    BOOL v28 = (unint64_t)(self->_interfaceOrientation - 3) < 2;
  }

  -[CCUIStatusBar sizeThatFits:](self->_statusBar, "sizeThatFits:", v16, v18);
  double v30 = v29;
  double v32 = v31;
  double v33 = 0.0;
  if (v28)
  {
    double v34 = CCUILandscapeGridLayoutTopMargin();
    double v33 = v34 - CCUIStatusBarBaselineHeight();
  }
  v87.origin.x = v12;
  v87.origin.y = v14;
  v87.size.width = v16;
  v87.size.height = v18;
  double MinX = CGRectGetMinX(v87);
  v88.origin.x = v12;
  v88.origin.y = v14;
  v88.size.width = v16;
  v88.size.height = v18;
  double v36 = CGRectGetMaxY(v88) - v32 - v33;
  statusBar = self->_statusBar;
  long long v74 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v75 = *MEMORY[0x1E4F1DAB8];
  long long v77 = *MEMORY[0x1E4F1DAB8];
  long long v78 = v74;
  long long v73 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v79 = v73;
  [(CCUIStatusBar *)statusBar setTransform:&v77];
  -[CCUIStatusBar setFrame:](self->_statusBar, "setFrame:", MinX, v36, v30, v32);
  [(CCUIStatusBar *)self->_statusBar controlCenterApplyPrimaryContentShadow];
  statusLabelView = self->_statusLabelView;
  if (statusLabelView)
  {
    [(UIView *)statusLabelView frame];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v69 = v45;
    v89.origin.x = v70;
    v89.origin.y = v71;
    v89.size.width = rect;
    v89.size.height = v76;
    CGRectGetMaxY(v89);
    v90.origin.x = MinX;
    v90.origin.y = v36;
    v90.size.width = v30;
    v90.size.height = v32;
    CGRectGetMidY(v90);
    v91.origin.x = v40;
    v91.origin.y = v42;
    v91.size.width = v44;
    v91.size.height = v69;
    CGRectGetHeight(v91);
    UIRectCenteredYInRect();
    -[UIView setFrame:](self->_statusLabelView, "setFrame:");
  }
  v46 = [(CCUIHeaderPocketView *)self editButton];
  v47 = [(CCUIHeaderPocketView *)self powerButton];
  [(CCUIHeaderPocketView *)self _topButtonSymbolPointSize];
  double v49 = v48;
  v50 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v50 userInterfaceIdiom])
  {

    CGFloat v51 = v70;
  }
  else
  {
    uint64_t v52 = SBFEffectiveHomeButtonType();

    CGFloat v51 = v70;
    if (v52 != 2)
    {
      double v62 = CCUILayoutEdgeInsetsForInterfaceOrientation(1) + -7.0;
      v93.origin.x = v70;
      v93.origin.y = v71;
      double v60 = rect;
      v93.size.width = rect;
      v93.size.height = v76;
      double v61 = CGRectGetMaxX(v93) + -5.0;
      double v59 = 5.0;
      goto LABEL_27;
    }
  }
  CCUIEdgeInsetsRTLSwap();
  double v54 = v53 + -7.0;
  CCUIEdgeInsetsRTLSwap();
  double v56 = v55 + -7.0;
  v57 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v58 = [v57 userInterfaceIdiom];

  if (v58 == 1) {
    double v59 = v54 + 6.0;
  }
  else {
    double v59 = v54;
  }
  if (v58 == 1) {
    double v56 = v56 + 10.0;
  }
  v92.origin.x = v51;
  v92.origin.y = v71;
  double v60 = rect;
  v92.size.width = rect;
  v92.size.height = v76;
  double v61 = CGRectGetMaxX(v92) - v56;
  double v62 = 23.0;
LABEL_27:
  double v63 = v61 - (v49 + 14.0);
  int v64 = [(CCUIHeaderPocketView *)self _shouldReverseLayoutDirection];
  if (v64) {
    double v65 = v63;
  }
  else {
    double v65 = v59;
  }
  if (!v64) {
    double v59 = v63;
  }
  objc_msgSend(v46, "setFrame:", v65, v62, v49 + 14.0, v49 + 14.0);
  objc_msgSend(v47, "setFrame:", v59, v62, v49 + 14.0, v49 + 14.0);
  [v46 setHidden:v28];
  [v47 setHidden:v28];
  compactSensorAttributionControl = self->_compactSensorAttributionControl;
  long long v77 = v75;
  long long v78 = v74;
  long long v79 = v73;
  [(CCUISensorAttributionCompactControl *)compactSensorAttributionControl setTransform:&v77];
  v67 = self->_compactSensorAttributionControl;
  [(CCUIHeaderPocketView *)self compactModeFrameForSensorView];
  -[CCUISensorAttributionCompactControl setFrame:](v67, "setFrame:");
  [(CCUIStatusBar *)self->_statusBar _updateCompactTrailingStatusBarStyleRequestAndAvoidanceFrame];
  privacyAttributionButton = self->_privacyAttributionButton;
  long long v77 = v75;
  long long v78 = v74;
  long long v79 = v73;
  [(CCUIPrivacyAttributionButton *)privacyAttributionButton setTransform:&v77];
  -[CCUIPrivacyAttributionButton setFrame:](self->_privacyAttributionButton, "setFrame:", 0.0, self->_verticalContentTranslation + 0.0, v60, 140.0);
  [(CCUIHeaderPocketView *)self _updateContentTransform];
}

- (BOOL)isDisplayingSensorStatus
{
  return [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl isDisplayingSensorStatus];
}

- (double)yOriginForCompactControlForFrame:(CGRect)a3
{
  double Height = CGRectGetHeight(a3);
  [(CCUIHeaderPocketView *)self contentBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  -[CCUIStatusBar sizeThatFits:](self->_statusBar, "sizeThatFits:", v12, v14);
  double v16 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (![v16 userInterfaceIdiom] && (unint64_t)(self->_interfaceOrientation - 3) <= 1)
  {
    CCUILandscapeGridLayoutTopMargin();
    CCUIStatusBarBaselineHeight();
  }

  v49.origin.x = v9;
  v49.origin.y = v11;
  v49.size.width = v13;
  v49.size.height = v15;
  CGRectGetMinX(v49);
  v50.origin.x = v9;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  CGRectGetMaxY(v50);
  if ((self->_mode | 2) != 3)
  {
    double v22 = Height * 0.5;
    double v23 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v24 = (void *)[v23 userInterfaceIdiom];

    if (v24 == (void *)1)
    {
      double v17 = -v22;
      goto LABEL_101;
    }
    double v25 = (void *)(self->_interfaceOrientation - 3);
    CCUIReferenceScreenBounds();
    double Width = CGRectGetWidth(v63);
    if ((unint64_t)v25 <= 1)
    {
      if (Width >= 1024.0)
      {
        double v25 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 1024.0);
        if ([v25 userInterfaceIdiom] == 1)
        {
          double v27 = 0.0;
          if (SBFEffectiveHomeButtonType() != 2) {
            goto LABEL_99;
          }
        }
      }
      CCUIReferenceScreenBounds();
      double v28 = CGRectGetWidth(v64);
      if (v28 >= 1024.0)
      {
        double v24 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v24 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() == 2)
        {

          double v27 = 0.0;
          goto LABEL_98;
        }
      }
      double v47 = v28;
      CCUIReferenceScreenBounds();
      double v45 = CGRectGetWidth(v76);
      if (v45 >= 834.0)
      {
        double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v4 userInterfaceIdiom] == 1)
        {
          double v27 = 0.0;
          if (SBFEffectiveHomeButtonType() == 2)
          {
LABEL_115:

LABEL_116:
            if (v47 >= 1024.0) {

            }
            if (Width < 1024.0) {
              goto LABEL_100;
            }
            goto LABEL_99;
          }
        }
      }
      CCUIReferenceScreenBounds();
      double v30 = CGRectGetWidth(v77);
      if (v30 >= 834.0)
      {
        double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v5 userInterfaceIdiom] == 1 && SBFEffectiveHomeButtonType() != 2)
        {

          double v27 = 0.0;
          goto LABEL_114;
        }
      }
      double v42 = v30;
      double v31 = [MEMORY[0x1E4FB16C8] currentDevice];
      double v27 = 0.0;
      if ([v31 userInterfaceIdiom] == 1) {
        goto LABEL_112;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v78) >= 430.0)
      {
        *(double *)&uint64_t v39 = 38.0;
      }
      else
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v79) < 428.0)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v80) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
          {
LABEL_110:
            *(double *)&uint64_t v39 = 34.0;
            goto LABEL_111;
          }
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v81) < 414.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v82) < 393.0)
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v83) >= 390.0)
              {
                double v27 = 20.5;
              }
              else
              {
                CCUIReferenceScreenBounds();
                uint64_t v40 = 0x4077700000000000;
                if (CGRectGetWidth(v84) < 375.0 || (double v27 = 30.0, SBFEffectiveHomeButtonType() != 2))
                {
                  CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v85) < 375.0) {
                    double v27 = 20.0;
                  }
                  else {
                    double v27 = 8.0;
                  }
                }
              }
              goto LABEL_112;
            }
            goto LABEL_110;
          }
          double v27 = 23.5;
LABEL_112:

          if (v42 >= 834.0) {
LABEL_114:
          }
          if (v45 < 834.0) {
            goto LABEL_116;
          }
          goto LABEL_115;
        }
        *(double *)&uint64_t v39 = 36.0;
      }
LABEL_111:
      double v27 = *(double *)&v39;
      goto LABEL_112;
    }
    if (Width >= 1024.0)
    {
      double v25 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 1024.0);
      if ([v25 userInterfaceIdiom] == 1)
      {
        double v27 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2) {
          goto LABEL_99;
        }
      }
    }
    CCUIReferenceScreenBounds();
    double v46 = CGRectGetWidth(v65);
    if (v46 >= 1024.0)
    {
      double v24 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v24 userInterfaceIdiom] == 1)
      {
        double v27 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_97:

LABEL_98:
          if (Width < 1024.0)
          {
LABEL_100:
            double v17 = v27 - v22;
            goto LABEL_101;
          }
LABEL_99:

          goto LABEL_100;
        }
      }
    }
    CCUIReferenceScreenBounds();
    double v44 = CGRectGetWidth(v66);
    if (v44 >= 834.0)
    {
      double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v4 userInterfaceIdiom] == 1)
      {
        double v27 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_95:

LABEL_96:
          if (v46 < 1024.0) {
            goto LABEL_98;
          }
          goto LABEL_97;
        }
      }
    }
    CCUIReferenceScreenBounds();
    double v41 = CGRectGetWidth(v67);
    if (v41 >= 834.0)
    {
      double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v5 userInterfaceIdiom] == 1)
      {
        double v27 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2)
        {
LABEL_93:

LABEL_94:
          if (v44 < 834.0) {
            goto LABEL_96;
          }
          goto LABEL_95;
        }
      }
    }
    double v29 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v27 = 30.0;
    if ([v29 userInterfaceIdiom] == 1) {
      goto LABEL_91;
    }
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v68) >= 430.0) {
      goto LABEL_90;
    }
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v69) >= 428.0) {
      goto LABEL_91;
    }
    CCUIReferenceScreenBounds();
    uint64_t v40 = 0x4079E00000000000;
    if (CGRectGetWidth(v70) >= 414.0 && SBFEffectiveHomeButtonType() == 2) {
      goto LABEL_91;
    }
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v71) >= 414.0) {
      goto LABEL_91;
    }
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v72) >= 393.0)
    {
LABEL_90:
      double v27 = 46.0;
    }
    else
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v73) < 390.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v74) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          CCUIReferenceScreenBounds();
          CGRectGetWidth(v75);

          double v27 = 12.0;
          goto LABEL_92;
        }
      }
    }
LABEL_91:

LABEL_92:
    if (v41 < 834.0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
  double v17 = 12.0;
  if ((unint64_t)(self->_interfaceOrientation - 3) < 2) {
    goto LABEL_101;
  }
  CCUIReferenceScreenBounds();
  double v18 = CGRectGetWidth(v51);
  if (v18 >= 1024.0)
  {
    double v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v16 userInterfaceIdiom] == 1)
    {
      double v17 = 30.0;
      if (SBFEffectiveHomeButtonType() != 2) {
        goto LABEL_89;
      }
    }
  }
  CCUIReferenceScreenBounds();
  double v48 = CGRectGetWidth(v52);
  if (v48 < 1024.0
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v3 = objc_claimAutoreleasedReturnValue(),
        [v3 userInterfaceIdiom] != 1)
    || (double v17 = 30.0, SBFEffectiveHomeButtonType() != 2))
  {
    double v43 = v18;
    CCUIReferenceScreenBounds();
    double v19 = CGRectGetWidth(v53);
    if (v19 >= 834.0)
    {
      double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v4 userInterfaceIdiom] == 1)
      {
        double v17 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_85:

LABEL_86:
          double v18 = v43;
          if (v48 < 1024.0) {
            goto LABEL_88;
          }
          goto LABEL_87;
        }
      }
    }
    CCUIReferenceScreenBounds();
    double v20 = CGRectGetWidth(v54);
    if (v20 >= 834.0)
    {
      double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v5 userInterfaceIdiom] == 1)
      {
        double v17 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2)
        {
LABEL_83:

LABEL_84:
          if (v19 < 834.0) {
            goto LABEL_86;
          }
          goto LABEL_85;
        }
      }
    }
    uint64_t v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v17 = 30.0;
    if ([v21 userInterfaceIdiom] != 1)
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v55) >= 430.0) {
        goto LABEL_81;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v56) >= 428.0) {
        goto LABEL_82;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v57) >= 414.0 && SBFEffectiveHomeButtonType() == 2) {
        goto LABEL_82;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v58) >= 414.0) {
        goto LABEL_82;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v59) >= 393.0)
      {
LABEL_81:
        double v17 = 46.0;
        goto LABEL_82;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v60) < 390.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v61) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          CCUIReferenceScreenBounds();
          CGRectGetWidth(v62);
          double v17 = 12.0;
        }
      }
    }
LABEL_82:

    if (v20 < 834.0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_87:

LABEL_88:
  if (v18 >= 1024.0) {
LABEL_89:
  }

LABEL_101:
  UIRectGetCenter();
  [(CCUIStatusBar *)self->_statusBar verticalSecondaryServiceDelta];
  UIRectCenteredXInRect();
  if (SBFEffectiveHomeButtonType() == 2
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v32 = objc_claimAutoreleasedReturnValue(),
        uint64_t v33 = [v32 userInterfaceIdiom],
        v32,
        v33))
  {
    double v34 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", v40);
    uint64_t v35 = [v34 userInterfaceIdiom];

    if (v35 == 1)
    {
      double v36 = [(CCUIHeaderPocketView *)self editButton];
      [v36 frame];
      double v17 = CGRectGetMaxY(v86) + 14.0;
    }
    else
    {
      UIRectCenteredAboutPoint();
      double v17 = v37;
    }
  }
  return v17 + self->_verticalContentTranslation;
}

- (CGRect)contentBounds
{
  [(CCUIHeaderPocketView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CCUIHeaderPocketView *)self edgeInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CCUIPowerButton)powerButton
{
  return self->_powerButton;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)_updateContentTransform
{
  headerChevronView = self->_headerChevronView;
  long long v4 = *(_OWORD *)&self->_contentTransform.c;
  long long v11 = *(_OWORD *)&self->_contentTransform.a;
  long long v12 = v4;
  long long v13 = *(_OWORD *)&self->_contentTransform.tx;
  [(SBUIChevronView *)headerChevronView setTransform:&v11];
  statusBar = self->_statusBar;
  long long v6 = *(_OWORD *)&self->_contentTransform.c;
  long long v11 = *(_OWORD *)&self->_contentTransform.a;
  long long v12 = v6;
  long long v13 = *(_OWORD *)&self->_contentTransform.tx;
  [(CCUIStatusBar *)statusBar setTransform:&v11];
  compactSensorAttributionControl = self->_compactSensorAttributionControl;
  long long v8 = *(_OWORD *)&self->_contentTransform.c;
  long long v11 = *(_OWORD *)&self->_contentTransform.a;
  long long v12 = v8;
  long long v13 = *(_OWORD *)&self->_contentTransform.tx;
  [(CCUISensorAttributionCompactControl *)compactSensorAttributionControl setTransform:&v11];
  privacyAttributionButton = self->_privacyAttributionButton;
  long long v10 = *(_OWORD *)&self->_contentTransform.c;
  long long v11 = *(_OWORD *)&self->_contentTransform.a;
  long long v12 = v10;
  long long v13 = *(_OWORD *)&self->_contentTransform.tx;
  [(CCUIPrivacyAttributionButton *)privacyAttributionButton setTransform:&v11];
  [(UIView *)self->_sensorAttributionExpandedWrapperView frame];
  -[UIView setFrame:](self->_sensorAttributionExpandedWrapperView, "setFrame:");
}

- (double)_topButtonSymbolPointSize
{
  v2 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (void)setSensorAttributionEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_sensorAttributionEdgeInsets = a3;
  CCUIEdgeInsetsRTLSwap();
  double v9 = v8;
  CCUIEdgeInsetsRTLSwap();
  double v11 = v10;
  long long v12 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v12 userInterfaceIdiom])
  {
  }
  else
  {
    unint64_t v13 = self->_interfaceOrientation - 3;

    if (v13 <= 1)
    {
      double v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v14 _referenceBounds];
      double v16 = v15;
      double v18 = v17;

      double v11 = (v18 - v16) * 0.5;
      double top = 0.0;
      double v9 = v11;
      double left = v11;
      double bottom = 0.0;
      double right = v11;
    }
  }
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if ((unint64_t)(interfaceOrientation - 3) > 1)
  {
    [(CCUIHeaderPocketView *)self bounds];
    double v25 = v26 - v9 - v11;
  }
  else
  {
    double v20 = CCUILayoutEdgeInsetsForInterfaceOrientation(interfaceOrientation);
    double v22 = v21;
    double v24 = v23;
    [(CCUIHeaderPocketView *)self contentBounds];
    double v25 = (CGRectGetWidth(v28) - v22 - v24) * 0.5;
  }
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl setMaximumAllowableWidth:v25];
  -[CCUISensorAttributionExpandedViewController setEdgeInsets:](self->_sensorAttributionExpandedViewController, "setEdgeInsets:", top, left, bottom, right);

  [(CCUIHeaderPocketView *)self setNeedsLayout];
}

- (CCUIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_int64_t interfaceOrientation = a3;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(CCUIHeaderPocketView *)self setNeedsLayout];
  }
}

- (void)setGameModeActivityDataProvider:(id)a3
{
}

- (void)setAudioVideoModeSelectionAttribution:(id)a3
{
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CCUIHeaderPocketView *)self setAudioVideoControlsEnabled:v4];
  [(CCUIHeaderPocketView *)self setBundleIdentifierUsingAudioVideoControls:v6];

  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController setAudioVideoControlsEnabled:v4];

  [(CCUIHeaderPocketView *)self setNeedsLayout];
}

- (void)setBundleIdentifierUsingAudioVideoControls:(id)a3
{
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3
{
  self->_audioVideoControlsEnabled = a3;
}

- (void)sensorAttributionsChanged:(id)a3
{
  CCUIFixSpecialAttributions(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl sensorAttributionsChanged:v5];
  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController sensorAttributionsChanged:v5];
  [(CCUIHeaderPocketView *)self setNeedsLayout];
  [(CCUIHeaderPocketView *)self _preheatEntityIconsForAttributions:v5];
  BOOL v4 = CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v5);
  [(CCUIPrivacyAttributionButton *)self->_privacyAttributionButton sensorAttributionsChanged:v5 uniqueEntities:v4];
}

- (void)inactiveMicModeSelectionAttributionChanged:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    double v7 = CCUIFixSpecialAttributions(v6);
    id v8 = [v7 anyObject];
  }
  else
  {
    id v8 = 0;
  }
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl inactiveMicModeSelectionAttributionChanged:v8];
  [(CCUIHeaderPocketView *)self setNeedsLayout];
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  -[CCUISensorAttributionCompactControl gameModeStateDidChange:](self->_compactSensorAttributionControl, "gameModeStateDidChange:");
  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController gameModeStateDidChange:a3];

  [(CCUIHeaderPocketView *)self setNeedsLayout];
}

- (void)_preheatEntityIconsForAttributions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CCUISensorEntityIconCache sharedInstance];
  id v5 = CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 preheatImageForSensorEntity:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CCUIHeaderPocketView)initWithFrame:(CGRect)a3 moduleInstanceManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CCUIHeaderPocketView;
  long long v10 = -[CCUIHeaderPocketView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  long long v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_moduleInstanceManager, v9);
    id v12 = [(CCUIHeaderPocketView *)v11 _newDefaultBackgroundView];
    [(CCUIHeaderPocketView *)v11 _setHeaderBackgroundView:v12];

    dispatch_group_t v13 = dispatch_group_create();
    expandedViewControllerCloseDispatchGroup = v11->_expandedViewControllerCloseDispatchGroup;
    v11->_expandedViewControllerCloseDispatchGroup = (OS_dispatch_group *)v13;

    if (CCUIFeatureEnabled())
    {
      uint64_t v15 = [[CCUIPrivacyAttributionButton alloc] initWithDelegate:v11];
      [(CCUIHeaderPocketView *)v11 addSubview:v15];
      privacyAttributionButton = v11->_privacyAttributionButton;
      v11->_privacyAttributionButton = v15;
    }
    else
    {
      double v17 = [CCUISensorAttributionCompactControl alloc];
      uint64_t v18 = -[CCUISensorAttributionCompactControl initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      compactSensorAttributionControl = v11->_compactSensorAttributionControl;
      v11->_compactSensorAttributionControl = (CCUISensorAttributionCompactControl *)v18;

      [(CCUISensorAttributionCompactControl *)v11->_compactSensorAttributionControl setDelegate:v11];
      [(CCUIHeaderPocketView *)v11 addSubview:v11->_compactSensorAttributionControl];
    }
    [(CCUIHeaderPocketView *)v11 setChevronAlpha:1.0];
    [(CCUIHeaderPocketView *)v11 setStatusBarAlpha:1.0];
    [(CCUIHeaderPocketView *)v11 setSensorStatusViewAlpha:1.0];
    [(CCUIHeaderPocketView *)v11 setContentAlphaMultiplier:1.0];
    [(CCUIHeaderPocketView *)v11 setAdditionalContentAlphaMultiplier:1.0];
    [(CCUIHeaderPocketView *)v11 _configureTopButtons];
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = (CCUISensorAttributionCompactControl *)a4;
  if (CCUIFeatureEnabled())
  {
    v13.receiver = self;
    v13.super_class = (Class)CCUIHeaderPocketView;
    -[CCUIHeaderPocketView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    uint64_t v8 = (CCUIPrivacyAttributionButton *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    long long v10 = (CCUISensorAttributionCompactControl *)v8;

    uint64_t v7 = v10;
    goto LABEL_10;
  }
  v12.receiver = self;
  v12.super_class = (Class)CCUIHeaderPocketView;
  -[CCUIHeaderPocketView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  id v9 = (CCUISensorAttributionCompactControl *)objc_claimAutoreleasedReturnValue();

  if ([(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl activeIndicatorsCount] >= 1&& ([(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl frame], CGRect v18 = CGRectInset(v17, -20.0, -20.0), v15.x = x, v15.y = y, CGRectContainsPoint(v18, v15)))
  {
    uint64_t v7 = self->_compactSensorAttributionControl;
  }
  else
  {
    uint64_t v7 = v9;
  }
  [(CCUIPrivacyAttributionButton *)self->_privacyAttributionButton frame];
  v16.double x = x;
  v16.double y = y;
  if (CGRectContainsPoint(v19, v16))
  {
    uint64_t v8 = self->_privacyAttributionButton;
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (void)handleCompactControlTouchBeganEvent
{
  id v3 = [(UIView *)self->_sensorAttributionExpandedWrapperView superview];
  [v3 bringSubviewToFront:self->_sensorAttributionExpandedWrapperView];

  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController setDelegate:self];
  sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
  id v5 = [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl clone];
  [(CCUISensorAttributionExpandedViewController *)sensorAttributionExpandedViewController prepareForInteractionWithClonedCompactControl:v5];

  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    compactSensorAttributionControl = self->_compactSensorAttributionControl;
    [(CCUISensorAttributionCompactControl *)compactSensorAttributionControl setHidden:1];
  }
}

- (void)handleCompactControlExpansionEvent
{
}

- (void)handleCompactControlCompactionEvent
{
}

- (void)privacyButtonTapped
{
}

- (NSString)bundleIdentifierUsingAudioVideoControls
{
  return self->_bundleIdentifierUsingAudioVideoControls;
}

- (BOOL)hitTestedViewWantsToBlockGestures:(id)a3
{
  id v4 = (CCUISensorAttributionCompactControl *)a3;
  BOOL v5 = self->_compactSensorAttributionControl == v4
    || (CCUISensorAttributionCompactControl *)self->_privacyAttributionButton == v4
    || self->_powerButton == (CCUIPowerButton *)v4;

  return v5;
}

- (void)addSensorAttributionViewControllerAsChildOfViewController:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 view];
  [v7 bounds];
  uint64_t v8 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  sensorAttributionExpandedWrapperView = self->_sensorAttributionExpandedWrapperView;
  self->_sensorAttributionExpandedWrapperView = v8;

  [(UIView *)self->_sensorAttributionExpandedWrapperView setAutoresizingMask:18];
  [(CCUIHeaderPocketView *)self addSubview:self->_sensorAttributionExpandedWrapperView];
  id v17 = [(CCUIHeaderPocketView *)self moduleInstanceManager];
  long long v10 = [[CCUISensorAttributionExpandedViewController alloc] initWithModuleInstanceManager:v17];
  sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
  self->_sensorAttributionExpandedViewController = v10;

  [v5 addChildViewController:self->_sensorAttributionExpandedViewController];
  objc_super v12 = [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController view];
  [(UIView *)self->_sensorAttributionExpandedWrapperView bounds];
  objc_msgSend(v12, "setFrame:");

  objc_super v13 = [v5 view];
  [v13 addSubview:self->_sensorAttributionExpandedWrapperView];

  double v14 = [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController view];
  [v14 setAutoresizingMask:18];

  CGPoint v15 = self->_sensorAttributionExpandedWrapperView;
  CGPoint v16 = [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController view];
  [(UIView *)v15 addSubview:v16];

  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController didMoveToParentViewController:v5];
  [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController setExpanded:0 animated:0];
  [(UIView *)self->_sensorAttributionExpandedWrapperView setHidden:1];
}

- (CCUISensorActivityData)audioVideoModeSelectionAttribution
{
  return [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController audioVideoModeSelectionAttribution];
}

- (BOOL)isSensorAttributionViewControllerExpanded
{
  return [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController isExpanded];
}

- (void)presentSensorAttributionExpandedView:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CCUIHeaderPocketView *)self isSensorAttributionViewControllerExpanded])
  {
    id v5 = [(UIView *)self->_sensorAttributionExpandedWrapperView superview];
    [v5 bringSubviewToFront:self->_sensorAttributionExpandedWrapperView];

    [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController setDelegate:self];
    sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
    uint64_t v7 = [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl clone];
    [(CCUISensorAttributionExpandedViewController *)sensorAttributionExpandedViewController prepareForInteractionWithClonedCompactControl:v7];

    if (!UIAccessibilityIsReduceMotionEnabled() && v3) {
      [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl setHidden:1];
    }
    uint64_t v8 = self->_sensorAttributionExpandedViewController;
    [(CCUISensorAttributionExpandedViewController *)v8 setExpanded:1 animated:v3];
  }
}

- (void)dismissSensorAttributionExpandedView:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(CCUIHeaderPocketView *)self isSensorAttributionViewControllerExpanded])
  {
    if (v6)
    {
      expandedViewControllerCloseDispatchGroup = self->_expandedViewControllerCloseDispatchGroup;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__CCUIHeaderPocketView_dismissSensorAttributionExpandedView_completion___block_invoke;
      block[3] = &unk_1E6A89B38;
      id v9 = v6;
      dispatch_group_notify(expandedViewControllerCloseDispatchGroup, MEMORY[0x1E4F14428], block);
    }
    [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController setExpanded:0 animated:v4];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __72__CCUIHeaderPocketView_dismissSensorAttributionExpandedView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setStatusBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarDelegate, a3);
  statusBar = self->_statusBar;
  id v5 = [(CCUIHeaderPocketView *)self statusBarDelegate];
  [(CCUIStatusBar *)statusBar setDelegate:v5];
}

- (void)setMode:(unint64_t)a3 orientationHint:(int64_t)a4
{
  if (self->_mode == a3) {
    return;
  }
  self->_unint64_t mode = a3;
  p_headerChevronView = (id *)&self->_headerChevronView;
  [(SBUIChevronView *)self->_headerChevronView removeFromSuperview];
  id v7 = *p_headerChevronView;
  id *p_headerChevronView = 0;

  p_statusBar = (id *)&self->_statusBar;
  [(CCUIStatusBar *)self->_statusBar removeFromSuperview];
  statusBar = self->_statusBar;
  self->_statusBar = 0;

  unint64_t mode = self->_mode;
  switch(mode)
  {
    case 1uLL:
      id v20 = objc_alloc(MEMORY[0x1E4FA79A0]);
      objc_super v21 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v22 = [v20 initWithColor:v21];
      id v23 = *p_headerChevronView;
      id *p_headerChevronView = (id)v22;

      [*p_headerChevronView configureForLightStyle];
LABEL_9:
      [(CCUIHeaderPocketView *)self addSubview:*p_headerChevronView];
      break;
    case 2uLL:
      double v24 = [CCUIStatusBar alloc];
      [(CCUIHeaderPocketView *)self bounds];
      uint64_t v25 = -[CCUIStatusBar initWithFrame:](v24, "initWithFrame:");
      id v26 = *p_statusBar;
      id *p_statusBar = (id)v25;

      [*p_statusBar setOrientation:a4];
      id v18 = *p_statusBar;
      uint64_t v19 = 1;
      goto LABEL_8;
    case 3uLL:
      id v11 = objc_alloc(MEMORY[0x1E4FA79A0]);
      objc_super v12 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v13 = [v11 initWithColor:v12];
      id v14 = *p_headerChevronView;
      id *p_headerChevronView = (id)v13;

      [*p_headerChevronView configureForLightStyle];
      [(CCUIHeaderPocketView *)self addSubview:*p_headerChevronView];
      CGPoint v15 = [CCUIStatusBar alloc];
      [(CCUIHeaderPocketView *)self bounds];
      uint64_t v16 = -[CCUIStatusBar initWithFrame:](v15, "initWithFrame:");
      id v17 = *p_statusBar;
      id *p_statusBar = (id)v16;

      [*p_statusBar setOrientation:a4];
      id v18 = *p_statusBar;
      uint64_t v19 = 0;
LABEL_8:
      [v18 setAlignCompactAndExpandedStatusBars:v19];
      id v27 = *p_statusBar;
      CGRect v28 = [(CCUIHeaderPocketView *)self statusBarDelegate];
      [v27 setDelegate:v28];

      p_headerChevronView = (id *)&self->_statusBar;
      goto LABEL_9;
  }
  [*p_statusBar prepareForPresentation];
  [*p_statusBar setNeedsLayout];
  [*p_statusBar layoutIfNeeded];
  [(CCUIHeaderPocketView *)self _updateAlpha];

  [(CCUIHeaderPocketView *)self _updateContentTransform];
}

- (void)setBackgroundAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_backgroundAlpha = a3;
    headerBackgroundView = self->_headerBackgroundView;
    [(UIView *)headerBackgroundView setAlpha:a3];
  }
}

- (void)setCustomBackgroundView:(id)a3
{
  BOOL v4 = (UIView *)a3;
  if (self->_customBackgroundView != v4)
  {
    self->_customBackgroundView = v4;
    id v7 = v4;
    if (v4) {
      id v5 = v4;
    }
    else {
      id v5 = [(CCUIHeaderPocketView *)self _newDefaultBackgroundView];
    }
    id v6 = v5;
    [(CCUIHeaderPocketView *)self _setHeaderBackgroundView:v5];

    BOOL v4 = v7;
  }
}

- (void)setChevronAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_chevronAlpha = a3;
    [(CCUIHeaderPocketView *)self _updateAlpha];
  }
}

- (void)setStatusBarAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_statusBarAlpha = a3;
    [(CCUIHeaderPocketView *)self _updateAlpha];
  }
}

- (void)setSensorStatusViewAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_sensorStatusViewAlpha = a3;
    [(CCUIHeaderPocketView *)self _updateAlpha];
  }
}

- (void)setContentAlphaMultiplier:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentAlphaMultiplier = a3;
    [(CCUIHeaderPocketView *)self _updateAlpha];
  }
}

- (void)setAdditionalContentAlphaMultiplier:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_additionalContentAlphaMultiplier = a3;
    [(CCUIHeaderPocketView *)self _updateAlpha];
  }
}

- (void)setVerticalContentTranslation:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_verticalContentTranslation = a3;
    [(CCUIHeaderPocketView *)self setNeedsLayout];
  }
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  p_contentTransform = &self->_contentTransform;
  long long v6 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_contentTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tdouble x = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    [(CCUIHeaderPocketView *)self _updateContentTransform];
  }
}

- (CGAffineTransform)compactScaleTransform
{
  UIEdgeInsets result = (CGAffineTransform *)self->_statusBar;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result compactScaleTransform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setCompactScaleTransform:(CGAffineTransform *)a3
{
  statusBar = self->_statusBar;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(CCUIStatusBar *)statusBar setCompactScaleTransform:v5];
}

- (unint64_t)chevronState
{
  return [(SBUIChevronView *)self->_headerChevronView state] == 1;
}

- (void)setChevronState:(unint64_t)a3
{
  if (a3 <= 1) {
    -[SBUIChevronView setState:animated:](self->_headerChevronView, "setState:animated:");
  }
}

- (void)_configureTopButtons
{
  [(CCUIHeaderPocketView *)self _topButtonSymbolPointSize];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:weight:scale:", 6, 2);
  objc_initWeak(&location, self);
  long long v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  id v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus" withConfiguration:v3];
  [v4 setImage:v5];
  long long v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v4 setBaseForegroundColor:v6];

  long long v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __44__CCUIHeaderPocketView__configureTopButtons__block_invoke;
  uint64_t v19 = &unk_1E6A89C50;
  objc_copyWeak(&v20, &location);
  long long v8 = [v7 actionWithHandler:&v16];
  long long v9 = +[CCUIAccessoryButton buttonWithConfiguration:primaryAction:](CCUIAccessoryButton, "buttonWithConfiguration:primaryAction:", v4, v8, v16, v17, v18, v19);

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1938]);
  [v9 addInteraction:v10];

  [v9 setShowsLargeContentViewer:1];
  [v9 setScalesLargeContentImage:1];
  [(CCUIHeaderPocketView *)self addSubview:v9];
  [(CCUIHeaderPocketView *)self setEditButton:v9];
  id v11 = objc_alloc_init(CCUIPowerButton);
  objc_super v12 = [[CCUIPowerButtonGlyphView alloc] initWithSymbolConfiguration:v3];
  [(CSProminentButtonControl *)v11 setGlyphView:v12];
  [(CSProminentButtonControl *)v11 setShouldAnimateBackgroundDuringInteraction:1];
  [(CCUIPowerButton *)v11 addTarget:self action:sel__powerButtonPrimaryActionTriggered forControlEvents:0x2000];
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1938]);
  [(CCUIPowerButton *)v11 addInteraction:v13];

  [(CCUIPowerButton *)v11 setShowsLargeContentViewer:1];
  [(CCUIPowerButton *)v11 setScalesLargeContentImage:1];
  id v14 = [(CCUIPowerButtonGlyphView *)v12 imageView];
  CGPoint v15 = [v14 largeContentImage];
  [(CCUIPowerButton *)v11 setLargeContentImage:v15];

  [(CCUIHeaderPocketView *)self addSubview:v11];
  [(CCUIHeaderPocketView *)self setPowerButton:v11];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __44__CCUIHeaderPocketView__configureTopButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _editButtonPrimaryActionTriggered];
}

- (void)_editButtonPrimaryActionTriggered
{
  id v2 = [(CCUIHeaderPocketView *)self actionsDelegate];
  [v2 didTriggerEditButtonPrimaryAction];
}

- (void)_powerButtonPrimaryActionTriggered
{
  id v2 = [(CCUIHeaderPocketView *)self actionsDelegate];
  [v2 didTriggerPowerButtonPrimaryAction];
}

- (void)_updateAlpha
{
  double v3 = self->_contentAlphaMultiplier * self->_additionalContentAlphaMultiplier;
  [(SBUIChevronView *)self->_headerChevronView setAlpha:v3 * self->_chevronAlpha];
  [(CCUIStatusBar *)self->_statusBar setAlpha:v3 * self->_statusBarAlpha];
  double v4 = v3 * self->_sensorStatusViewAlpha;
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl setAlpha:v4];
  id v5 = [(CCUISensorAttributionExpandedViewController *)self->_sensorAttributionExpandedViewController view];
  [v5 setAlpha:v4];

  [(CCUIPrivacyAttributionButton *)self->_privacyAttributionButton setAlpha:v4];
  [(UIButton *)self->_editButton setAlpha:v4];
  powerButton = self->_powerButton;

  [(CCUIPowerButton *)powerButton setAlpha:v4];
}

- (id)_newDefaultBackgroundView
{
  id v2 = objc_alloc(MEMORY[0x1E4FA5F00]);

  return (id)[v2 initWithRecipe:7];
}

- (void)_setHeaderBackgroundView:(id)a3
{
  id v5 = (UIView *)a3;
  p_headerBackgroundView = &self->_headerBackgroundView;
  if (self->_headerBackgroundView != v5)
  {
    long long v7 = v5;
    [(UIView *)v5 setAlpha:self->_backgroundAlpha];
    [(UIView *)*p_headerBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerBackgroundView, a3);
    [(CCUIHeaderPocketView *)self insertSubview:*p_headerBackgroundView atIndex:0];
    [(CCUIHeaderPocketView *)self setNeedsLayout];
    id v5 = v7;
  }
}

- (void)willOpenExpandedSensorAttributionViewController
{
  [(UIView *)self->_sensorAttributionExpandedWrapperView setHidden:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);
  [WeakRetained willOpenExpandedSensorAttributionViewController];
}

- (void)didCloseExpandedSensorAttributionViewController
{
  [(UIView *)self->_sensorAttributionExpandedWrapperView setHidden:1];
  [(CCUISensorAttributionCompactControl *)self->_compactSensorAttributionControl setHidden:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);
  [WeakRetained didCloseExpandedSensorAttributionViewController];
}

- (id)compactSensorAttributionControl
{
  return self->_compactSensorAttributionControl;
}

- (CCUIStatusBarDelegate)statusBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarDelegate);

  return (CCUIStatusBarDelegate *)WeakRetained;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UIView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (double)chevronAlpha
{
  return self->_chevronAlpha;
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (double)sensorStatusViewAlpha
{
  return self->_sensorStatusViewAlpha;
}

- (double)contentAlphaMultiplier
{
  return self->_contentAlphaMultiplier;
}

- (double)additionalContentAlphaMultiplier
{
  return self->_additionalContentAlphaMultiplier;
}

- (double)verticalContentTranslation
{
  return self->_verticalContentTranslation;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[14].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[15].b;
  return self;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (UIView)statusLabelView
{
  return self->_statusLabelView;
}

- (void)setStatusLabelView:(id)a3
{
}

- (CCUIHeaderPocketViewSensorAttributionDelegate)headerPocketViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);

  return (CCUIHeaderPocketViewSensorAttributionDelegate *)WeakRetained;
}

- (void)setHeaderPocketViewDelegate:(id)a3
{
}

- (CCUIHeaderPocketViewActionsDelegate)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (CCUIHeaderPocketViewActionsDelegate *)WeakRetained;
}

- (void)setActionsDelegate:(id)a3
{
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moduleInstanceManager);

  return (CCUIModuleInstanceManager *)WeakRetained;
}

- (void)setModuleInstanceManager:(id)a3
{
}

- (void)setEditButton:(id)a3
{
}

- (void)setPowerButton:(id)a3
{
}

- (BOOL)audioVideoControlsAreEnabled
{
  return self->_audioVideoControlsEnabled;
}

- (CCUIPrivacyAttributionButton)privacyAttributionButton
{
  return self->_privacyAttributionButton;
}

- (void)setPrivacyAttributionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyAttributionButton, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierUsingAudioVideoControls, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_moduleInstanceManager);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_destroyWeak((id *)&self->_headerPocketViewDelegate);
  objc_storeStrong((id *)&self->_statusLabelView, 0);
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_expandedViewControllerCloseDispatchGroup, 0);
  objc_storeStrong((id *)&self->_sensorAttributionExpandedWrapperView, 0);
  objc_storeStrong((id *)&self->_sensorAttributionExpandedViewController, 0);
  objc_storeStrong((id *)&self->_compactSensorAttributionControl, 0);
  objc_storeStrong((id *)&self->_headerChevronView, 0);

  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
}

@end