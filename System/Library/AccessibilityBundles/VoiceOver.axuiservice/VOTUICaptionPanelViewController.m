@interface VOTUICaptionPanelViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isTV;
- (UIScrollView)scrollView;
- (UITextView)captionPanelText;
- (VOTUICaptionPanelViewController)init;
- (double)_captionTextBottomInset;
- (double)captionPanelHeight;
- (double)marqueeEnableDelay;
- (void)_accessibilityLoadInvertColors;
- (void)_animateTextBack:(BOOL)a3;
- (void)_hostContextId;
- (void)_unhostContextId;
- (void)_updateCaptionPanelHeight;
- (void)parseMessage:(id)a3;
- (void)setCaptionPanelHeight:(double)a3;
- (void)setCaptionPanelText:(id)a3;
- (void)setMarqueeEnableDelay:(double)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VOTUICaptionPanelViewController

- (VOTUICaptionPanelViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)VOTUICaptionPanelViewController;
  v2 = [(VOTUICaptionPanelViewController *)&v8 init];
  [(VOTUICaptionPanelViewController *)v2 setMarqueeEnableDelay:2.0];
  v3 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  scrollingStartTimer = v2->_scrollingStartTimer;
  v2->_scrollingStartTimer = v3;

  [(AXDispatchTimer *)v2->_scrollingStartTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  v5 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
  resetColorsTimer = v2->_resetColorsTimer;
  v2->_resetColorsTimer = v5;

  [(AXDispatchTimer *)v2->_resetColorsTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  return v2;
}

- (double)_captionTextBottomInset
{
  int HasHomeButton = AXDeviceHasHomeButton();
  double result = 16.0;
  if (HasHomeButton) {
    return 2.0;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_isTV
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)VOTUICaptionPanelViewController;
  [(VOTUICaptionPanelViewController *)&v21 viewWillLayoutSubviews];
  v3 = [(VOTUICaptionPanelViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  [(VOTUICaptionPanelViewController *)self captionPanelHeight];
  double v7 = v5 - v6;

  objc_super v8 = [(VOTUICaptionPanelViewController *)self view];
  [v8 frame];
  double v10 = v9;
  [(VOTUICaptionPanelViewController *)self captionPanelHeight];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, v7, v10, v11);

  effectView = self->_effectView;
  [(UIView *)self->_backgroundView bounds];
  double v14 = v13;
  [(UIView *)self->_backgroundView bounds];
  -[UIVisualEffectView setFrame:](effectView, "setFrame:", 0.0, 0.0, v14);
  [(VOTUICaptionPanelViewController *)self _captionTextBottomInset];
  double v16 = v15;
  [(UIView *)self->_backgroundView bounds];
  -[UITextView setFrame:](self->_captionPanelText, "setFrame:", v17 + 8.0, v18 + 2.0, v19 + -16.0, v20 - (v16 + 2.0));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(VOTUICaptionPanelViewController *)self captionPanelHeight];
  double v8 = height - v7;
  [(VOTUICaptionPanelViewController *)self captionPanelHeight];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", 0.0, v8, width, v9);
  effectView = self->_effectView;
  [(UIView *)self->_backgroundView frame];
  double v12 = v11;
  [(UIView *)self->_backgroundView frame];
  -[UIVisualEffectView setFrame:](effectView, "setFrame:", 0.0, 0.0, v12);
  [(VOTUICaptionPanelViewController *)self _captionTextBottomInset];
  double v14 = v13;
  [(UIView *)self->_backgroundView bounds];
  double v16 = v15 + 8.0;
  double v18 = v17 + 2.0;
  double v20 = v19 + -16.0;
  captionPanelText = self->_captionPanelText;
  double v23 = v22 - (v14 + 2.0);

  -[UITextView setFrame:](captionPanelText, "setFrame:", v16, v18, v20, v23);
}

- (void)_updateCaptionPanelHeight
{
  if ([(VOTUICaptionPanelViewController *)self _isTV])
  {
    id v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    v3 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    [v3 setFont:v16];

    double v4 = [(VOTUICaptionPanelViewController *)self view];
    [v4 frame];
    [(VOTUICaptionPanelViewController *)self setCaptionPanelHeight:v5 / 10.0];

    double v6 = [(VOTUICaptionPanelViewController *)self view];
    [v6 setNeedsLayout];
  }
  else
  {
    double v7 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
    id v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1 compatibleWithTraitCollection:v7];

    double v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    double v8 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    [v8 setFont:v6];

    [v6 lineHeight];
    double v10 = v9 + 20.0;
    [v16 lineHeight];
    double v12 = v10 - v11;
    int HasHomeButton = AXDeviceHasHomeButton();
    double v14 = v12 + 14.0;
    if (HasHomeButton) {
      double v14 = v12;
    }
    [(VOTUICaptionPanelViewController *)self setCaptionPanelHeight:v14];
    double v15 = [(VOTUICaptionPanelViewController *)self view];
    [v15 setNeedsLayout];
  }
}

- (void)viewDidLoad
{
  v45.receiver = self;
  v45.super_class = (Class)VOTUICaptionPanelViewController;
  [(VOTUICaptionPanelViewController *)&v45 viewDidLoad];
  v3 = [(VOTUICaptionPanelViewController *)self view];
  [v3 setAccessibilityElementsHidden:1];

  id v4 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  double v8 = (UIView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;

  double v10 = [(VOTUICaptionPanelViewController *)self view];
  [v10 addSubview:self->_backgroundView];

  v41 = +[UIBlurEffect effectWithStyle:1102];
  double v11 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v41];
  effectView = self->_effectView;
  self->_effectView = v11;

  [(UIVisualEffectView *)self->_effectView setClipsToBounds:0];
  [(UIView *)self->_backgroundView addSubview:self->_effectView];
  id v13 = objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUICaptionPanelViewController *)self setScrollView:v13];

  double v14 = [(VOTUICaptionPanelViewController *)self scrollView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v15 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(VOTUICaptionPanelViewController *)self setCaptionPanelText:v15];

  id v16 = +[UIColor clearColor];
  double v17 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v17 setBackgroundColor:v16];

  double v18 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  double v19 = +[UIColor systemWhiteColor];
  [v18 setTextColor:v19];

  double v20 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v20 setTextAlignment:0];

  objc_super v21 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v21 setAdjustsFontForContentSizeCategory:1];

  double v22 = self->_backgroundView;
  double v23 = [(VOTUICaptionPanelViewController *)self scrollView];
  [(UIView *)v22 addSubview:v23];

  v24 = [(VOTUICaptionPanelViewController *)self scrollView];
  v25 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v24 addSubview:v25];

  v40 = [(VOTUICaptionPanelViewController *)self scrollView];
  v39 = [v40 widthAnchor];
  v38 = [(UIView *)self->_backgroundView widthAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 multiplier:0.9];
  v47[0] = v37;
  v26 = [(VOTUICaptionPanelViewController *)self scrollView];
  v27 = [v26 heightAnchor];
  v28 = [(UIView *)self->_backgroundView heightAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 multiplier:1.0];
  v47[1] = v29;
  v30 = [(VOTUICaptionPanelViewController *)self scrollView];
  v31 = [v30 centerXAnchor];
  v32 = [(UIView *)self->_backgroundView centerXAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:0.0];
  v47[2] = v33;
  v34 = +[NSArray arrayWithObjects:v47 count:3];
  +[NSLayoutConstraint activateConstraints:v34];

  [(VOTUICaptionPanelViewController *)self _updateCaptionPanelHeight];
  [(VOTUICaptionPanelViewController *)self _accessibilityLoadInvertColors];
  objc_initWeak(&location, self);
  uint64_t v46 = objc_opt_class();
  v35 = +[NSArray arrayWithObjects:&v46 count:1];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_F550;
  v42[3] = &unk_3D440;
  objc_copyWeak(&v43, &location);
  id v36 = [(VOTUICaptionPanelViewController *)self registerForTraitChanges:v35 withHandler:v42];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VOTUICaptionPanelViewController;
  [(VOTUICaptionPanelViewController *)&v4 viewDidAppear:a3];
  [(VOTUICaptionPanelViewController *)self _hostContextId];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VOTUICaptionPanelViewController;
  [(VOTUICaptionPanelViewController *)&v4 viewWillDisappear:a3];
  [(VOTUICaptionPanelViewController *)self _unhostContextId];
}

- (void)_hostContextId
{
  id v5 = +[AXSpringBoardServer server];
  v3 = [(VOTUICaptionPanelViewController *)self view];
  objc_super v4 = [v3 window];
  objc_msgSend(v5, "setCaptionPanelContextId:", objc_msgSend(v4, "_contextId"));
}

- (void)_unhostContextId
{
  id v2 = +[AXSpringBoardServer server];
  [v2 setCaptionPanelContextId:0];
}

- (void)parseMessage:(id)a3
{
  id v4 = a3;
  [(VOTUICaptionPanelViewController *)self _hostContextId];
  id v5 = [v4 objectForKey:@"VoiceOverCaptionText"];
  double v6 = [v4 objectForKey:@"VoiceOverCaptionSpokenRange"];

  NSRange v7 = NSRangeFromString(v6);
  NSUInteger length = v7.length;

  double v9 = VOTLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v7.location, v7.length);
    *(_DWORD *)buf = 138412290;
    v109 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Handling caption panel message: %@", buf, 0xCu);
  }
  double v11 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  double v12 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  id v13 = [v12 text];
  unsigned __int8 v14 = [(__CFString *)v11 isEqualToString:v13];

  id v15 = objc_alloc((Class)NSMutableAttributedString);
  if (v11) {
    CFStringRef v16 = v11;
  }
  else {
    CFStringRef v16 = &stru_3F588;
  }
  id v17 = [v15 initWithString:v16];
  double v18 = +[UIColor whiteColor];
  objc_msgSend(v17, "addAttribute:value:range:", NSForegroundColorAttributeName, v18, 0, objc_msgSend(v17, "length"));

  double v19 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  double v20 = [v19 font];

  if (v20)
  {
    objc_super v21 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    double v22 = [v21 font];
    objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v22, 0, objc_msgSend(v17, "length"));

    NSUInteger length = v7.length;
  }
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  if (v7.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v114.NSUInteger length = (NSUInteger)[v17 length];
    v114.NSUInteger location = 0;
    v115.NSUInteger location = v7.location;
    v115.NSUInteger length = length;
    NSRange v24 = NSIntersectionRange(v114, v115);
    NSUInteger location = v24.location;
    NSUInteger length = v24.length;
    v25 = +[UIColor yellowColor];
    objc_msgSend(v17, "addAttribute:value:range:", NSForegroundColorAttributeName, v25, v24.location, v24.length);

    objc_msgSend(v17, "addAttribute:value:range:", NSUnderlineStyleAttributeName, &off_40128, v24.location, v24.length);
  }
  v26 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v26 setAttributedText:v17];

  v27 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  v28 = [(VOTUICaptionPanelViewController *)self scrollView];
  [v28 frame];
  objc_msgSend(v27, "sizeThatFits:", 3.40282347e38, v29);
  double v31 = v30;

  if ((v14 & 1) == 0)
  {
    v32 = [(VOTUICaptionPanelViewController *)self scrollView];
    objc_msgSend(v32, "setContentOffset:animated:", 0, 0.0, 0.0);

    [(UIViewPropertyAnimator *)self->_scrollingAnimator stopAnimation:1];
    v33 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    [v33 frame];
    double v35 = v34;

    if (AXDeviceHasHomeButton()) {
      double v36 = v35;
    }
    else {
      double v36 = -4.0;
    }
    double v37 = v31 + 10.0;
    v38 = [(VOTUICaptionPanelViewController *)self scrollView];
    [v38 frame];
    double v40 = v39;

    v41 = [(VOTUICaptionPanelViewController *)self scrollView];
    [v41 frame];
    double v43 = v42;

    if (v31 + 10.0 < v43)
    {
      v44 = [(VOTUICaptionPanelViewController *)self scrollView];
      [v44 frame];
      double v37 = v45;
    }
    uint64_t v46 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    objc_msgSend(v46, "setFrame:", 0.0, v36, v37, v40);

    v47 = [(VOTUICaptionPanelViewController *)self scrollView];
    objc_msgSend(v47, "setContentSize:", v37, v40);
  }
  v48 = objc_opt_new();
  v49 = [(VOTUICaptionPanelViewController *)self view];
  [v49 bounds];
  double v51 = v50;

  if (v31 <= v51) {
    uint64_t v52 = 1;
  }
  else {
    uint64_t v52 = 4;
  }
  [v48 setAlignment:v52];
  objc_msgSend(v17, "addAttribute:value:range:", NSParagraphStyleAttributeName, v48, 0, objc_msgSend(v17, "length"));
  v53 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v53 setAttributedText:v17];

  resetColorsTimer = self->_resetColorsTimer;
  [(VOTUICaptionPanelViewController *)self marqueeEnableDelay];
  double v56 = v55;
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_10168;
  v103[3] = &unk_3D468;
  v57 = v11;
  v104 = v57;
  id v58 = v17;
  id v105 = v58;
  v106 = self;
  id v59 = v48;
  id v107 = v59;
  [(AXDispatchTimer *)resetColorsTimer afterDelay:v103 processBlock:v56];
  scrollingStartTimer = self->_scrollingStartTimer;
  [(VOTUICaptionPanelViewController *)self marqueeEnableDelay];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_102B4;
  v102[3] = &unk_3D2B0;
  v102[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](scrollingStartTimer, "afterDelay:processBlock:", v102);
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v61 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    v62 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    [v62 beginningOfDocument];
    v64 = NSUInteger v63 = length;
    v65 = [v61 positionFromPosition:v64 offset:location];

    v66 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    v67 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    v68 = [v67 beginningOfDocument];
    v69 = [v66 positionFromPosition:v68 offset:location + v63];

    v70 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    v71 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    v72 = [v71 textRangeFromPosition:v65 toPosition:v69];
    [v70 firstRectForRange:v72];
    double v74 = v73;
    double v76 = v75;
    double v78 = v77;
    double v80 = v79;

    v81 = [(VOTUICaptionPanelViewController *)self scrollView];
    [v81 contentOffset];
    CGFloat v83 = v82;
    v84 = [(VOTUICaptionPanelViewController *)self scrollView];
    [v84 frame];
    double v86 = v85;
    v87 = [(VOTUICaptionPanelViewController *)self scrollView];
    [v87 frame];
    CGFloat v89 = v88;

    v116.origin.x = v74;
    v116.origin.double y = v76;
    CGFloat v100 = v78;
    v116.size.double width = v78;
    v116.size.double height = v80;
    double MaxX = CGRectGetMaxX(v116);
    v117.origin.double y = 0.0;
    v117.origin.x = v83;
    v117.size.double width = v86;
    v117.size.double height = v89;
    if (MaxX > CGRectGetMaxX(v117))
    {
      double v91 = v74 + v86 / -5.0;
      double v92 = fabs(v91);
      BOOL v93 = (unint64_t)(*(void *)&v92 - 1) < 0xFFFFFFFFFFFFFLL;
      BOOL v94 = v91 < 0.0 && (unint64_t)(*(void *)&v92 - 0x10000000000000) >> 53 < 0x3FF;
      if (v91 >= 0.0) {
        BOOL v93 = 0;
      }
      int v95 = v92 == INFINITY || v93;
      if ((v95 | v94) == 1)
      {
        v96 = VOTLogCommon();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        {
          v118.origin.x = v74;
          v118.origin.double y = v76;
          v118.size.double width = v100;
          v118.size.double height = v80;
          v97 = NSStringFromRect(v118);
          v119.origin.double y = 0.0;
          v119.origin.x = v83;
          v119.size.double width = v86;
          v119.size.double height = v89;
          v98 = NSStringFromRect(v119);
          v99 = +[NSNumber numberWithDouble:v74 + v86 / -5.0];
          *(_DWORD *)buf = 138412802;
          v109 = v97;
          __int16 v110 = 2112;
          v111 = v98;
          __int16 v112 = 2112;
          v113 = v99;
          _os_log_error_impl(&dword_0, v96, OS_LOG_TYPE_ERROR, "Bad x for caption panel offset: %@ %@ %@", buf, 0x20u);
        }
      }
      else
      {
        if (!UIAccessibilityIsReduceMotionEnabled())
        {
          v101[0] = _NSConcreteStackBlock;
          v101[1] = 3221225472;
          v101[2] = sub_102C0;
          v101[3] = &unk_3D300;
          v101[4] = self;
          *(double *)&v101[5] = v74 + v86 / -5.0;
          +[UIView animateWithDuration:v101 animations:0.15];
          goto LABEL_37;
        }
        v96 = [(VOTUICaptionPanelViewController *)self scrollView];
        -[NSObject setContentOffset:animated:](v96, "setContentOffset:animated:", 0, v74 + v86 / -5.0, 0.0);
      }
    }
LABEL_37:
  }
}

- (void)_animateTextBack:(BOOL)a3
{
  BOOL v3 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_105A4;
  v23[3] = &unk_3D2B0;
  v23[4] = self;
  +[UIView performWithoutAnimation:v23];
  id v5 = [(VOTUICaptionPanelViewController *)self scrollView];
  [v5 contentSize];
  double v7 = v6;
  double v8 = [(VOTUICaptionPanelViewController *)self scrollView];
  [v8 bounds];
  double v10 = v7 - v9;

  if (v10 <= 0.0)
  {
    [(UIViewPropertyAnimator *)self->_scrollingAnimator stopAnimation:1];
  }
  else if (v3)
  {
    objc_initWeak(&location, self);
    id v11 = objc_alloc((Class)UIViewPropertyAnimator);
    double v12 = [(VOTUICaptionPanelViewController *)self captionPanelText];
    id v13 = [v12 text];
    unsigned __int8 v14 = (UIViewPropertyAnimator *)objc_msgSend(v11, "initWithDuration:curve:animations:", 3, 0, (float)(unint64_t)objc_msgSend(v13, "length") / 10.0);
    scrollingAnimator = self->_scrollingAnimator;
    self->_scrollingAnimator = v14;

    CFStringRef v16 = self->_scrollingAnimator;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_105F0;
    v20[3] = &unk_3D490;
    objc_copyWeak(&v21, &location);
    [(UIViewPropertyAnimator *)v16 addCompletion:v20];
    id v17 = self->_scrollingAnimator;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1070C;
    v18[3] = &unk_3D4B8;
    objc_copyWeak(v19, &location);
    v19[1] = *(id *)&v10;
    [(UIViewPropertyAnimator *)v17 addAnimations:v18 delayFactor:0.0];
    [(UIViewPropertyAnimator *)self->_scrollingAnimator startAnimationAfterDelay:1.0];
    objc_destroyWeak(v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

- (void)_accessibilityLoadInvertColors
{
  BOOL v3 = [(VOTUICaptionPanelViewController *)self captionPanelText];
  [v3 setAccessibilityIgnoresInvertColors:1];

  effectView = self->_effectView;

  [(UIVisualEffectView *)effectView setAccessibilityIgnoresInvertColors:1];
}

- (UITextView)captionPanelText
{
  return self->_captionPanelText;
}

- (void)setCaptionPanelText:(id)a3
{
}

- (double)marqueeEnableDelay
{
  return self->_marqueeEnableDelay;
}

- (void)setMarqueeEnableDelay:(double)a3
{
  self->_marqueeEnableDeladouble y = a3;
}

- (double)captionPanelHeight
{
  return self->_captionPanelHeight;
}

- (void)setCaptionPanelHeight:(double)a3
{
  self->_captionPanelHeight = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_captionPanelText, 0);
  objc_storeStrong((id *)&self->_scrollingAnimator, 0);
  objc_storeStrong((id *)&self->_resetColorsTimer, 0);
  objc_storeStrong((id *)&self->_scrollingStartTimer, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end