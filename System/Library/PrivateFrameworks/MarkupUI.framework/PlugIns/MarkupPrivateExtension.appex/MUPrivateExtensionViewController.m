@interface MUPrivateExtensionViewController
+ (BOOL)_isInLowMemoryEnvironment;
+ (double)_maxImageDimensionInView;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_validateAnimationDictionary:(id)a3 isEntering:(BOOL)a4;
- (BOOL)canBecomeFirstResponder;
- (CGAffineTransform)_transformToHideContainerViewBehindBounds:(SEL)a3;
- (CGRect)_containerBounds;
- (CGRect)_rectBetweenNavAndToolbar;
- (CGSize)_minimumFormSheetDimensions;
- (void)_adjustFormSheetFrameToFitSize:(CGSize)a3;
- (void)_animateEnteringMarkupWithInfo:(id)a3;
- (void)_animateExitWithInfo:(id)a3;
- (void)_bailFailedAnimateEnterMarkup;
- (void)_setupContainerAndDimmingViews;
- (void)animateExitWithInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MUPrivateExtensionViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPrivateExtensionViewController;
  [(MUPrivateExtensionViewController *)&v4 viewDidAppear:a3];
  [(MUPrivateExtensionViewController *)self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v63.receiver = self;
  v63.super_class = (Class)MUPrivateExtensionViewController;
  [(MUPrivateExtensionViewController *)&v63 viewDidLoad];
  v48 = [(MUPrivateExtensionViewController *)self extensionContext];
  if (v48)
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"Markup" value:&stru_1000084A8 table:@"MUPrivateExtensionViewController"];
    [(MUPrivateExtensionViewController *)self setTitle:v3];

    objc_super v4 = +[UIDevice currentDevice];
    -[MUPrivateExtensionViewController setShowAsFormSheet:](self, "setShowAsFormSheet:", [v4 userInterfaceIdiom] == (id)1);

    [(MUPrivateExtensionViewController *)self _containerBounds];
    if (v7 >= v8) {
      double v7 = v8;
    }
    double v9 = v7 + -50.0;
    double v10 = v9;
    double v11 = v9;
    if (!CGRectIsEmpty(*(CGRect *)&v5)) {
      -[MUPrivateExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v9);
    }
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = [v48 inputItems];
    id v46 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v46)
    {
      uint64_t v12 = *(void *)v60;
      uint64_t v43 = *(void *)v60;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v60 != v12)
          {
            uint64_t v14 = v13;
            objc_enumerationMutation(obj);
            uint64_t v13 = v14;
          }
          v15 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          uint64_t v44 = v13;
          v45 = v15;
          v16 = [v15 attachments];
          id v17 = [v16 countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (!v17) {
            goto LABEL_26;
          }
          uint64_t v18 = *(void *)v56;
          while (2)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v56 != v18) {
                objc_enumerationMutation(v16);
              }
              v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v21 = [UTTypeFileURL identifier];
              unsigned __int8 v22 = [v20 hasItemConformingToTypeIdentifier:v21];

              v23 = UTTypeFileURL;
              if (v22) {
                goto LABEL_17;
              }
              v25 = [UTTypeData identifier];
              unsigned __int8 v26 = [v20 hasItemConformingToTypeIdentifier:v25];

              if ((v26 & 1) == 0)
              {
                v28 = [UTTypeImage identifier];
                unsigned __int8 v29 = [v20 hasItemConformingToTypeIdentifier:v28];

                v23 = UTTypeImage;
                if ((v29 & 1) == 0)
                {
                  v30 = [UTTypePDF identifier];
                  unsigned int v31 = [v20 hasItemConformingToTypeIdentifier:v30];

                  v23 = UTTypePDF;
                  if (!v31) {
                    continue;
                  }
                }
LABEL_17:
                v24 = v23;
                if (v24)
                {
                  v32 = v24;
LABEL_29:
                  [(MUPrivateExtensionViewController *)self _setupContainerAndDimmingViews];
                  if (([(MUPrivateExtensionViewController *)self useFancyTransition] & 1) == 0)
                  {
                    v33 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
                    v34 = [(MUPrivateExtensionViewController *)self contentContainerView];
                    [v34 setBackgroundColor:v33];
                  }
                  objc_initWeak(&location, self);
                  v35 = [(UTType *)v32 identifier];
                  v50[0] = _NSConcreteStackBlock;
                  v50[1] = 3221225472;
                  v50[2] = sub_100003300;
                  v50[3] = &unk_100008378;
                  objc_copyWeak(&v53, &location);
                  v50[4] = v45;
                  v36 = v32;
                  v51 = v36;
                  v52 = self;
                  [v20 loadItemForTypeIdentifier:v35 options:0 completionHandler:v50];

                  objc_destroyWeak(&v53);
                  objc_destroyWeak(&location);

                  goto LABEL_32;
                }
                continue;
              }
              v27 = UTTypeData;
              if (UTTypeData)
              {
                v32 = v27;
                v37 = [v45 userInfo];
                unsigned int v38 = [(MUPrivateExtensionViewController *)self _validateAnimationDictionary:v37 isEntering:1];

                if (v38)
                {
                  [(MUPrivateExtensionViewController *)self setUseFancyTransition:1];
                  v39 = [v45 userInfo];
                  v40 = [v39 valueForKey:MUDisplayAsFullScreen];

                  if (v40)
                  {
                    v41 = +[UIDevice currentDevice];
                    if ([v41 userInterfaceIdiom] == (id)1) {
                      uint64_t v42 = [v40 BOOLValue] ^ 1;
                    }
                    else {
                      uint64_t v42 = 0;
                    }
                    [(MUPrivateExtensionViewController *)self setShowAsFormSheet:v42];
                  }
                }
                goto LABEL_29;
              }
            }
            id v17 = [v16 countByEnumeratingWithState:&v55 objects:v64 count:16];
            if (v17) {
              continue;
            }
            break;
          }
LABEL_26:

          uint64_t v12 = v43;
          uint64_t v13 = v44 + 1;
        }
        while ((id)(v44 + 1) != v46);
        id v46 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        uint64_t v12 = v43;
      }
      while (v46);
    }
LABEL_32:

    [(MUPrivateExtensionViewController *)self _createCancelDoneNavBar];
  }
  [(MUPrivateExtensionViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)MUPrivateExtensionViewController;
  -[MUPrivateExtensionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ([(MUPrivateExtensionViewController *)self showAsFormSheet]
    && [(MUPrivateExtensionViewController *)self useFancyTransition])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000385C;
    v8[3] = &unk_1000083A0;
    v8[4] = self;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
}

+ (BOOL)_isInLowMemoryEnvironment
{
  return 1;
}

+ (double)_maxImageDimensionInView
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MUPrivateExtensionViewController;
  objc_msgSendSuper2(&v4, "_maxImageDimensionInView");
  return fmin(v2, 1400.0);
}

+ (id)_remoteViewControllerInterface
{
  double v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MURemoteViewProtocol];
  v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:"serviceDidFinishwithResults:andSandboxExtension:" argumentIndex:0 ofReply:0];

  objc_super v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:"serviceDidFinishwithResults:andSandboxExtension:" argumentIndex:1 ofReply:0];

  return v2;
}

+ (id)_exportedInterface
{
  double v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MUExtensionViewProtocol];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:"animateExitWithInfo:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)animateExitWithInfo:(id)a3
{
}

- (BOOL)_validateAnimationDictionary:(id)a3 isEntering:(BOOL)a4
{
  uint64_t v4 = (uint64_t *)&MUAnimationSourceRect;
  if (!a4) {
    uint64_t v4 = (uint64_t *)&MUAnimationTargetRect;
  }
  uint64_t v5 = *v4;
  id v6 = a3;
  id v7 = [v6 valueForKey:v5];
  double v8 = [v6 valueForKey:MUAnimationMaskRect];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;

  return v10;
}

- (void)_setupContainerAndDimmingViews
{
  if ([(MUPrivateExtensionViewController *)self showAsFormSheet]
    && [(MUPrivateExtensionViewController *)self useFancyTransition])
  {
    id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 100.0, 40.0, 800.0, 720.0);
    [(MUPrivateExtensionViewController *)self setContentContainerView:v3];

    uint64_t v4 = [(MUPrivateExtensionViewController *)self contentContainerView];
    uint64_t v5 = [v4 layer];
    [v5 setCornerRadius:13.0];

    id v6 = [(MUPrivateExtensionViewController *)self contentContainerView];
    id v7 = [v6 layer];
    [v7 setMasksToBounds:1];

    id firstValue = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    [firstValue setAlpha:0.0];
    [(MUPrivateExtensionViewController *)self setTransitionDimmingView:firstValue];
    double v8 = +[UIColor blackColor];
    BOOL v9 = [(MUPrivateExtensionViewController *)self transitionDimmingView];
    [v9 setBackgroundColor:v8];

    BOOL v10 = [(MUPrivateExtensionViewController *)self view];
    [v10 addSubview:firstValue];

    double v11 = _NSDictionaryOfVariableBindings(@"transitionDimmingView", firstValue, 0);
    uint64_t v12 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[transitionDimmingView]|" options:0 metrics:0 views:v11];
    +[NSLayoutConstraint activateConstraints:v12];

    uint64_t v13 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[transitionDimmingView]|" options:0 metrics:0 views:v11];
    +[NSLayoutConstraint activateConstraints:v13];

    uint64_t v14 = [(MUPrivateExtensionViewController *)self view];
    v15 = [(MUPrivateExtensionViewController *)self contentContainerView];
    [v14 addSubview:v15];
  }
  else
  {
    id firstValue = [(MUPrivateExtensionViewController *)self view];
    -[MUPrivateExtensionViewController setContentContainerView:](self, "setContentContainerView:");
  }
}

- (void)_adjustFormSheetFrameToFitSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if ([(MUPrivateExtensionViewController *)self showAsFormSheet]
    && [(MUPrivateExtensionViewController *)self useFancyTransition])
  {
    id v6 = [(MUPrivateExtensionViewController *)self contentContainerView];
    [v6 frame];
    CGFloat v47 = v8;
    CGFloat v48 = v7;
    CGFloat v45 = v10;
    CGFloat v46 = v9;

    double v11 = [(MUPrivateExtensionViewController *)self navBar];
    [v11 bounds];
    double v12 = height + CGRectGetHeight(v50);
    uint64_t v13 = [(MUPrivateExtensionViewController *)self toolbar];
    [v13 bounds];
    double v14 = v12 + CGRectGetHeight(v51);

    [(MUPrivateExtensionViewController *)self _containerBounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(MUPrivateExtensionViewController *)self _minimumFormSheetDimensions];
    double v24 = v23;
    double v26 = v25;
    v52.origin.x = 0.0;
    v52.origin.y = 0.0;
    v52.size.CGFloat width = width;
    v52.size.double height = v14;
    double v27 = CGRectGetWidth(v52);
    CGFloat v28 = v27 >= v24 ? v27 : v24;
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    v53.size.CGFloat width = v28;
    v53.size.double height = v14;
    double v29 = CGRectGetHeight(v53);
    CGFloat v30 = v29 >= v26 ? v29 : v26;
    v54.origin.x = 0.0;
    v54.origin.y = 0.0;
    v54.size.CGFloat width = v28;
    v54.size.double height = v30;
    double v31 = CGRectGetWidth(v54);
    v55.origin.x = v16;
    v55.origin.y = v18;
    v55.size.CGFloat width = v20;
    v55.size.double height = v22;
    double v32 = CGRectGetWidth(v55) + -50.0;
    double v33 = v31 >= v32 ? v32 : v31;
    v56.origin.x = 0.0;
    v56.origin.y = 0.0;
    v56.size.CGFloat width = v33;
    v56.size.double height = v30;
    double v34 = CGRectGetHeight(v56);
    v57.origin.x = v16;
    v57.origin.y = v18;
    v57.size.CGFloat width = v20;
    v57.size.double height = v22;
    double v35 = CGRectGetHeight(v57) + -50.0;
    double v36 = v34 >= v35 ? v35 : v34;
    v58.origin.x = v16;
    v58.origin.y = v18;
    v58.size.CGFloat width = v20;
    v58.size.double height = v22;
    double MidX = CGRectGetMidX(v58);
    v59.origin.x = 0.0;
    v59.origin.y = 0.0;
    v59.size.CGFloat width = v33;
    v59.size.double height = v36;
    double v38 = MidX + CGRectGetWidth(v59) * -0.5;
    v60.origin.x = v16;
    v60.origin.y = v18;
    v60.size.CGFloat width = v20;
    v60.size.double height = v22;
    double MidY = CGRectGetMidY(v60);
    v61.origin.x = 0.0;
    v61.origin.y = 0.0;
    v61.size.CGFloat width = v33;
    v61.size.double height = v36;
    double v40 = MidY + CGRectGetHeight(v61) * -0.5;
    v62.origin.y = v47;
    v62.origin.x = v48;
    v62.size.double height = v45;
    v62.size.CGFloat width = v46;
    v65.origin.x = v38;
    v65.origin.y = v40;
    v65.size.CGFloat width = v33;
    v65.size.double height = v36;
    if (!CGRectEqualToRect(v62, v65))
    {
      v63.origin.x = v38;
      v63.origin.y = v40;
      v63.size.CGFloat width = v33;
      v63.size.double height = v36;
      if (!CGRectIsEmpty(v63))
      {
        v64.origin.x = v38;
        v64.origin.y = v40;
        v64.size.CGFloat width = v33;
        v64.size.double height = v36;
        if (!CGRectIsInfinite(v64))
        {
          double v41 = CGSizeZero.height;
          if (CGSizeZero.width != v33 || v41 != v36)
          {
            uint64_t v43 = [(MUPrivateExtensionViewController *)self contentContainerView];
            objc_msgSend(v43, "setFrame:", v38, v40, v33, v36);

            if ([(MUPrivateExtensionViewController *)self showAsFormSheet])
            {
              if ([(MUPrivateExtensionViewController *)self useFancyTransition]
                && ([(MUPrivateExtensionViewController *)self isAnimatingMarkupExtensionTransition] & 1) == 0)
              {
                uint64_t v44 = [(MUPrivateExtensionViewController *)self whiteView];
                [v44 removeFromSuperview];

                [(MUPrivateExtensionViewController *)self setWhiteView:0];
              }
            }
          }
        }
      }
    }
  }
}

- (CGAffineTransform)_transformToHideContainerViewBehindBounds:(SEL)a3
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v10 frame];
  CGFloat v11 = width / CGRectGetWidth(v24);

  double v12 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v12 frame];
  CGFloat v13 = height / CGRectGetHeight(v25);

  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeScale(&v23, v11, v13);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  double MidX = CGRectGetMidX(v26);
  double v15 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v15 frame];
  CGFloat v16 = MidX - CGRectGetMidX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  double MidY = CGRectGetMidY(v28);
  CGFloat v18 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v18 frame];
  CGFloat v19 = CGRectGetMidY(v29);
  CGAffineTransformMakeTranslation(&t2, v16, MidY - v19);
  CGAffineTransform v21 = v23;
  CGAffineTransformConcat(retstr, &v21, &t2);

  return result;
}

- (CGRect)_rectBetweenNavAndToolbar
{
  id v3 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(MUPrivateExtensionViewController *)self navBar];
  [v12 bounds];
  double v13 = v7 + CGRectGetHeight(v22);

  double v14 = [(MUPrivateExtensionViewController *)self navBar];
  [v14 bounds];
  double Height = CGRectGetHeight(v23);
  CGFloat v16 = [(MUPrivateExtensionViewController *)self toolbar];
  [v16 bounds];
  double v17 = v11 - (Height + CGRectGetHeight(v24));

  double v18 = v5;
  double v19 = v13;
  double v20 = v9;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_containerBounds
{
  id v3 = [(MUPrivateExtensionViewController *)self view];
  double v4 = [v3 window];

  if (v4)
  {
    double v5 = [(MUPrivateExtensionViewController *)self view];
    double v6 = [v5 window];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }

  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGSize)_minimumFormSheetDimensions
{
  double v2 = 800.0;
  double v3 = 590.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_animateEnteringMarkupWithInfo:(id)a3
{
  id v4 = a3;
  [(MUPrivateExtensionViewController *)self setIsAnimatingMarkupExtensionTransition:1];
  if ([(MUPrivateExtensionViewController *)self showAsFormSheet])
  {
    double v5 = [(MUPrivateExtensionViewController *)self contentViewController];
    [v5 visibleContentRect];
    -[MUPrivateExtensionViewController _adjustFormSheetFrameToFitSize:](self, "_adjustFormSheetFrameToFitSize:", v6, v7);
  }
  memset(&rect, 0, sizeof(rect));
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v4 valueForKey:MUAnimationSourceRect], &rect);
  id v8 = objc_alloc((Class)UIView);
  double v9 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v9 bounds];
  id v10 = objc_msgSend(v8, "initWithFrame:");

  double v11 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
  [v10 setBackgroundColor:v11];

  double v12 = [(MUPrivateExtensionViewController *)self contentViewController];
  double v13 = [v12 view];
  [v13 addSubview:v10];

  id v14 = objc_alloc((Class)UIView);
  double v15 = [(MUPrivateExtensionViewController *)self contentViewController];
  double v16 = [v15 view];
  double v17 = [(MUPrivateExtensionViewController *)self contentViewController];
  [v17 visibleContentRect];
  objc_msgSend(v16, "convertRect:fromView:", 0);
  id v18 = objc_msgSend(v14, "initWithFrame:");

  double v19 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
  [v18 setBackgroundColor:v19];

  double v20 = [(MUPrivateExtensionViewController *)self contentViewController];
  double v21 = [v20 view];
  [v21 addSubview:v18];

  memset(&v84, 0, sizeof(v84));
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v4 valueForKey:MUAnimationMaskRect], &v84);
  if (CGRectContainsRect(v84, rect)) {
    CGRect v84 = rect;
  }
  double v22 = [(MUPrivateExtensionViewController *)self view];
  objc_msgSend(v22, "convertRect:fromView:", 0, v84.origin.x, v84.origin.y, v84.size.width, v84.size.height);
  v84.origin.double x = v23;
  v84.origin.double y = v24;
  v84.size.double width = v25;
  v84.size.double height = v26;

  id v27 = objc_alloc((Class)UIView);
  id v28 = objc_msgSend(v27, "initWithFrame:", v84.origin.x, v84.origin.y, v84.size.width, v84.size.height);
  CGRect v29 = [(MUPrivateExtensionViewController *)self view];
  if ([(MUPrivateExtensionViewController *)self showAsFormSheet])
  {
    CGFloat v30 = [(MUPrivateExtensionViewController *)self contentContainerView];
    [v29 insertSubview:v28 aboveSubview:v30];
  }
  else
  {
    CGFloat v30 = [(MUPrivateExtensionViewController *)self contentViewController];
    double v31 = [v30 view];
    [v29 insertSubview:v28 aboveSubview:v31];
  }
  [v28 setClipsToBounds:1];
  double v32 = [(MUPrivateExtensionViewController *)self contentViewController];
  double v33 = [v32 contentSnapshot];

  objc_msgSend(v28, "convertRect:fromView:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  objc_msgSend(v33, "setFrame:");
  [v28 addSubview:v33];
  double v34 = [v4 valueForKey:MUAnimationIconImage];
  if (v34)
  {
    id v35 = objc_alloc((Class)UIImageView);
    [v33 bounds];
    id v36 = objc_msgSend(v35, "initWithFrame:");
    [v36 setImage:v34];
    [v33 addSubview:v36];
  }
  else
  {
    id v36 = 0;
  }
  id v37 = objc_alloc((Class)UIView);
  [v28 frame];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v46 = [(MUPrivateExtensionViewController *)self view];
  objc_msgSend(v46, "convertRect:fromView:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  v89.origin.double x = v47;
  v89.origin.double y = v48;
  v89.size.double width = v49;
  v89.size.double height = v50;
  v86.origin.double x = v39;
  v86.origin.double y = v41;
  v86.size.double width = v43;
  v86.size.double height = v45;
  CGRect v87 = CGRectIntersection(v86, v89);
  id v51 = objc_msgSend(v37, "initWithFrame:", v87.origin.x, v87.origin.y, v87.size.width, v87.size.height);
  [(MUPrivateExtensionViewController *)self setWhiteView:v51];

  CGRect v52 = +[UIColor whiteColor];
  CGRect v53 = [(MUPrivateExtensionViewController *)self whiteView];
  [v53 setBackgroundColor:v52];

  CGRect v54 = [(MUPrivateExtensionViewController *)self view];
  CGRect v55 = [(MUPrivateExtensionViewController *)self whiteView];
  [v54 insertSubview:v55 atIndex:0];

  if ([(MUPrivateExtensionViewController *)self showAsFormSheet])
  {
    CGRect v56 = [(MUPrivateExtensionViewController *)self view];
    objc_msgSend(v56, "convertRect:fromView:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    v90.origin.double x = v57;
    v90.origin.double y = v58;
    v90.size.double width = v59;
    v90.size.double height = v60;
    CGRect v88 = CGRectIntersection(v84, v90);
    double x = v88.origin.x;
    double y = v88.origin.y;
    double width = v88.size.width;
    double height = v88.size.height;

    -[MUPrivateExtensionViewController _transformToHideContainerViewBehindBounds:](self, "_transformToHideContainerViewBehindBounds:", x, y, width, height);
    CGRect v65 = [(MUPrivateExtensionViewController *)self contentContainerView];
    v83[0] = v83[3];
    v83[1] = v83[4];
    v83[2] = v83[5];
    [v65 setTransform:v83];
  }
  v66 = [(MUPrivateExtensionViewController *)self view];
  [v66 layoutIfNeeded];

  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100004AB4;
  v77[3] = &unk_1000083F0;
  v77[4] = self;
  id v78 = v28;
  id v79 = v10;
  id v80 = v33;
  id v81 = v36;
  id v82 = v18;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100004E6C;
  v72[3] = &unk_100008418;
  id v73 = v78;
  id v74 = v79;
  id v75 = v82;
  v76 = self;
  id v67 = v82;
  id v68 = v79;
  id v69 = v78;
  id v70 = v36;
  id v71 = v33;
  +[UIView animateKeyframesWithDuration:0 delay:v77 options:v72 animations:0.5 completion:0.0];
}

- (void)_animateExitWithInfo:(id)a3
{
  id v4 = a3;
  if ([(MUPrivateExtensionViewController *)self _validateAnimationDictionary:v4 isEntering:0])
  {
    memset(&rect, 0, sizeof(rect));
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v4 valueForKey:MUAnimationTargetRect], &rect);
    uint64_t v78 = 0;
    id v79 = (CGRect *)&v78;
    uint64_t v80 = 0x4010000000;
    id v81 = &unk_100007CD1;
    long long v82 = 0u;
    long long v83 = 0u;
    CFDictionaryRef v5 = (const __CFDictionary *)[v4 valueForKey:MUAnimationMaskRect];
    CGRectMakeWithDictionaryRepresentation(v5, v79 + 1);
    double v6 = [(MUPrivateExtensionViewController *)self view];
    objc_msgSend(v6, "convertRect:fromView:", 0, v79[1].origin.x, v79[1].origin.y, v79[1].size.width, v79[1].size.height);
    p_double x = (void *)&v79->origin.x;
    v79[1].origin.double x = v8;
    p_x[5] = v9;
    p_x[6] = v10;
    p_x[7] = v11;

    id v12 = objc_alloc((Class)UIView);
    id v13 = objc_msgSend(v12, "initWithFrame:", v79[1].origin.x, v79[1].origin.y, v79[1].size.width, v79[1].size.height);
    id v14 = [(MUPrivateExtensionViewController *)self view];
    uint64_t v15 = (uint64_t)[(MUPrivateExtensionViewController *)self showAsFormSheet];
    if (v15)
    {
      double v16 = [(MUPrivateExtensionViewController *)self contentContainerView];
      double v17 = v16;
    }
    else
    {
      double v17 = [(MUPrivateExtensionViewController *)self contentViewController];
      double v16 = [v17 view];
    }
    [v14 insertSubview:v13 aboveSubview:v16];
    if ((v15 & 1) == 0) {

    }
    [v13 setClipsToBounds:1];
    id v18 = [(MUPrivateExtensionViewController *)self contentViewController];
    [v18 visibleContentRect];
    objc_msgSend(v13, "convertRect:fromView:", 0);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    [v13 bounds];
    v87.origin.double x = v20;
    v87.origin.double y = v22;
    v87.size.double width = v24;
    v87.size.double height = v26;
    if (!CGRectContainsRect(v85, v87))
    {
      unsigned int v27 = [(MUPrivateExtensionViewController *)self showAsFormSheet];
      char v28 = v27;
      if (v27)
      {
        [(MUPrivateExtensionViewController *)self _rectBetweenNavAndToolbar];
      }
      else
      {
        uint64_t v15 = [(MUPrivateExtensionViewController *)self view];
        [(id)v15 bounds];
      }
      objc_msgSend(v13, "setFrame:");
      if ((v28 & 1) == 0) {

      }
      CGRect v29 = [(MUPrivateExtensionViewController *)self contentViewController];
      [v29 visibleContentRect];
      objc_msgSend(v13, "convertRect:fromView:", 0);
      double v20 = v30;
      double v22 = v31;
      double v24 = v32;
      double v26 = v33;
    }
    double v34 = [(MUPrivateExtensionViewController *)self contentViewController];
    id v35 = [v34 contentSnapshot];

    objc_msgSend(v35, "setFrame:", v20, v22, v24, v26);
    [v13 addSubview:v35];
    uint64_t v36 = [v4 valueForKey:MUAnimationIconImage];
    if (v36)
    {
      id v37 = objc_alloc((Class)UIImageView);
      [v35 bounds];
      id v38 = objc_msgSend(v37, "initWithFrame:");
      [v38 setImage:v36];
      [v38 setAlpha:0.0];
      [v35 addSubview:v38];
    }
    else
    {
      id v38 = 0;
    }
    id v69 = (void *)v36;
    id v39 = objc_alloc((Class)UIView);
    double v40 = [(MUPrivateExtensionViewController *)self view];
    [v40 bounds];
    id v41 = objc_msgSend(v39, "initWithFrame:");

    double v42 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
    [v41 setBackgroundColor:v42];

    CGFloat v43 = [(MUPrivateExtensionViewController *)self contentViewController];
    double v44 = [v43 view];
    [v44 addSubview:v41];

    [v41 setAlpha:0.0];
    id v45 = objc_alloc((Class)UIView);
    CGFloat v46 = [(MUPrivateExtensionViewController *)self contentViewController];
    CGFloat v47 = [v46 view];
    CGFloat v48 = [(MUPrivateExtensionViewController *)self contentViewController];
    [v48 visibleContentRect];
    objc_msgSend(v47, "convertRect:fromView:", 0);
    id v49 = objc_msgSend(v45, "initWithFrame:");

    CGFloat v50 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
    [v49 setBackgroundColor:v50];

    id v51 = [(MUPrivateExtensionViewController *)self contentViewController];
    CGRect v52 = [v51 view];
    [v52 addSubview:v49];

    id v53 = objc_alloc((Class)UIView);
    CGRect v54 = v79;
    CGRect v55 = [(MUPrivateExtensionViewController *)self view];
    objc_msgSend(v55, "convertRect:fromView:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    v88.origin.double x = v56;
    v88.origin.double y = v57;
    v88.size.double width = v58;
    v88.size.double height = v59;
    CGRect v86 = CGRectIntersection(v54[1], v88);
    id v60 = objc_msgSend(v53, "initWithFrame:", v86.origin.x, v86.origin.y, v86.size.width, v86.size.height);

    CGRect v61 = +[UIColor whiteColor];
    [v60 setBackgroundColor:v61];

    CGRect v62 = [(MUPrivateExtensionViewController *)self view];
    [v62 insertSubview:v60 atIndex:0];

    CGRect v63 = +[UIColor clearColor];
    CGRect v64 = [(MUPrivateExtensionViewController *)self contentContainerView];
    [v64 setBackgroundColor:v63];

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    CGRect v77 = rect;
    v71[2] = sub_1000055EC;
    v71[3] = &unk_100008440;
    v71[4] = self;
    v76 = &v78;
    id v65 = v41;
    id v72 = v65;
    id v66 = v13;
    id v73 = v66;
    id v67 = v35;
    id v74 = v67;
    id v68 = v38;
    id v75 = v68;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100005A0C;
    v70[3] = &unk_100008468;
    v70[4] = self;
    +[UIView animateKeyframesWithDuration:0 delay:v71 options:v70 animations:0.5 completion:0.0];

    _Block_object_dispose(&v78, 8);
  }
  else
  {
    [(MUPrivateExtensionViewController *)self documentDidCloseTeardown];
  }
}

- (void)_bailFailedAnimateEnterMarkup
{
  double v3 = [(MUPrivateExtensionViewController *)self contentContainerView];
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v15[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v15[1] = v4;
  v15[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v3 setTransform:v15];

  CFDictionaryRef v5 = [(MUPrivateExtensionViewController *)self toolbar];
  [v5 setAlpha:1.0];

  double v6 = [(MUPrivateExtensionViewController *)self navBar];
  [v6 setAlpha:1.0];

  double v7 = [(MUPrivateExtensionViewController *)self contentViewController];
  CGFloat v8 = [v7 view];
  [v8 setAlpha:1.0];

  uint64_t v9 = [(MUPrivateExtensionViewController *)self _effectiveBackgroundColor];
  uint64_t v10 = [(MUPrivateExtensionViewController *)self contentContainerView];
  [v10 setBackgroundColor:v9];

  if ([(MUPrivateExtensionViewController *)self showAsFormSheet])
  {
    uint64_t v11 = [(MUPrivateExtensionViewController *)self transitionDimmingView];
    [v11 setAlpha:0.37];
  }
  id v12 = [(MUPrivateExtensionViewController *)self annotationController];
  id v13 = [v12 toolbarViewController];

  id v14 = [v13 floatingAttributeToolbarContainer];
  [v14 setAlpha:1.0];
}

@end