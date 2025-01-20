@interface MSMessageExtensionBalloonView
- (BOOL)allowedByScreenTime;
- (BOOL)fromMe;
- (BOOL)isInShelf;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTranscriptPluginViewDelegate)pluginViewDelegate;
- (LPLinkPresentationPropertyProvider)propertyProvider;
- (LPLinkView)linkView;
- (MSMessageExtensionBalloonView)initWithFrame:(CGRect)a3 dataSource:(id)a4 fromMe:(BOOL)a5;
- (MSMessageExtensionDataSource)dataSource;
- (UIImageView)iconView;
- (id)payload;
- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4;
- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4 forceReloadData:(BOOL)a5;
- (void)iconViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIsInShelf:(BOOL)a3;
- (void)setLinkView:(id)a3;
- (void)setPluginViewDelegate:(id)a3;
- (void)setPropertyProvider:(id)a3;
@end

@implementation MSMessageExtensionBalloonView

- (MSMessageExtensionBalloonView)initWithFrame:(CGRect)a3 dataSource:(id)a4 fromMe:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v47.receiver = self;
  v47.super_class = (Class)MSMessageExtensionBalloonView;
  v13 = -[MSMessageExtensionBalloonView initWithFrame:](&v47, "initWithFrame:", x, y, width, height);
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
      *(void *)&buf[4] = v13;
      CFStringRef v50 = v18;
      __int16 v49 = 2112;
      if (v5) {
        CFStringRef v17 = @"YES";
      }
      __int16 v51 = 2112;
      CFStringRef v52 = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "MSMessageExtensionBalloonView init self %@ payload from me %@ from me %@", buf, 0x20u);
    }
    v13->_fromMe = v5;
    p_dataSource = (id *)&v13->_dataSource;
    objc_storeStrong((id *)&v13->_dataSource, a4);
    if (v13->_dataSource) {
      unsigned __int8 v20 = [(MSMessageExtensionDataSource *)v13->_dataSource allowedByScreenTime];
    }
    else {
      unsigned __int8 v20 = 1;
    }
    v13->_allowedByScreenTime = v20;
    if (*p_dataSource)
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v13);
      v21 = +[NSNotificationCenter defaultCenter];
      v22 = +[NSOperationQueue mainQueue];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1D19C;
      v45[3] = &unk_3D360;
      objc_copyWeak(&v46, (id *)buf);
      id v23 = [v21 addObserverForName:IMBalloonPluginDataSourceScreenTimeAllowedStateChanged object:v12 queue:v22 usingBlock:v45];

      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
    v24 = +[IMBalloonPluginManager sharedInstance];
    v25 = [(MSMessageExtensionBalloonView *)v13 payload];
    v26 = [v25 pluginBundleID];
    v27 = [v24 balloonPluginForBundleID:v26];

    uint64_t v28 = [*p_dataSource propertyProvider];
    propertyProvider = v13->_propertyProvider;
    v13->_propertyProvider = (LPLinkPresentationPropertyProvider *)v28;

    [(MSMessageExtensionBalloonView *)v13 setClipsToBounds:1];
    id v30 = [objc_alloc((Class)LPLinkView) initWithPresentationProperties:v13->_propertyProvider URL:0];
    [v30 _setDisableTapGesture:1];
    [v30 _setApplyCornerRadius:0];
    [v30 setAutoresizingMask:18];
    objc_storeStrong((id *)&v13->_linkView, v30);
    [(MSMessageExtensionBalloonView *)v13 addSubview:v30];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v27 shouldBalloonHideAppIcon] & 1) == 0)
    {
      if (v5) {
        double v31 = 6.0;
      }
      else {
        double v31 = 12.0;
      }
      v32 = +[CKUIBehavior sharedBehaviors];
      [v32 iMessageAppIconSize];
      double v34 = v33;
      double v36 = v35;

      id v37 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", v31, 6.0, v34, v36);
      [v37 setAutoresizingMask:36];
      [v37 setUserInteractionEnabled:1];
      id v38 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v13 action:"iconViewTapped:"];
      [v37 addGestureRecognizer:v38];

      objc_storeStrong((id *)&v13->_iconView, v37);
      [(MSMessageExtensionBalloonView *)v13 addSubview:v37];
      v39 = [v27 identifier];
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v13);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1D210;
      v42[3] = &unk_3D310;
      objc_copyWeak(&v44, (id *)buf);
      id v40 = v39;
      id v43 = v40;
      objc_msgSend(v27, "__ck_generateStatusImage:", v42);

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
  }

  return v13;
}

- (id)payload
{
  v2 = [(MSMessageExtensionBalloonView *)self dataSource];
  v3 = [v2 pluginPayload];

  return v3;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)MSMessageExtensionBalloonView;
  [(MSMessageExtensionBalloonView *)&v27 layoutSubviews];
  BOOL v3 = !self->_fromMe;
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 extensionIconBadgeRectForOrientation:(2 * v3)];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (self->_isInShelf)
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    CFStringRef v17 = +[CKUIBehavior sharedBehaviors];
    [v17 pluginBalloonInsetsForMessageFromMe:self->_fromMe];
    double top = v18;
    double left = v19;
    double bottom = v20;
    double right = v21;
  }
  if (self->_iconView)
  {
    v22 = [(LPLinkPresentationPropertyProvider *)self->_propertyProvider image];
    if (v22)
    {
    }
    else
    {
      id v23 = [(LPLinkPresentationPropertyProvider *)self->_propertyProvider video];

      if (!v23)
      {
        v28.origin.double x = v6;
        v28.origin.double y = v8;
        v28.size.double width = v10;
        v28.size.double height = v12;
        double left = left + CGRectGetWidth(v28);
      }
    }
  }
  v24 = [(MSMessageExtensionBalloonView *)self linkView];
  objc_msgSend(v24, "setContentInset:", top, left, bottom, right);

  v25 = [(MSMessageExtensionBalloonView *)self linkView];
  [(MSMessageExtensionBalloonView *)self bounds];
  objc_msgSend(v25, "setFrame:");

  v26 = [(MSMessageExtensionBalloonView *)self iconView];
  objc_msgSend(v26, "setFrame:", v6, v8, v10, v12);

  [(MSMessageExtensionBalloonView *)self setUserInteractionEnabled:[(MSMessageExtensionBalloonView *)self allowedByScreenTime]];
}

- (void)setIsInShelf:(BOOL)a3
{
  if (self->_isInShelf != a3)
  {
    self->_isInShelf = a3;
    [(MSMessageExtensionBalloonView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPLinkView sizeThatFits:](self->_linkView, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 minimumSizeThatFitsExtensionIconBadge:self->_fromMe];
  double v10 = v9;
  double v12 = v11;

  if (v7 >= v12) {
    double v13 = v7;
  }
  else {
    double v13 = v12;
  }
  if (v5 >= v10) {
    double v14 = v5;
  }
  else {
    double v14 = v10;
  }
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4
{
}

- (void)dataSourcePluginPayloadDidChange:(id)a3 didUpdateData:(BOOL)a4 forceReloadData:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v7 = [(MSMessageExtensionBalloonView *)self dataSource];

  double v8 = v9;
  if (v7 != v9 || v5)
  {
    [(MSMessageExtensionBalloonView *)self setDataSource:v9];
    [(MSMessageExtensionBalloonView *)self reloadData];
    double v8 = v9;
  }
}

- (void)reloadData
{
  p_linkView = &self->_linkView;
  [(LPLinkView *)self->_linkView removeFromSuperview];
  double v4 = ms_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_fromMe) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    double v6 = [(MSMessageExtensionBalloonView *)self payload];
    *(_DWORD *)buf = 138412802;
    if ([v6 isFromMe]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    *(void *)&buf[4] = self;
    __int16 v24 = 2112;
    CFStringRef v25 = v5;
    __int16 v26 = 2112;
    CFStringRef v27 = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "reloadData %@ isFromMe %@ incoming isFromMe %@", buf, 0x20u);
  }
  double v8 = [(MSMessageExtensionBalloonView *)self payload];
  -[MSMessageExtensionBalloonView setFromMe:](self, "setFromMe:", [v8 isFromMe]);

  id v9 = [(MSMessageExtensionDataSource *)self->_dataSource propertyProvider];
  propertyProvider = self->_propertyProvider;
  self->_propertyProvider = v9;

  id v11 = [objc_alloc((Class)LPLinkView) initWithPresentationProperties:self->_propertyProvider URL:0];
  [v11 _setDisableTapGesture:1];
  [v11 _setApplyCornerRadius:0];
  [v11 setAutoresizingMask:18];
  objc_storeStrong((id *)p_linkView, v11);
  [(MSMessageExtensionBalloonView *)self addSubview:v11];
  [(MSMessageExtensionBalloonView *)self bringSubviewToFront:self->_iconView];
  if (self->_iconView)
  {
    double v12 = +[IMBalloonPluginManager sharedInstance];
    double v13 = [(MSMessageExtensionBalloonView *)self payload];
    double v14 = [v13 pluginBundleID];
    v15 = [v12 balloonPluginForBundleID:v14];

    unsigned int v16 = [v15 identifier];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1DB40;
    v19[3] = &unk_3D388;
    objc_copyWeak(&v22, (id *)buf);
    id v17 = v16;
    id v20 = v17;
    id v18 = v15;
    id v21 = v18;
    objc_msgSend(v18, "__ck_generateStatusImage:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  [(MSMessageExtensionBalloonView *)self setNeedsLayout];
}

- (void)iconViewTapped:(id)a3
{
  id v4 = [(MSMessageExtensionBalloonView *)self pluginViewDelegate];
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

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (LPLinkPresentationPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_destroyWeak((id *)&self->_pluginViewDelegate);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end