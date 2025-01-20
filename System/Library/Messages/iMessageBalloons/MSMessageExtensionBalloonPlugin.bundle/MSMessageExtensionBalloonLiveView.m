@interface MSMessageExtensionBalloonLiveView
- (BOOL)forceHideAppIcon;
- (BOOL)isFromMe;
- (BOOL)isInShelf;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptPluginViewDelegate)pluginViewDelegate;
- (MSMessageExtensionBalloonLiveView)initWithFrame:(CGRect)a3 dataSource:(id)a4 fromMe:(BOOL)a5;
- (MSMessageExtensionBalloonLiveViewDelegate)delegate;
- (MSMessageExtensionDataSource)dataSource;
- (UIImageView)iconView;
- (UIView)remoteBalloonView;
- (UIView)staticView;
- (_MSRemoteBalloonViewController)remoteBalloonViewController;
- (id)interactiveViews;
- (id)payload;
- (void)configureForDisplay;
- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4;
- (void)iconViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceHideAppIcon:(BOOL)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIsInShelf:(BOOL)a3;
- (void)setPluginViewDelegate:(id)a3;
- (void)setRemoteBalloonView:(id)a3;
- (void)setRemoteBalloonViewController:(id)a3;
- (void)setStaticView:(id)a3;
- (void)updateIconForPlugin:(id)a3;
@end

@implementation MSMessageExtensionBalloonLiveView

- (MSMessageExtensionBalloonLiveView)initWithFrame:(CGRect)a3 dataSource:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MSMessageExtensionBalloonLiveView;
  v13 = -[MSMessageExtensionBalloonLiveView initWithFrame:](&v34, "initWithFrame:", x, y, width, height);
  if (v13)
  {
    v14 = ms_defaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v12 pluginPayload];
      unsigned int v16 = [v15 isFromMe];
      CFStringRef v17 = @"NO";
      if (v16) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v36 = v13;
      CFStringRef v38 = v18;
      __int16 v37 = 2112;
      if (v5) {
        CFStringRef v17 = @"YES";
      }
      __int16 v39 = 2112;
      CFStringRef v40 = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBalloonView init self %@ payload from me %@ from me %@", buf, 0x20u);
    }
    v13->_fromMe = v5;
    objc_storeStrong((id *)&v13->_dataSource, a4);
    [(MSMessageExtensionBalloonLiveView *)v13 setClipsToBounds:1];
    v19 = +[IMBalloonPluginManager sharedInstance];
    v20 = [(MSMessageExtensionBalloonLiveView *)v13 payload];
    v21 = [v20 pluginBundleID];
    v22 = [v19 balloonPluginForBundleID:v21];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v22 shouldBalloonHideAppIcon] & 1) == 0)
    {
      if (v5) {
        double v23 = 6.0;
      }
      else {
        double v23 = 12.0;
      }
      v24 = +[CKUIBehavior sharedBehaviors];
      [v24 iMessageAppIconSize];
      double v26 = v25;
      double v28 = v27;

      v29 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", v23, 6.0, v26, v28);
      [(UIImageView *)v29 setAutoresizingMask:36];
      [(UIImageView *)v29 setUserInteractionEnabled:1];
      id v30 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v13 action:"iconViewTapped:"];
      [(UIImageView *)v29 addGestureRecognizer:v30];

      iconView = v13->_iconView;
      v13->_iconView = v29;
      v32 = v29;

      [(MSMessageExtensionBalloonLiveView *)v13 addSubview:v32];
    }
  }
  return v13;
}

- (void)setForceHideAppIcon:(BOOL)a3
{
  if (self->_forceHideAppIcon != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = [(MSMessageExtensionBalloonLiveView *)self iconView];

    if (v5)
    {
      self->_forceHideAppIcon = v3;
      id v6 = [(MSMessageExtensionBalloonLiveView *)self iconView];
      [v6 setHidden:v3];
    }
  }
}

- (id)payload
{
  v2 = [(MSMessageExtensionBalloonLiveView *)self dataSource];
  BOOL v3 = [v2 pluginPayload];

  return v3;
}

- (void)updateIconForPlugin:(id)a3
{
  id v4 = a3;
  if (self->_iconView)
  {
    BOOL v5 = [(MSMessageExtensionBalloonLiveView *)self payload];
    id v6 = [v5 pluginBundleID];

    id location = 0;
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1BD7C;
    v8[3] = &unk_3D310;
    objc_copyWeak(&v10, &location);
    id v7 = v6;
    id v9 = v7;
    objc_msgSend(v4, "__ck_generateStatusImage:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)MSMessageExtensionBalloonLiveView;
  [(MSMessageExtensionBalloonLiveView *)&v16 layoutSubviews];
  BOOL fromMe = self->_fromMe;
  id v4 = [(MSMessageExtensionBalloonLiveView *)self remoteBalloonView];
  [(MSMessageExtensionBalloonLiveView *)self bounds];
  objc_msgSend(v4, "setFrame:");

  BOOL v5 = [(MSMessageExtensionBalloonLiveView *)self iconView];

  if (v5)
  {
    id v6 = +[CKUIBehavior sharedBehaviors];
    [v6 extensionIconBadgeRectForOrientation:2 * !fromMe];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(MSMessageExtensionBalloonLiveView *)self iconView];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  }
}

- (void)setIsInShelf:(BOOL)a3
{
  if (self->_isInShelf != a3)
  {
    self->_isInShelf = a3;
    if (a3) {
      [(MSMessageExtensionBalloonLiveView *)self configureForDisplay];
    }
    [(MSMessageExtensionBalloonLiveView *)self setNeedsLayout];
  }
}

- (void)configureForDisplay
{
  id v3 = [(MSMessageExtensionBalloonLiveView *)self delegate];
  [v3 configureLiveViewForDisplay:self];
}

- (void)setRemoteBalloonView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_remoteBalloonView = &self->_remoteBalloonView;
  remoteBalloonView = self->_remoteBalloonView;
  if (remoteBalloonView != v5)
  {
    double v12 = v5;
    [(UIView *)remoteBalloonView removeFromSuperview];
    objc_storeStrong((id *)&self->_remoteBalloonView, a3);
    if (*p_remoteBalloonView)
    {
      uint64_t v8 = 48;
      double v9 = [(UIView *)self->_staticView superview];

      if (v9 == self)
      {
        double v11 = *p_remoteBalloonView;
      }
      else
      {
        uint64_t v8 = 56;
        double v10 = [(UIImageView *)self->_iconView superview];

        double v11 = *p_remoteBalloonView;
        if (v10 != self)
        {
          [(MSMessageExtensionBalloonLiveView *)self addSubview:v11];
          goto LABEL_8;
        }
      }
      [(MSMessageExtensionBalloonLiveView *)self insertSubview:v11 belowSubview:*(Class *)((char *)&self->super.super.super.isa + v8)];
    }
LABEL_8:
    remoteBalloonView = (UIView *)[(MSMessageExtensionBalloonLiveView *)self setNeedsLayout];
    BOOL v5 = v12;
  }

  _objc_release_x1(remoteBalloonView, v5);
}

- (void)setStaticView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_staticView = &self->_staticView;
  staticView = self->_staticView;
  if (staticView != v5)
  {
    double v9 = v5;
    [(UIView *)staticView removeFromSuperview];
    objc_storeStrong((id *)&self->_staticView, a3);
    if (*p_staticView)
    {
      uint64_t v8 = [(UIImageView *)self->_iconView superview];

      if (v8 == self) {
        [(MSMessageExtensionBalloonLiveView *)self insertSubview:v9 belowSubview:self->_iconView];
      }
      else {
        [(MSMessageExtensionBalloonLiveView *)self addSubview:*p_staticView];
      }
    }
    else
    {
      [(UIView *)self->_remoteBalloonView setHidden:0];
    }
    staticView = (UIView *)[(MSMessageExtensionBalloonLiveView *)self setNeedsLayout];
    BOOL v5 = v9;
  }

  _objc_release_x1(staticView, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(MSMessageExtensionBalloonLiveView *)self dataSource];
  double v7 = [v6 message];

  uint64_t v8 = [(MSMessageExtensionBalloonLiveView *)self staticView];

  if (v8)
  {
    double v9 = [(MSMessageExtensionBalloonLiveView *)self staticView];
    [v9 bounds];
  }
  else
  {
    double v10 = [v7 layout];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v9 = [(MSMessageExtensionBalloonLiveView *)self delegate];
      objc_msgSend(v9, "liveView:sizeThatFits:", self, width, height);
    }
    else
    {
      double v9 = +[CKUIBehavior sharedBehaviors];
      [v9 extensionBalloonMaximumHeight];
    }
  }

  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 minimumSizeThatFitsExtensionIconBadge:self->_fromMe];
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = [(MSMessageExtensionBalloonLiveView *)self dataSource];

  id v8 = v11;
  if (v6 != v11)
  {
    [(MSMessageExtensionBalloonLiveView *)self setDataSource:v11];
    double v9 = [(MSMessageExtensionBalloonLiveView *)self delegate];
    [v9 pluginPayloadDidChangeForLiveView:self];

    id v8 = v11;
  }
  if (v4)
  {
    double v10 = [(MSMessageExtensionBalloonLiveView *)self delegate];
    [v10 pluginPayloadDataDidChangeForLiveView:self];

    id v8 = v11;
  }

  _objc_release_x1(v7, v8);
}

- (id)interactiveViews
{
  BOOL v4 = self;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)iconViewTapped:(id)a3
{
  id v4 = [(MSMessageExtensionBalloonLiveView *)self pluginViewDelegate];
  [v4 pluginViewRequestsPresentationAction:self];
}

- (BOOL)isInShelf
{
  return self->_isInShelf;
}

- (MSMessageExtensionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CKTranscriptPluginViewDelegate)pluginViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginViewDelegate);

  return (CKTranscriptPluginViewDelegate *)WeakRetained;
}

- (void)setPluginViewDelegate:(id)a3
{
}

- (MSMessageExtensionBalloonLiveViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSMessageExtensionBalloonLiveViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)remoteBalloonView
{
  return self->_remoteBalloonView;
}

- (UIView)staticView
{
  return self->_staticView;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (BOOL)forceHideAppIcon
{
  return self->_forceHideAppIcon;
}

- (_MSRemoteBalloonViewController)remoteBalloonViewController
{
  return self->_remoteBalloonViewController;
}

- (void)setRemoteBalloonViewController:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_BOOL fromMe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteBalloonViewController, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_staticView, 0);
  objc_storeStrong((id *)&self->_remoteBalloonView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_pluginViewDelegate);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end