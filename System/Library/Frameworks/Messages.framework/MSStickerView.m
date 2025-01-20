@interface MSStickerView
- (BOOL)_isInsideMessagesCamera;
- (BOOL)animating;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)initialLayoutComplete;
- (BOOL)isAnimated;
- (BOOL)isAnimating;
- (BOOL)isPeeled;
- (BOOL)userExplicitlyUnpausedAnimation;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IMAnimatedImageProtocol)image;
- (IMImageDataProtocol)imageData;
- (MSSticker)sticker;
- (MSStickerView)initWithCoder:(id)a3;
- (MSStickerView)initWithFrame:(CGRect)a3;
- (MSStickerView)initWithFrame:(CGRect)frame sticker:(MSSticker *)sticker;
- (NSArray)frames;
- (NSError)stickerError;
- (NSTimeInterval)animationDuration;
- (PXRoundProgressView)roundProgressView;
- (UIDragInteraction)dragInteraction;
- (UIImage)stickerImage;
- (UIImageView)imageView;
- (UIImageView)outlineImageView;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)tapRecognizer;
- (VKCStickerEffectView)effectView;
- (_MSStickerDragPreviewContainerView)container;
- (double)animationOffset;
- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4;
- (id)_stickerSendManager;
- (id)accessibilityLabel;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragPreviewLiftContainerProvider;
- (id)representationForRole:(id)a3;
- (unint64_t)initialFrameIndexForCurrentDrag;
- (void)_buildEffectView;
- (void)_configureDragAndDrop;
- (void)_configureEffectView;
- (void)_configureStickerView;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_enableEffectView;
- (void)_loadAnimatedStickerIfNecessary;
- (void)_loadSticker;
- (void)_logStickerUsage;
- (void)_prepareForReuse;
- (void)_registerRepresentationsInItemProvider:(id)a3;
- (void)_registerStandardRepresentationsInItemProvider:(id)a3;
- (void)_removeEffectView;
- (void)_resetPeel;
- (void)_sendStickerUsageAnalyticsForDragAndDrop;
- (void)_setImage:(id)a3;
- (void)_stickerPreviewCachePreviewDidChange:(id)a3;
- (void)_swapWithOutlineImage;
- (void)_updateStickerView;
- (void)addHEICImage:(id)a3 completion:(id)a4;
- (void)addPNGImage:(id)a3 completion:(id)a4;
- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)animationTimerFired:(double)a3;
- (void)clearCachedPreviewsForCurrentSticker;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)pauseVisionKitEffect:(BOOL)a3;
- (void)prepareForSnapshotting;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationOffset:(double)a3;
- (void)setContainer:(id)a3;
- (void)setDragPreviewLiftContainerProvider:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setFrames:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInitialFrameIndexForCurrentDrag:(unint64_t)a3;
- (void)setInitialLayoutComplete:(BOOL)a3;
- (void)setIsPeeled:(BOOL)a3;
- (void)setOutlineImageView:(id)a3;
- (void)setRoundProgressView:(id)a3;
- (void)setSticker:(MSSticker *)sticker;
- (void)setStickerError:(id)a3;
- (void)setStickerImage:(id)a3;
- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3;
- (void)stageStickerForce:(BOOL)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)updateAnimationTimerObserving;
@end

@implementation MSStickerView

- (void)_configureStickerView
{
  if (!self->_imageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(MSStickerView *)self bounds];
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    [(UIImageView *)v4 setContentMode:1];
    v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_handleTap_];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    [(MSStickerView *)self addGestureRecognizer:self->_tapRecognizer];
    v7 = (objc_class *)_configureStickerView_PXPhotosRoundProgressViewClass;
    if (!_configureStickerView_PXPhotosRoundProgressViewClass)
    {
      v7 = (objc_class *)MEMORY[0x1E4E865C0](@"PXRoundProgressView", @"PhotosUICore");
      _configureStickerView_PXPhotosRoundProgressViewClass = (uint64_t)v7;
    }
    if (!self->_roundProgressView)
    {
      id v8 = [v7 alloc];
      v9 = (PXRoundProgressView *)objc_msgSend(v8, "initWithFrame:style:", 5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      roundProgressView = self->_roundProgressView;
      self->_roundProgressView = v9;

      [(PXRoundProgressView *)self->_roundProgressView setHidden:1];
      [(MSStickerView *)self addSubview:self->_roundProgressView];
    }
    [(MSStickerView *)self _configureDragAndDrop];
    [(MSStickerView *)self addSubview:v4];
    imageView = self->_imageView;
    self->_imageView = v4;

    [(MSStickerView *)self setClipsToBounds:1];
  }
  if (!self->_outlineImageView)
  {
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    outlineImageView = self->_outlineImageView;
    self->_outlineImageView = v12;

    [(UIImageView *)self->_outlineImageView setContentMode:1];
    [(UIImageView *)self->_outlineImageView setHidden:1];
    [(MSStickerView *)self addSubview:self->_outlineImageView];
  }
  [(MSStickerView *)self setEffectView:0];
  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__stickerPreviewCachePreviewDidChange_ name:@"MSStickerPreviewCachePreviewDidChange" object:0];
}

- (MSStickerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerView;
  id v3 = -[MSStickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MSStickerView *)v3 _configureStickerView];
  }
  return v4;
}

- (MSStickerView)initWithFrame:(CGRect)frame sticker:(MSSticker *)sticker
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  v9 = sticker;
  v10 = -[MSStickerView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10) {
    [(MSStickerView *)v10 setSticker:v9];
  }

  return v11;
}

- (MSStickerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSStickerView;
  id v3 = [(MSStickerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MSStickerView *)v3 _configureStickerView];
  }
  return v4;
}

- (void)dealloc
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)_prepareForReuse
{
  uint64_t v3 = [(MSStickerView *)self imageView];
  [v3 setImage:0];

  [(MSStickerView *)self setImage:0];
  [(MSStickerView *)self setImageData:0];
  [(MSStickerView *)self setFrames:0];
  [(MSStickerView *)self setIsPeeled:0];
  [(MSStickerView *)self setAnimating:0];
  [(MSStickerView *)self setStickerError:0];
  [(MSStickerView *)self setStickerImage:0];
  uint64_t v4 = [(MSStickerView *)self roundProgressView];
  [v4 setHidden:1];

  uint64_t v5 = [(MSStickerView *)self roundProgressView];
  [v5 prepareForReuse];

  [(MSStickerView *)self setEffectView:0];
  self->_animationDuration = 0.0;

  [(MSStickerView *)self updateAnimationTimerObserving];
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)MSStickerView;
  [(MSStickerView *)&v32 layoutSubviews];
  [(MSStickerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v30 = v5;
  CGFloat v31 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MSStickerView *)self imageView];
  objc_msgSend(v11, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v10);
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v33.origin.double x = v4;
  v33.origin.double y = v6;
  v33.size.double width = v8;
  v33.size.double height = v10;
  CGFloat v20 = CGRectGetWidth(v33) * 0.5;
  v34.origin.double x = v13;
  v34.origin.double y = v15;
  v34.size.double width = v17;
  v34.size.double height = v19;
  double v21 = v20 - CGRectGetWidth(v34) * 0.5;
  v35.origin.double y = v30;
  v35.origin.double x = v31;
  v35.size.double width = v8;
  v35.size.double height = v10;
  CGFloat v22 = CGRectGetHeight(v35) * 0.5;
  v36.origin.double x = v21;
  v36.origin.double y = v15;
  v36.size.double width = v17;
  v36.size.double height = v19;
  double v23 = v22 - CGRectGetHeight(v36) * 0.5;
  objc_msgSend(v11, "setFrame:", v21, v23, v17, v19);
  v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v25 = [v24 isStickersAppEnabled];

  if (v25)
  {
    v26 = [(MSStickerView *)self effectView];
    objc_msgSend(v26, "setFrame:", v21, v23, v17, v19);
  }
  if (![(MSStickerView *)self initialLayoutComplete])
  {
    [(MSStickerView *)self bounds];
    if (!CGRectEqualToRect(v37, *MEMORY[0x1E4F1DB28]))
    {
      [(MSStickerView *)self setInitialLayoutComplete:1];
      uint64_t v27 = [(MSStickerView *)self sticker];
      if (v27)
      {
        v28 = (void *)v27;
        v29 = [(MSStickerView *)self image];

        if (!v29) {
          [(MSStickerView *)self _loadSticker];
        }
      }
    }
  }
  -[PXRoundProgressView setFrame:](self->_roundProgressView, "setFrame:", v17 + -20.0, v19 + -20.0, 20.0, 20.0);
  [(MSStickerView *)self bringSubviewToFront:self->_roundProgressView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(MSStickerView *)self imageData];
  [v5 pxSize];
  double v7 = v6;
  double v9 = v8;

  CKUIBehaviorClass = (objc_class *)getCKUIBehaviorClass();
  v11 = IMLogHandleForCategory();
  double v12 = v11;
  if (CKUIBehaviorClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[MSStickerView sizeThatFits:](CKUIBehaviorClass);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[MSStickerView sizeThatFits:]();
  }

  CGFloat v13 = [(objc_class *)CKUIBehaviorClass sharedBehaviors];
  [v13 stickerScreenScale];
  double v15 = v14;

  double v16 = v7 / v15;
  double v17 = v9 / v15;
  BOOL v18 = v9 / v15 > height;
  if (v7 / v15 > width) {
    BOOL v18 = 1;
  }
  if (v18)
  {
    double v17 = height;
    double v16 = width;
  }
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)setSticker:(MSSticker *)sticker
{
  v45[1] = *MEMORY[0x1E4F143B8];
  double v5 = sticker;
  p_sticker = &self->_sticker;
  if (self->_sticker != v5)
  {
    objc_storeStrong((id *)&self->_sticker, sticker);
    stickerError = self->_stickerError;
    self->_stickerError = 0;

    if (v5)
    {
      double v8 = [(MSSticker *)*p_sticker representations];

      if (v8) {
        [(MSSticker *)*p_sticker _generateImageData];
      }
      double v9 = [(MSSticker *)*p_sticker _imageData];
      double v10 = *p_sticker;
      if (v9)
      {
        v11 = [(MSSticker *)v10 _stickerError];
        double v12 = self->_stickerError;
        self->_stickerError = v11;

        if (!self->_stickerError)
        {
          CGFloat v13 = v9;
LABEL_22:
          [(MSStickerView *)self setImageData:v13];
          if ([(MSStickerView *)self initialLayoutComplete]) {
            [(MSStickerView *)self _loadSticker];
          }

          goto LABEL_25;
        }
      }
      else
      {
        double v14 = [(MSSticker *)v10 imageFileURL];
        double v15 = v14;
        if (v14)
        {
          if (objc_msgSend(v14, "__ms_conformsToUTI:", *MEMORY[0x1E4F225F8]))
          {
            uint64_t v38 = 0;
            v39 = &v38;
            uint64_t v40 = 0x2050000000;
            double v16 = (void *)getCKImageDataClass_softClass_0;
            uint64_t v41 = getCKImageDataClass_softClass_0;
            if (!getCKImageDataClass_softClass_0)
            {
              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v37[2] = __getCKImageDataClass_block_invoke_0;
              v37[3] = &unk_1E6E98778;
              v37[4] = &v38;
              __getCKImageDataClass_block_invoke_0((uint64_t)v37);
              double v16 = (void *)v39[3];
            }
            double v17 = v16;
            _Block_object_dispose(&v38, 8);
            BOOL v18 = IMLogHandleForCategory();
            double v19 = v18;
            if (v17)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                -[MSStickerView setSticker:](v17);
              }
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              -[MSStickerView setSticker:]();
            }

            id v26 = objc_alloc(v17);
            uint64_t v27 = [(MSSticker *)*p_sticker imageFileURL];
            CGFloat v13 = (void *)[v26 initWithURL:v27];

            if (v13)
            {

              goto LABEL_22;
            }
            CGFloat v30 = [MEMORY[0x1E4F28CB8] defaultManager];
            CGFloat v31 = [v15 path];
            if ([v30 fileExistsAtPath:v31]) {
              uint64_t v32 = 2;
            }
            else {
              uint64_t v32 = 1;
            }

            CGRect v33 = (void *)MEMORY[0x1E4F28C58];
            v42 = @"MSStickersErrorStickerInfoKey";
            v43 = v15;
            CGRect v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
            CGRect v35 = [v33 errorWithDomain:@"com.apple.messages.stickers-error" code:v32 userInfo:v34];
            CGRect v36 = self->_stickerError;
            self->_stickerError = v35;
          }
          else
          {
            CGFloat v22 = (void *)MEMORY[0x1E4F28C58];
            v44 = @"MSStickersErrorStickerInfoKey";
            v45[0] = v15;
            double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
            v24 = [v22 errorWithDomain:@"com.apple.messages.stickers-error" code:3 userInfo:v23];
            int v25 = self->_stickerError;
            self->_stickerError = v24;
          }
        }
        else
        {
          CGFloat v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.messages.stickers-error" code:1 userInfo:0];
          double v21 = self->_stickerError;
          self->_stickerError = v20;
        }
      }

      goto LABEL_33;
    }
    [(MSStickerView *)self _prepareForReuse];
  }
LABEL_25:
  v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v29 = [v28 isStickersAppEnabled];

  if (v29) {
    [(MSStickerView *)self _configureEffectView];
  }
LABEL_33:
}

- (void)_configureEffectView
{
  double v3 = [(MSStickerView *)self sticker];
  [v3 stickerEffectType];

  if (!self->_sticker
    || (IMStickerEffectTypeShouldAvoidEffectView() & 1) != 0
    || [(MSStickerView *)self isAnimated])
  {
    [(MSStickerView *)self _removeEffectView];
  }
  else
  {
    [(MSStickerView *)self _buildEffectView];
    [(MSStickerView *)self _enableEffectView];
  }
}

- (void)_removeEffectView
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isStickersAppEnabled];

  if (v4)
  {
    if (self->_imageView) {
      -[MSStickerView addSubview:](self, "addSubview:");
    }
    [(MSStickerView *)self setEffectView:0];
  }
}

- (void)_buildEffectView
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isStickersAppEnabled];

  if (!v4) {
    return;
  }
  double v5 = [(UIImageView *)self->_imageView image];

  if (!v5) {
    [(MSStickerView *)self _loadSticker];
  }
  effectView = self->_effectView;
  if (effectView)
  {
    [(VKCStickerEffectView *)effectView removeFromSuperview];
  }
  else
  {
    id v7 = MTLCreateSystemDefaultDevice();
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB3FF8]) initWithDevice:v7];
    [(MSStickerView *)self setEffectView:v8];
  }
  [(VKCStickerEffectView *)self->_effectView setContentMode:1];
  [(UIImageView *)self->_imageView frame];
  -[VKCStickerEffectView setFrame:](self->_effectView, "setFrame:");
  double v9 = (void *)MEMORY[0x1E4FB3FF0];
  double v10 = [(MSStickerView *)self sticker];
  v11 = objc_msgSend(v9, "effectWithType:", objc_msgSend(v10, "stickerEffectType"));
  [(VKCStickerEffectView *)self->_effectView setEffect:v11];

  if (![(MSStickerView *)self isAnimated])
  {
    [(VKCStickerEffectView *)self->_effectView setImage:self->_stickerImage];
    double v17 = (void *)MEMORY[0x1E4FB3FF0];
    id v21 = [(MSStickerView *)self sticker];
    BOOL v18 = objc_msgSend(v17, "effectWithType:", objc_msgSend(v21, "stickerEffectType"));
    [(VKCStickerEffectView *)self->_effectView setEffect:v18];

    goto LABEL_12;
  }
  double v12 = [(MSStickerView *)self sticker];
  CGFloat v13 = [v12 representations];
  double v14 = [v13 firstObject];
  double v15 = [v14 type];
  int v16 = [v15 containsString:@"public.heic"];

  if (v16)
  {
    id v21 = [(IMImageDataProtocol *)self->_imageData data];
    [(VKCStickerEffectView *)self->_effectView setVideoData:v21];
LABEL_12:

    return;
  }
  stickerImage = self->_stickerImage;
  CGFloat v20 = self->_effectView;

  [(VKCStickerEffectView *)v20 setImage:stickerImage];
}

- (void)setEffectView:(id)a3
{
  id v7 = a3;
  double v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isStickersAppEnabled];

  if (v6)
  {
    [(VKCStickerEffectView *)self->_effectView setPaused:1];
    [(VKCStickerEffectView *)self->_effectView removeFromSuperview];
    objc_storeStrong((id *)&self->_effectView, a3);
    if (!self->_effectView && ([(MSStickerView *)self containsView:self->_imageView] & 1) == 0) {
      [(MSStickerView *)self addSubview:self->_imageView];
    }
  }
}

- (void)_enableEffectView
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isStickersAppEnabled];

  if (v4)
  {
    if (self->_effectView && (-[MSStickerView containsView:](self, "containsView:") & 1) == 0) {
      [(MSStickerView *)self addSubview:self->_effectView];
    }
    if ([(MSStickerView *)self containsView:self->_imageView]) {
      [(UIImageView *)self->_imageView removeFromSuperview];
    }
    effectView = self->_effectView;
    [(VKCStickerEffectView *)effectView setPaused:0];
  }
}

- (void)_stickerPreviewCachePreviewDidChange:(id)a3
{
  int v4 = [(MSStickerView *)self sticker];
  double v5 = +[MSSticker MSStickerPreviewCacheKeyForSticker:v4];

  CKPreviewDispatchCacheClass = (objc_class *)getCKPreviewDispatchCacheClass();
  id v7 = IMLogHandleForCategory();
  double v8 = v7;
  if (CKPreviewDispatchCacheClass)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MSStickerView _stickerPreviewCachePreviewDidChange:](CKPreviewDispatchCacheClass);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[MSStickerView _stickerPreviewCachePreviewDidChange:]();
  }

  double v9 = [(objc_class *)CKPreviewDispatchCacheClass stickerPreviewCache];
  double v10 = [v9 cachedPreviewForKey:v5];

  if (v10 && v10 != self->_image)
  {
    [(MSStickerView *)self setImage:v10];
    v11 = [(IMAnimatedImageProtocol *)v10 frames];
    [(MSStickerView *)self setFrames:v11];

    [(MSStickerView *)self _updateStickerView];
    [(MSStickerView *)self setNeedsLayout];
    [(MSStickerView *)self layoutIfNeeded];
  }
}

- (void)setImage:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = (IMAnimatedImageProtocol *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    self->_animationDuration = 0.0;
    int v6 = [(MSStickerView *)self image];
    id v7 = [v6 durations];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "doubleValue", (void)v14);
          self->_animationDuration = v13 + self->_animationDuration;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)_loadSticker
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)clearCachedPreviewsForCurrentSticker
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)_loadAnimatedStickerIfNecessary
{
  v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

id __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke(uint64_t a1)
{
  CKAnimatedImageClass = (objc_class *)getCKAnimatedImageClass();
  uint64_t v3 = IMLogHandleForCategory();
  uint64_t v4 = v3;
  if (CKAnimatedImageClass)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_4(CKAnimatedImageClass);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_3();
  }

  uint64_t v5 = CKAnimatedImageClass;
  uint64_t v6 = *(void *)(a1 + 32);
  id v20 = 0;
  uint64_t v7 = [(objc_class *)v5 animatedImageFromOptimizedBitmapAtFileURL:v6 error:&v20];
  id v8 = v20;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    if ([*(id *)(a1 + 40) count])
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = objc_msgSend(*(id *)(a1 + 40), "thumbnailAtIndex:fillToSize:maxCount:", v11, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
        if (v12) {
          [v10 addObject:v12];
        }

        ++v11;
      }
      while (v11 < [*(id *)(a1 + 40) count]);
    }
    double v13 = [*(id *)(a1 + 40) durationsWithMaxCount:0x7FFFFFFFLL];
    long long v14 = [*(id *)(a1 + 48) roundProgressView];

    if (v14)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_2;
      v19[3] = &unk_1E6E987F0;
      v19[4] = *(void *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], v19);
    }
    long long v15 = (objc_class *)getCKAnimatedImageClass();
    long long v16 = IMLogHandleForCategory();
    long long v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_2(v15);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_1();
    }

    id v9 = (id) [objc_alloc(v15) initWithImages:v10 durations:v13];
  }

  return v9;
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) roundProgressView];
  LODWORD(v3) = 1.0;
  [v2 setProgress:v3];

  id v4 = [*(id *)(a1 + 32) roundProgressView];
  [v4 setHidden:1];
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_4;
    block[3] = &unk_1E6E987F0;
    block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      double v3 = *(void **)(a1 + 32);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_5;
      v4[3] = &unk_1E6E98890;
      id v5 = v2;
      id v6 = *(id *)(a1 + 56);
      [v3 enqueueSaveBlock:v4 withPriority:0];
    }
  }
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSStickerPreviewCachePreviewDidChange" object:*(void *)(*(void *)(a1 + 32) + 416)];
}

uint64_t __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_5(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = 0;
  return [v2 writeAsOptimizedBitmapToFileURL:v1 error:&v4];
}

- (void)_updateStickerView
{
  double v3 = [(MSStickerView *)self frames];
  uint64_t v4 = [v3 firstObject];
  stickerImage = self->_stickerImage;
  self->_stickerImage = v4;

  [(MSStickerView *)self _setImage:self->_stickerImage];

  [(MSStickerView *)self updateAnimationTimerObserving];
}

- (void)_setImage:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self->_imageView;
  id v5 = [(UIImageView *)v4 image];

  if (v5 != v6)
  {
    [(MSStickerView *)self setStickerImage:v6];
    [(UIImageView *)v4 setImage:v6];
  }
}

- (void)_swapWithOutlineImage
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)_resetPeel
{
  uint64_t v3 = [(MSStickerView *)self outlineImageView];
  [v3 setHidden:1];

  uint64_t v4 = [(MSStickerView *)self imageView];
  [(MSStickerView *)self addSubview:v4];

  uint64_t v5 = [(MSStickerView *)self stickerImage];
  uint64_t v6 = [(MSStickerView *)self imageView];
  [v6 setImage:v5];

  [(MSStickerView *)self setIsPeeled:0];
  [(MSStickerView *)self setAnimating:1];

  [(MSStickerView *)self _configureEffectView];
}

- (id)accessibilityLabel
{
  return [(MSSticker *)self->_sticker localizedDescription];
}

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MSStickerView *)self isAnimated]
    && ![(MSStickerView *)self isPeeled]
    && self->_animating != v3)
  {
    self->_animating = v3;
    uint64_t v5 = [(MSStickerView *)self stickerImage];
    [(MSStickerView *)self _setImage:v5];

    [(MSStickerView *)self updateAnimationTimerObserving];
  }
}

- (BOOL)isAnimated
{
  uint64_t v2 = [(MSStickerView *)self imageData];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)updateAnimationTimerObserving
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)prepareForSnapshotting
{
  if ([(MSStickerView *)self isAnimated])
  {
    [(MSStickerView *)self setAnimating:0];
    id v4 = [(MSStickerView *)self frames];
    uint64_t v3 = [v4 firstObject];
    [(MSStickerView *)self _setImage:v3];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MSStickerView;
  [(MSStickerView *)&v3 didMoveToWindow];
  [(MSStickerView *)self updateAnimationTimerObserving];
}

- (void)pauseVisionKitEffect:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MSStickerView *)self effectView];
  [v4 setPaused:v3];
}

- (void)_sendStickerUsageAnalyticsForDragAndDrop
{
  BOOL v3 = [MSStickerUsageEvent alloc];
  id v4 = [(MSStickerView *)self sticker];
  uint64_t v5 = [(MSStickerUsageEvent *)v3 initWithSticker:v4];

  [(MSStickerUsageEvent *)v5 setUsageType:1];
  [(MSStickerUsageEvent *)v5 send];
}

- (void)_logStickerUsage
{
  if (getSTKStickerUsageManagerClass())
  {
    getSTKStickerUsageManagerClass();
    if (objc_opt_respondsToSelector())
    {
      id v7 = [getSTKStickerUsageManagerClass() sharedManager];
      BOOL v3 = [(MSSticker *)self->_sticker stickerIdentifier];
      id v4 = [v3 UUIDString];
      uint64_t v5 = +[_MSStickerSendManager sharedInstance];
      uint64_t v6 = [v5 hostBundleID];
      [v7 logStickerWithStickerIdentifier:v4 bundleIdentifier:v6];
    }
  }
}

- (void)_configureDragAndDrop
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isClingEnabled];

  if (v4 && ![(MSStickerView *)self _isInsideMessagesCamera])
  {
    uint8_t v8 = (UIDragInteraction *)[objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:self];
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v8;

    uint64_t v10 = self->_dragInteraction;
    [(MSStickerView *)self addInteraction:v10];
  }
  else
  {
    uint64_t v5 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel_handleLongPress_];
    longPressRecognizer = self->_longPressRecognizer;
    self->_longPressRecognizer = v5;

    [(MSStickerView *)self addGestureRecognizer:self->_longPressRecognizer];
    [(UILongPressGestureRecognizer *)self->_longPressRecognizer setDelegate:self];
    id v7 = self->_longPressRecognizer;
    [(UILongPressGestureRecognizer *)v7 setMinimumPressDuration:0.15];
  }
}

- (BOOL)_isInsideMessagesCamera
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_MSMessageAppContext activeExtensionContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v3 = objc_msgSend(v2, "inputItems", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          uint8_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) userInfo];
          id v9 = [v8 objectForKeyedSubscript:@"context-is-messages-camera"];
          char v10 = [v9 isEqual:&unk_1F406F108];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)animationTimerFired:(double)a3
{
  id v8 = [(MSStickerView *)self frames];
  if ((unint64_t)[v8 count] >= 2)
  {
    uint64_t v5 = [(MSStickerView *)self image];
    [(MSStickerView *)self animationOffset];
    id v7 = [v5 frameForAnimationTime:v6 + a3];

    [(MSStickerView *)self _setImage:v7];
  }
}

- (void)handleTap:(id)a3
{
  if ([a3 state] == 3)
  {
    [(MSStickerView *)self stageStickerForce:0];
  }
}

- (void)stageStickerForce:(BOOL)a3
{
  BOOL v3 = a3;
  [(MSStickerView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  long long v13 = [(MSStickerView *)self window];
  long long v14 = [v13 coordinateSpace];
  -[MSStickerView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v14, v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(MSSticker *)self->_sticker imageFileURL];

  if (v23) {
    [(MSSticker *)self->_sticker _convertImageFileURLIfNeeded];
  }
  v24 = [(MSStickerView *)self _stickerSendManager];
  objc_msgSend(v24, "insertSticker:forceStage:frameInRemoteView:completionHandler:", self->_sticker, v3, &__block_literal_global_7, v16, v18, v20, v22);

  [(MSStickerView *)self _logStickerUsage];
}

void __35__MSStickerView_stageStickerForce___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_StickerError.isa, a2);
  }
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(MSStickerView *)self _swapWithOutlineImage];
    [(MSStickerView *)self setIsPeeled:1];
    double v5 = [(MSStickerView *)self imageView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    long long v14 = [(MSStickerView *)self window];
    -[MSStickerView convertRect:toView:](self, "convertRect:toView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = (void *)MEMORY[0x1E4E868E0]();
    v24 = [(MSStickerView *)self _stickerSendManager];
    sticker = self->_sticker;
    id v26 = [MEMORY[0x1E4F43058] _synchronizedDrawingFence];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __33__MSStickerView_handleLongPress___block_invoke;
    v27[3] = &unk_1E6E98B60;
    v27[4] = self;
    objc_msgSend(v24, "startDragSticker:frameInRemoteView:fence:completionHandler:", sticker, v26, v27, v16, v18, v20, v22);
  }
}

void __33__MSStickerView_handleLongPress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MSStickerView_handleLongPress___block_invoke_2;
  v6[3] = &unk_1E6E98890;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __33__MSStickerView_handleLongPress___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    NSLog(&cfstr_StickerError.isa, *(void *)(a1 + 40));
  }
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  [v6 setShadowPath:v7];

  double v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v6 setBackgroundColor:v8];

  double v9 = +[_MSStickerDragPreviewContainerView shadowPropertiesForDrag];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 _setShadowProperties:v9];
  }
  double v10 = [(MSStickerView *)self superview];
  double v11 = self->_effectView;
  double v12 = [(VKCStickerEffectView *)v11 superview];
  imageView = (UIImageView *)v11;
  if (!v12) {
    imageView = self->_imageView;
  }
  long long v14 = imageView;

  double v15 = [(MSStickerView *)self dragPreviewLiftContainerProvider];

  if (v15)
  {
    double v16 = [(MSStickerView *)self dragPreviewLiftContainerProvider];
    double v17 = v16[2]();

    if (v17)
    {
      id v18 = v17;

      double v10 = v18;
    }
  }
  double v19 = [(MSStickerView *)self superview];
  [(MSStickerView *)self center];
  objc_msgSend(v19, "convertPoint:toView:", v10);
  double v21 = v20;
  double v23 = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F429B8]);
  +[_MSStickerDragPreviewContainerView targetPreviewTransform];
  int v25 = objc_msgSend(v24, "initWithContainer:center:transform:", v10, v40, v21, v23);
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F42ED0]) initWithView:v14 parameters:v6 target:v25];

  uint64_t v27 = [[_MSStickerDragPreviewContainerView alloc] initWithIsDropAnimation:0];
  [(MSStickerView *)self setContainer:v27];
  v28 = [(MSStickerView *)self stickerImage];
  [(_MSStickerDragPreviewContainerView *)v27 setImage:v28];

  [v26 _setPreviewContainer:v27];
  int v29 = [(MSStickerView *)self frames];
  if ((unint64_t)[v29 count] <= 1)
  {

    uint64_t v36 = 0;
  }
  else
  {
    v39 = v11;
    CGFloat v30 = [(MSStickerView *)self imageView];
    CGFloat v31 = [v30 image];

    if (v31)
    {
      uint64_t v32 = [(MSStickerView *)self frames];
      CGRect v33 = [(MSStickerView *)self imageView];
      CGRect v34 = [v33 image];
      uint64_t v38 = v9;
      uint64_t v35 = [v32 indexOfObject:v34];

      if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v36 = 0;
      }
      else {
        uint64_t v36 = v35;
      }
      double v9 = v38;
    }
    else
    {
      uint64_t v36 = 0;
    }
    double v11 = v39;
  }
  -[MSStickerView setInitialFrameIndexForCurrentDrag:](self, "setInitialFrameIndexForCurrentDrag:", v36, v38);

  return v26;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  id v7 = [(MSStickerView *)self superview];
  double v8 = [(MSStickerView *)self superview];
  [(MSStickerView *)self center];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  double v10 = v9;
  double v12 = v11;

  double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F429B8]), "initWithContainer:center:", v7, v10, v12);
  long long v14 = [v6 retargetedPreviewWithTarget:v13];

  return v14;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4 = [(MSStickerView *)self container];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MSStickerView__dragInteractionDidCancelLiftWithoutDragging___block_invoke;
  v5[3] = &unk_1E6E987F0;
  v5[4] = self;
  [v4 _animateLiftCancellationAlongsideAnimator:0 completion:v5];
}

uint64_t __62__MSStickerView__dragInteractionDidCancelLiftWithoutDragging___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetPeel];
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6 = a5;
  id v7 = [(MSStickerView *)self container];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MSStickerView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v8[3] = &unk_1E6E987F0;
  v8[4] = self;
  [v7 _animateLiftCancellationAlongsideAnimator:v6 completion:v8];
}

uint64_t __68__MSStickerView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetPeel];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__MSStickerView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1E6E98B88;
  v5[4] = self;
  [a4 addCompletion:v5];
}

uint64_t __69__MSStickerView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 != 1)
  {
    uint64_t v3 = result;
    [*(id *)(result + 32) _swapWithOutlineImage];
    id v4 = *(void **)(v3 + 32);
    return [v4 setIsPeeled:1];
  }
  return result;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = ms_defaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v58 = self;
    _os_log_impl(&dword_1E4A76000, v5, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> dragInteraction:itemsForBeginningSession:", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v7 = [(MSStickerView *)self effectView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v9 != v12 || v11 != v13)
  {
    double v15 = [(MSStickerView *)self effectView];
    double v16 = [(MSStickerView *)self effectView];
    [v16 center];
    objc_msgSend(v15, "convertPoint:toView:", 0);
    double v18 = v17;
    double v20 = v19;

    double v21 = [(MSStickerView *)self effectView];
LABEL_13:
    uint64_t v32 = v21;
    [v21 bounds];
    double v34 = v33;
    double v36 = v35;
    double v37 = v18 - v33 * 0.5;
    double v38 = v20 - v35 * 0.5;

    goto LABEL_15;
  }
  double v22 = [(MSStickerView *)self imageView];
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;

  if (v24 != v12 || v26 != v13)
  {
    v28 = [(MSStickerView *)self effectView];
    int v29 = [(MSStickerView *)self effectView];
    [v29 center];
    objc_msgSend(v28, "convertPoint:toView:", 0);
    double v18 = v30;
    double v20 = v31;

    double v21 = [(MSStickerView *)self imageView];
    goto LABEL_13;
  }
  [(MSStickerView *)self frame];
  double v37 = v39;
  double v38 = v40;
  double v34 = v41;
  double v36 = v42;
LABEL_15:
  v43 = [(MSStickerView *)self sticker];
  uint64_t v44 = objc_opt_class();
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke;
  v50[3] = &unk_1E6E98BB0;
  v50[4] = self;
  id v51 = v43;
  double v52 = v37;
  double v53 = v38;
  double v54 = v34;
  double v55 = v36;
  id v45 = v43;
  [v6 registerObjectOfClass:v44 visibility:0 loadHandler:v50];
  [(MSStickerView *)self _registerStandardRepresentationsInItemProvider:v6];
  [(MSStickerView *)self _registerRepresentationsInItemProvider:v6];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke_163;
  v49[3] = &unk_1E6E98BD8;
  v49[4] = self;
  [v6 registerItemForTypeIdentifier:@"com.apple.sticker" loadHandler:v49];
  v46 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v6];
  v56 = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];

  return v47;
}

uint64_t __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1E4A76000, v4, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> Item provider load for _MSMessageMediaPayload", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [[_MSMessageMediaPayload alloc] initWithSticker:*(void *)(a1 + 40)];
  -[_MSMessageMediaPayload setSourceFrame:](v6, "setSourceFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  -[_MSMessageMediaPayload setInitialFrameIndex:](v6, "setInitialFrameIndex:", [*(id *)(a1 + 32) initialFrameIndexForCurrentDrag]);
  v3[2](v3, v6, 0);

  return 0;
}

void __58__MSStickerView_dragInteraction_itemsForBeginningSession___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1E4A76000, v4, OS_LOG_TYPE_DEFAULT, "<MSStickerView: %p> Item provider load for com.apple.sticker", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1C9B8] data];
  v3[2](v3, v6, 0);
}

- (void)_registerRepresentationsInItemProvider:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(MSStickerView *)self sticker];
  id v6 = [v5 representations];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v11 type];
        char v13 = [v4 hasItemConformingToTypeIdentifier:v12];

        if ((v13 & 1) == 0)
        {
          long long v14 = [v11 type];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __56__MSStickerView__registerRepresentationsInItemProvider___block_invoke;
          v15[3] = &unk_1E6E98BD8;
          v15[4] = v11;
          [v4 registerItemForTypeIdentifier:v14 loadHandler:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

void __56__MSStickerView__registerRepresentationsInItemProvider___block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 data];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

- (void)_registerStandardRepresentationsInItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(MSStickerView *)self sticker];
  id v6 = [v5 imageFileURL];

  uint64_t v7 = [(MSStickerView *)self sticker];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [(id)*MEMORY[0x1E4F44460] identifier];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke;
    v39[3] = &unk_1E6E98C00;
    double v40 = v8;
    double v41 = self;
    id v10 = v8;
    [v4 registerItemForTypeIdentifier:v9 loadHandler:v39];

    id v11 = v40;
  }
  else
  {
    double v12 = [v7 representations];
    id v10 = [v12 firstObject];

    id v11 = [(MSStickerView *)self representationForRole:@"com.apple.stickers.role.animated"];
    char v13 = [(MSStickerView *)self representationForRole:@"com.apple.stickers.role.still"];
    if (v10 && v10 == v11)
    {
      long long v14 = [v10 type];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_2;
      v37[3] = &unk_1E6E98BD8;
      id v38 = v10;
      [v4 registerItemForTypeIdentifier:v14 loadHandler:v37];
    }
    if (v13)
    {
      double v15 = [(MSStickerView *)self effectView];
      long long v16 = [v15 effect];

      long long v17 = (void *)MEMORY[0x1E4F42A80];
      long long v18 = [v13 data];
      long long v19 = [(MSStickerView *)self window];
      double v20 = [v19 screen];
      [v20 scale];
      uint64_t v21 = objc_msgSend(v17, "imageWithData:scale:", v18);

      double v22 = [v13 type];
      double v23 = [(id)*MEMORY[0x1E4F443E0] identifier];
      LODWORD(v20) = [v22 isEqualToString:v23];

      if (v20)
      {
        double v24 = [v13 type];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_3;
        v32[3] = &unk_1E6E98C50;
        id v33 = v16;
        id v34 = v21;
        double v35 = self;
        id v36 = v13;
        [v4 registerItemForTypeIdentifier:v24 loadHandler:v32];
      }
      double v25 = [(id)*MEMORY[0x1E4F44460] identifier];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_5;
      v28[3] = &unk_1E6E98C78;
      id v29 = v16;
      id v30 = v21;
      double v31 = self;
      id v26 = v21;
      id v27 = v16;
      [v4 registerItemForTypeIdentifier:v25 loadHandler:v28];
    }
  }
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 imageFileURL];
  uint64_t v7 = [v6 path];
  id v8 = [v3 imageWithContentsOfFile:v7];

  [*(id *)(a1 + 40) addPNGImage:v8 completion:v5];
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_2(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 data];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (*(void *)(a1 + 32) && +[MSSticker _isHEICSupported])
  {
    id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v9 = [v8 isStickersAppEnabled];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_4;
      v13[3] = &unk_1E6E98C28;
      v13[4] = *(void *)(a1 + 48);
      id v14 = v6;
      [v10 applyToImage:v11 completion:v13];
    }
  }
  else
  {
    double v12 = [*(id *)(a1 + 56) data];
    (*((void (**)(id, void *, void))v6 + 2))(v6, v12, 0);
  }
}

uint64_t __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addHEICImage:a2 completion:*(void *)(a1 + 40)];
}

void __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (*(void *)(a1 + 32))
  {
    id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v9 = [v8 isStickersAppEnabled];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_6;
      v12[3] = &unk_1E6E98C28;
      v12[4] = *(void *)(a1 + 48);
      id v13 = v6;
      [v10 applyToImage:v11 completion:v12];
    }
  }
  else
  {
    [*(id *)(a1 + 48) addPNGImage:*(void *)(a1 + 40) completion:v6];
  }
}

uint64_t __64__MSStickerView__registerStandardRepresentationsInItemProvider___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addPNGImage:a2 completion:*(void *)(a1 + 40)];
}

- (id)representationForRole:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(MSStickerView *)self sticker];
  id v6 = [v5 representations];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 role];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)addHEICImage:(id)a3 completion:(id)a4
{
  id v7 = (void (**)(id, void *, void))a4;
  id v5 = objc_msgSend(a3, "__ms_HEICData");
  if (v5)
  {
    v7[2](v7, v5, 0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.messages.stickers-error" code:-1 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v6);
  }
}

- (void)addPNGImage:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id, void))a4;
  objc_msgSend(a3, "__ms_PNGData");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v4 = [(MSStickerView *)self _stickerSendManager];
  [v4 stickerDruidDragStarted];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v7 = [(MSStickerView *)self _stickerSendManager];
  uint64_t v8 = [(MSStickerView *)self sticker];
  [v7 stickerDruidDragEndedWithMSSticker:v8];

  [(MSStickerView *)self _resetPeel];
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(MSStickerView *)self _logStickerUsage];
    [(MSStickerView *)self _sendStickerUsageAnalyticsForDragAndDrop];
  }
}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F43148]);
  objc_msgSend(v5, "set_wantsElasticEffects:", 1);
  objc_msgSend(v5, "set_resizable:", 1);
  objc_msgSend(v5, "set_rotatable:", 1);
  [(MSStickerView *)self frame];
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(v5, "set_maximumResizableSize:", 300.0, 300.0);
  objc_msgSend(v5, "set_minimumResizableSize:", v7, v9);

  return v5;
}

- (id)_stickerSendManager
{
  return +[_MSStickerSendManager sharedInstance];
}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v6 = a3;
  double v7 = [(MSStickerView *)self sticker];
  double v8 = [v7 stickerIdentifier];
  double v9 = [v6 valueForKey:@"stickerIDs"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSStickerView_animatedStickerCreationProgressChanged_progress___block_invoke;
  block[3] = &unk_1E6E98CA0;
  block[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v6;
  double v19 = a4;
  int v20 = 1119092736;
  id v10 = v6;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__MSStickerView_animatedStickerCreationProgressChanged_progress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    return;
  }
  uint64_t v3 = [v2 sticker];
  id v4 = *(void **)(a1 + 40);

  if (v3 != v4) {
    return;
  }
  id v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) objectAtIndexedSubscript:0];
  if ([v5 isEqual:v6])
  {
  }
  else
  {
    double v7 = *(void **)(a1 + 48);
    double v8 = [*(id *)(a1 + 56) objectAtIndexedSubscript:1];
    LODWORD(v7) = [v7 isEqual:v8];

    if (!v7) {
      return;
    }
  }
  id v19 = [*(id *)(a1 + 64) valueForKey:@"type"];
  if ([v19 isEqualToString:@"begin"])
  {
    double v9 = [*(id *)(a1 + 32) roundProgressView];
    id v10 = v9;
    uint64_t v11 = 0;
LABEL_11:
    [v9 setHidden:v11];
    goto LABEL_12;
  }
  if ([v19 isEqualToString:@"end"])
  {
    id v12 = [*(id *)(a1 + 32) roundProgressView];
    LODWORD(v13) = 1.0;
    [v12 setProgress:v13];

    double v9 = [*(id *)(a1 + 32) roundProgressView];
    id v10 = v9;
    uint64_t v11 = 1;
    goto LABEL_11;
  }
  if (![v19 isEqualToString:@"update"]) {
    goto LABEL_13;
  }
  long long v14 = [*(id *)(a1 + 32) roundProgressView];
  [v14 setHidden:0];

  double v15 = *(double *)(a1 + 72);
  if (v15 == 100.0)
  {
    id v16 = [*(id *)(a1 + 32) roundProgressView];
    id v10 = v16;
    *(float *)&double v17 = *(float *)(a1 + 80) / 100.0;
  }
  else
  {
    double v18 = v15 * *(float *)(a1 + 80) / 100.0;
    id v16 = [*(id *)(a1 + 32) roundProgressView];
    id v10 = v16;
    double v17 = v18 / 100.0;
    *(float *)&double v17 = v18 / 100.0;
  }
  [v16 setProgress:v17];
LABEL_12:

LABEL_13:
}

- (MSSticker)sticker
{
  return self->_sticker;
}

- (NSTimeInterval)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (NSError)stickerError
{
  return self->_stickerError;
}

- (void)setStickerError:(id)a3
{
}

- (UIImage)stickerImage
{
  return self->_stickerImage;
}

- (void)setStickerImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)outlineImageView
{
  return self->_outlineImageView;
}

- (void)setOutlineImageView:(id)a3
{
}

- (VKCStickerEffectView)effectView
{
  return self->_effectView;
}

- (PXRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (void)setRoundProgressView:(id)a3
{
}

- (IMAnimatedImageProtocol)image
{
  return self->_image;
}

- (IMImageDataProtocol)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (unint64_t)initialFrameIndexForCurrentDrag
{
  return self->_initialFrameIndexForCurrentDrag;
}

- (void)setInitialFrameIndexForCurrentDrag:(unint64_t)a3
{
  self->_initialFrameIndexForCurrentDrag = a3;
}

- (BOOL)initialLayoutComplete
{
  return self->_initialLayoutComplete;
}

- (void)setInitialLayoutComplete:(BOOL)a3
{
  self->_initialLayoutComplete = a3;
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (_MSStickerDragPreviewContainerView)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (_MSStickerDragPreviewContainerView *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (BOOL)isPeeled
{
  return self->_isPeeled;
}

- (void)setIsPeeled:(BOOL)a3
{
  self->_isPeeled = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (double)animationOffset
{
  return self->_animationOffset;
}

- (void)setAnimationOffset:(double)a3
{
  self->_animationOffset = a3;
}

- (id)dragPreviewLiftContainerProvider
{
  return self->_dragPreviewLiftContainerProvider;
}

- (void)setDragPreviewLiftContainerProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dragPreviewLiftContainerProvider, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_outlineImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_stickerImage, 0);
  objc_storeStrong((id *)&self->_stickerError, 0);

  objc_storeStrong((id *)&self->_sticker, 0);
}

- (void)sizeThatFits:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

- (void)sizeThatFits:(objc_class *)a1 .cold.2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)setSticker:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

- (void)setSticker:(objc_class *)a1 .cold.2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

- (void)_stickerPreviewCachePreviewDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

- (void)_stickerPreviewCachePreviewDidChange:(objc_class *)a1 .cold.2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_2(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E4A76000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
}

void __48__MSStickerView__loadAnimatedStickerIfNecessary__block_invoke_cold_4(objc_class *a1)
{
  uint64_t v1 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1E4A76000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);
}

@end