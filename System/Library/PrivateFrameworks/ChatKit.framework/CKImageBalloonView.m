@interface CKImageBalloonView
- (BOOL)isIrisAsset;
- (BOOL)isMonoskiAsset;
- (BOOL)isScheduled;
- (BOOL)suppressMask;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CAGradientLayer)gradientLayer;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAnimatedImage)animatedImage;
- (CKBalloonImageView)imageInsetMask;
- (CKBalloonImageView)tailMask;
- (CKBalloonShapeView)outlineMask;
- (CKImageBalloonView)initWithFrame:(CGRect)a3;
- (Class)invisibleInkEffectViewClass;
- (NSArray)frames;
- (NSString)description;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)imageInsets;
- (UIEdgeInsets)safeAreaInsets;
- (UIImageView)imageContentView;
- (UIImageView)irisBadgeView;
- (UIView)gradientView;
- (UIView)monoskiBadgeView;
- (id)_addPauseButtonToImage:(id)a3;
- (id)image;
- (id)overlayColor;
- (unint64_t)animationFrameOffset;
- (void)_animatedImagesStateChanged:(id)a3;
- (void)addFilter:(id)a3;
- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3;
- (void)animationTimerFired:(double)a3;
- (void)attachInvisibleInkEffectView;
- (void)clearFilters;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)configureForMessagePart:(id)a3;
- (void)configureForTranscriptPlugin:(id)a3;
- (void)dealloc;
- (void)detachInvisibleInkEffectView;
- (void)didMoveToWindow;
- (void)invisibleInkEffectViewWasResumed;
- (void)invisibleInkEffectViewWasUncovered;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setAnimatedImage:(id)a3;
- (void)setAnimationFrameOffset:(unint64_t)a3;
- (void)setCanUseOpaqueMask:(BOOL)a3;
- (void)setFrames:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setHasTail:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageContentView:(id)a3;
- (void)setImageInsetMask:(id)a3;
- (void)setIrisBadgeView:(id)a3;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setIsMonoskiAsset:(BOOL)a3;
- (void)setMonoskiBadgeView:(id)a3;
- (void)setOutlineMask:(id)a3;
- (void)setScheduled:(BOOL)a3;
- (void)setSuppressMask:(BOOL)a3;
- (void)setTailMask:(id)a3;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)updateAnimationTimerObserving;
@end

@implementation CKImageBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v37 configureForMediaObject:v10 previewWidth:v7 orientation:a4];
  if (CKIsRunningInMacCatalyst())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = +[CKUIBehavior sharedBehaviors];
      [v11 mapPreviewMaxWidth];
      a4 = v12;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    if ([v13 isSticker])
    {
      v14 = [v13 sticker];
      v15 = [v14 externalURI];
      uint64_t v16 = [v15 hasPrefix:@"sticker:///emoji/"];

      v17 = [v14 representations];
      v18 = [v17 firstObject];

      if (v18)
      {
        [v18 size];
        double v20 = v19;
        v21 = [(CKImageBalloonView *)self traitCollection];
        [v21 displayScale];
        double v23 = v20 / v22;

        [v18 size];
        double v25 = v24;
        v26 = [(CKImageBalloonView *)self traitCollection];
        [v26 displayScale];
        double v28 = v25 / v27;
      }
      else
      {
        double v23 = *MEMORY[0x1E4F1DB30];
        double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      v29 = +[CKUIBehavior sharedBehaviors];
      v30 = [(CKImageBalloonView *)self traitCollection];
      [v30 displayScale];
      objc_msgSend(v29, "stickerInlinePreviewMaxWidthForImageSize:isEmoji:displayScale:", v16, v23, v28, v31);
      a4 = v32;
    }
  }
  v33 = [v10 previewForWidth:v7 orientation:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CKImageBalloonView *)self setAnimatedImage:v33];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CKImageBalloonView *)self setImage:v33];
      [(CKBalloonView *)self configureForEffectViewWithMediaObject:v10];
    }
  }
  if (v6)
  {
    v34 = [v10 invisibleInkEffectImageWithPreview:v33];
    [(CKBalloonImageView *)self setInvisibleInkEffectImage:v34];
  }
  if ([v10 isMonoskiAsset])
  {
    [(CKImageBalloonView *)self setIsMonoskiAsset:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [v10 isIrisAsset];
      v36 = self;
    }
    else
    {
      v36 = self;
      uint64_t v35 = 0;
    }
    [(CKImageBalloonView *)v36 setIsIrisAsset:v35];
  }
}

- (void)configureForComposition:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v22 configureForComposition:v4];
  v5 = [v4 shelfPluginPayload];
  BOOL v6 = [v5 pluginBundleID];

  if ([v6 isEqualToString:*MEMORY[0x1E4F6CBF8]])
  {
    uint64_t v7 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v8 = [v7 existingPhotoBrowserViewController];
LABEL_5:
    v11 = (void *)v8;

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v14 = 0;
      goto LABEL_12;
    }
    double v12 = [v11 fetchPluginPayloadsAndClear:0];
    id v13 = [v12 lastObject];
    v14 = [v13 mediaObjectFromPayload];

    goto LABEL_11;
  }
  v9 = IMBalloonExtensionIDWithSuffix();
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    uint64_t v7 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v8 = [v7 viewControllerForPluginIdentifier:v6];
    goto LABEL_5;
  }
  v11 = [v4 shelfPluginPayload];
  if ([v11 shouldSendAsMediaObject])
  {
    v14 = [v11 mediaObjectFromPayload];
    goto LABEL_12;
  }
  double v12 = [v4 mediaObjects];
  v14 = [v12 lastObject];
LABEL_11:

LABEL_12:
  if (v14)
  {
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 previewMaxWidth];
    -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](self, "configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:", v14, 1, 1);
  }
  uint64_t v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isScheduledMessagesCoreEnabled];

  if (v17)
  {
    v18 = [v4 sendLaterPluginInfo];

    if (v18)
    {
      [(CKImageBalloonView *)self setScheduled:1];
      double v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v20 = [v19 isDashedBalloonsEnabled];

      if (v20) {
        uint64_t v21 = 3;
      }
      else {
        uint64_t v21 = 1;
      }
      [(CKBalloonView *)self setBalloonStyle:v21];
    }
  }
}

- (void)dealloc
{
  v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 removeAnimationTimerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = [(CKImageBalloonView *)self animatedImage];
  v8.receiver = self;
  v8.super_class = (Class)CKImageBalloonView;
  v5 = [(CKBalloonView *)&v8 description];
  BOOL v6 = [v3 stringWithFormat:@"[CKImageBalloonView animatedImage:%@ %@]", v4, v5];

  return (NSString *)v6;
}

- (CKImageBalloonView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKImageBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = [CKBalloonImageView alloc];
    [(CKImageBalloonView *)v3 bounds];
    v5 = -[CKBalloonImageView initWithFrame:](v4, "initWithFrame:");
    [(CKBalloonImageView *)v5 setUserInteractionEnabled:0];
    [(CKImageBalloonView *)v3 setTailMask:v5];
    BOOL v6 = +[CKUIBehavior sharedBehaviors];
    uint64_t v7 = [v6 theme];
    objc_super v8 = [v7 unfilledBalloonColorForColorType:0xFFFFFFFFLL];
    [v8 ckColor];
    -[CKBalloonView setStrokeColor:](v3, "setStrokeColor:");

    v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v7) = [v9 isScheduledMessagesCoreEnabled];

    if (v7)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F42AA0]);
      [(CKImageBalloonView *)v3 bounds];
      v11 = objc_msgSend(v10, "initWithFrame:");
      [v11 setContentMode:2];
      [(CKImageBalloonView *)v3 setImageContentView:v11];
      double v12 = [CKBalloonImageView alloc];
      [(CKImageBalloonView *)v3 bounds];
      id v13 = -[CKBalloonImageView initWithFrame:](v12, "initWithFrame:");
      [(CKImageBalloonView *)v3 setImageInsetMask:v13];
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v3 selector:sel__animatedImagesStateChanged_ name:*MEMORY[0x1E4FB9280] object:0];
  }
  return v3;
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CKImageAnimationTimer accessibilityAnimatedImagesDisabled];
  BOOL v6 = [(CKObscurableBalloonView *)self isObscured];
  if (!self->_animatedImage || v6 || !v5) {
    goto LABEL_10;
  }
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  objc_super v8 = [v7 playButtonImage];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  [(CKImageBalloonView *)self bounds];
  -[CKImageBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (CKMainScreenScale_once_20 != -1) {
    dispatch_once(&CKMainScreenScale_once_20, &__block_literal_global_296);
  }
  double v21 = *(double *)&CKMainScreenScale_sMainScreenScale_20;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_20 == 0.0) {
    double v21 = 1.0;
  }
  double v22 = v10 * v21;
  double v23 = v12 * v21;
  double v24 = v14 * v21 + floor((v18 * v21 - v10 * v21) * 0.5);
  double v25 = v16 * v21 + floor((v20 * v21 - v12 * v21) * 0.5);
  double v26 = 1.0 / v21;
  CGFloat v27 = v26 * v24;
  CGFloat v28 = v26 * v25;
  CGFloat v29 = v22 * v26;
  CGFloat v30 = v23 * v26;
  BOOL v31 = [(CKImageBalloonView *)self userExplicitlyUnpausedAnimation];
  [v4 locationInView:self];
  v37.x = v32;
  v37.y = v33;
  v38.origin.x = v27;
  v38.origin.y = v28;
  v38.size.width = v29;
  v38.size.height = v30;
  BOOL v34 = CGRectContainsPoint(v38, v37);
  if (v31 || v34)
  {
    [(CKImageBalloonView *)self setUserExplicitlyUnpausedAnimation:[(CKImageBalloonView *)self userExplicitlyUnpausedAnimation] ^ 1];
    if (v31)
    {
      uint64_t v35 = [(CKImageBalloonView *)self image];
      [(CKImageBalloonView *)self setImage:v35];
    }
  }
  else
  {
LABEL_10:
    v36.receiver = self;
    v36.super_class = (Class)CKImageBalloonView;
    [(CKObscurableBalloonView *)&v36 tapGestureRecognized:v4];
  }
}

- (void)_animatedImagesStateChanged:(id)a3
{
  id v4 = [(CKImageBalloonView *)self image];
  [(CKImageBalloonView *)self setImage:v4];
}

- (id)_addPauseButtonToImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKImageBalloonView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  objc_super v8 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v8, "thumbnailContentAlignmentInsetsForOrientation:", -[CKBalloonView orientation](self, "orientation"));
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = +[CKMovieMediaObject playButtonPreviewForUIImage:scale:contentAlignmentInsets:](CKMovieMediaObject, "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v4, v7, v10, v12, v14, v16);

  return v17;
}

- (UIEdgeInsets)safeAreaInsets
{
  v20.receiver = self;
  v20.super_class = (Class)CKImageBalloonView;
  [(CKImageBalloonView *)&v20 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 balloonMaskTailSizeForTailShape:1];
  double v13 = v12;

  int v14 = [(CKBalloonView *)self orientation];
  if (v14) {
    double v15 = v13;
  }
  else {
    double v15 = v10;
  }
  double v16 = -0.0;
  if (!v14) {
    double v16 = v13;
  }
  double v17 = v6 + v16;
  double v18 = v4;
  double v19 = v8;
  result.right = v15;
  result.bottom = v19;
  result.left = v17;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)imageInsets
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  double v5 = 0.0;
  if (v4)
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    if ([(CKImageBalloonView *)self isScheduled])
    {
      double v9 = +[CKUIBehavior sharedBehaviors];
      [v9 imageSendLaterInsets];
      double v6 = v10;
      double v5 = v11;
      double v7 = v12;
      double v8 = v13;
    }
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  double v14 = v6;
  double v15 = v5;
  double v16 = v7;
  double v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)layoutSubviews
{
  v92.receiver = self;
  v92.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v92 layoutSubviews];
  [(CKImageBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKBalloonView *)self backdropFilterLayer];

  if (v11)
  {
    double v12 = [(CKImageBalloonView *)self layer];
    [v12 setContents:0];
  }
  double v13 = [(CKImageBalloonView *)self tailMask];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  double v14 = [(CKImageBalloonView *)self outlineMask];
  objc_msgSend(v14, "setFrame:", v4, v6, v8, v10);

  double v15 = [(CKImageBalloonView *)self outlineMask];
  [(CKImageBalloonView *)self bringSubviewToFront:v15];

  double v16 = [(CKImageBalloonView *)self irisBadgeView];

  if (v16)
  {
    double v17 = +[CKUIBehavior sharedBehaviors];
    [v17 verticalBalloonBadgeInset];
    double v19 = v18;

    objc_super v20 = +[CKUIBehavior sharedBehaviors];
    [v20 horizontalBalloonBadgeInset];
    double v22 = v21;

    double v23 = [(CKImageBalloonView *)self irisBadgeView];
    [v23 sizeToFit];

    double v24 = [(CKImageBalloonView *)self irisBadgeView];
    [v24 frame];
    double v26 = v25;
    double v28 = v27;

    if (![(CKBalloonView *)self orientation])
    {
      CGFloat v29 = +[CKUIBehavior sharedBehaviors];
      [v29 balloonMaskTailSizeForTailShape:1];
      double v22 = v22 + v30;
    }
    BOOL v31 = [(CKImageBalloonView *)self irisBadgeView];
    objc_msgSend(v31, "setFrame:", v22, v19, v26, v28);

    CGFloat v32 = [(CKImageBalloonView *)self irisBadgeView];
    [(CKImageBalloonView *)self bringSubviewToFront:v32];
  }
  CGFloat v33 = [(CKImageBalloonView *)self monoskiBadgeView];

  if (v33)
  {
    [(CKImageBalloonView *)self safeAreaInsets];
    double v91 = v34;
    [(CKImageBalloonView *)self safeAreaInsets];
    double v36 = v35;
    [(CKImageBalloonView *)self bounds];
    double v38 = v37;
    [(CKImageBalloonView *)self safeAreaInsets];
    double v40 = v39;
    [(CKImageBalloonView *)self safeAreaInsets];
    double v42 = v38 - (v40 + v41);
    [(CKImageBalloonView *)self bounds];
    double v44 = v43;
    [(CKImageBalloonView *)self safeAreaInsets];
    double v45 = v6;
    double v46 = v4;
    double v47 = v8;
    double v48 = v10;
    double v50 = v49;
    [(CKImageBalloonView *)self safeAreaInsets];
    double v52 = v44 - (v50 + v51);
    v53 = [(CKImageBalloonView *)self monoskiBadgeView];
    double v54 = v52;
    double v10 = v48;
    double v8 = v47;
    double v4 = v46;
    double v6 = v45;
    objc_msgSend(v53, "setFrame:", v91, v36, v42, v54);

    if (![(CKObscurableBalloonView *)self isObscured])
    {
      v55 = [(CKImageBalloonView *)self monoskiBadgeView];
      [(CKImageBalloonView *)self bringSubviewToFront:v55];
    }
  }
  v56 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v57 = [v56 isScheduledMessagesCoreEnabled];

  if (v57)
  {
    imageContentView = self->_imageContentView;
    [(CKImageBalloonView *)self imageInsets];
    -[UIImageView setFrame:](imageContentView, "setFrame:", v4 + v62, v6 + v59, v8 - (v62 + v60), v10 - (v59 + v61));
    imageInsetMask = self->_imageInsetMask;
    [(UIImageView *)self->_imageContentView frame];
    double v65 = v64;
    [(UIImageView *)self->_imageContentView frame];
    -[CKBalloonImageView setFrame:](imageInsetMask, "setFrame:", 0.0, 0.0, v65);
    v66 = self->_imageContentView;
    if ([(CKImageBalloonView *)self isScheduled])
    {
      v67 = +[CKUIBehavior sharedBehaviors];
      [v67 scheduledImageBalloonAlpha];
      -[UIImageView setAlpha:](v66, "setAlpha:");
    }
    else
    {
      [(UIImageView *)v66 setAlpha:1.0];
    }
    [(UIImageView *)self->_imageContentView setHidden:[(CKBalloonImageView *)self imageHidden]];
    v68 = [(CKBalloonView *)self invisibleInkEffectController];
    v69 = [v68 effectView];
    [(UIImageView *)self->_imageContentView frame];
    objc_msgSend(v69, "setFrame:");
  }
  v70 = [(CKImageBalloonView *)self gradientView];

  if (v70)
  {
    [(CKImageBalloonView *)self bounds];
    double v72 = v71;
    [(CKImageBalloonView *)self bounds];
    double v74 = v73;
    [(CKImageBalloonView *)self bounds];
    double v76 = v75;
    [(CKImageBalloonView *)self bounds];
    double v78 = v77 * 0.5;
    v79 = [(CKImageBalloonView *)self gradientLayer];
    objc_msgSend(v79, "setFrame:", v72, v74, v76, v78);

    [(CKImageBalloonView *)self bounds];
    double v81 = v80;
    [(CKImageBalloonView *)self bounds];
    double v83 = v82;
    [(CKImageBalloonView *)self bounds];
    double v85 = v83 + v84 * 0.5;
    [(CKImageBalloonView *)self bounds];
    double v87 = v86;
    [(CKImageBalloonView *)self bounds];
    double v89 = v88 * 0.5;
    v90 = [(CKImageBalloonView *)self gradientView];
    objc_msgSend(v90, "setFrame:", v81, v85, v87, v89);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CKImageBalloonView;
  [(CKImageBalloonView *)&v3 didMoveToWindow];
  [(CKImageBalloonView *)self updateAnimationTimerObserving];
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = [(CKImageBalloonView *)self animatedImage];
  double v8 = v7;
  if (v7
    || ([MEMORY[0x1E4F6E778] sharedFeatureFlags],
        double v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isScheduledMessagesCoreEnabled],
        v9,
        double v7 = self,
        !v10))
  {
    double v11 = [v7 image];
    [v11 size];
    double v14 = v17;
    double v16 = v18;
  }
  else
  {
    double v11 = [(CKImageBalloonView *)self imageContentView];
    double v12 = [v11 image];
    [v12 size];
    double v14 = v13;
    double v16 = v15;
  }
  if (width < v14 || height < v16)
  {
    double v20 = width / v14;
    double v21 = 0.0;
    if (v14 == 0.0) {
      double v20 = 0.0;
    }
    if (v16 != 0.0) {
      double v21 = height / v16;
    }
    double v22 = fmin(v20, v21);
    double v14 = ceil(v14 * v22);
    double v16 = ceil(v16 * v22);
  }

  double v23 = v14;
  double v24 = v16;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)prepareForDisplay
{
  v39.receiver = self;
  v39.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v39 prepareForDisplay];
  objc_super v3 = [(CKImageBalloonView *)self tailMask];
  [v3 removeFromSuperview];

  double v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isScheduledMessagesCoreEnabled];

  if (v5)
  {
    double v6 = [(CKImageBalloonView *)self imageContentView];
    [v6 removeFromSuperview];
  }
  double v7 = [(CKImageBalloonView *)self layer];
  [v7 setMask:0];

  double v8 = [(CKImageBalloonView *)self outlineMask];
  [v8 removeFromSuperview];

  double v9 = [(CKImageBalloonView *)self gradientView];
  [v9 removeFromSuperview];

  int v10 = [(CKImageBalloonView *)self tailMask];
  if ([(CKBalloonView *)self canUseOpaqueMask])
  {
    [(CKBalloonView *)self balloonDescriptor];
    double v11 = CKResizableBalloonPunchout(v38);
    [v10 setImage:v11];

    double v12 = [(CKBalloonView *)self invisibleInkEffectController];
    double v13 = [v12 effectView];

    if (![(CKImageBalloonView *)self suppressMask])
    {
      if (v13) {
        [(CKImageBalloonView *)self insertSubview:v10 aboveSubview:v13];
      }
      else {
        [(CKImageBalloonView *)self insertSubview:v10 atIndex:0];
      }
    }
    goto LABEL_18;
  }
  double v13 = [(CKImageBalloonView *)self tailMask];
  if ([(CKImageBalloonView *)self suppressMask])
  {
    double v14 = [(CKImageBalloonView *)self layer];
    [v14 setMask:0];
LABEL_17:

    goto LABEL_18;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  [(CKBalloonView *)self balloonDescriptor];
  if ([(CKBalloonView *)self balloonStyle])
  {
    double v15 = [(CKImageBalloonView *)self outlineMask];
    BYTE8(v37) = 0;
    LOBYTE(v34) = -1;
    if (!v15)
    {
      double v16 = [CKBalloonShapeView alloc];
      long long v30 = v35;
      long long v31 = v36;
      long long v32 = v37;
      long long v28 = v33;
      long long v29 = v34;
      double v15 = [(CKBalloonShapeView *)v16 initWithDescriptor:&v28 imageGenerator:&__block_literal_global_49];
      [(CKBalloonShapeView *)v15 setUserInteractionEnabled:0];
      [(CKImageBalloonView *)self setOutlineMask:v15];
    }
    v27[2] = v35;
    v27[3] = v36;
    v27[4] = v37;
    v27[0] = v33;
    v27[1] = v34;
    [(CKBalloonShapeView *)v15 setDescriptor:v27];
    [(CKImageBalloonView *)self bounds];
    -[CKBalloonShapeView setFrame:](v15, "setFrame:");
    if (![(CKImageBalloonView *)self suppressMask]) {
      [(CKImageBalloonView *)self insertSubview:v15 atIndex:0];
    }
    BYTE2(v33) = 0;
  }
  if (![(CKImageBalloonView *)self isScheduled])
  {
    long long v30 = v35;
    long long v31 = v36;
    long long v32 = v37;
    long long v28 = v33;
    long long v29 = v34;
    double v17 = CKResizableBalloonMask(&v28);
    [v13 setImage:v17];

    double v14 = [(CKImageBalloonView *)self layer];
    double v18 = [v13 layer];
    [v14 setMask:v18];

    goto LABEL_17;
  }
LABEL_18:

  double v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v20 = [v19 isScheduledMessagesCoreEnabled];

  if (v20)
  {
    if ([(CKImageBalloonView *)self isScheduled])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
      [(CKBalloonView *)self balloonDescriptor];
      BYTE9(v37) = 0;
      BYTE2(v33) = 0;
      imageInsetMask = self->_imageInsetMask;
      long long v30 = v35;
      long long v31 = v36;
      long long v32 = v37;
      long long v28 = v33;
      long long v29 = v34;
      double v22 = CKResizableBalloonMask(&v28);
      [(CKBalloonImageView *)imageInsetMask setImage:v22];

      double v23 = [(CKImageBalloonView *)self imageContentView];
      [v23 setMaskView:self->_imageInsetMask];

      double v24 = [(CKBalloonView *)self invisibleInkEffectController];
      double v25 = [v24 effectView];
      [v25 setMaskView:self->_imageInsetMask];
    }
    double v26 = [(CKImageBalloonView *)self imageContentView];
    [(CKImageBalloonView *)self insertSubview:v26 atIndex:0];
  }
}

id __39__CKImageBalloonView_prepareForDisplay__block_invoke(uint64_t a1, _OWORD *a2)
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

- (id)overlayColor
{
  long long v2 = +[CKUIBehavior sharedBehaviors];
  long long v3 = [v2 imageBalloonSelectionOverlayColor];

  return v3;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CKImageBalloonView;
  [(CKObscurableBalloonView *)&v5 prepareForReuse];
  [(CKImageBalloonView *)self setImage:0];
  [(CKImageBalloonView *)self setAnimatedImage:0];
  [(CKImageBalloonView *)self setIsIrisAsset:0];
  [(CKImageBalloonView *)self setIsMonoskiAsset:0];
  [(CKImageBalloonView *)self setSuppressMask:0];
  [(CKImageBalloonView *)self setScheduled:0];
  long long v3 = [(CKImageBalloonView *)self imageContentView];
  [v3 setMaskView:0];

  double v4 = [(CKImageBalloonView *)self imageContentView];
  [v4 setAlpha:1.0];

  [(CKImageBalloonView *)self setGradientView:0];
}

- (void)setHasTail:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKBalloonView *)self hasTail] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKImageBalloonView;
    [(CKBalloonView *)&v5 setHasTail:v3];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  if ([(CKBalloonView *)self canUseOpaqueMask] != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)CKImageBalloonView;
    [(CKBalloonView *)&v4 setCanUseOpaqueMask:0];
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setAnimatedImage:(id)a3
{
  objc_super v5 = (CKAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    double v6 = [(CKAnimatedImage *)self->_animatedImage frames];
    if ([v6 count] == 1)
    {

      double v6 = 0;
    }
    [(CKImageBalloonView *)self setFrames:v6];
    if ([v6 count]) {
      [v6 objectAtIndex:0];
    }
    else {
    double v7 = [(CKAnimatedImage *)v8 image];
    }
    [(CKImageBalloonView *)self setImage:v7];

    [(CKImageBalloonView *)self updateAnimationTimerObserving];
    objc_super v5 = v8;
  }
}

- (id)image
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  if (v4)
  {
    objc_super v5 = [(CKImageBalloonView *)self imageContentView];
    double v6 = [v5 image];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKImageBalloonView;
    double v6 = [(CKBalloonImageView *)&v8 image];
  }

  return v6;
}

- (void)setImage:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_animatedImage
    && +[CKImageAnimationTimer accessibilityAnimatedImagesDisabled]&& ![(CKImageBalloonView *)self userExplicitlyUnpausedAnimation])
  {
    uint64_t v5 = [(CKImageBalloonView *)self _addPauseButtonToImage:v4];

    id v4 = (id)v5;
  }
  double v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isScheduledMessagesCoreEnabled];

  if (v7)
  {
    objc_super v8 = [(CKImageBalloonView *)self imageContentView];
    [v8 setImage:v4];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CKImageBalloonView;
    [(CKBalloonImageView *)&v19 setImage:v4];
  }
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    gradientView = self->_gradientView;
    self->_gradientView = v9;

    double v11 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = v11;

    double v13 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.2];
    double v14 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0];
    id v15 = v13;
    v20[0] = [v15 CGColor];
    id v16 = v14;
    v20[1] = [v16 CGColor];
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [(CAGradientLayer *)self->_gradientLayer setColors:v17];

    -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", 0.0, 1.0);
    -[CAGradientLayer setEndPoint:](self->_gradientLayer, "setEndPoint:", 0.0, 0.0);
    double v18 = [(UIView *)self->_gradientView layer];
    [v18 insertSublayer:self->_gradientLayer atIndex:0];

    [(CKImageBalloonView *)self addSubview:self->_gradientView];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  if (v4)
  {
    uint64_t v5 = [(CKImageBalloonView *)self imageContentView];
    double v6 = [v5 image];

    if (v6)
    {
      [v6 alignmentRectInsets];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      uint64_t v15 = [v6 imageOrientation];
      if (v15)
      {
        uint64_t v16 = v15;
        if (v15 == 4)
        {
          double v17 = v14;
          double v14 = v10;
LABEL_10:

          goto LABEL_11;
        }
        double v22 = [MEMORY[0x1E4F28B00] currentHandler];
        double v23 = objc_msgSend(NSString, "stringWithUTF8String:", "UIEdgeInsets CKEdgeInsetsWithImageOrientation(UIEdgeInsets, UIImageOrientation)");
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"CKGeometry.h", 429, @"CKEdgeInsetsWithImageOrientation %ld hasn't been implemented", v16);
      }
      double v17 = v10;
      goto LABEL_10;
    }
    double v8 = *MEMORY[0x1E4F437F8];
    double v17 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    goto LABEL_10;
  }
  v28.receiver = self;
  v28.super_class = (Class)CKImageBalloonView;
  [(CKBalloonImageView *)&v28 alignmentRectInsets];
  double v8 = v18;
  double v17 = v19;
  double v12 = v20;
  double v14 = v21;
LABEL_11:
  double v24 = v8;
  double v25 = v17;
  double v26 = v12;
  double v27 = v14;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 showsBalloonBadges];

  if (v6 && self->_isIrisAsset != v3)
  {
    self->_isIrisAsset = v3;
    if (v3 && !self->_isMonoskiAsset)
    {
      double v9 = [(CKImageBalloonView *)self irisBadgeView];

      if (!v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F42AA0]);
        double v11 = +[CKUIBehavior sharedBehaviors];
        double v12 = [v11 livePhotoBadgeImage];
        id v19 = (id)[v10 initWithImage:v12];

        double v13 = [v19 layer];
        LODWORD(v14) = 0.5;
        [v13 setShadowOpacity:v14];

        uint64_t v15 = [v19 layer];
        objc_msgSend(v15, "setShadowOffset:", 0.0, 0.0);

        uint64_t v16 = [v19 layer];
        [v16 setShadowRadius:1.0];

        double v17 = [(CKBalloonView *)self invisibleInkEffectController];
        double v18 = [v17 effectView];

        if (v18) {
          [(CKImageBalloonView *)self insertSubview:v19 belowSubview:v18];
        }
        else {
          [(CKImageBalloonView *)self addSubview:v19];
        }
        [(CKImageBalloonView *)self setIrisBadgeView:v19];
      }
    }
    else
    {
      double v7 = [(CKImageBalloonView *)self irisBadgeView];

      if (v7)
      {
        double v8 = [(CKImageBalloonView *)self irisBadgeView];
        [v8 removeFromSuperview];

        [(CKImageBalloonView *)self setIrisBadgeView:0];
      }
    }
  }
}

- (void)setIsMonoskiAsset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 showsBalloonBadges];

  if (v6 && self->_isMonoskiAsset != v3)
  {
    self->_isMonoskiAsset = v3;
    double v7 = [(CKImageBalloonView *)self monoskiBadgeView];
    double v8 = v7;
    if (v3)
    {

      if (!v8)
      {
        id v12 = +[CKMonoskiBadgeViewFactory badgeViewWithSupportsGradient:[(CKImageBalloonView *)self isScheduled] ^ 1];
        double v9 = [(CKBalloonView *)self invisibleInkEffectController];
        id v10 = [v9 effectView];

        if (v10) {
          [(CKImageBalloonView *)self insertSubview:v12 belowSubview:v10];
        }
        else {
          [(CKImageBalloonView *)self addSubview:v12];
        }
        [(CKImageBalloonView *)self setMonoskiBadgeView:v12];
        [(CKImageBalloonView *)self setIsIrisAsset:0];
      }
    }
    else
    {

      if (v8)
      {
        double v11 = [(CKImageBalloonView *)self monoskiBadgeView];
        [v11 removeFromSuperview];

        [(CKImageBalloonView *)self setMonoskiBadgeView:0];
      }
    }
  }
}

- (void)animationTimerFired:(double)a3
{
  if (![(CKBalloonView *)self animationPaused])
  {
    id v5 = [(CKAnimatedImage *)self->_animatedImage frameForAnimationTime:a3];
    [(CKImageBalloonView *)self setImage:v5];
  }
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)attachInvisibleInkEffectView
{
  BOOL v3 = [(CKBalloonView *)self invisibleInkEffectController];
  uint64_t v19 = [v3 effectView];

  int v4 = [(CKImageBalloonView *)self tailMask];
  id v5 = [v4 superview];

  if (v5)
  {
    uint64_t v6 = [(CKImageBalloonView *)self tailMask];
LABEL_3:
    double v7 = (void *)v6;
    [(CKImageBalloonView *)self insertSubview:v19 belowSubview:v6];

    goto LABEL_7;
  }
  double v8 = [(CKBalloonView *)self stickerEffectView];

  double v9 = self;
  if (v8)
  {
    uint64_t v10 = v19;
    uint64_t v11 = 1;
  }
  else
  {
    double v17 = [(CKImageBalloonView *)self outlineMask];
    double v18 = [v17 superview];

    double v9 = self;
    if (v18)
    {
      uint64_t v6 = [(CKImageBalloonView *)self outlineMask];
      goto LABEL_3;
    }
    uint64_t v10 = v19;
    uint64_t v11 = 0;
  }
  [(CKImageBalloonView *)v9 insertSubview:v10 atIndex:v11];
LABEL_7:
  id v12 = [(CKImageBalloonView *)self irisBadgeView];

  if (v12)
  {
    double v13 = [(CKImageBalloonView *)self irisBadgeView];
    [(CKImageBalloonView *)self insertSubview:v13 belowSubview:v19];
  }
  double v14 = [(CKImageBalloonView *)self monoskiBadgeView];

  uint64_t v15 = (void *)v19;
  if (v14)
  {
    uint64_t v16 = [(CKImageBalloonView *)self monoskiBadgeView];
    [(CKImageBalloonView *)self insertSubview:v16 belowSubview:v19];

    uint64_t v15 = (void *)v19;
  }
}

- (void)detachInvisibleInkEffectView
{
  BOOL v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v8 = [v3 effectView];

  [v8 removeFromSuperview];
  int v4 = [(CKImageBalloonView *)self irisBadgeView];

  if (v4)
  {
    id v5 = [(CKImageBalloonView *)self irisBadgeView];
    [(CKImageBalloonView *)self addSubview:v5];
  }
  uint64_t v6 = [(CKImageBalloonView *)self monoskiBadgeView];

  if (v6)
  {
    double v7 = [(CKImageBalloonView *)self monoskiBadgeView];
    [(CKImageBalloonView *)self addSubview:v7];
  }
}

- (void)invisibleInkEffectViewWasUncovered
{
  BOOL v3 = [(CKImageBalloonView *)self animatedImage];
  int v4 = [v3 image];
  [v4 duration];
  double v6 = v5;

  double v7 = 5.0;
  if (v6 > 0.0) {
    double v7 = v6 * ceil(5.0 / v6);
  }
  id v8 = [(CKBalloonView *)self invisibleInkEffectController];
  [v8 suspendForTimeInterval:v7];
}

- (void)invisibleInkEffectViewWasResumed
{
  [(CKImageBalloonView *)self setAnimationFrameOffset:0];
  BOOL v3 = [(CKImageBalloonView *)self frames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = [(CKImageBalloonView *)self frames];
    double v6 = [v5 firstObject];
    [(CKImageBalloonView *)self setImage:v6];
  }

  [(CKImageBalloonView *)self updateAnimationTimerObserving];
}

- (void)updateAnimationTimerObserving
{
  BOOL v3 = [(CKImageBalloonView *)self frames];
  if ((unint64_t)[v3 count] < 2
    || ([(CKImageBalloonView *)self window], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  double v5 = (void *)v4;
  if ([(CKBalloonView *)self invisibleInkEffectEnabled])
  {
    double v6 = [(CKBalloonView *)self invisibleInkEffectController];
    int v7 = [v6 isSuspended];

    if (v7) {
      goto LABEL_9;
    }
LABEL_7:
    id v8 = +[CKImageAnimationTimer sharedTimer];
    [v8 removeAnimationTimerObserver:self];
    goto LABEL_10;
  }

LABEL_9:
  id v8 = +[CKImageAnimationTimer sharedTimer];
  [v8 addAnimationTimerObserver:self];
LABEL_10:
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  double v5 = [v4 balloonBackdropFilters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      int v7 = OSLogHandleForIMFoundationCategory();
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
      uint64_t v10 = [(CKBalloonView *)self backdropFilterLayer];
      [v10 removeFromSuperlayer];

      [(CKBalloonView *)self setBackdropFilterLayer:0];
    }
    [(CKImageBalloonView *)self setSuppressMask:1];
    uint64_t v11 = [(CKImageBalloonView *)self layer];
    [v11 setAllowsGroupBlending:0];

    id v12 = [(CKImageBalloonView *)self tailMask];
    double v13 = [v12 image];

    id v14 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    [(CKImageBalloonView *)self bounds];
    objc_msgSend(v14, "setFrame:");
    [v14 setGroupName:@"FSMBackdropGroup"];
    uint64_t v15 = [v4 balloonBackdropFilters];
    [v14 setFilters:v15];

    [v14 setScale:0.25];
    if (v13)
    {
      [v14 setMaskImage:v13];
      uint64_t v16 = (void *)MEMORY[0x1E4F39BE8];
      [(CKImageBalloonView *)self bounds];
      objc_msgSend(v16, "boundsForMaskImage:withOriginalSize:", v13, v17, v18);
      objc_msgSend(v14, "setFrame:");
      [(CKBalloonView *)self setBackdropFilterLayer:v14];
    }
    uint64_t v19 = [(CKImageBalloonView *)self layer];
    [v19 addSublayer:v14];

    [(CKBalloonView *)self setInvisibleInkEffectEnabled:0];
  }
  double v20 = [(CKImageBalloonView *)self layer];
  double v21 = [v4 balloonFilters];
  [v20 setFilters:v21];

  double v22 = [(CKImageBalloonView *)self layer];
  double v23 = [v4 balloonCompositingFilter];
  [v22 setCompositingFilter:v23];

  v24.receiver = self;
  v24.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v24 addFilter:v4];
}

- (void)clearFilters
{
  BOOL v3 = [(CKImageBalloonView *)self layer];
  [v3 setAllowsGroupBlending:1];

  id v4 = [(CKBalloonView *)self backdropFilterLayer];
  [v4 removeFromSuperlayer];

  [(CKBalloonView *)self setBackdropFilterLayer:0];
  double v5 = [(CKImageBalloonView *)self layer];
  [v5 setFilters:0];

  uint64_t v6 = [(CKImageBalloonView *)self layer];
  [v6 setCompositingFilter:0];

  v7.receiver = self;
  v7.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v7 clearFilters];
  [(CKImageBalloonView *)self setSuppressMask:0];
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

- (CKAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (CKBalloonImageView)tailMask
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

- (BOOL)suppressMask
{
  return self->_suppressMask;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (UIImageView)irisBadgeView
{
  return self->_irisBadgeView;
}

- (void)setIrisBadgeView:(id)a3
{
}

- (UIView)monoskiBadgeView
{
  return self->_monoskiBadgeView;
}

- (void)setMonoskiBadgeView:(id)a3
{
}

- (BOOL)isScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (CKBalloonImageView)imageInsetMask
{
  return self->_imageInsetMask;
}

- (void)setImageInsetMask:(id)a3
{
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (UIImageView)imageContentView
{
  return self->_imageContentView;
}

- (void)setImageContentView:(id)a3
{
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (unint64_t)animationFrameOffset
{
  return self->_animationFrameOffset;
}

- (void)setAnimationFrameOffset:(unint64_t)a3
{
  self->_animationFrameOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_imageContentView, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_imageInsetMask, 0);
  objc_storeStrong((id *)&self->_monoskiBadgeView, 0);
  objc_storeStrong((id *)&self->_irisBadgeView, 0);
  objc_storeStrong((id *)&self->_outlineMask, 0);
  objc_storeStrong((id *)&self->_tailMask, 0);

  objc_storeStrong((id *)&self->_animatedImage, 0);
}

- (void)configureForMessagePart:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v22 configureForMessagePart:v4];
  double v5 = [v4 mediaObject];
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  [v6 previewMaxWidth];
  double v8 = v7;
  uint64_t v9 = [v4 balloonOrientation];
  uint64_t v10 = [v4 message];
  uint64_t v11 = [v10 expressiveSendStyleID];
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](self, "configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:", v5, v9, [v11 isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"], v8);

  id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v6) = [v12 isScheduledMessagesCoreEnabled];

  if (v6)
  {
    double v13 = [v4 messageItem];
    uint64_t v14 = [v13 scheduleType];

    if (v14 == 2)
    {
      uint64_t v15 = [v4 messageItem];
      unint64_t v16 = [v15 scheduleState];

      if (v16 <= 5) {
        uint64_t v17 = (0x36u >> v16) & 1;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    [(CKImageBalloonView *)self setScheduled:v17];
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  double v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v19 = [v18 isDashedBalloonsEnabled];

  if (v19) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 1;
  }
  if ((v17 & 1) == 0) {
    uint64_t v20 = objc_msgSend(v4, "balloonStyle", v20);
  }
  [(CKBalloonView *)self setBalloonStyle:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v21 = [v4 mediaObject];
    [(CKBalloonView *)self configureForEffectViewWithMediaObject:v21];
  }
}

- (void)configureForTranscriptPlugin:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKImageBalloonView;
  [(CKBalloonView *)&v8 configureForMessagePart:v4];
  double v5 = [v4 message];
  uint64_t v6 = [v5 guid];
  double v7 = +[CKSnapshotUtilities snapshotForGUID:v6];
  [(CKImageBalloonView *)self setImage:v7];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 wantsOutline]) {
    [(CKBalloonView *)self setBalloonStyle:1];
  }
}

- (void)addSuggestedActionsMenuWithSuggestedActionsList:(id)a3
{
}

@end