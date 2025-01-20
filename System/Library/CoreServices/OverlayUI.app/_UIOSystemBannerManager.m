@interface _UIOSystemBannerManager
+ (id)sharedInstance;
- (void)bannerSourceDidInvalidate:(id)a3;
- (void)beginDismissalTimerWithInterval:(double)a3;
- (void)postBannerWithRequest:(id)a3;
- (void)presentable:(id)a3 willDisappearWithReason:(id)a4;
@end

@implementation _UIOSystemBannerManager

+ (id)sharedInstance
{
  if (qword_10000EC58 != -1) {
    dispatch_once(&qword_10000EC58, &stru_1000082E0);
  }
  v2 = (void *)qword_10000EC50;

  return v2;
}

- (void)postBannerWithRequest:(id)a3
{
  id v4 = a3;
  if (!self->_bannerSource)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2050000000;
    v5 = (void *)qword_10000EC78;
    uint64_t v43 = qword_10000EC78;
    if (!qword_10000EC78)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v47 = sub_100002210;
      v48 = &unk_100008330;
      v49 = &v40;
      sub_100002210((uint64_t)&buf);
      v5 = (void *)v41[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v40, 8);
    v7 = +[NSBundle mainBundle];
    v8 = [v7 bundleIdentifier];
    v9 = [v6 bannerSourceForDestination:0 forRequesterIdentifier:v8];
    bannerSource = self->_bannerSource;
    self->_bannerSource = v9;

    [(BNBannerSource *)self->_bannerSource setDelegate:self];
  }
  v11 = [(_UIOSystemBannerViewController *)self->_currentlyPresentedBanner request];
  unsigned int v12 = [v11 isEqual:v4];

  if (v12)
  {
    [v4 bannerTimeoutDuration];
    -[_UIOSystemBannerManager beginDismissalTimerWithInterval:](self, "beginDismissalTimerWithInterval:");
  }
  else
  {
    v13 = self->_bannerSource;
    id v39 = 0;
    v14 = [(BNBannerSource *)v13 layoutDescriptionWithError:&v39];
    id v15 = v39;
    if (v14)
    {
      v16 = [[_UIOSystemBannerViewController alloc] initWithBannerRequest:v4];
      [(_UIOSystemBannerViewController *)v16 setDelegate:self];
      [v14 presentationSize];
      double v18 = v17;
      double v20 = v19;
      [v14 containerSize];
      -[_UIOSystemBannerViewController preferredContentSizeWithPresentationSize:containerSize:](v16, "preferredContentSizeWithPresentationSize:containerSize:", v18, v20, v21, v22);
      -[_UIOSystemBannerViewController setPreferredContentSize:](v16, "setPreferredContentSize:");
      v44[0] = @"com.apple.DragUI.druid.DRPasteAnnouncementAccessibilityDescriptionKey";
      v23 = [v4 primaryTitleText];
      v45[0] = v23;
      v44[1] = _UISystemBannerAccessibilityValueKey;
      v24 = [v4 primaryTitleText];
      v45[1] = v24;
      v44[2] = @"SBUIPresentableShouldBypassScreenSharingUserInfoKey";
      v45[2] = &__kCFBooleanTrue;
      v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];

      v26 = self->_bannerSource;
      id v38 = 0;
      LODWORD(v24) = [(BNBannerSource *)v26 postPresentable:v16 options:1 userInfo:0 error:&v38];
      id v27 = v38;

      if (v24)
      {
        uint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl();
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v35 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = v35;
            v37 = [v4 primaryTitleText];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Posting system banner with title: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        objc_storeStrong((id *)&self->_currentlyPresentedBanner, v16);
        [v4 bannerTimeoutDuration];
        -[_UIOSystemBannerManager beginDismissalTimerWithInterval:](self, "beginDismissalTimerWithInterval:");
      }
      else
      {
        v32 = *(NSObject **)(__UILogGetCategoryCachedImpl() + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = v32;
          v34 = [v27 localizedDescription];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Unable to post banner: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    else
    {
      v29 = *(NSObject **)(__UILogGetCategoryCachedImpl() + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        v31 = [v15 localizedDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to get banner source layout: %@", (uint8_t *)&buf, 0xCu);
      }
      id v27 = v15;
    }
  }
}

- (void)beginDismissalTimerWithInterval:(double)a3
{
  [(BSAbsoluteMachTimer *)self->_bannerTimeoutTimer invalidate];
  v5 = (BSAbsoluteMachTimer *)[objc_alloc((Class)BSAbsoluteMachTimer) initWithIdentifier:@"com.apple.UIKit.OverlayUI._UIOSystemBannerManager"];
  bannerTimeoutTimer = self->_bannerTimeoutTimer;
  self->_bannerTimeoutTimer = v5;

  objc_initWeak(&location, self);
  v7 = self->_bannerTimeoutTimer;
  id v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000207C;
  v9[3] = &unk_100008308;
  objc_copyWeak(&v10, &location);
  [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:&_dispatch_main_q leewayInterval:v9 queue:a3 handler:0.0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)presentable:(id)a3 willDisappearWithReason:(id)a4
{
  v5 = (_UIOSystemBannerViewController *)a3;
  if (self->_currentlyPresentedBanner == v5)
  {
    self->_currentlyPresentedBanner = 0;
    v7 = v5;

    [(BSAbsoluteMachTimer *)self->_bannerTimeoutTimer invalidate];
    bannerTimeoutTimer = self->_bannerTimeoutTimer;
    self->_bannerTimeoutTimer = 0;

    v5 = v7;
  }
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  id v4 = (BNBannerSource *)a3;
  if (self->_bannerSource == v4)
  {
    self->_bannerSource = 0;
    v5 = v4;

    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);

  objc_storeStrong((id *)&self->_currentlyPresentedBanner, 0);
}

@end