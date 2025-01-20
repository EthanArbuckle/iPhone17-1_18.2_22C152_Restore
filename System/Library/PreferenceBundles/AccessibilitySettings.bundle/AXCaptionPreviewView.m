@interface AXCaptionPreviewView
+ (NSArray)cloudImages;
- (AXCaptionPreviewDelegate)previewDelegate;
- (AXCaptionPreviewView)initWithFrame:(CGRect)a3;
- (BOOL)inTable;
- (BOOL)isExpanded;
- (BOOL)transitioningToBiggerView;
- (BOOL)transitioningToSmallerView;
- (CGPoint)originalCenter;
- (CGRect)originalFrame;
- (CGRect)visibleFrame;
- (double)_xOffset;
- (id)captionCell;
- (id)currentSlide;
- (id)enclosingViewController;
- (id)nextSlide;
- (void)_expandPressed:(id)a3;
- (void)_previewTapped:(id)a3;
- (void)_updateButtonStyle;
- (void)_updateSubtitle:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setIsExpanded:(BOOL)a3;
- (void)setOriginalCenter:(CGPoint)a3;
- (void)setOriginalFrame:(CGRect)a3;
- (void)setPreviewDelegate:(id)a3;
- (void)setTransitioningToBiggerView:(BOOL)a3;
- (void)setTransitioningToSmallerView:(BOOL)a3;
- (void)showNextImage;
- (void)stopBackgroundAnimation;
- (void)updateExpandButtonPosition;
- (void)updateSubtitle;
@end

@implementation AXCaptionPreviewView

- (id)captionCell
{
  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(AXCaptionPreviewView *)v2 superview];

      v2 = (AXCaptionPreviewView *)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    v2 = v2;
  }
LABEL_6:
  v4 = __UIAccessibilitySafeClass();

  return v4;
}

- (BOOL)inTable
{
  v2 = [(AXCaptionPreviewView *)self captionCell];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)visibleFrame
{
  if ([(AXCaptionPreviewView *)self inTable])
  {
    uint64_t v3 = [(AXCaptionPreviewView *)self captionCell];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    [v3 frame];
    float v9 = v7 - fabs(v8);
    double v10 = v9;
    double v11 = v7 - v9;
    double v12 = 0.0;
  }
  else
  {
    [(AXCaptionPreviewView *)self bounds];
    double v12 = v13;
    double v11 = v14;
    double v5 = v15;
    double v10 = v16;
  }
  double v17 = v12;
  double v18 = v11;
  double v19 = v5;
  double v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_previewTapped:(id)a3
{
  id v3 = [(AXCaptionPreviewView *)self previewDelegate];
  [v3 captionPreviewWasTapped:1];
}

- (void)_updateSubtitle:(id)a3
{
}

void __40__AXCaptionPreviewView__updateSubtitle___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) cancel];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = *(void **)(*(void *)(a1 + 32) + 136);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __40__AXCaptionPreviewView__updateSubtitle___block_invoke_2;
  v5[3] = &unk_2087C0;
  id v6 = v2;
  id v4 = v2;
  [v3 afterDelay:v5 processBlock:&__block_literal_global_66 cancelBlock:0.25];
}

id __40__AXCaptionPreviewView__updateSubtitle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) update];
}

- (void)updateSubtitle
{
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
  id v4 = &selRef__previewTapped_;
  if (!a3) {
    id v4 = &selRef__expandPressed_;
  }
  [(AXCaptionPreviewView *)self addTarget:self action:*v4 forControlEvents:64];

  [(AXCaptionPreviewView *)self _updateButtonStyle];
}

+ (NSArray)cloudImages
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __35__AXCaptionPreviewView_cloudImages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudImages_onceToken != -1) {
    dispatch_once(&cloudImages_onceToken, block);
  }
  id v2 = (void *)cloudImages_Clouds;

  return (NSArray *)v2;
}

void __35__AXCaptionPreviewView_cloudImages__block_invoke()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  v1 = (void *)cloudImages_Clouds;
  cloudImages_Clouds = (uint64_t)v0;

  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [&off_22C338 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(&off_22C338);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        double v8 = +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v7, v2, v9, v10, v11, v12);
        if (v8)
        {
          [(id)cloudImages_Clouds addObject:v8];
        }
        else
        {
          uint64_t v11 = v7;
          double v12 = v2;
          CFStringRef v10 = @"Unable to find image named %@ in bundle %@";
          LOBYTE(v9) = 1;
          _AXLogWithFacility();
        }
      }
      id v4 = [&off_22C338 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (double)_xOffset
{
  id v2 = [(AXCaptionPreviewView *)self captionCell];
  [v2 xOffset];
  double v4 = v3;

  return v4;
}

- (AXCaptionPreviewView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v45.receiver = self;
  v45.super_class = (Class)AXCaptionPreviewView;
  uint64_t v5 = -[AXCaptionPreviewView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y);
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:v5 selector:"_updateSubtitle:" name:kMACaptionAppearanceSettingsChangedNotification object:0];

  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:v5 selector:"_updateSubtitle:" name:kFigSubtitleRendererNotification_NeedsLayout object:0];

  id v8 = objc_alloc((Class)AXThreadTimer);
  uint64_t v9 = +[NSThread mainThread];
  CFStringRef v10 = (AXThreadTimer *)[v8 initWithThread:v9];
  updateSettingsTimer = v5->_updateSettingsTimer;
  v5->_updateSettingsTimer = v10;

  double v12 = +[AXCaptionPreviewView cloudImages];
  if ((unint64_t)[v12 count] < 2)
  {
    v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    cloudView1 = v5->_cloudView1;
    v5->_cloudView1 = v21;

    v23 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    cloudView2 = v5->_cloudView2;
    v5->_cloudView2 = v23;
  }
  else
  {
    id v13 = objc_alloc((Class)UIImageView);
    long long v14 = [v12 objectAtIndex:0];
    long long v15 = (UIImageView *)[v13 initWithImage:v14];
    long long v16 = v5->_cloudView1;
    v5->_cloudView1 = v15;

    id v17 = objc_alloc((Class)UIImageView);
    cloudView2 = [v12 objectAtIndex:1];
    double v19 = (UIImageView *)[v17 initWithImage:cloudView2];
    double v20 = v5->_cloudView2;
    v5->_cloudView2 = v19;
  }
  [(UIImageView *)v5->_cloudView1 setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)v5->_cloudView2 setAccessibilityIgnoresInvertColors:1];
  v24 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, width, height);
  cloudContainer = v5->_cloudContainer;
  v5->_cloudContainer = v24;

  [(UIView *)v5->_cloudContainer setClipsToBounds:1];
  [(UIView *)v5->_cloudContainer addSubview:v5->_cloudView1];
  [(UIView *)v5->_cloudContainer addSubview:v5->_cloudView2];
  [(UIView *)v5->_cloudContainer setIsAccessibilityElement:1];
  v26 = settingsLocString(@"subtitle.preview.label.spoken", @"Captioning");
  [(UIView *)v5->_cloudContainer setAccessibilityLabel:v26];

  [(UIView *)v5->_cloudContainer setAccessibilityTraits:UIAccessibilityTraitImage];
  [(AXCaptionPreviewView *)v5 addSubview:v5->_cloudContainer];
  v27 = [AXCaptionSubtitlePreviewView alloc];
  double y = CGRectZero.origin.y;
  double v29 = CGRectZero.size.width;
  double v30 = CGRectZero.size.height;
  v31 = -[AXCaptionSubtitlePreviewView initWithFrame:](v27, "initWithFrame:", CGRectZero.origin.x, y, v29, v30);
  subtitle = v5->_subtitle;
  v5->_subtitle = v31;

  v33 = settingsLocString(@"SAMPLE_CAPTION_TEXT", @"Captioning");
  [(AXCaptionSubtitlePreviewView *)v5->_subtitle setText:v33];

  [(AXCaptionPreviewView *)v5 addSubview:v5->_subtitle];
  v34 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, v29, v30);
  whiteBottomBorder = v5->_whiteBottomBorder;
  v5->_whiteBottomBorder = v34;

  v36 = +[UIColor whiteColor];
  v37 = [v36 colorWithAlphaComponent:0.3];
  [(UIView *)v5->_whiteBottomBorder setBackgroundColor:v37];

  [(AXCaptionPreviewView *)v5 addSubview:v5->_whiteBottomBorder];
  uint64_t v38 = +[UIButton buttonWithType:0];
  expandCollapseButton = v5->_expandCollapseButton;
  v5->_expandCollapseButton = (UIButton *)v38;

  [(UIButton *)v5->_expandCollapseButton addTarget:v5 action:"_expandPressed:" forControlEvents:64];
  [(AXCaptionPreviewView *)v5 addSubview:v5->_expandCollapseButton];
  [(AXCaptionPreviewView *)v5 _updateButtonStyle];
  v40 = settingsLocString(@"enlarge.caption.button", @"Captioning");
  [(UIButton *)v5->_expandCollapseButton setAccessibilityLabel:v40];

  uint64_t v41 = +[NSTimer scheduledTimerWithTimeInterval:v5 target:"showNextImage" selector:0 userInfo:1 repeats:5.0];
  cloudTimer = v5->_cloudTimer;
  v5->_cloudTimer = (NSTimer *)v41;

  v44 = v5;
  AXPerformBlockAsynchronouslyOnMainThread();

  return v44;
}

id __38__AXCaptionPreviewView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) fire];
}

- (void)dealloc
{
  [(AXCaptionPreviewView *)self stopBackgroundAnimation];
  v3.receiver = self;
  v3.super_class = (Class)AXCaptionPreviewView;
  [(AXCaptionPreviewView *)&v3 dealloc];
}

- (id)enclosingViewController
{
  id v2 = self;
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(AXCaptionPreviewView *)v2 nextResponder];

      id v2 = (AXCaptionPreviewView *)v3;
    }
    while (v3);
  }

  return v2;
}

- (void)updateExpandButtonPosition
{
  [(AXCaptionPreviewView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(AXCaptionPreviewView *)self enclosingViewController];
  id v43 = v11;
  if (v11)
  {
    double v12 = [v11 view];
    id v13 = [v43 view];
  }
  else
  {
    long long v14 = [(AXCaptionPreviewView *)self window];

    CGFloat v15 = v10;
    CGFloat v16 = v8;
    CGFloat v17 = v6;
    CGFloat v18 = v4;
    if (!v14) {
      goto LABEL_6;
    }
    double v12 = [(AXCaptionPreviewView *)self window];
    id v13 = [(AXCaptionPreviewView *)self window];
  }
  double v19 = v13;
  double v20 = [v13 safeAreaLayoutGuide];
  [v20 layoutFrame];
  objc_msgSend(v12, "convertRect:toView:", self);
  CGFloat v18 = v21;
  CGFloat v17 = v22;
  CGFloat v16 = v23;
  CGFloat v15 = v24;

LABEL_6:
  v45.origin.double x = v4;
  v45.origin.CGFloat y = v6;
  v45.size.double width = v8;
  v45.size.CGFloat height = v10;
  v49.origin.double x = v18;
  v49.origin.CGFloat y = v17;
  v49.size.double width = v16;
  v49.size.CGFloat height = v15;
  CGRect v46 = CGRectIntersection(v45, v49);
  double x = v46.origin.x;
  CGFloat y = v46.origin.y;
  double width = v46.size.width;
  CGFloat height = v46.size.height;
  double v29 = [(AXCaptionPreviewView *)self superview];
  double v30 = 0;
  if (v29)
  {
    do
    {
      AXSafeClassFromString();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v29;

        double v30 = v31;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      uint64_t v32 = [v29 superview];

      double v29 = (void *)v32;
    }
    while (v32);
    if (v30)
    {
      [v30 frame];
      v50.origin.double x = v33;
      v50.origin.CGFloat y = v34;
      v50.size.double width = v35;
      v50.size.CGFloat height = v36;
      v47.origin.double x = x;
      v47.origin.CGFloat y = y;
      v47.size.double width = width;
      v47.size.CGFloat height = height;
      CGRect v48 = CGRectIntersection(v47, v50);
      double x = v48.origin.x;
      double width = v48.size.width;
    }
  }
  [(UIButton *)self->_expandCollapseButton frame];
  double v38 = v37;
  double v40 = v39;
  double v41 = width + x - v37 + -5.0;
  [(AXCaptionPreviewView *)self bounds];
  -[UIButton setFrame:](self->_expandCollapseButton, "setFrame:", v41, v42 - v40 + -5.0, v38, v40);
}

- (void)layoutSubviews
{
  [(AXCaptionPreviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(AXCaptionPreviewView *)self updateExpandButtonPosition];
  [(AXCaptionPreviewView *)self visibleFrame];
  -[AXCaptionSubtitlePreviewView setFrame:](self->_subtitle, "setFrame:");
  [(AXCaptionSubtitlePreviewView *)self->_subtitle update];
  -[UIView setFrame:](self->_whiteBottomBorder, "setFrame:", v4, v8, v6, 1.0);
  [(AXCaptionPreviewView *)self bounds];
  -[UIView setFrame:](self->_cloudContainer, "setFrame:");
  if ([(AXCaptionPreviewView *)self transitioningToBiggerView])
  {
    [(AXCaptionPreviewView *)self visibleFrame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(AXCaptionPreviewView *)self visibleFrame];
    CGFloat v18 = v17 * -0.1;
    [(AXCaptionPreviewView *)self visibleFrame];
    CGFloat v20 = v19 * -0.1;
    v41.origin.double x = v10;
    v41.origin.double y = v12;
    v41.size.double width = v14;
    v41.size.double height = v16;
    CGRect v42 = CGRectInset(v41, v18, v20);
    double x = v42.origin.x;
    double y = v42.origin.y;
    double width = v42.size.width;
    double height = v42.size.height;
    -[UIImageView setFrame:](self->_cloudView1, "setFrame:");
    cloudView2 = self->_cloudView2;
    -[UIImageView setFrame:](cloudView2, "setFrame:", x, y, width, height);
  }
  else
  {
    [(AXCaptionPreviewView *)self _xOffset];
    double v27 = v26;
    v28 = [(UIImageView *)self->_cloudView1 image];
    [v28 size];
    double v30 = v29 * 1.2;
    id v31 = [(UIImageView *)self->_cloudView1 image];
    [v31 size];
    -[UIImageView setFrame:](self->_cloudView1, "setFrame:", v27, 0.0, v30, v32 * 1.1);

    [(AXCaptionPreviewView *)self _xOffset];
    double v34 = v33;
    id v39 = [(UIImageView *)self->_cloudView2 image];
    [v39 size];
    double v36 = v35 * 1.2;
    double v37 = [(UIImageView *)self->_cloudView2 image];
    [v37 size];
    -[UIImageView setFrame:](self->_cloudView2, "setFrame:", v34, 0.0, v36, v38 * 1.1);
  }
}

- (void)_expandPressed:(id)a3
{
  id v3 = [(AXCaptionPreviewView *)self previewDelegate];
  [v3 captionPreviewWasTapped:1];
}

- (void)stopBackgroundAnimation
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(AXThreadTimer *)self->_updateSettingsTimer cancel];
  updateSettingsTimer = self->_updateSettingsTimer;
  self->_updateSettingsTimer = 0;

  [(NSTimer *)self->_cloudTimer invalidate];
  cloudTimer = self->_cloudTimer;
  self->_cloudTimer = 0;
}

- (void)_updateButtonStyle
{
  id v21 = +[NSBundle bundleForClass:objc_opt_class()];
  if ([(AXCaptionPreviewView *)self isExpanded])
  {
    contractImage = self->_contractImage;
    if (!contractImage)
    {
      double v4 = +[UIImage imageNamed:@"contract" inBundle:v21];
      double v5 = self->_contractImage;
      self->_contractImage = v4;

      contractImage = self->_contractImage;
    }
    [(UIButton *)self->_expandCollapseButton setImage:contractImage forState:0];
    p_contractPressedImage = &self->_contractPressedImage;
    contractPressedImage = self->_contractPressedImage;
    double v8 = @"shrink.caption.button";
    if (!contractPressedImage)
    {
      CFStringRef v9 = @"contract_pressed";
LABEL_10:
      uint64_t v13 = +[UIImage imageNamed:v9 inBundle:v21];
      CGFloat v14 = *p_contractPressedImage;
      *p_contractPressedImage = (UIImage *)v13;

      contractPressedImage = *p_contractPressedImage;
    }
  }
  else
  {
    expandImage = self->_expandImage;
    if (!expandImage)
    {
      double v11 = +[UIImage imageNamed:@"expand" inBundle:v21];
      CGFloat v12 = self->_expandImage;
      self->_expandImage = v11;

      expandImage = self->_expandImage;
    }
    [(UIButton *)self->_expandCollapseButton setImage:expandImage forState:0];
    p_contractPressedImage = &self->_expandPressedImage;
    contractPressedImage = self->_expandPressedImage;
    double v8 = @"enlarge.caption.button";
    if (!contractPressedImage)
    {
      CFStringRef v9 = @"expand_pressed";
      goto LABEL_10;
    }
  }
  [(UIButton *)self->_expandCollapseButton setImage:contractPressedImage forState:1];
  double v15 = settingsLocString(v8, @"Captioning");
  [(UIButton *)self->_expandCollapseButton setAccessibilityLabel:v15];

  CGFloat v16 = [(UIButton *)self->_expandCollapseButton imageForState:0];
  [v16 size];
  double v18 = v17;
  double v20 = v19;

  -[UIButton setBounds:](self->_expandCollapseButton, "setBounds:", 0.0, 0.0, v18, v20);
}

- (id)nextSlide
{
  int64_t v2 = self->_viewIndex + 1;
  self->_viewIndedouble x = v2;
  id v3 = &OBJC_IVAR___AXCaptionPreviewView__cloudView2;
  if ((v2 & 1) == 0) {
    id v3 = &OBJC_IVAR___AXCaptionPreviewView__cloudView1;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v3);
}

- (id)currentSlide
{
  if (self->_viewIndex) {
    int64_t v2 = &OBJC_IVAR___AXCaptionPreviewView__cloudView1;
  }
  else {
    int64_t v2 = &OBJC_IVAR___AXCaptionPreviewView__cloudView2;
  }
  return *(id *)((char *)&self->super.super.super.super.isa + *v2);
}

- (void)showNextImage
{
  int64_t v3 = self->_cloudIndex + 1;
  double v4 = +[AXCaptionPreviewView cloudImages];
  self->_cloudIndedouble x = v3 % (int)[v4 count];

  double v5 = [(AXCaptionPreviewView *)self nextSlide];
  double v6 = [(AXCaptionPreviewView *)self currentSlide];
  double v7 = +[AXCaptionPreviewView cloudImages];
  id v8 = [v7 count];
  cloudIndedouble x = self->_cloudIndex;

  if ((unint64_t)v8 > cloudIndex)
  {
    CGFloat v10 = +[AXCaptionPreviewView cloudImages];
    double v11 = [v10 objectAtIndex:self->_cloudIndex];
    [v5 setImage:v11];
  }
  [v5 setAlpha:1.0];
  CGFloat v12 = [v5 image];
  uint64_t v13 = [v6 image];

  if (v12 == v13)
  {
    __37__AXCaptionPreviewView_showNextImage__block_invoke(v14, v5, v6);
  }
  else
  {
    [(AXCaptionPreviewView *)self _xOffset];
    double v16 = v15;
    [v5 frame];
    double v18 = v17;
    [v5 frame];
    double v20 = v19;
    [v5 frame];
    objc_msgSend(v5, "setFrame:", v16, v18, v20);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __37__AXCaptionPreviewView_showNextImage__block_invoke_3;
    v25[3] = &unk_2087C0;
    id v26 = v5;
    +[UIView animateWithDuration:v25 animations:4.9];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __37__AXCaptionPreviewView_showNextImage__block_invoke_4;
    v23[3] = &unk_2087C0;
    id v24 = v6;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __37__AXCaptionPreviewView_showNextImage__block_invoke_5;
    v21[3] = &unk_20BFC0;
    v21[4] = self;
    id v22 = v24;
    +[UIView animateWithDuration:v23 animations:v21 completion:1.0];
  }
}

void __37__AXCaptionPreviewView_showNextImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = [v4 image];
  if (v6 && ([v4 alpha], v7 > 0.0))
  {
  }
  else
  {
    uint64_t v8 = [v5 image];
    if (v8)
    {
      CFStringRef v9 = (void *)v8;
      [v5 alpha];
      double v11 = v10;

      if (v11 > 0.0) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [v4 setAlpha:0.0];
    [v5 setAlpha:0.0];
    CGFloat v12 = +[AXCaptionPreviewView cloudImages];
    uint64_t v13 = [v12 firstObject];
    [v4 setImage:v13];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __37__AXCaptionPreviewView_showNextImage__block_invoke_2;
    v14[3] = &unk_2087C0;
    id v15 = v4;
    +[UIView animateWithDuration:v14 animations:1.0];
  }
LABEL_9:
}

id __37__AXCaptionPreviewView_showNextImage__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id __37__AXCaptionPreviewView_showNextImage__block_invoke_3(uint64_t a1)
{
  double v2 = (double)(rand() % 20);
  memset(&v9.c, 0, 32);
  if (rand()) {
    double v3 = v2;
  }
  else {
    double v3 = -v2;
  }
  *(_OWORD *)&v9.a = 0uLL;
  CGAffineTransformMakeTranslation(&v9, 0.0, v3);
  CGAffineTransform v7 = v9;
  CGAffineTransformScale(&v8, &v7, 1.08000004, 1.08000004);
  id v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  return [v4 setTransform:&v6];
}

id __37__AXCaptionPreviewView_showNextImage__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id __37__AXCaptionPreviewView_showNextImage__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) sendSubviewToBack:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v2 setTransform:v5];
}

- (AXCaptionPreviewDelegate)previewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->previewDelegate);

  return (AXCaptionPreviewDelegate *)WeakRetained;
}

- (void)setPreviewDelegate:(id)a3
{
}

- (CGRect)originalFrame
{
  double x = self->originalFrame.origin.x;
  double y = self->originalFrame.origin.y;
  double width = self->originalFrame.size.width;
  double height = self->originalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->originalFrame = a3;
}

- (CGPoint)originalCenter
{
  double x = self->originalCenter.x;
  double y = self->originalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->originalCenter = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)transitioningToSmallerView
{
  return self->transitioningToSmallerView;
}

- (void)setTransitioningToSmallerView:(BOOL)a3
{
  self->transitioningToSmallerView = a3;
}

- (BOOL)transitioningToBiggerView
{
  return self->transitioningToBiggerView;
}

- (void)setTransitioningToBiggerView:(BOOL)a3
{
  self->transitioningToBiggerView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->previewDelegate);
  objc_storeStrong((id *)&self->_updateSettingsTimer, 0);
  objc_storeStrong((id *)&self->_expandPressedImage, 0);
  objc_storeStrong((id *)&self->_expandImage, 0);
  objc_storeStrong((id *)&self->_contractPressedImage, 0);
  objc_storeStrong((id *)&self->_contractImage, 0);
  objc_storeStrong((id *)&self->_cloudTimer, 0);
  objc_storeStrong((id *)&self->_cloudView2, 0);
  objc_storeStrong((id *)&self->_cloudView1, 0);
  objc_storeStrong((id *)&self->_cloudContainer, 0);
  objc_storeStrong((id *)&self->_expandCollapseButton, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_whiteBottomBorder, 0);
}

@end