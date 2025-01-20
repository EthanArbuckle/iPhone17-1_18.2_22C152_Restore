@interface PresentationViewController
- (BNBannerSource)bannerSource;
- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3;
- (BOOL)isActive;
- (BOOL)isDynamicIslandAvailable;
- (BOOL)preventsInteractiveDismissal;
- (BOOL)providesHostedContent;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (LAUIPearlGlyphView)glyphView;
- (NSString)associatedAppBundleIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (id)presentableDescription;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_checkDismissalCompletion;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentOnParentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)revokePresentableWithCompletionHandler:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setGlyphView:(id)a3;
- (void)shake;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLoad;
@end

@implementation PresentationViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PresentationViewController;
  [(PresentationViewController *)&v5 viewDidLoad];
  v3 = (NSMutableArray *)objc_opt_new();
  dismissCompletionHandlers = self->_dismissCompletionHandlers;
  self->_dismissCompletionHandlers = v3;
}

- (void)presentOnParentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a5;
  if ([(PresentationViewController *)self isDynamicIslandAvailable])
  {
    +[LANotificationUIBannerAppearance postNotificationWithNewBoolState:1];
    v25[0] = kSBUIPresentableSystemApertureSupportingUserInfoKey;
    v25[1] = @"SBUIPresentableSystemApertureAffectsAppLifecyleUserInfoKey";
    v26[0] = &__kCFBooleanTrue;
    v26[1] = &__kCFBooleanFalse;
    v10 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v11 = LACLogFaceIDUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(PresentationViewController *)self requestIdentifier];
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Posting %{public}@", buf, 0xCu);
    }
    v13 = [(PresentationViewController *)self bannerSource];
    id v17 = 0;
    unsigned __int8 v14 = [v13 postPresentable:self options:1 userInfo:v10 error:&v17];
    id v15 = v17;

    if ((v14 & 1) == 0)
    {
      v16 = LACLogFaceIDUI();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100061648();
      }
    }
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D634;
    block[3] = &unk_100086758;
    objc_copyWeak(&v21, (id *)buf);
    id v19 = v8;
    BOOL v22 = a4;
    v20 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PresentationViewController *)self isDynamicIslandAvailable])
  {
    [(PresentationViewController *)self revokePresentableWithCompletionHandler:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PresentationViewController;
    [(PresentationViewController *)&v7 dismissViewControllerAnimated:v4 completion:v6];
  }
}

- (void)revokePresentableWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  objc_super v5 = LACLogFaceIDUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PresentationViewController *)self requestIdentifier];
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Revoking %{public}@", buf, 0xCu);
  }
  objc_super v7 = [(PresentationViewController *)self bannerSource];
  id v8 = [(PresentationViewController *)self requestIdentifier];
  v9 = +[NSString stringWithFormat:@"dismissing %@", self];
  id v16 = 0;
  v10 = [v7 revokePresentableWithRequestIdentifier:v8 reason:v9 animated:1 userInfo:0 error:&v16];
  id v11 = v16;

  if (v10)
  {
    if (v4)
    {
      dismissCompletionHandlers = self->_dismissCompletionHandlers;
      v13 = objc_retainBlock(v4);
      [(NSMutableArray *)dismissCompletionHandlers addObject:v13];

      unsigned __int8 v14 = LACLogFaceIDUI();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100061718((uint64_t)self, (id *)&self->_dismissCompletionHandlers, v14);
      }
    }
  }
  else
  {
    id v15 = LACLogFaceIDUI();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000616B0();
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

- (BNBannerSource)bannerSource
{
  bannerSource = self->_bannerSource;
  if (!bannerSource)
  {
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v5 = [v4 bundleIdentifier];
    id v6 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:v5];
    objc_super v7 = self->_bannerSource;
    self->_bannerSource = v6;

    bannerSource = self->_bannerSource;
  }

  return bannerSource;
}

- (NSString)requesterIdentifier
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)requestIdentifier
{
  return +[NSString stringWithFormat:@"PresentingRequest:%@", self];
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v3 = a3;
  BOOL v4 = LACLogFaceIDUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "presentableWillAppearAsBanner:%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  int v5 = LACLogFaceIDUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "presentableDidAppearAsBanner:%{public}@", buf, 0xCu);
  }

  self->_isActive = 1;
  byte_10009E2A8 = 1;
  if (self->_preventingInteractiveDismissal)
  {
    objc_initWeak((id *)buf, self);
    id v6 = [(PresentationViewController *)self glyphView];
    objc_super v7 = [v6 remainingMinDisplayTimeInterval];
    [v7 doubleValue];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DD28;
    block[3] = &unk_1000860D8;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = LACLogFaceIDUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presentableWillDisappearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  self->_isActive = 0;
  byte_10009E2A8 = 0;
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = LACLogFaceIDUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presentableDidDisappearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  +[LANotificationUIBannerAppearance postNotificationWithNewBoolState:0];
  [(PresentationViewController *)self _checkDismissalCompletion];
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = LACLogFaceIDUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presentableWillNotAppearAsBanner:%{public}@ withReason:%{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(PresentationViewController *)self _checkDismissalCompletion];
}

- (void)_checkDismissalCompletion
{
  if ([(NSMutableArray *)self->_dismissCompletionHandlers count])
  {
    unint64_t v4 = 0;
    *(void *)&long long v3 = 138543874;
    long long v8 = v3;
    do
    {
      int v5 = LACLogFaceIDUI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v7 = [(NSMutableArray *)self->_dismissCompletionHandlers count];
        *(_DWORD *)buf = v8;
        id v10 = self;
        __int16 v11 = 1024;
        int v12 = v4 + 1;
        __int16 v13 = 1024;
        unsigned int v14 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@ is calling completion handler %u of %u", buf, 0x18u);
      }

      id v6 = [(NSMutableArray *)self->_dismissCompletionHandlers objectAtIndexedSubscript:v4];
      v6[2]();

      ++v4;
    }
    while (v4 < (unint64_t)[(NSMutableArray *)self->_dismissCompletionHandlers count]);
  }
  [(NSMutableArray *)self->_dismissCompletionHandlers removeAllObjects];
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v3 = a3;
  unint64_t v4 = LACLogFaceIDUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "userInteractionWillBeginForPresentable:%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v3 = a3;
  unint64_t v4 = LACLogFaceIDUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "userInteractionDidEndForPresentable:%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)presentableDescription
{
  return [(PresentationViewController *)self description];
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)contentRole
{
  return 1;
}

- (BOOL)preventsInteractiveDismissal
{
  id v3 = [(PresentationViewController *)self glyphView];
  unint64_t v4 = [v3 remainingMinDisplayTimeInterval];

  if (v4)
  {
    [v4 doubleValue];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 1;
  }
  self->_preventingInteractiveDismissal = v6;

  return v6;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (NSString)associatedAppBundleIdentifier
{
  return 0;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (BOOL)bn_shouldAnimateViewTransitionToSize:(CGSize)a3
{
  return 1;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  [(PresentationViewController *)self preferredContentSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)isDynamicIslandAvailable
{
  if (qword_10009E2B0 != -1) {
    dispatch_once(&qword_10009E2B0, &stru_100086908);
  }
  return byte_10009E2A9;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)shake
{
  id v3 = LACLogFaceIDUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(PresentationViewController *)self systemApertureElementContext];
    int v6 = 138543618;
    unsigned int v7 = self;
    __int16 v8 = 2114;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will shake via %{public}@", (uint8_t *)&v6, 0x16u);
  }
  double v5 = [(PresentationViewController *)self systemApertureElementContext];
  [v5 requestNegativeResponseAnimation];
}

- (int64_t)activeLayoutMode
{
  return self->activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->activeLayoutMode = a3;
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);

  objc_storeStrong((id *)&self->_dismissCompletionHandlers, 0);
}

@end