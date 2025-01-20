@interface AMSUIMessageView
- (AMSDialogAction)bodyAction;
- (AMSUICommonButton)debugButton;
- (AMSUICommonImageView)imageView;
- (AMSUICommonTextView)textView;
- (AMSUICommonVisualEffectView)backgroundVisualEffectView;
- (AMSUIMessageView)initWithStyle:(unint64_t)a3;
- (AMSUIMessageViewLayoutContext)layoutContext;
- (AMSUIPopoverShapeLayerView)maskShapeView;
- (BOOL)_layoutHeightDependsOnWidth;
- (BOOL)canBecomeFocused;
- (BOOL)isImageSymbolImage;
- (BOOL)isSizing;
- (BOOL)preLayoutImageView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MicaPlayer)micaPlayer;
- (NSArray)ams_accessibilitySupplementaryFooterViews;
- (NSArray)footerButtonViews;
- (NSArray)separatorViews;
- (NSAttributedString)message;
- (NSAttributedString)title;
- (UIColor)iconColor;
- (UIColor)separatorColor;
- (UIImageView)backgroundImageView;
- (UIScrollView)containerView;
- (UIView)accessorySecondaryView;
- (UIView)accessoryView;
- (UIView)imageContainerView;
- (double)_textViewParagraphSpacingBefore;
- (id)_makeSeparatorView;
- (id)focusItemsInRect:(CGRect)a3;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (unint64_t)imageStyle;
- (unint64_t)style;
- (void)_endObservations;
- (void)_recordNewsDebugEventWithCategory:(id)a3;
- (void)_setAccessibility;
- (void)_setAccessibilityIdentifier;
- (void)_setBackground;
- (void)_setMICAPlayerTintColor:(id)a3;
- (void)_setShadow;
- (void)_setTextAlignment;
- (void)_setTextViewText;
- (void)_setupDefaults;
- (void)_setupImageView;
- (void)_setupImageViewDefault;
- (void)_setupInitialLayout;
- (void)_setupMICAAssetWithData:(id)a3 originalURL:(id)a4;
- (void)_startObservations;
- (void)_syncRectsFromContext;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeBubbleArrowMaskView;
- (void)setAccessorySecondaryView:(id)a3;
- (void)setAccessorySecondaryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setAms_accessibilitySupplementaryFooterViews:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setBodyDialogAction:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setContainerView:(id)a3;
- (void)setDebugButton:(id)a3;
- (void)setFooterButtonViews:(id)a3;
- (void)setFooterForDialogActions:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setIconColor:(id)a3;
- (void)setImageContainerView:(id)a3;
- (void)setImageStyle:(unint64_t)a3;
- (void)setIsImageSymbolImage:(BOOL)a3;
- (void)setIsSizing:(BOOL)a3;
- (void)setLayoutContext:(id)a3;
- (void)setMaskShapeView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMicaPlayer:(id)a3;
- (void)setNeedsLayout;
- (void)setPreLayoutImageView:(BOOL)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setupBubbleArrowMaskView;
- (void)setupDebugButtonWithTarget:(id)a3 action:(SEL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AMSUIMessageView

- (AMSUIMessageView)initWithStyle:(unint64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)AMSUIMessageView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[AMSUICommonView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    [(AMSUIMessageView *)v8 setPreservesSuperviewLayoutMargins:0];
    v9->_imageStyle = 0;
    v9->_style = a3;
    if (os_variant_has_internal_content()
      && ([MEMORY[0x263F27EF8] isRunningUnitTests] & 1) == 0)
    {
      v10 = -[AMSUICommonButton initWithFrame:]([AMSUICommonButton alloc], "initWithFrame:", v4, v5, v6, v7);
      debugButton = v9->_debugButton;
      v9->_debugButton = v10;
    }
    v12 = objc_alloc_init(AMSUICommonVisualEffectView);
    backgroundVisualEffectView = v9->_backgroundVisualEffectView;
    v9->_backgroundVisualEffectView = v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82B88]), "initWithFrame:", v4, v5, v6, v7);
    containerView = v9->_containerView;
    v9->_containerView = (UIScrollView *)v14;

    v16 = -[AMSUICommonImageView initWithFrame:]([AMSUICommonImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    backgroundImageView = v9->_backgroundImageView;
    v9->_backgroundImageView = &v16->super;

    v18 = -[AMSUICommonImageView initWithFrame:]([AMSUICommonImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    imageView = v9->_imageView;
    v9->_imageView = v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v4, v5, v6, v7);
    imageContainerView = v9->_imageContainerView;
    v9->_imageContainerView = (UIView *)v20;

    v9->_isImageSymbolImage = 0;
    separatorViews = v9->_separatorViews;
    v9->_separatorViews = (NSArray *)MEMORY[0x263EFFA68];

    v23 = [[AMSUIMessageViewLayoutContext alloc] initWithMessageView:v9];
    layoutContext = v9->_layoutContext;
    v9->_layoutContext = v23;

    v25 = -[AMSUICommonTextView initWithFrame:]([AMSUICommonTextView alloc], "initWithFrame:", v4, v5, v6, v7);
    textView = v9->_textView;
    v9->_textView = v25;

    [(AMSUIMessageView *)v9 _setupInitialLayout];
    [(AMSUIMessageView *)v9 _setupDefaults];
    [(AMSUIMessageView *)v9 _startObservations];
  }
  return v9;
}

- (void)dealloc
{
  [(AMSUIMessageView *)self _endObservations];
  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageView;
  [(AMSUIMessageView *)&v3 dealloc];
}

- (void)didMoveToSuperview
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIMessageView;
  [(AMSUIMessageView *)&v6 didMoveToSuperview];
  objc_super v3 = NSString;
  double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AMSUIMessageView style](self, "style"));
  double v5 = [v3 stringWithFormat:@"%@ didMoveToSuperview", v4];
  [(AMSUIMessageView *)self _recordNewsDebugEventWithCategory:v5];
}

- (void)_recordNewsDebugEventWithCategory:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = [MEMORY[0x263F27E08] currentProcess];
  double v5 = [v4 bundleIdentifier];

  if (os_variant_has_internal_content())
  {
    objc_super v6 = [v5 lowercaseString];
    int v7 = [v6 isEqualToString:@"com.apple.news"];

    if (v7)
    {
      v8 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v8)
      {
        v8 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = objc_opt_class();
        v11 = AMSLogKey();
        int v15 = 138543618;
        uint64_t v16 = v10;
        __int16 v17 = 2114;
        v18 = v11;
        _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Recording debug event for news", (uint8_t *)&v15, 0x16u);
      }
      v12 = (void *)[objc_alloc(MEMORY[0x263F27D68]) initWithSubsystem:@"MessagingUI" category:v3 error:0];
      [v12 setClientApp:v5];
      v13 = [MEMORY[0x263F27B28] bagForProfile:@"AppleNews" profileVersion:@"1"];
      uint64_t v14 = [MEMORY[0x263F27D40] internalInstanceUsingBag:v13];
      [v14 enqueueEvent:v12];
    }
  }
}

- (void)_setupDefaults
{
  id v3 = [(AMSUIMessageView *)self containerView];
  [v3 setClipsToBounds:1];

  double v4 = [(AMSUIMessageView *)self containerView];
  [v4 setContentInsetAdjustmentBehavior:2];

  [(AMSUIMessageView *)self _setBackground];
  [(AMSUIMessageView *)self _setupImageViewDefault];
  [(AMSUIMessageView *)self _setupImageView];
  [(AMSUIMessageView *)self _setAccessibilityIdentifier];
  double v5 = [(AMSUIMessageView *)self textView];
  [v5 setDataDetectorTypes:0];

  objc_super v6 = [(AMSUIMessageView *)self textView];
  [v6 setEditable:0];

  int v7 = [(AMSUIMessageView *)self textView];
  [v7 setScrollEnabled:0];

  v8 = [(AMSUIMessageView *)self textView];
  [v8 setShowsHorizontalScrollIndicator:0];

  v9 = [(AMSUIMessageView *)self textView];
  [v9 setShowsVerticalScrollIndicator:0];

  uint64_t v10 = [(AMSUIMessageView *)self textView];
  [v10 setAdjustsFontForContentSizeCategory:1];

  v11 = [MEMORY[0x263F825C8] clearColor];
  v12 = [(AMSUIMessageView *)self textView];
  [v12 setBackgroundColor:v11];

  v13 = [(AMSUIMessageView *)self textView];
  uint64_t v14 = [v13 textContainer];
  [v14 setLineFragmentPadding:0.0];

  int v15 = [(AMSUIMessageView *)self textView];
  uint64_t v16 = [v15 textContainer];
  [v16 setLineBreakMode:4];

  __int16 v17 = [(AMSUIMessageView *)self textView];
  [v17 setUserInteractionEnabled:0];

  v18 = [(AMSUIMessageView *)self textView];
  [v18 textContainerInset];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = [(AMSUIMessageView *)self textView];
  objc_msgSend(v25, "setTextContainerInset:", v20, 1.0, v22, v24);

  v26 = [(AMSUIMessageView *)self backgroundImageView];
  [v26 setClipsToBounds:1];

  id v27 = +[AMSUIAppearance _defaultSeparatorColor];
  [(AMSUIMessageView *)self setSeparatorColor:v27];
}

- (void)_setupInitialLayout
{
  id v3 = [(AMSUIMessageView *)self imageContainerView];
  double v4 = [(AMSUIMessageView *)self imageView];
  [v3 addSubview:v4];

  double v5 = [(AMSUIMessageView *)self containerView];
  objc_super v6 = [(AMSUIMessageView *)self imageContainerView];
  [v5 addSubview:v6];

  int v7 = [(AMSUIMessageView *)self containerView];
  v8 = [(AMSUIMessageView *)self textView];
  [v7 addSubview:v8];

  v9 = [(AMSUIMessageView *)self backgroundImageView];
  [(AMSUIMessageView *)self addSubview:v9];

  uint64_t v10 = [(AMSUIMessageView *)self backgroundVisualEffectView];
  v11 = [v10 contentView];
  v12 = [(AMSUIMessageView *)self containerView];
  [v11 addSubview:v12];

  id v13 = [(AMSUIMessageView *)self backgroundVisualEffectView];
  [(AMSUIMessageView *)self addSubview:v13];
}

- (void)setupDebugButtonWithTarget:(id)a3 action:(SEL)a4
{
  objc_super v6 = (void *)MEMORY[0x263F82818];
  id v7 = a3;
  id v35 = [v6 configurationWithPointSize:14.0];
  v8 = [(AMSUIMessageView *)self debugButton];
  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"ant.fill" withConfiguration:v35];
  [v8 setImage:v9 forState:0];

  uint64_t v10 = [(AMSUIMessageView *)self debugButton];
  [v10 setTitle:0 forState:0];

  v11 = [MEMORY[0x263F825C8] lightGrayColor];
  v12 = [(AMSUIMessageView *)self debugButton];
  [v12 setTintColor:v11];

  id v13 = [(AMSUIMessageView *)self debugButton];
  [v13 sizeToFit];

  uint64_t v14 = [(AMSUIMessageView *)self debugButton];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(AMSUIMessageView *)self debugButton];
  objc_msgSend(v23, "setFrame:", v16, v18, v20 + 8.0, v22 + 8.0);

  double v24 = [(AMSUIMessageView *)self debugButton];
  [v24 setContentHorizontalAlignment:1];

  v25 = [(AMSUIMessageView *)self debugButton];
  [v25 setContentVerticalAlignment:1];

  v26 = [(AMSUIMessageView *)self debugButton];
  [v26 addTarget:v7 action:a4 forControlEvents:64];

  id v27 = [(AMSUIMessageView *)self debugButton];
  [v27 frame];
  double v29 = v28;
  double v31 = v30;
  v32 = [(AMSUIMessageView *)self layoutContext];
  objc_msgSend(v32, "setDebugButtonSize:", v29, v31);

  v33 = [(AMSUIMessageView *)self containerView];
  v34 = [(AMSUIMessageView *)self debugButton];
  [v33 addSubview:v34];
}

- (void)_setShadow
{
  if ([(AMSUIMessageView *)self style] == 4)
  {
    id v3 = [(AMSUIMessageView *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 2) {
      [MEMORY[0x263F825C8] systemGray4Color];
    }
    else {
    id v5 = [MEMORY[0x263F825C8] blackColor];
    }
    uint64_t v6 = [v5 CGColor];
    id v7 = [(AMSUIMessageView *)self layer];
    [v7 setShadowColor:v6];

    v8 = [(AMSUIMessageView *)self traitCollection];
    [v8 displayScale];
    double v10 = 100.0 / v9;
    v11 = [(AMSUIMessageView *)self layer];
    [v11 setShadowRadius:v10];

    v12 = [(AMSUIMessageView *)self layer];
    LODWORD(v13) = 1050253722;
    [v12 setShadowOpacity:v13];

    uint64_t v14 = [(AMSUIMessageView *)self layer];
    objc_msgSend(v14, "setShadowOffset:", 0.0, 10.0);

    double v15 = [(AMSUIMessageView *)self layer];
    [v15 setMasksToBounds:0];

    id v16 = [(AMSUIMessageView *)self layer];
    [v16 setShadowPath:0];
  }
}

- (void)_setupMICAAssetWithData:(id)a3 originalURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AMSUIMessageView *)self traitCollection];
  [v8 displayScale];
  double v10 = v9;

  v11 = [[MicaPlayer alloc] initWithData:v7 url:v6 retinaScale:v10];
  [(AMSUIMessageView *)self setMicaPlayer:v11];

  v12 = [(AMSUIMessageView *)self iconColor];

  if (v12)
  {
    double v13 = [(AMSUIMessageView *)self iconColor];
    [(AMSUIMessageView *)self _setMICAPlayerTintColor:v13];
  }
  uint64_t v14 = [(AMSUIMessageView *)self micaPlayer];
  double v15 = [(AMSUIMessageView *)self imageContainerView];
  id v16 = [v15 layer];
  [v14 addToLayer:v16 onTop:0 gravity:*MEMORY[0x263F15E20]];

  [(AMSUIMessageView *)self setNeedsLayout];
  id v17 = [(AMSUIMessageView *)self micaPlayer];
  [v17 setLoopDuringPlayback:1];
}

- (void)_setBackground
{
  id v3 = [(AMSUIMessageView *)self maskShapeView];
  if (!v3)
  {
    if (![(AMSUIMessageView *)self style]) {
      goto LABEL_5;
    }
    [(AMSUIMessageView *)self _setContinuousCornerRadius:10.0];
    [(AMSUIMessageView *)self _continuousCornerRadius];
    double v5 = v4;
    id v6 = [(AMSUIMessageView *)self backgroundImageView];
    [v6 _setContinuousCornerRadius:v5];

    [(AMSUIMessageView *)self _continuousCornerRadius];
    double v8 = v7;
    id v3 = [(AMSUIMessageView *)self backgroundVisualEffectView];
    [v3 _setContinuousCornerRadius:v8];
  }

LABEL_5:
  unint64_t v9 = [(AMSUIMessageView *)self style];
  id v11 = [(AMSUIMessageView *)self traitCollection];
  double v10 = +[AMSUIAppearance _defaultBackgroundColorForStyle:v9 withTraitCollection:v11];
  [(AMSUIMessageView *)self setBackgroundColor:v10];
}

- (void)_setupImageView
{
  id v3 = [MEMORY[0x263F825C8] clearColor];
  double v4 = [(AMSUIMessageView *)self imageContainerView];
  [v4 setBackgroundColor:v3];

  if ([(AMSUIMessageView *)self isImageSymbolImage]
    || ([(AMSUIMessageView *)self imageView],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 image],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isSymbolImage],
        v6,
        v5,
        v7))
  {
    double v8 = [(AMSUIMessageView *)self imageView];
    unint64_t v9 = v8;
    uint64_t v10 = 4;
  }
  else
  {
    double v8 = [(AMSUIMessageView *)self imageView];
    unint64_t v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setContentMode:v10];

  if ([(AMSUIMessageView *)self style])
  {
    if ([(AMSUIMessageView *)self style] == 4)
    {
      id v11 = [(AMSUIMessageView *)self imageView];
      [v11 _setContinuousCornerRadius:6.0];

      if ([(AMSUIMessageView *)self isImageSymbolImage]
        || ([(AMSUIMessageView *)self imageView],
            v12 = objc_claimAutoreleasedReturnValue(),
            [v12 image],
            double v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 isSymbolImage],
            v13,
            v12,
            (v14 & 1) != 0))
      {
        double v15 = [(AMSUIMessageView *)self imageView];
        id v16 = [v15 layer];
        [v16 setBorderWidth:0.0];

        id v17 = [(AMSUIMessageView *)self imageContainerView];
        double v18 = [v17 layer];
        [v18 setShadowColor:0];

        double v19 = [(AMSUIMessageView *)self imageContainerView];
        double v20 = [v19 layer];
        [v20 setShadowOpacity:0.0];

        double v21 = [(AMSUIMessageView *)self imageContainerView];
        double v22 = [v21 layer];
        [v22 setShadowPath:0];
      }
      else
      {
        id v27 = [(AMSUIMessageView *)self traitCollection];
        uint64_t v28 = [v27 userInterfaceStyle];

        if (v28 == 2) {
          [MEMORY[0x263F825C8] whiteColor];
        }
        else {
        double v21 = [MEMORY[0x263F825C8] blackColor];
        }
        id v29 = [v21 colorWithAlphaComponent:0.1];
        uint64_t v30 = [v29 CGColor];
        double v31 = [(AMSUIMessageView *)self imageView];
        v32 = [v31 layer];
        [v32 setBorderColor:v30];

        v33 = [(AMSUIMessageView *)self imageView];
        v34 = [v33 layer];
        [v34 setBorderWidth:0.5];

        id v35 = [MEMORY[0x263F825C8] blackColor];
        uint64_t v36 = [v35 CGColor];
        v37 = [(AMSUIMessageView *)self imageContainerView];
        v38 = [v37 layer];
        [v38 setShadowColor:v36];

        v39 = [(AMSUIMessageView *)self traitCollection];
        [v39 displayScale];
        double v41 = 5.0 / v40;
        v42 = [(AMSUIMessageView *)self imageContainerView];
        v43 = [v42 layer];
        [v43 setShadowRadius:v41];

        v44 = [(AMSUIMessageView *)self imageContainerView];
        v45 = [v44 layer];
        objc_msgSend(v45, "setShadowOffset:", 0.0, 2.0);

        v46 = [(AMSUIMessageView *)self imageContainerView];
        v47 = [v46 layer];
        LODWORD(v48) = 1050253722;
        [v47 setShadowOpacity:v48];

        v49 = [(AMSUIMessageView *)self imageContainerView];
        v50 = [v49 layer];
        [v50 setMasksToBounds:0];

        double v22 = [(AMSUIMessageView *)self imageContainerView];
        v51 = [v22 layer];
        [v51 setShadowPath:0];
      }
    }
    else
    {
      if ([(AMSUIMessageView *)self style] == 5)
      {
        double v23 = [(AMSUIMessageView *)self imageView];
        double v21 = v23;
        double v24 = 4.0;
      }
      else
      {
        if ([(AMSUIMessageView *)self imageStyle] != 2) {
          goto LABEL_24;
        }
        v25 = [(AMSUIMessageView *)self traitCollection];
        uint64_t v26 = [v25 userInterfaceIdiom];

        double v23 = [(AMSUIMessageView *)self imageView];
        double v21 = v23;
        if (v26 == 5) {
          double v24 = 4.0;
        }
        else {
          double v24 = 6.0;
        }
      }
      [v23 _setContinuousCornerRadius:v24];
    }
  }
  else
  {
    double v21 = [(AMSUIMessageView *)self imageView];
    [v21 setContentMode:4];
  }

LABEL_24:
  if (![(AMSUIMessageView *)self style])
  {
    v52 = [(AMSUIMessageView *)self imageView];
    [v52 _setOverrideUserInterfaceRenderingMode:1];
  }
  v53 = [(AMSUIMessageView *)self imageView];
  v54 = [v53 layer];
  [v54 setMasksToBounds:1];

  v55 = [(AMSUIMessageView *)self imageView];
  v56 = [v55 image];

  if (v56)
  {
    v57 = [(AMSUIMessageView *)self imageView];
    id v70 = [v57 image];

    v58 = [(AMSUIMessageView *)self imageView];
    v59 = [v58 image];
    [v59 size];
    double v61 = v60;
    double v63 = v62;

    v64 = [(AMSUIMessageView *)self imageView];
    [v64 frame];
    double v66 = v65;
    double v68 = v67;

    if (v61 / v63 * v68 > v66)
    {
      v69 = [(AMSUIMessageView *)self imageView];
      [v69 setContentMode:1];
    }
  }
}

- (void)_setupImageViewDefault
{
  id v4 = +[AMSUIAppearance _defaultImageViewColorForStyle:[(AMSUIMessageView *)self style]];
  if (v4)
  {
    id v3 = [(AMSUIMessageView *)self imageView];
    [v3 setTintColor:v4];
  }
}

- (void)_setAccessibility
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(AMSUIMessageView *)self accessoryView];

  if (v4)
  {
    double v5 = [(AMSUIMessageView *)self accessoryView];
    [v3 addObject:v5];
  }
  id v6 = [(AMSUIMessageView *)self accessorySecondaryView];

  if (v6)
  {
    int v7 = [(AMSUIMessageView *)self accessorySecondaryView];
    [v3 addObject:v7];
  }
  double v8 = [(AMSUIMessageView *)self footerButtonViews];

  if (v8)
  {
    unint64_t v9 = [(AMSUIMessageView *)self footerButtonViews];
    [v3 addObjectsFromArray:v9];
  }
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  id v11 = [(AMSUIMessageView *)self imageView];
  uint64_t v12 = [v11 image];
  if (v12)
  {
    double v13 = (void *)v12;
    char v14 = [(AMSUIMessageView *)self imageView];
    double v15 = [v14 accessibilityLabel];

    if (!v15) {
      goto LABEL_11;
    }
    id v11 = [(AMSUIMessageView *)self imageView];
    id v16 = [v11 accessibilityLabel];
    [v10 addObject:v16];
  }
LABEL_11:
  id v17 = [(AMSUIMessageView *)self textView];
  if ([v17 hasText])
  {
    double v18 = [(AMSUIMessageView *)self textView];
    double v19 = [v18 accessibilityLabel];

    if (!v19) {
      goto LABEL_15;
    }
    id v17 = [(AMSUIMessageView *)self textView];
    double v20 = [v17 accessibilityLabel];
    [v10 addObject:v20];
  }
LABEL_15:
  double v21 = [MEMORY[0x263F089D8] stringWithString:&stru_26CC491D8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v10;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
        if ([v21 length]) {
          [v21 appendString:@", "];
        }
        [v21 appendFormat:@"%@", v27];
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v24);
  }

  if ([v21 length])
  {
    uint64_t v28 = [NSString stringWithString:v21];
    [(AMSUIMessageView *)self setAccessibilityLabel:v28];
  }
  else
  {
    [(AMSUIMessageView *)self setAccessibilityLabel:0];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v29 = v3;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v33++) setIsAccessibilityElement:1];
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v31);
  }

  [(AMSUIMessageView *)self setAms_accessibilitySupplementaryFooterViews:v29];
  [(AMSUIMessageView *)self setIsAccessibilityElement:1];
}

- (void)_setMICAPlayerTintColor:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(AMSUIMessageView *)self micaPlayer];

  if (v5)
  {
    id v6 = [(AMSUIMessageView *)self micaPlayer];
    int v7 = [v6 publishedObjects];

    if (v7)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      double v8 = [(AMSUIMessageView *)self micaPlayer];
      unint64_t v9 = [v8 publishedObjects];
      uint64_t v10 = [v9 allValues];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(id *)(*((void *)&v18 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v16 = v15;
            }
            else {
              id v16 = 0;
            }

            if ([v16 fillColor] && CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "fillColor")) > 0.0) {
              objc_msgSend(v16, "setFillColor:", objc_msgSend(v4, "CGColor"));
            }
            if ([v16 strokeColor] && CGColorGetAlpha((CGColorRef)objc_msgSend(v16, "strokeColor")) > 0.0) {
              objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v4, "CGColor"));
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      if (!v10)
      {
        uint64_t v10 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v17 = [v10 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = objc_opt_class();
        _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: No published objects to tint", buf, 0xCu);
      }
    }
  }
}

- (void)_setAccessibilityIdentifier
{
  unint64_t v3 = [(AMSUIMessageView *)self style];
  if (v3 > 5) {
    id v4 = @"bubbleTip";
  }
  else {
    id v4 = off_2643E3FC8[v3];
  }
  [(AMSUIMessageView *)self setAccessibilityIdentifier:v4];
  double v5 = [(AMSUIMessageView *)self imageView];
  [v5 setAccessibilityIdentifier:@"primaryImageView"];

  id v6 = [(AMSUIMessageView *)self textView];
  [v6 setAccessibilityIdentifier:@"textView"];
}

- (void)_setTextViewText
{
  unint64_t v3 = [(AMSUIMessageView *)self title];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(AMSUIMessageView *)self message];
  }
  id v14 = v5;

  uint64_t v6 = [(AMSUIMessageView *)self title];
  if (v6)
  {
    int v7 = (void *)v6;
    double v8 = [(AMSUIMessageView *)self message];

    if (v8)
    {
      unint64_t v9 = (void *)[v14 mutableCopy];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
      [v9 appendAttributedString:v10];

      uint64_t v11 = [(AMSUIMessageView *)self message];
      [v9 appendAttributedString:v11];

      id v12 = objc_alloc_init(MEMORY[0x263F81650]);
      [(AMSUIMessageView *)self _textViewParagraphSpacingBefore];
      objc_msgSend(v12, "setParagraphSpacingBefore:");
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x263F81540], v12, 0, objc_msgSend(v9, "length"));

      id v14 = v9;
    }
  }
  uint64_t v13 = [(AMSUIMessageView *)self textView];
  [v13 setAttributedText:v14];
}

- (void)setAccessoryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[AMSUIMessageButton alloc] initWithDialogAction:v9 messageStyle:[(AMSUIMessageView *)self style]];

  [(AMSUIMessageButton *)v10 addTarget:v8 action:a5 forControlEvents:64];
  [(AMSUIMessageView *)self setAccessoryView:v10];
}

- (void)setAccessorySecondaryViewForDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[AMSUIMessageButton alloc] initWithDialogAction:v9 messageStyle:[(AMSUIMessageView *)self style]];

  [(AMSUIMessageButton *)v10 addTarget:v8 action:a5 forControlEvents:64];
  [(AMSUIMessageView *)self setAccessorySecondaryView:v10];
}

- (void)setBodyDialogAction:(id)a3 target:(id)a4 action:(SEL)a5
{
  objc_storeStrong((id *)&self->_bodyAction, a3);
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc(MEMORY[0x263F82CB0]);

  id v12 = (id)[v11 initWithTarget:v10 action:a5];
  [(AMSUIMessageView *)self addGestureRecognizer:v12];
}

- (void)setFooterForDialogActions:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__AMSUIMessageView_setFooterForDialogActions_target_action___block_invoke;
  v11[3] = &unk_2643E3F80;
  v11[4] = self;
  id v12 = v8;
  SEL v13 = a5;
  id v9 = v8;
  id v10 = objc_msgSend(a3, "ams_mapWithTransform:", v11);
  [(AMSUIMessageView *)self setFooterButtonViews:v10];
}

AMSUIMessageButton *__60__AMSUIMessageView_setFooterForDialogActions_target_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[AMSUIMessageButton initWithDialogAction:messageStyle:]([AMSUIMessageButton alloc], "initWithDialogAction:messageStyle:", v3, [*(id *)(a1 + 32) style]);

  [(AMSUIMessageButton *)v4 setFooterStyle];
  [(AMSUIMessageButton *)v4 addTarget:*(void *)(a1 + 40) action:*(void *)(a1 + 48) forControlEvents:64];
  return v4;
}

- (void)setupBubbleArrowMaskView
{
  id v3 = [(AMSUIMessageView *)self maskShapeView];

  if (!v3)
  {
    id v4 = [AMSUIPopoverShapeLayerView alloc];
    id v5 = -[AMSUIPopoverShapeLayerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AMSUIPopoverShapeLayerView *)v5 setHidden:1];
    [(AMSUIPopoverShapeLayerView *)v5 setViewToMaskWhenContentExtendsOverArrow:self];
    [(AMSUIMessageView *)self addSubview:v5];
    [(AMSUIMessageView *)self setMaskShapeView:v5];
  }
}

- (void)removeBubbleArrowMaskView
{
  [(AMSUIMessageView *)self setMaskView:0];
  id v3 = [(AMSUIMessageView *)self maskShapeView];
  [v3 removeFromSuperview];

  [(AMSUIMessageView *)self setMaskShapeView:0];
}

- (void)_startObservations
{
  id v3 = [(AMSUIMessageView *)self imageView];
  [v3 addObserver:self forKeyPath:@"frame" options:1 context:0];

  id v4 = [(AMSUIMessageView *)self imageView];
  [v4 addObserver:self forKeyPath:@"image" options:1 context:0];
}

- (void)_endObservations
{
  id v3 = [(AMSUIMessageView *)self imageView];
  [v3 removeObserver:self forKeyPath:@"image"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(AMSUIMessageView *)self imageView];

  if (v13 == v11)
  {
    [(AMSUIMessageView *)self _setupImageView];
    id v14 = [(AMSUIMessageView *)self layoutContext];
    [v14 invalidate];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)AMSUIMessageView;
    [(AMSUIMessageView *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = [(AMSUIMessageView *)self accessoryView];

  if (v5)
  {
    uint64_t v6 = [(AMSUIMessageView *)self accessoryView];
    [v4 addObject:v6];
  }
  int v7 = [(AMSUIMessageView *)self footerButtonViews];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [(AMSUIMessageView *)self footerButtonViews];
    [v4 addObjectsFromArray:v9];
  }
  id v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v10;
}

- (void)setNeedsLayout
{
  v4.receiver = self;
  v4.super_class = (Class)AMSUIMessageView;
  [(AMSUIMessageView *)&v4 setNeedsLayout];
  id v3 = [(AMSUIMessageView *)self layoutContext];
  [v3 invalidate];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AMSUIMessageView;
  [(AMSUIMessageView *)&v7 layoutSubviews];
  [(AMSUIMessageView *)self _syncRectsFromContext];
  id v3 = [(AMSUIMessageView *)self micaPlayer];

  if (v3)
  {
    objc_super v4 = [(AMSUIMessageView *)self micaPlayer];
    id v5 = [(AMSUIMessageView *)self imageContainerView];
    uint64_t v6 = [v5 layer];
    [v4 moveAndResizeWithinParentLayer:v6 usingGravity:*MEMORY[0x263F15E20] animate:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(AMSUIMessageView *)self setIsSizing:1];
  uint64_t v6 = [(AMSUIMessageView *)self layoutContext];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  [(AMSUIMessageView *)self _syncRectsFromContext];
  [(AMSUIMessageView *)self setIsSizing:0];
  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AMSUIMessageView;
  id v4 = a3;
  [(AMSUIMessageView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(AMSUIMessageView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceLevel];
  uint64_t v7 = [v4 userInterfaceLevel];

  if (v6 != v7) {
    [(AMSUIMessageView *)self _setupImageView];
  }
  double v8 = [(AMSUIMessageView *)self iconColor];
  [(AMSUIMessageView *)self _setMICAPlayerTintColor:v8];

  [(AMSUIMessageView *)self _setTextAlignment];
  [(AMSUIMessageView *)self _setTextViewText];
  [(AMSUIMessageView *)self _setShadow];
}

- (void)_syncRectsFromContext
{
  [(AMSUIMessageView *)self _setTextAlignment];
  id v3 = [(AMSUIMessageView *)self layoutContext];
  [v3 layoutSubviewFrames];

  id v4 = [(AMSUIMessageView *)self accessoryView];

  if (v4)
  {
    id v5 = [(AMSUIMessageView *)self layoutContext];
    [v5 contentLayoutMargins];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(AMSUIMessageView *)self layoutContext];
    [v12 accessorySpacing];
    double v14 = v13;

    double v15 = -v11;
    if ([(AMSUIMessageView *)self style] == 4)
    {
      id v16 = [(AMSUIMessageView *)self traitCollection];
      uint64_t v17 = [v16 layoutDirection];

      if (v17 == 1)
      {
        [(AMSUIMessageView *)self frame];
        double v19 = v18;
        long long v20 = [(AMSUIMessageView *)self layoutContext];
        [v20 accessoryViewFrame];
        double v22 = v19 - v21;
        uint64_t v23 = [(AMSUIMessageView *)self layoutContext];
        [v23 accessoryViewFrame];
        double v25 = -(v22 - v24);
      }
      else
      {
        long long v20 = [(AMSUIMessageView *)self layoutContext];
        [v20 accessoryViewFrame];
        double v25 = -v28;
      }

      id v29 = [(AMSUIMessageView *)self layoutContext];
      [v29 accessoryViewFrame];
      double v26 = -v30;

      [(AMSUIMessageView *)self frame];
      double v32 = v31;
      uint64_t v33 = [(AMSUIMessageView *)self layoutContext];
      [v33 accessoryViewFrame];
      double v35 = v32 - v34;
      long long v36 = [(AMSUIMessageView *)self layoutContext];
      [v36 accessoryViewFrame];
      double v27 = -(v35 - v37);
    }
    else
    {
      double v25 = -v14;
      double v26 = -v7;
      double v27 = -v9;
    }
    long long v38 = [(AMSUIMessageView *)self accessoryView];
    objc_msgSend(v38, "setHitTestDirectionalInsets:", v26, v25, v27, v15);
  }
  long long v39 = [(AMSUIMessageView *)self imageView];
  long long v40 = [v39 image];
  if (v40)
  {
    BOOL v41 = 0;
  }
  else
  {
    v42 = [(AMSUIMessageView *)self micaPlayer];
    BOOL v41 = v42 == 0;
  }
  v43 = [(AMSUIMessageView *)self layoutContext];
  [v43 contentSize];
  double v45 = v44;
  double v47 = v46;

  double v48 = [(AMSUIMessageView *)self imageContainerView];
  [v48 setHidden:v41];

  v49 = [(AMSUIMessageView *)self imageContainerView];
  v50 = [(AMSUIMessageView *)self layoutContext];
  [v50 imageViewFrame];
  objc_msgSend(v49, "setFrame:");

  v51 = [(AMSUIMessageView *)self imageView];
  v52 = [(AMSUIMessageView *)self imageContainerView];
  [v52 bounds];
  objc_msgSend(v51, "setFrame:");

  v53 = [(AMSUIMessageView *)self textView];
  v54 = [(AMSUIMessageView *)self layoutContext];
  [v54 textViewFrame];
  objc_msgSend(v53, "setFrame:");

  v55 = [(AMSUIMessageView *)self layoutContext];
  [v55 debugButtonFrame];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  v64 = [(AMSUIMessageView *)self debugButton];
  objc_msgSend(v64, "setFrame:", v57, v59, v61, v63);

  [(AMSUIMessageView *)self bounds];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  if ([(AMSUIMessageView *)self style] == 2)
  {
    [(AMSUIMessageView *)self safeAreaInsets];
    double v68 = v73;
    [(AMSUIMessageView *)self safeAreaInsets];
    double v66 = v74;
  }
  v75 = [(AMSUIMessageView *)self containerView];
  [(AMSUIMessageView *)self bounds];
  objc_msgSend(v75, "setFrame:");

  v76 = [(AMSUIMessageView *)self containerView];
  objc_msgSend(v76, "setContentSize:", v45, v47);

  v77 = [(AMSUIMessageView *)self backgroundVisualEffectView];
  objc_msgSend(v77, "setFrame:", v66, v68, v70, v72);

  v78 = [(AMSUIMessageView *)self accessoryView];
  v79 = [(AMSUIMessageView *)self layoutContext];
  [v79 accessoryViewFrame];
  objc_msgSend(v78, "setFrame:");

  v80 = [(AMSUIMessageView *)self accessorySecondaryView];
  v81 = [(AMSUIMessageView *)self layoutContext];
  [v81 accessorySecondaryViewFrame];
  objc_msgSend(v80, "setFrame:");

  v82 = [(AMSUIMessageView *)self separatorViews];
  unint64_t v83 = [v82 count];
  v84 = [(AMSUIMessageView *)self layoutContext];
  v85 = [v84 separatorViewFrames];
  unint64_t v86 = [v85 count];

  if (v83 < v86)
  {
    v87 = (void *)MEMORY[0x263EFF980];
    v88 = [(AMSUIMessageView *)self separatorViews];
    v89 = [v87 arrayWithArray:v88];
    while (1)
    {

      unint64_t v90 = [v89 count];
      v91 = [(AMSUIMessageView *)self layoutContext];
      v92 = [v91 separatorViewFrames];
      unint64_t v93 = [v92 count];

      if (v90 >= v93) {
        break;
      }
      v88 = [(AMSUIMessageView *)self _makeSeparatorView];
      [v89 addObject:v88];
      v94 = [(AMSUIMessageView *)self containerView];
      [v94 addSubview:v88];
    }
    v95 = [MEMORY[0x263EFF8C0] arrayWithArray:v89];
    [(AMSUIMessageView *)self setSeparatorViews:v95];
  }
  v96 = [(AMSUIMessageView *)self layoutContext];
  v97 = [v96 separatorViewFrames];
  uint64_t v98 = [v97 count];

  if (v98)
  {
    v99 = [(AMSUIMessageView *)self separatorViews];
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __41__AMSUIMessageView__syncRectsFromContext__block_invoke;
    v118[3] = &unk_2643E3FA8;
    v118[4] = self;
    [v99 enumerateObjectsUsingBlock:v118];
  }
  v100 = [(AMSUIMessageView *)self footerButtonViews];
  v117[0] = MEMORY[0x263EF8330];
  v117[1] = 3221225472;
  v117[2] = __41__AMSUIMessageView__syncRectsFromContext__block_invoke_2;
  v117[3] = &unk_2643E3FA8;
  v117[4] = self;
  [v100 enumerateObjectsUsingBlock:v117];

  v101 = [(AMSUIMessageView *)self backgroundImageView];
  v102 = [(AMSUIMessageView *)self backgroundImageView];
  v103 = [v102 image];
  [v101 setHidden:v103 == 0];

  v104 = [(AMSUIMessageView *)self backgroundImageView];
  [(AMSUIMessageView *)self bounds];
  objc_msgSend(v104, "setFrame:");

  v105 = [(AMSUIMessageView *)self maskShapeView];

  if (v105)
  {
    v106 = [(AMSUIMessageView *)self layoutContext];
    [v106 maskViewFrame];
    double v108 = v107;
    double v110 = v109;
    double v112 = v111;
    double v114 = v113;
    v115 = [(AMSUIMessageView *)self maskShapeView];
    objc_msgSend(v115, "setFrame:", v108, v110, v112, v114);

    v116 = [(AMSUIMessageView *)self maskShapeView];
    [v116 setNeedsLayout];
  }
  [(AMSUIMessageView *)self _setAccessibility];
}

void __41__AMSUIMessageView__syncRectsFromContext__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  id v5 = [*(id *)(a1 + 32) layoutContext];
  double v6 = [v5 separatorViewFrames];
  unint64_t v7 = [v6 count];

  if (v7 >= a3)
  {
    [v11 setHidden:0];
    double v8 = [*(id *)(a1 + 32) layoutContext];
    double v9 = [v8 separatorViewFrames];
    double v10 = [v9 objectAtIndexedSubscript:a3];
    [v10 CGRectValue];
    objc_msgSend(v11, "setFrame:");
  }
  else
  {
    [v11 setHidden:1];
  }
}

void __41__AMSUIMessageView__syncRectsFromContext__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = [*(id *)(a1 + 32) layoutContext];
  unint64_t v7 = [v6 footerButtonFrames];
  unint64_t v8 = [v7 count];

  if (v8 >= a3)
  {
    double v14 = [*(id *)(a1 + 32) layoutContext];
    double v15 = [v14 footerButtonFrames];
    id v16 = [v15 objectAtIndexedSubscript:a3];
    [v16 CGRectValue];
    objc_msgSend(v5, "setFrame:");
  }
  else
  {
    int v9 = [MEMORY[0x263F27EF8] isRunningUnitTests];
    uint64_t v10 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
    id v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        id v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      double v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138543362;
        uint64_t v19 = objc_opt_class();
        _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Internal inconsistency there are less frames allocated for footer buttons", (uint8_t *)&v18, 0xCu);
      }

      id v11 = [MEMORY[0x263F08A00] defaultCenter];
      double v13 = [MEMORY[0x263F27CB8] sharedMessagingUIConfig];
      [v11 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v13 userInfo:0];
    }
    else
    {
      if (!v10)
      {
        id v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      uint64_t v17 = [v11 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v18 = 138543362;
        uint64_t v19 = objc_opt_class();
        _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Internal inconsistency there are less frames allocated for footer buttons", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  id v4 = (UIView *)a3;
  [(UIView *)self->_accessoryView removeFromSuperview];
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;
  double v6 = v4;

  unint64_t v7 = [(AMSUIMessageView *)self containerView];
  [v7 addSubview:v6];

  [(AMSUIMessageView *)self setNeedsLayout];
}

- (UIView)accessorySecondaryView
{
  return self->_accessorySecondaryView;
}

- (void)setAccessorySecondaryView:(id)a3
{
  id v4 = (UIView *)a3;
  [(UIView *)self->_accessorySecondaryView removeFromSuperview];
  accessorySecondaryView = self->_accessorySecondaryView;
  self->_accessorySecondaryView = v4;
  double v6 = v4;

  unint64_t v7 = [(AMSUIMessageView *)self containerView];
  [v7 addSubview:v6];

  [(AMSUIMessageView *)self setNeedsLayout];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMSUIMessageView;
  -[AMSUIMessageView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  if (!a3) {
    [(AMSUIMessageView *)self _setBackground];
  }
}

- (NSArray)footerButtonViews
{
  return self->_footerButtonViews;
}

- (void)setFooterButtonViews:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_footerButtonViews = &self->_footerButtonViews;
  footerButtonViews = self->_footerButtonViews;
  if (footerButtonViews)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v8 = footerButtonViews;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v12++) removeFromSuperview];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
  }
  objc_storeStrong((id *)&self->_footerButtonViews, a3);
  double v13 = *p_footerButtonViews;
  if (*p_footerButtonViews)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v14 = v13;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * v18);
          uint64_t v20 = [(AMSUIMessageView *)self containerView];
          [v20 addSubview:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
  }
  [(AMSUIMessageView *)self setNeedsLayout];
}

- (UIColor)iconColor
{
  return self->_iconColor;
}

- (void)setIconColor:(id)a3
{
  id v4 = (UIColor *)a3;
  id v5 = [(AMSUIMessageView *)self imageView];
  [v5 setTintColor:v4];

  [(AMSUIMessageView *)self _setMICAPlayerTintColor:v4];
  iconColor = self->_iconColor;
  self->_iconColor = v4;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_separatorColor, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = [(AMSUIMessageView *)self separatorViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setBackgroundColor:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_makeSeparatorView
{
  id v3 = objc_alloc_init(AMSUICommonView);
  id v4 = [(AMSUIMessageView *)self separatorColor];
  [(AMSUICommonView *)v3 setBackgroundColor:v4];

  [(AMSUICommonView *)v3 setIsAccessibilityElement:0];
  return v3;
}

- (void)_setTextAlignment
{
  id v3 = [(AMSUIMessageView *)self textView];
  uint64_t v4 = [v3 textAlignment];

  if ([(AMSUIMessageView *)self style] == 1)
  {
    id v5 = [(AMSUIMessageView *)self imageView];
    double v6 = [v5 image];
    if (v6)
    {
    }
    else
    {
      BOOL v7 = [(AMSUIMessageView *)self preLayoutImageView];

      if (!v7)
      {
        uint64_t v8 = [(AMSUIMessageView *)self layoutContext];
        int v9 = [v8 shouldUseStackedLayout];

        if (v9) {
          uint64_t v4 = 4;
        }
        else {
          uint64_t v4 = 1;
        }
      }
    }
  }
  uint64_t v10 = [(AMSUIMessageView *)self textView];
  uint64_t v11 = [v10 textAlignment];

  if (v4 != v11)
  {
    id v12 = [(AMSUIMessageView *)self textView];
    [v12 setTextAlignment:v4];
  }
}

- (double)_textViewParagraphSpacingBefore
{
  unint64_t v2 = [(AMSUIMessageView *)self style];
  double result = 2.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (AMSUICommonImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isImageSymbolImage
{
  return self->_isImageSymbolImage;
}

- (void)setIsImageSymbolImage:(BOOL)a3
{
  self->_isImageSymbolImage = a3;
}

- (BOOL)isSizing
{
  return self->_isSizing;
}

- (void)setIsSizing:(BOOL)a3
{
  self->_isSizing = a3;
}

- (NSAttributedString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (AMSUICommonTextView)textView
{
  return self->_textView;
}

- (AMSDialogAction)bodyAction
{
  return self->_bodyAction;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)preLayoutImageView
{
  return self->_preLayoutImageView;
}

- (void)setPreLayoutImageView:(BOOL)a3
{
  self->_preLayoutImageView = a3;
}

- (NSArray)ams_accessibilitySupplementaryFooterViews
{
  return self->_ams_accessibilitySupplementaryFooterViews;
}

- (void)setAms_accessibilitySupplementaryFooterViews:(id)a3
{
}

- (AMSUICommonVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (UIScrollView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (AMSUICommonButton)debugButton
{
  return self->_debugButton;
}

- (void)setDebugButton:(id)a3
{
}

- (UIView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (AMSUIMessageViewLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(id)a3
{
}

- (AMSUIPopoverShapeLayerView)maskShapeView
{
  return self->_maskShapeView;
}

- (void)setMaskShapeView:(id)a3
{
}

- (MicaPlayer)micaPlayer
{
  return self->_micaPlayer;
}

- (void)setMicaPlayer:(id)a3
{
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_micaPlayer, 0);
  objc_storeStrong((id *)&self->_maskShapeView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_debugButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_ams_accessibilitySupplementaryFooterViews, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bodyAction, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_footerButtonViews, 0);
  objc_storeStrong((id *)&self->_accessorySecondaryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end