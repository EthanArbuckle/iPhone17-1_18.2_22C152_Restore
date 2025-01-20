@interface _DRPasteAnnouncementViewController
+ (BOOL)shouldCoalesce:(id)a3;
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (DRPasteAnnouncement)announcement;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (_DRPasteAnnouncementViewController)initWithAnnouncement:(id)a3 reply:(id)a4 bannerSource:(id)a5;
- (id)authorizationDecisionView;
- (id)authorizationReplyBlock;
- (id)initForDeniedPasteWithBannerSource:(id)a3;
- (void)allowPaste:(id)a3;
- (void)denyPaste:(id)a3;
- (void)dismissBanner;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setAnnouncement:(id)a3;
- (void)setAuthorizationReplyBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation _DRPasteAnnouncementViewController

- (_DRPasteAnnouncementViewController)initWithAnnouncement:(id)a3 reply:(id)a4 bannerSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_DRPasteAnnouncementViewController;
  v12 = [(_DRPasteAnnouncementViewController *)&v21 initWithNibName:0 bundle:0];
  uint64_t v13 = (uint64_t)v12;
  if (v12)
  {
    p_announcement = (id *)&v12->_announcement;
    objc_storeStrong((id *)&v12->_announcement, a3);
    *(unsigned char *)(v13 + 40) = 0;
    id v15 = objc_retainBlock(v10);
    v16 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v15;

    if (v10)
    {
      v17 = +[NSDate distantFuture];
      [v17 timeIntervalSinceReferenceDate];
      *(void *)(v13 + 32) = v18;

      [*p_announcement localizedAuthorizationText];
    }
    else
    {
      *(void *)(v13 + 32) = 0x3FF8000000000000;
      [*p_announcement localizedAnnouncementText];
    v19 = };
    sub_10000CF7C(v13, v19, 0, v11);
  }
  return (_DRPasteAnnouncementViewController *)v13;
}

- (id)initForDeniedPasteWithBannerSource:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DRPasteAnnouncementViewController;
  v5 = [(_DRPasteAnnouncementViewController *)&v14 initWithNibName:0 bundle:0];
  v6 = (double *)v5;
  if (v5)
  {
    v5->_isPasteDeniedAnnouncement = 1;
    v7 = +[DREnterpriseInfo sharedInstance];
    v8 = [v7 orgName];

    if (v8)
    {
      BOOL v9 = sub_100008ACC(v8);
      double v10 = 2.0;
      if (v9) {
        double v10 = 2.5;
      }
      v6[4] = v10;
      id v11 = sub_100008A20(v8);
      v12 = sub_1000089B4();
      sub_10000CF7C((uint64_t)v6, v12, v11, v4);
    }
    else
    {
      v6[4] = 2.0;
      id v11 = sub_1000089B4();
      sub_10000CF7C((uint64_t)v6, v11, 0, v4);
    }
  }
  return v6;
}

- (void)allowPaste:(id)a3
{
  id v4 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];
  v4[2](v4, 1);

  [(_DRPasteAnnouncementViewController *)self setAuthorizationReplyBlock:0];
  [(_DRPasteAnnouncementViewController *)self dismissBanner];
}

- (void)denyPaste:(id)a3
{
  id v4 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];
  v4[2](v4, 0);

  [(_DRPasteAnnouncementViewController *)self setAuthorizationReplyBlock:0];
  [(_DRPasteAnnouncementViewController *)self dismissBanner];
}

- (void)dismissBanner
{
  id v2 = [(BNBannerSource *)self->_bannerSource revokePresentableWithRequestIdentifier:self->_requestID reason:@"userInteraction" animated:1 userInfo:0 error:0];
}

- (id)authorizationDecisionView
{
  v47 = +[NSBundle mainBundle];
  v46 = [v47 localizedStringForKey:@"PASTE_AUTHORIZATION_BUTTON_ALLOW" value:@"Allow" table:@"Localizable"];
  v45 = [v47 localizedStringForKey:@"PASTE_AUTHORIZATION_BUTTON_DENY" value:@"Don't Allow" table:@"Localizable"];
  v3 = +[UIButton buttonWithType:1];
  [v3 setTitle:v46 forState:0];
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v5 = [v3 titleLabel];
  [v5 setFont:v4];

  v6 = +[UIButton buttonWithType:1];
  [v6 setTitle:v45 forState:0];
  v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v8 = [v6 titleLabel];
  [v8 setFont:v7];

  [v6 setRole:2];
  [v6 addTarget:self action:"denyPaste:" forControlEvents:0x2000];
  [v3 addTarget:self action:"allowPaste:" forControlEvents:0x2000];
  BOOL v9 = objc_opt_new();
  double v10 = objc_opt_new();
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 addSubview:v3];
  [v10 addSubview:v6];
  [v3 sizeToFit];
  [v6 sizeToFit];
  [v9 addSubview:v10];
  v44 = [v10 leadingAnchor];
  v43 = [v6 leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v48[0] = v42;
  v41 = [v10 trailingAnchor];
  v40 = [v3 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v48[1] = v39;
  v38 = [v3 leadingAnchor];
  v36 = [v6 trailingAnchor];
  v35 = [v38 constraintEqualToSystemSpacingAfterAnchor:v36 multiplier:6.0];
  v48[2] = v35;
  v34 = [v10 topAnchor];
  v37 = v3;
  v33 = [v3 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v48[3] = v32;
  v31 = [v10 topAnchor];
  v30 = [v6 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v48[4] = v29;
  v28 = [v10 bottomAnchor];
  v27 = [v3 bottomAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v48[5] = v26;
  v25 = [v10 bottomAnchor];
  v24 = [v6 bottomAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v48[6] = v23;
  v22 = [v10 centerXAnchor];
  objc_super v21 = [v9 centerXAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v48[7] = v20;
  id v11 = [v10 centerYAnchor];
  v12 = v9;
  uint64_t v13 = [v9 centerYAnchor];
  objc_super v14 = [v11 constraintEqualToAnchor:v13];
  v48[8] = v14;
  id v15 = [v9 heightAnchor];
  v16 = [v10 heightAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 multiplier:2.0];
  v48[9] = v17;
  uint64_t v18 = +[NSArray arrayWithObjects:v48 count:10];
  +[NSLayoutConstraint activateConstraints:v18];

  [v12 layoutIfNeeded];
  return v12;
}

- (void)viewDidLoad
{
  [(PLPillView *)self->_pillView setAutoresizingMask:18];
  v3 = [(_DRPasteAnnouncementViewController *)self view];
  [v3 bounds];
  -[PLPillView setFrame:](self->_pillView, "setFrame:");

  id v4 = [(_DRPasteAnnouncementViewController *)self view];
  [v4 addSubview:self->_pillView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.DragUI.druid";
}

- (NSString)requestIdentifier
{
  return self->_requestID;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  -[PLPillView systemLayoutSizeFittingSize:](self->_pillView, "systemLayoutSizeFittingSize:", a3.width, a3.height, a4.width, a4.height);
  if (!self->_isPasteDeniedAnnouncement || (double v7 = 358.0, v5 <= 358.0))
  {
    double v7 = 280.0;
    if (!self->_isPasteDeniedAnnouncement || v5 >= 280.0) {
      double v7 = v5;
    }
  }
  double v8 = v7;
  result.height = v6;
  result.width = v8;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  [(PLPillView *)self->_pillView shadowOutsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)shouldCoalesce:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  double v4 = (void *)qword_100064618;
  if (qword_100064618)
  {
    if (!v3)
    {
      double v5 = [(id)qword_100064618 announcement];

      if (!v5)
      {
        unsigned __int8 v7 = 1;
        goto LABEL_8;
      }
      double v4 = (void *)qword_100064618;
    }
    double v6 = [v4 announcement];
    unsigned __int8 v7 = [v3 canCoalesceWithAnnouncement:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
LABEL_8:

  return v7;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  double v4 = (_DRPasteAnnouncementViewController *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v4 == self)
  {
    double v5 = v4->_bannerSource;
    double v6 = v4->_requestID;
    double announcementDuration = v4->_announcementDuration;
    double v8 = +[NSDate distantFuture];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    if (announcementDuration != v10)
    {
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v4->_announcementDuration * 1000000000.0));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000DD20;
      v12[3] = &unk_100054C58;
      uint64_t v13 = v5;
      objc_super v14 = v6;
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v12);
    }
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v6 = qword_100064618;

  if ((id)v6 == v5)
  {
    unsigned __int8 v7 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];

    if (v7)
    {
      double v8 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];
      v8[2](v8, 0);

      [(_DRPasteAnnouncementViewController *)self setAuthorizationReplyBlock:0];
    }
    double v9 = (void *)qword_100064618;
    qword_100064618 = 0;
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  if ((id)qword_100064618 == a3)
  {
    unsigned __int8 v7 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];

    if (v7)
    {
      double v8 = [(_DRPasteAnnouncementViewController *)self authorizationReplyBlock];
      v8[2](v8, 0);
    }
    double v9 = DRLogTarget();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Banner posting was rejected by BannerKit: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (DRPasteAnnouncement)announcement
{
  return (DRPasteAnnouncement *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAnnouncement:(id)a3
{
}

- (id)authorizationReplyBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAuthorizationReplyBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationReplyBlock, 0);
  objc_storeStrong((id *)&self->_announcement, 0);
  objc_storeStrong((id *)&self->_bannerSource, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end