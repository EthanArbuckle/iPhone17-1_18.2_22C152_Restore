@interface CKTranscriptPluginBalloonView
- (BOOL)canUseOpaqueMask;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isInteractive;
- (BOOL)isScheduled;
- (BOOL)isSyndicationOnboarding;
- (BOOL)mayReparentPluginViews;
- (BOOL)shouldMaskWhenOpaque;
- (BOOL)suppressMask;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonImageView)pluginInsetMask;
- (CKBalloonShapeView)outlineMask;
- (CKBalloonShapeView)tailMask;
- (CKTranscriptPluginBalloonView)initWithFrame:(CGRect)a3;
- (CKTranscriptPluginView)pluginView;
- (Class)invisibleInkEffectViewClass;
- (IMBalloonPluginDataSource)dataSource;
- (UIEdgeInsets)pluginInsets;
- (UIView)pluginSnapshotView;
- (UIView)pluginSnapshotViewForThrowAnimation;
- (UIView)suggestedActionsBackgroundView;
- (UIViewController)pluginViewController;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)imageForInvisibleInkEffectView;
- (id)overlayColor;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (void)_pluginViewReadyForSnapshot:(id)a3;
- (void)_reparentCurrentPluginView;
- (void)_setAndAddPluginViewAsSubview:(id)a3;
- (void)addFilter:(id)a3;
- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3;
- (void)attachInvisibleInkEffectView;
- (void)clearFilters;
- (void)configureForComposition:(id)a3;
- (void)configureForTranscriptPlugin:(id)a3 context:(id)a4;
- (void)detachInvisibleInkEffectView;
- (void)invisibleInkEffectViewWasUncovered;
- (void)layoutSubviews;
- (void)pluginViewRequestsPresentationAction:(id)a3;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setCanUseOpaqueMask:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setHasTail:(BOOL)a3;
- (void)setIsInteractive:(BOOL)a3;
- (void)setIsSyndicationOnboarding:(BOOL)a3;
- (void)setMayReparentPluginViews:(BOOL)a3;
- (void)setOutlineMask:(id)a3;
- (void)setPluginInsetMask:(id)a3;
- (void)setPluginSnapshotView:(id)a3;
- (void)setPluginSnapshotViewForThrowAnimation:(id)a3;
- (void)setPluginView:(id)a3;
- (void)setPluginViewController:(id)a3;
- (void)setScheduled:(BOOL)a3;
- (void)setSuggestedActionsBackgroundColor:(id)a3;
- (void)setSuggestedActionsBackgroundView:(id)a3;
- (void)setSuppressMask:(BOOL)a3;
- (void)setTailMask:(id)a3;
- (void)setUserInterfaceLevel:(int64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)updateBalloonMasks;
- (void)willRemoveSubview:(id)a3;
@end

@implementation CKTranscriptPluginBalloonView

- (void)configureForComposition:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v14 configureForComposition:v4];
  v5 = [v4 shelfPluginPayload];
  if (!v5)
  {
    v6 = [v4 pluginDisplayContainers];
    v7 = [v6 lastObject];

    v5 = [v7 pluginPayload];

    if (!v5)
    {
      v5 = [v4 firstEmbeddedPluginPayload];
    }
  }
  [v5 setIsFromMe:1];
  v8 = [MEMORY[0x1E4F6BC18] sharedInstance];
  v9 = [v5 pluginBundleID];
  v10 = [v8 balloonPluginForBundleID:v9];

  v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataSourceClass")), "initWithPluginPayload:", v5);
  v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "bubbleClass")), "initWithDataSource:isFromMe:", v11, 1);
  v13 = [v12 pluginContentView];
  [(CKTranscriptPluginBalloonView *)self setPluginView:v13];

  [(CKTranscriptPluginBalloonView *)self setDataSource:v11];
}

- (CKTranscriptPluginBalloonView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CKTranscriptPluginBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CKBalloonImageView *)v3 setContentsTransformAnimationEnabled:1];
    v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v6 = [v5 isScheduledMessagesCoreEnabled];

    if (v6)
    {
      v7 = [CKBalloonImageView alloc];
      [(CKTranscriptPluginBalloonView *)v4 bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [(CKTranscriptPluginBalloonView *)v4 pluginInsets];
      v20 = -[CKBalloonImageView initWithFrame:](v7, "initWithFrame:", v9 + v19, v11 + v16, v13 - (v19 + v17), v15 - (v16 + v18));
      [(CKBalloonImageView *)v20 setContentsTransformAnimationEnabled:1];
      [(CKTranscriptPluginBalloonView *)v4 setPluginInsetMask:v20];
    }
    [(CKTranscriptPluginBalloonView *)v4 setMayReparentPluginViews:1];
    v21 = +[CKUIBehavior sharedBehaviors];
    v22 = [v21 theme];
    v23 = [v22 unfilledBalloonColorForColorType:0xFFFFFFFFLL];
    [v23 ckColor];
    -[CKBalloonView setStrokeColor:](v4, "setStrokeColor:");

    id location = 0;
    objc_initWeak(&location, v4);
    v24 = [CKBalloonShapeView alloc];
    [(CKBalloonView *)v4 balloonDescriptor];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke;
    v30 = &unk_1E5629618;
    objc_copyWeak(&v31, &location);
    v25 = [(CKBalloonShapeView *)v24 initWithDescriptor:v32 imageGenerator:&v27];
    -[CKTranscriptPluginBalloonView setTailMask:](v4, "setTailMask:", v25, v27, v28, v29, v30);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke(uint64_t a1, __int16 *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (![WeakRetained canUseOpaqueMask])
    {
      __int16 v10 = *a2;
      *(void *)((char *)&v19 + 3) = *(void *)((char *)a2 + 3);
      *((void *)&v19 + 1) = *((void *)a2 + 1);
      *(_OWORD *)&v20[1] = *(_OWORD *)((char *)a2 + 17);
      *(_OWORD *)&v20[17] = *(_OWORD *)((char *)a2 + 33);
      *(_OWORD *)&v20[33] = *(_OWORD *)((char *)a2 + 49);
      *(void *)&v20[48] = *((void *)a2 + 8);
      *(_DWORD *)&v20[57] = *(_DWORD *)((char *)a2 + 73);
      *(_DWORD *)&v20[60] = *((_DWORD *)a2 + 19);
      LOWORD(v19) = v10;
      BYTE2(v19) = 0;
      v20[0] = -1;
      v20[56] = 0;
      uint64_t v5 = CKResizableBalloonMask(&v19);
      goto LABEL_11;
    }
    long long v16 = *((_OWORD *)a2 + 2);
    long long v17 = *((_OWORD *)a2 + 3);
    uint64_t v18 = *((void *)a2 + 8);
    long long v14 = *(_OWORD *)a2;
    long long v15 = *((_OWORD *)a2 + 1);
    *(_DWORD *)double v13 = *(_DWORD *)((char *)a2 + 73);
    *(_DWORD *)&v13[3] = *((_DWORD *)a2 + 19);
    if ([v4 isSyndicationOnboarding])
    {
      *(_OWORD *)&v20[32] = v17;
      *(void *)&v20[48] = v18;
      *(_OWORD *)v20 = v15;
      *(_OWORD *)&v20[16] = v16;
      long long v19 = v14;
      v20[56] = 1;
      *(_DWORD *)&v20[57] = *(_DWORD *)v13;
      *(_DWORD *)&v20[60] = *(_DWORD *)&v13[3];
      uint64_t v5 = CKResizableOnboardingBalloonPunchout(&v19);
      goto LABEL_11;
    }
    *(_OWORD *)&v20[32] = v17;
    *(void *)&v20[48] = v18;
    *(_OWORD *)v20 = v15;
    *(_OWORD *)&v20[16] = v16;
    long long v19 = v14;
    v20[56] = 1;
    *(_DWORD *)&v20[57] = *(_DWORD *)v13;
    *(_DWORD *)&v20[60] = *(_DWORD *)&v13[3];
  }
  else
  {
    int v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke_cold_1(v6);
    }

    long long v7 = *((_OWORD *)a2 + 2);
    long long v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)&v20[32] = *((_OWORD *)a2 + 3);
    *(_OWORD *)&v20[48] = v8;
    long long v9 = *(_OWORD *)a2;
    *(_OWORD *)v20 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&v20[16] = v7;
    long long v19 = v9;
  }
  uint64_t v5 = CKResizableBalloonPunchout(&v19);
LABEL_11:
  double v11 = (void *)v5;

  return v11;
}

- (void)willRemoveSubview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKTranscriptPluginBalloonView *)&v3 willRemoveSubview:a3];
}

- (UIEdgeInsets)pluginInsets
{
  if ([(CKTranscriptPluginBalloonView *)self isScheduled])
  {
    v2 = +[CKUIBehavior sharedBehaviors];
    [v2 linkPreviewSendLaterInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F437F8];
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)layoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v64 layoutSubviews];
  BOOL v3 = [(CKBalloonView *)self hasSuggestedActionsMenu];
  [(CKTranscriptPluginBalloonView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKTranscriptPluginBalloonView *)self pluginInsets];
  double v13 = v5 + v12;
  double v15 = v7 + v14;
  double v17 = v9 - (v12 + v16);
  double v19 = v11 - (v14 + v18);
  if (v3)
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v19 = v19 - v20;
  }
  -[CKTranscriptPluginView setFrame:](self->_pluginView, "setFrame:", v13, v15, v17, v19);
  [(CKTranscriptPluginBalloonView *)self maskFrame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(CKTranscriptPluginBalloonView *)self tailMask];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  v30 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v31 = [v30 isScheduledMessagesCoreEnabled];

  if (v31)
  {
    -[CKBalloonImageView setFrame:](self->_pluginInsetMask, "setFrame:", v13, v15, v17, v19);
    v32 = [(CKBalloonView *)self invisibleInkEffectController];
    v33 = [v32 effectView];
    objc_msgSend(v33, "setFrame:", v13, v15, v17, v19);

    BOOL v34 = [(CKTranscriptPluginBalloonView *)self isScheduled];
    pluginView = self->_pluginView;
    if (v34)
    {
      [(CKTranscriptPluginView *)pluginView setAlpha:0.5];
      v36 = [(CKBalloonView *)self invisibleInkEffectController];
      v37 = [v36 effectView];
      v38 = [v37 superview];

      v39 = [(CKTranscriptPluginBalloonView *)self pluginInsetMask];
      if (v38)
      {
        v40 = [(CKBalloonView *)self invisibleInkEffectController];
        v41 = [v40 effectView];
        [(CKTranscriptPluginBalloonView *)self insertSubview:v39 above:v41];
      }
      else
      {
        [(CKTranscriptPluginBalloonView *)self insertSubview:v39 above:self->_pluginView];
      }
    }
    else
    {
      [(CKTranscriptPluginView *)pluginView setAlpha:1.0];
      v39 = [(CKTranscriptPluginBalloonView *)self pluginInsetMask];
      [v39 removeFromSuperview];
    }
  }
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    [(CKBalloonView *)self suggestedActionsMenuAdditionalHeight];
    double v43 = v42;
    [(CKTranscriptPluginBalloonView *)self bounds];
    double v45 = v44 - v43;
    [(CKTranscriptPluginBalloonView *)self bounds];
    double v47 = v46;
    v48 = [(CKTranscriptPluginBalloonView *)self suggestedActionsBackgroundView];
    objc_msgSend(v48, "setFrame:", 0.0, v45, v47, v43);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v59 = 0u;
  [(CKBalloonView *)self balloonDescriptor];
  BYTE8(v63) = 0;
  if (![(CKTranscriptPluginBalloonView *)self canUseOpaqueMask]) {
    BYTE2(v59) = 0;
  }
  long long v56 = v61;
  long long v57 = v62;
  long long v58 = v63;
  long long v54 = v59;
  long long v55 = v60;
  v49 = [(CKTranscriptPluginBalloonView *)self tailMask];
  v53[2] = v56;
  v53[3] = v57;
  v53[4] = v58;
  v53[0] = v54;
  v53[1] = v55;
  [v49 setDescriptor:v53];

  v50 = [(CKTranscriptPluginBalloonView *)self outlineMask];
  objc_msgSend(v50, "setFrame:", v22, v24, v26, v28);

  v51 = [(CKTranscriptPluginBalloonView *)self tailMask];
  [(CKTranscriptPluginBalloonView *)self bringSubviewToFront:v51];

  v52 = [(CKTranscriptPluginBalloonView *)self outlineMask];
  [(CKTranscriptPluginBalloonView *)self bringSubviewToFront:v52];
}

- (void)prepareForDisplay
{
  v13.receiver = self;
  v13.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v13 prepareForDisplay];
  [(CKTranscriptPluginBalloonView *)self updateBalloonMasks];
  double v3 = 0.0;
  double v4 = 0.0;
  if ([(CKBalloonView *)self hasTail])
  {
    double v5 = +[CKUIBehavior sharedBehaviors];
    [v5 balloonMaskTailSizeForTailShape:1];
    double v4 = v6;

    double v7 = +[CKUIBehavior sharedBehaviors];
    [v7 balloonMaskTailSizeForTailShape:1];
    double v3 = v8;
  }
  double v9 = *MEMORY[0x1E4F437F8];
  double v10 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (![(CKBalloonView *)self orientation])
  {
    double v10 = v4;
    double v4 = v11;
  }
  double v12 = [(CKTranscriptPluginBalloonView *)self pluginView];
  objc_msgSend(v12, "setLayoutMargins:", v9, v10, v3, v4);
  [v12 layoutMarginsDidChange];
  if (objc_opt_respondsToSelector()) {
    [v12 setPluginViewDelegate:self];
  }
}

- (void)updateBalloonMasks
{
  double v3 = [(CKTranscriptPluginBalloonView *)self tailMask];
  [v3 removeFromSuperview];

  double v4 = [(CKTranscriptPluginBalloonView *)self outlineMask];
  [v4 removeFromSuperview];

  double v5 = [(CKTranscriptPluginBalloonView *)self layer];
  [v5 setMask:0];

  double v6 = [(CKTranscriptPluginBalloonView *)self tailMask];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  [(CKBalloonView *)self balloonDescriptor];
  v31[2] = v34;
  v31[3] = v35;
  v31[4] = v36;
  v31[0] = v32;
  v31[1] = v33;
  [v6 setDescriptor:v31];
  if ([(CKTranscriptPluginBalloonView *)self canUseOpaqueMask])
  {
    double v7 = [v6 layer];
    [v7 setAllowsHitTesting:0];

    [v6 setUserInteractionEnabled:0];
    double v8 = [(CKBalloonView *)self invisibleInkEffectController];
    double v9 = [v8 effectView];

    if (v9)
    {
      if (![(CKTranscriptPluginBalloonView *)self suppressMask]) {
        [(CKTranscriptPluginBalloonView *)self insertSubview:v6 aboveSubview:v9];
      }
    }
    else if ([(CKTranscriptPluginBalloonView *)self shouldMaskWhenOpaque] {
           && ![(CKTranscriptPluginBalloonView *)self suppressMask])
    }
    {
      [(CKTranscriptPluginBalloonView *)self insertSubview:v6 atIndex:0];
    }
    goto LABEL_16;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  [(CKBalloonView *)self balloonDescriptor];
  if ([(CKBalloonView *)self balloonStyle] - 1 <= 3)
  {
    BYTE8(v30) = 0;
    LOBYTE(v27) = -1;
    double v10 = [(CKTranscriptPluginBalloonView *)self outlineMask];
    if (!v10)
    {
      double v11 = [CKBalloonShapeView alloc];
      long long v23 = v28;
      long long v24 = v29;
      long long v25 = v30;
      long long v21 = v26;
      long long v22 = v27;
      double v10 = [(CKBalloonShapeView *)v11 initWithDescriptor:&v21 imageGenerator:&__block_literal_global_161];
      [(CKBalloonShapeView *)v10 setUserInteractionEnabled:0];
      [(CKTranscriptPluginBalloonView *)self setOutlineMask:v10];
    }
    v20[2] = v28;
    v20[3] = v29;
    v20[4] = v30;
    v20[0] = v26;
    v20[1] = v27;
    [(CKBalloonShapeView *)v10 setDescriptor:v20];
    [(CKTranscriptPluginBalloonView *)self bounds];
    -[CKBalloonShapeView setFrame:](v10, "setFrame:");
    if (![(CKTranscriptPluginBalloonView *)self suppressMask]) {
      [(CKTranscriptPluginBalloonView *)self insertSubview:v10 atIndex:0];
    }
  }
  if (![(CKTranscriptPluginBalloonView *)self suppressMask])
  {
    double v9 = [(CKTranscriptPluginBalloonView *)self layer];
    double v12 = [v6 layer];
    [v9 setMask:v12];

LABEL_16:
  }
  objc_super v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isScheduledMessagesCoreEnabled];

  if (v14)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    [(CKBalloonView *)self balloonDescriptor];
    BYTE2(v26) = 0;
    WORD4(v30) = 1;
    double v15 = [(CKTranscriptPluginBalloonView *)self pluginInsetMask];
    long long v23 = v28;
    long long v24 = v29;
    long long v25 = v30;
    long long v21 = v26;
    long long v22 = v27;
    double v16 = CKResizableBalloonPunchout(&v21);
    [v15 setImage:v16];

    double v17 = [(CKBalloonView *)self invisibleInkEffectController];
    double v18 = [v17 effectView];
    double v19 = [(CKTranscriptPluginBalloonView *)self pluginInsetMask];
    [v18 setMaskView:v19];
  }
}

id __51__CKTranscriptPluginBalloonView_updateBalloonMasks__block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[3];
  v6[2] = a2[2];
  v6[3] = v2;
  v6[4] = a2[4];
  long long v3 = a2[1];
  v6[0] = *a2;
  v6[1] = v3;
  double v4 = CKResizableBalloonImage((uint64_t)v6);

  return v4;
}

- (void)setIsSyndicationOnboarding:(BOOL)a3
{
  self->_isSyndicationOnboarding = a3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(CKTranscriptPluginBalloonView *)self updateBalloonMasks];
  }
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    [(CKTranscriptPluginBalloonView *)self updateBalloonMasks];
  }
}

- (void)setHasTail:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKBalloonView *)self hasTail] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptPluginBalloonView;
    [(CKBalloonView *)&v5 setHasTail:v3];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v10 prepareForReuse];
  BOOL v3 = [(CKTranscriptPluginBalloonView *)self pluginView];
  double v4 = [(CKTranscriptPluginBalloonView *)self pluginView];
  objc_super v5 = [v4 superview];

  if (v5 == self)
  {
    double v6 = [(CKTranscriptPluginBalloonView *)self pluginViewController];
    [v6 willMoveToParentViewController:0];

    [v3 removeFromSuperview];
    if (objc_opt_respondsToSelector()) {
      [v3 setPluginViewDelegate:0];
    }
    double v7 = +[CKTranscriptPluginViewManager sharedInstance];
    [v7 enqueuePluginViewForReuse:v3];

    double v8 = [(CKTranscriptPluginBalloonView *)self pluginViewController];
    [v8 removeFromParentViewController];
  }
  [(CKTranscriptPluginBalloonView *)self setPluginViewController:0];
  [(CKTranscriptPluginBalloonView *)self setPluginView:0];
  [(CKTranscriptPluginBalloonView *)self setPluginSnapshotView:0];
  double v9 = [(CKTranscriptPluginBalloonView *)self pluginSnapshotViewForThrowAnimation];
  [v9 removeFromSuperview];

  [(CKTranscriptPluginBalloonView *)self setPluginSnapshotViewForThrowAnimation:0];
  [(CKTranscriptPluginBalloonView *)self setDataSource:0];
  [(CKTranscriptPluginBalloonView *)self setSuppressMask:0];
  [(CKTranscriptPluginBalloonView *)self setScheduled:0];
}

- (BOOL)canUseOpaqueMask
{
  BOOL v3 = +[CKPrintController sharedInstance];
  if ([v3 isPrinting])
  {

LABEL_4:
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptPluginBalloonView;
    return [(CKBalloonView *)&v7 canUseOpaqueMask];
  }
  double v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 canPluginBalloonsUseOpaqueMask];

  if (v5) {
    goto LABEL_4;
  }
  return 0;
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[CKPrintController sharedInstance];
  if ([v5 isPrinting])
  {
  }
  else
  {
    double v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 canPluginBalloonsUseOpaqueMask];

    if (!v7) {
      return;
    }
  }
  if ([(CKTranscriptPluginBalloonView *)self canUseOpaqueMask] != v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTranscriptPluginBalloonView;
    [(CKBalloonView *)&v8 setCanUseOpaqueMask:v3];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKTranscriptPluginBalloonView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(_OWORD *)&a4->bottom = v7;
  }
  objc_super v8 = [(CKTranscriptPluginBalloonView *)self dataSource];

  if (v8)
  {
    [(CKTranscriptPluginBalloonView *)self pluginInsets];
    double v11 = width - (v9 + v10);
    double v14 = height - (v12 + v13);
    double v15 = [(CKTranscriptPluginBalloonView *)self dataSource];
    objc_msgSend(v15, "sizeThatFits:", v11, v14);
    double v17 = v16;
    double v19 = v18;

    [(CKTranscriptPluginBalloonView *)self pluginInsets];
    double v21 = v20;
    double v24 = v17 + v22 + v23;
    double v26 = v19 + v21 + v25;
  }
  else
  {
    double v24 = *MEMORY[0x1E4F1DB30];
    double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v26;
  result.double width = v24;
  return result;
}

- (id)overlayColor
{
  long long v2 = +[CKUIBehavior sharedBehaviors];
  BOOL v3 = [v2 pluginBalloonSelectionOverlayColor];

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CKTranscriptPluginBalloonView;
  -[CKTranscriptPluginBalloonView hitTest:withEvent:](&v32, sel_hitTest_withEvent_, v7, x, y);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([(CKBalloonView *)self invisibleInkEffectEnabled]
    && [(CKTranscriptPluginBalloonView *)self isInteractive])
  {
    double v9 = [(CKBalloonView *)self invisibleInkEffectController];
    double v10 = [v9 effectView];

    double v11 = [v10 coverageTracker];
    double v12 = v11;
    if (v11 && ([v11 isUncovered] & 1) == 0)
    {

      goto LABEL_21;
    }
  }
  if ([(CKTranscriptPluginBalloonView *)self isInteractive])
  {
    double v13 = [(CKTranscriptPluginBalloonView *)self pluginView];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      double v15 = [(CKTranscriptPluginBalloonView *)self pluginView];
      double v16 = [v15 interactiveViews];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v18 = [(CKTranscriptPluginBalloonView *)self pluginView];
        double v19 = [v18 interactiveViews];

        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v19);
              }
              double v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              objc_msgSend(v24, "convertPoint:fromView:", self, x, y);
              uint64_t v25 = objc_msgSend(v24, "hitTest:withEvent:", v7);
              if (v25)
              {
                double v26 = (void *)v25;

                id v8 = v26;
                goto LABEL_19;
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
LABEL_19:
      }
    }
  }
  id v8 = v8;
  double v10 = v8;
LABEL_21:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 view];
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class()) {
    goto LABEL_18;
  }
  double v10 = [(CKBalloonView *)self delegate];
  [v10 liveBalloonTouched:self];

  if ([(CKTranscriptPluginBalloonView *)self isInteractive])
  {
    double v11 = [(CKTranscriptPluginBalloonView *)self pluginView];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = [(CKTranscriptPluginBalloonView *)self pluginView];
      char v14 = [v13 interactiveViews];

      if ([v14 containsObject:v8])
      {

LABEL_18:
        BOOL v19 = 0;
        goto LABEL_19;
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v15);
            }
            if ([v8 isDescendantOfView:*(void *)(*((void *)&v25 + 1) + 8 * i)]
              && !CKIsRunningInMessagesNotificationExtension())
            {
              id location = 0;
              objc_initWeak(&location, self);
              uint64_t v22 = MEMORY[0x1E4F143A8];
              objc_copyWeak(&v23, &location);
              uint64_t v20 = [(CKTranscriptPluginBalloonView *)self dataSource];
              [v20 setWillOpenHandler:&v22];

              objc_destroyWeak(&v23);
              objc_destroyWeak(&location);

              goto LABEL_18;
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
  }
  BOOL v19 = 1;
LABEL_19:

  return v19;
}

void __70__CKTranscriptPluginBalloonView_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    long long v2 = [WeakRetained delegate];
    if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v2 interactionStartedWithPluginBalloonView:v3];
    }

    id WeakRetained = v3;
  }
}

- (void)pluginViewRequestsPresentationAction:(id)a3
{
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)attachInvisibleInkEffectView
{
  id v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v6 = [v3 effectView];

  double v4 = [(CKTranscriptPluginBalloonView *)self pluginView];
  int v5 = [v4 superview];

  if (v5) {
    [(CKTranscriptPluginBalloonView *)self insertSubview:v6 aboveSubview:v4];
  }
  else {
    [(CKTranscriptPluginBalloonView *)self insertSubview:v6 atIndex:0];
  }
}

- (void)detachInvisibleInkEffectView
{
  long long v2 = [(CKBalloonView *)self invisibleInkEffectController];
  id v3 = [v2 effectView];

  [v3 removeFromSuperview];
}

- (id)imageForInvisibleInkEffectView
{
  id v3 = [(CKTranscriptPluginBalloonView *)self pluginView];
  double v4 = v3;
  if (v3)
  {
    [v3 layoutSubviews];
    [(CKTranscriptPluginBalloonView *)self bounds];
    v13.double width = v5;
    v13.double height = v6;
    UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    id v8 = [MEMORY[0x1E4F428B8] whiteColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v8 CGColor]);

    [(CKTranscriptPluginBalloonView *)self bounds];
    CGContextFillRect(CurrentContext, v14);
    uint64_t v9 = [v4 layer];
    [v9 renderInContext:CurrentContext];

    double v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)invisibleInkEffectViewWasUncovered
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  [v2 suspendForTimeInterval:5.0];
}

- (void)_pluginViewReadyForSnapshot:(id)a3
{
  id v21 = a3;
  BOOL v4 = [(CKBalloonView *)self invisibleInkEffectEnabled];
  CGFloat v5 = v21;
  if (v4)
  {
    CGFloat v6 = [v21 userInfo];
    id v7 = [v6 objectForKey:@"CKTranscriptPluginViewSnapshotUserInfoKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 size];
      double v9 = v8;
      double v11 = v10;
      [v7 size];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [v7 scale];
      CGFloat v17 = v16;
      v23.double width = v13;
      v23.double height = v15;
      UIGraphicsBeginImageContextWithOptions(v23, 1, v17);
      double v18 = [MEMORY[0x1E4F428B8] whiteColor];
      [v18 set];

      v24.size.double width = ceil(v9);
      v24.size.double height = ceil(v11);
      v24.origin.double x = 0.0;
      v24.origin.double y = 0.0;
      UIRectFill(v24);
      objc_msgSend(v7, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      BOOL v19 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
    }
    else
    {
      BOOL v19 = [(CKTranscriptPluginBalloonView *)self imageForInvisibleInkEffectView];
    }
    uint64_t v20 = [(CKBalloonView *)self invisibleInkEffectController];
    [v20 hostViewDidUpdateSnapshot:v19];

    CGFloat v5 = v21;
  }
}

- (void)_reparentCurrentPluginView
{
  if ([(CKTranscriptPluginBalloonView *)self mayReparentPluginViews]
    || ([(CKTranscriptPluginView *)self->_pluginView superview],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    BOOL v4 = [(CKTranscriptPluginView *)self->_pluginView superview];

    if (v4 != self) {
      [(CKTranscriptPluginView *)self->_pluginView removeFromSuperview];
    }
    CGFloat v5 = [(CKTranscriptPluginView *)self->_pluginView superview];

    if (v5 != self)
    {
      pluginView = self->_pluginView;
      [(CKTranscriptPluginBalloonView *)self _setAndAddPluginViewAsSubview:pluginView];
    }
  }
}

- (void)_setAndAddPluginViewAsSubview:(id)a3
{
  id v15 = a3;
  CGFloat v5 = [(CKBalloonView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKBalloonView *)self delegate];
    [v7 balloonView:self willInsertPluginViewAsSubview:v15];
  }
  p_pluginView = &self->_pluginView;
  objc_storeStrong((id *)&self->_pluginView, a3);
  double v9 = [(CKBalloonView *)self invisibleInkEffectController];
  double v10 = [v9 effectView];

  pluginView = self->_pluginView;
  if (v10) {
    [(CKTranscriptPluginBalloonView *)self insertSubview:pluginView belowSubview:v10];
  }
  else {
    [(CKTranscriptPluginBalloonView *)self addSubview:pluginView];
  }
  double v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v13 = [v12 isScheduledMessagesCoreEnabled];

  if ((v13 & 1) == 0) {
    [(CKTranscriptPluginView *)*p_pluginView setAlpha:1.0];
  }
  [(CKBalloonView *)self setNeedsPrepareForDisplay];
  double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 removeObserver:self name:@"CKTranscriptPluginViewReadyForSnapshotNotification" object:0];
  if (*p_pluginView) {
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__pluginViewReadyForSnapshot_, @"CKTranscriptPluginViewReadyForSnapshotNotification");
  }
}

- (void)setPluginView:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (CKTranscriptPluginView *)a3;
  CGFloat v5 = v4;
  pluginView = self->_pluginView;
  if (pluginView == v4 && pluginView != 0)
  {
    [(CKTranscriptPluginBalloonView *)self _reparentCurrentPluginView];
    goto LABEL_23;
  }
  if (pluginView == v4) {
    goto LABEL_23;
  }
  if (![(CKTranscriptPluginBalloonView *)self mayReparentPluginViews])
  {
    double v8 = [(CKTranscriptPluginView *)v5 superview];

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        double v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          double v10 = [(CKTranscriptPluginView *)v5 superview];
          int v17 = 138412802;
          double v18 = self;
          __int16 v19 = 2112;
          uint64_t v20 = v5;
          __int16 v21 = 2112;
          uint64_t v22 = v10;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "CKTranscriptPluginBalloonView: not setting %@'s plugin view to be %@, since that would remove it from its superview %@", (uint8_t *)&v17, 0x20u);
        }
      }
      goto LABEL_23;
    }
  }
  if (IMIsRunningInMessagesTranscriptExtension())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v11 = v5;
      double v12 = [(CKTranscriptPluginView *)v11 metadata];
      char v13 = [v12 specialization];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
      }
      else
      {
        double v14 = [(CKTranscriptPluginView *)v11 metadata];
        id v15 = [v14 specialization];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
      }
      [(CKTranscriptPluginView *)v11 _setUseLowMemoryImageFilters:1];
      goto LABEL_19;
    }
  }
LABEL_20:
  if ([(CKTranscriptPluginView *)self->_pluginView isDescendantOfView:self]) {
    [(CKTranscriptPluginView *)self->_pluginView removeFromSuperview];
  }
  [(CKTranscriptPluginBalloonView *)self _setAndAddPluginViewAsSubview:v5];
LABEL_23:
}

- (void)setPluginSnapshotView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  p_pluginSnapshotView = &self->_pluginSnapshotView;
  pluginSnapshotView = self->_pluginSnapshotView;
  double v10 = v5;
  if (pluginSnapshotView != v5)
  {
    [(UIView *)pluginSnapshotView removeFromSuperview];
    double v8 = [(CKTranscriptPluginBalloonView *)self pluginView];
    [v8 setAlpha:1.0];

    objc_storeStrong((id *)&self->_pluginSnapshotView, a3);
    if (*p_pluginSnapshotView)
    {
      [(CKTranscriptPluginBalloonView *)self insertSubview:*p_pluginSnapshotView atIndex:0];
      double v9 = [(CKTranscriptPluginBalloonView *)self pluginView];
      [v9 setAlpha:0.0];
    }
  }
}

- (void)setPluginSnapshotViewForThrowAnimation:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  p_pluginSnapshotViewForThrowAnimation = (id *)&self->_pluginSnapshotViewForThrowAnimation;
  pluginSnapshotViewForThrowAnimation = self->_pluginSnapshotViewForThrowAnimation;
  if (pluginSnapshotViewForThrowAnimation != v5)
  {
    double v9 = v5;
    [(UIView *)pluginSnapshotViewForThrowAnimation removeFromSuperview];
    objc_storeStrong((id *)&self->_pluginSnapshotViewForThrowAnimation, a3);
    if (*p_pluginSnapshotViewForThrowAnimation)
    {
      [(CKTranscriptPluginBalloonView *)self setPluginView:0];
      id v8 = *p_pluginSnapshotViewForThrowAnimation;
    }
    else
    {
      id v8 = 0;
    }
    [(CKTranscriptPluginBalloonView *)self bounds];
    objc_msgSend(v8, "setFrame:");
    [*p_pluginSnapshotViewForThrowAnimation setAutoresizingMask:18];
    [(CKTranscriptPluginBalloonView *)self addSubview:*p_pluginSnapshotViewForThrowAnimation];
    [(CKTranscriptPluginBalloonView *)self bringSubviewToFront:*p_pluginSnapshotViewForThrowAnimation];
    CGFloat v5 = v9;
  }
}

- (BOOL)shouldMaskWhenOpaque
{
  return 1;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 balloonBackdropFilters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Cannot have two backdrop filter layers", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      id v8 = [(CKBalloonView *)self backdropFilterLayer];
      _CKAssert(v8 == 0);
    }
    double v9 = [(CKBalloonView *)self backdropFilterLayer];

    if (v9)
    {
      double v10 = [(CKBalloonView *)self backdropFilterLayer];
      [v10 removeFromSuperlayer];

      [(CKBalloonView *)self setBackdropFilterLayer:0];
    }
    double v11 = [(CKTranscriptPluginBalloonView *)self pluginView];
    [v11 setHidden:1];

    [(CKTranscriptPluginBalloonView *)self setSuppressMask:1];
    double v12 = [(CKTranscriptPluginBalloonView *)self layer];
    [v12 setAllowsGroupBlending:0];

    id v13 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    [v13 setGroupName:@"FSMBackdropGroup"];
    double v14 = [v4 balloonBackdropFilters];
    [v13 setFilters:v14];

    [v13 setScale:0.25];
    id v15 = [(CKTranscriptPluginBalloonView *)self tailMask];
    double v16 = [v15 layer];
    [v13 setMask:v16];

    [(CKTranscriptPluginBalloonView *)self bounds];
    objc_msgSend(v13, "setFrame:");
    [(CKBalloonView *)self setBackdropFilterLayer:v13];
    int v17 = [(CKTranscriptPluginBalloonView *)self layer];
    [v17 addSublayer:v13];
  }
  double v18 = [(CKTranscriptPluginBalloonView *)self layer];
  __int16 v19 = [v4 balloonFilters];
  [v18 setFilters:v19];

  uint64_t v20 = [(CKTranscriptPluginBalloonView *)self layer];
  __int16 v21 = [v4 balloonCompositingFilter];
  [v20 setCompositingFilter:v21];

  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v22 addFilter:v4];
}

- (void)clearFilters
{
  id v3 = [(CKTranscriptPluginBalloonView *)self pluginView];
  [v3 setHidden:0];

  [(CKTranscriptPluginBalloonView *)self setSuppressMask:0];
  id v4 = [(CKTranscriptPluginBalloonView *)self layer];
  [v4 setAllowsGroupBlending:1];

  CGFloat v5 = [(CKBalloonView *)self backdropFilterLayer];
  [v5 removeFromSuperlayer];

  [(CKBalloonView *)self setBackdropFilterLayer:0];
  uint64_t v6 = [(CKTranscriptPluginBalloonView *)self layer];
  [v6 setFilters:0];

  id v7 = [(CKTranscriptPluginBalloonView *)self layer];
  [v7 setCompositingFilter:0];

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonView;
  [(CKBalloonView *)&v8 clearFilters];
}

- (void)setSuppressMask:(BOOL)a3
{
  if (self->_suppressMask != a3)
  {
    self->_suppressMask = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    [(CKBalloonView *)self prepareForDisplayIfNeeded];
  }
}

- (void)setSuggestedActionsBackgroundColor:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CKTranscriptPluginBalloonView *)self suggestedActionsBackgroundView];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(CKTranscriptPluginBalloonView *)self setSuggestedActionsBackgroundView:v6];

    id v7 = [(CKTranscriptPluginBalloonView *)self suggestedActionsBackgroundView];
    [(CKTranscriptPluginBalloonView *)self addSubview:v7];
  }
  id v8 = [(CKTranscriptPluginBalloonView *)self suggestedActionsBackgroundView];
  [v8 setBackgroundColor:v4];
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (UIViewController)pluginViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPluginViewController:(id)a3
{
}

- (CKTranscriptPluginView)pluginView
{
  return self->_pluginView;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (UIView)pluginSnapshotViewForThrowAnimation
{
  return self->_pluginSnapshotViewForThrowAnimation;
}

- (BOOL)mayReparentPluginViews
{
  return self->_mayReparentPluginViews;
}

- (void)setMayReparentPluginViews:(BOOL)a3
{
  self->_mayReparentPluginViews = a3;
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (CKBalloonShapeView)tailMask
{
  return self->_tailMask;
}

- (void)setTailMask:(id)a3
{
}

- (CKBalloonShapeView)outlineMask
{
  return self->_outlineMask;
}

- (void)setOutlineMask:(id)a3
{
}

- (CKBalloonImageView)pluginInsetMask
{
  return self->_pluginInsetMask;
}

- (void)setPluginInsetMask:(id)a3
{
}

- (UIView)pluginSnapshotView
{
  return self->_pluginSnapshotView;
}

- (BOOL)isSyndicationOnboarding
{
  return self->_isSyndicationOnboarding;
}

- (BOOL)suppressMask
{
  return self->_suppressMask;
}

- (UIView)suggestedActionsBackgroundView
{
  return self->_suggestedActionsBackgroundView;
}

- (void)setSuggestedActionsBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActionsBackgroundView, 0);
  objc_storeStrong((id *)&self->_pluginSnapshotView, 0);
  objc_storeStrong((id *)&self->_pluginInsetMask, 0);
  objc_storeStrong((id *)&self->_outlineMask, 0);
  objc_storeStrong((id *)&self->_tailMask, 0);
  objc_storeStrong((id *)&self->_pluginSnapshotViewForThrowAnimation, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_pluginView, 0);

  objc_destroyWeak((id *)&self->_pluginViewController);
}

- (void)configureForTranscriptPlugin:(id)a3 context:(id)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKTranscriptPluginBalloonView;
  id v7 = a4;
  [(CKBalloonView *)&v26 configureForMessagePart:v6];
  -[CKBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v6, "balloonOrientation", v26.receiver, v26.super_class));
  id v8 = [v6 extensibleViewControllerForContext:v7];
  [(CKTranscriptPluginBalloonView *)self setPluginViewController:v8];

  double v9 = [v6 extensibleViewForContext:v7];
  [(CKTranscriptPluginBalloonView *)self setPluginView:v9];

  double v10 = [v6 bundleIdentifier];
  [(CKTranscriptPluginBalloonView *)self setAccessibilityIdentifier:v10];

  double v11 = [v6 IMChatItem];
  double v12 = [v11 dataSource];
  [(CKTranscriptPluginBalloonView *)self setDataSource:v12];

  id v13 = [v6 balloonControllerForContext:v7];

  if (objc_opt_respondsToSelector()) {
    uint64_t v14 = [v13 isInteractive];
  }
  else {
    uint64_t v14 = 0;
  }
  [(CKTranscriptPluginBalloonView *)self setIsInteractive:v14];
  id v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 isScheduledMessagesCoreEnabled];

  if (v16) {
    -[CKTranscriptPluginBalloonView setScheduled:](self, "setScheduled:", [v6 wantsPendingMessageStyle]);
  }
  int v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isDashedBalloonsEnabled];

  char v19 = [v6 wantsPendingMessageStyle];
  if (v18) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 1;
  }
  if ((v19 & 1) == 0) {
    uint64_t v20 = objc_msgSend(v6, "balloonStyle", v20);
  }
  [(CKBalloonView *)self setBalloonStyle:v20];
  __int16 v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v22 = [v21 isScheduledMessagesCoreEnabled];

  if (v22 && [v6 wantsPendingMessageStyle] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v23 = [v13 balloonOutlineColor];
    CGRect v24 = [v23 colorWithAlphaComponent:0.5];

    [v24 ckColor];
    -[CKBalloonView setStrokeColor:](self, "setStrokeColor:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v13 wantsOutline]) {
    [(CKBalloonView *)self setBalloonStyle:1];
  }
  if ([(CKBalloonView *)self hasSuggestedActionsMenu]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v25 = [v13 balloonOutlineColor];
    [(CKTranscriptPluginBalloonView *)self setSuggestedActionsBackgroundColor:v25];
  }
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
}

void __47__CKTranscriptPluginBalloonView_initWithFrame___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Requested imageGenerator lost reference to self, returning back a normal punchout.", v1, 2u);
}

@end