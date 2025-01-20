@interface DOCItemInfoDownloadButton
- (BOOL)nodeCanBeOpened;
- (DOCDownloadProgressView)progressView;
- (DOCItemInfoDownloadButton)initWithCoder:(id)a3;
- (DOCItemInfoDownloadButton)initWithFrame:(CGRect)a3;
- (DOCItemInfoDownloadButtonDelegate)delegate;
- (DOCNode)node;
- (UIButton)underlyingButton;
- (unint64_t)downloadState;
- (void)applyTintColorToViews;
- (void)commonInit;
- (void)setDelegate:(id)a3;
- (void)setDownloadState:(unint64_t)a3;
- (void)setNode:(id)a3;
- (void)setNodeCanBeOpened:(BOOL)a3;
- (void)setProgressView:(id)a3;
- (void)setUnderlyingButton:(id)a3;
- (void)tintColorDidChange;
- (void)updateDownloadState;
- (void)userDidTapDownloadButton;
@end

@implementation DOCItemInfoDownloadButton

- (DOCItemInfoDownloadButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoDownloadButton;
  v3 = -[DOCItemInfoDownloadButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DOCItemInfoDownloadButton *)v3 commonInit];
  }
  return v4;
}

- (DOCItemInfoDownloadButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoDownloadButton;
  v3 = [(DOCItemInfoDownloadButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(DOCItemInfoDownloadButton *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  objc_initWeak(&location, self);
  v3 = +[UIButtonConfiguration plainButtonConfiguration];
  v4 = +[UIColor clearColor];
  v5 = [v3 background];
  [v5 setBackgroundColor:v4];

  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100005664;
  v16 = &unk_1005E4530;
  objc_copyWeak(&v17, &location);
  objc_super v6 = +[UIAction actionWithHandler:&v13];
  v7 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v6, v13, v14, v15, v16);
  [(DOCItemInfoDownloadButton *)self setUnderlyingButton:v7];

  v8 = [(DOCItemInfoDownloadButton *)self underlyingButton];
  [(DOCItemInfoDownloadButton *)self addSubview:v8];

  v9 = [(DOCItemInfoDownloadButton *)self underlyingButton];
  v10 = DOCConstraintsToResizeWithSuperview();
  +[NSLayoutConstraint activateConstraints:v10];

  [(DOCItemInfoDownloadButton *)self updateForState];
  v11 = +[UIHoverStyle doc_circleWithInset:-8.0];
  v12 = [(DOCItemInfoDownloadButton *)self underlyingButton];
  [v12 setHoverStyle:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setProgressView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_progressView, obj);
    [obj setCanShowStopButton:1];

    [(DOCItemInfoDownloadButton *)self applyTintColorToViews];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoDownloadButton;
  [(DOCItemInfoDownloadButton *)&v3 tintColorDidChange];
  [(DOCItemInfoDownloadButton *)self applyTintColorToViews];
}

- (void)applyTintColorToViews
{
  id v4 = [(DOCItemInfoDownloadButton *)self tintColor];
  objc_super v3 = [(DOCItemInfoDownloadButton *)self progressView];
  [v3 setActiveStrokeColor:v4];
}

- (void)setDownloadState:(unint64_t)a3
{
  if (self->_downloadState != a3)
  {
    self->_downloadState = a3;
    [(DOCItemInfoDownloadButton *)self updateForState];
  }
}

- (void)updateDownloadState
{
  node = self->_node;
  if (node)
  {
    id v4 = [(DOCNode *)node downloadingProgress];
    id v5 = [(DOCItemInfoDownloadButton *)self progressView];
    [v5 setObservedProgress:v4];

    if ([(DOCNode *)self->_node isDownloading])
    {
      uint64_t v6 = 1;
      goto LABEL_9;
    }
    if (![(DOCNode *)self->_node isCloudItem]
      || [(DOCNode *)self->_node isDownloaded])
    {
      uint64_t v6 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    v7 = [(DOCItemInfoDownloadButton *)self progressView];
    [v7 setObservedProgress:0];
  }
  uint64_t v6 = 0;
LABEL_9:

  [(DOCItemInfoDownloadButton *)self setDownloadState:v6];
}

- (void)setNode:(id)a3
{
  id v5 = (DOCNode *)a3;
  if (self->_node != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_node, a3);
    [(DOCItemInfoDownloadButton *)self updateDownloadState];
    id v5 = v6;
  }
}

- (void)userDidTapDownloadButton
{
  objc_super v3 = [(DOCItemInfoDownloadButton *)self node];
  id v4 = v3;
  if (v3)
  {
    if ([v3 isCloudItem]
      && ([v4 isDownloaded] & 1) == 0
      && (DOCIsNetworkReachable() & 1) == 0)
    {
      id v17 = [(DOCItemInfoDownloadButton *)self delegate];
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        goto LABEL_10;
      }
      id v9 = [(DOCItemInfoDownloadButton *)self delegate];
      v19 = [(DOCItemInfoDownloadButton *)self node];
      v20 = +[NSError errorWithDomain:NSURLErrorDomain code:-1009 userInfo:0];
      [v9 nodeDownloadButton:self downloadingNode:v19 encounteredError:v20];

      goto LABEL_8;
    }
    unint64_t v5 = [(DOCItemInfoDownloadButton *)self downloadState];
    if (v5 == 1)
    {
      v11 = [v4 downloadingProgress];
      [v11 cancel];

      id v12 = objc_alloc((Class)FPEvictOperation);
      v13 = objc_msgSend(v4, "fpfs_fpItem");
      v29 = v13;
      uint64_t v14 = +[NSArray arrayWithObjects:&v29 count:1];
      id v15 = [v12 initWithItems:v14];

      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100005F30;
      v24 = &unk_1005E45A8;
      id v25 = v4;
      [v15 setCompletionBlock:&v21];
      v16 = +[FPItemManager defaultManager];
      [v16 scheduleAction:v15];

      goto LABEL_10;
    }
    if (!v5)
    {
      id v6 = objc_alloc((Class)FPDownloadOperation);
      v7 = objc_msgSend(v4, "fpfs_fpItem");
      v30 = v7;
      v8 = +[NSArray arrayWithObjects:&v30 count:1];
      id v9 = [v6 initWithItems:v8];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100005C70;
      v26[3] = &unk_1005E4580;
      id v27 = v4;
      v28 = self;
      [v9 setDownloadCompletionBlock:v26];
      v10 = +[FPItemManager defaultManager];
      [v10 scheduleAction:v9];

LABEL_8:
    }
  }
LABEL_10:
}

- (DOCNode)node
{
  return self->_node;
}

- (BOOL)nodeCanBeOpened
{
  return self->_nodeCanBeOpened;
}

- (void)setNodeCanBeOpened:(BOOL)a3
{
  self->_nodeCanBeOpened = a3;
}

- (DOCItemInfoDownloadButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCItemInfoDownloadButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DOCDownloadProgressView)progressView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressView);

  return (DOCDownloadProgressView *)WeakRetained;
}

- (UIButton)underlyingButton
{
  return self->_underlyingButton;
}

- (void)setUnderlyingButton:(id)a3
{
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingButton, 0);
  objc_destroyWeak((id *)&self->_progressView);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_node, 0);
}

@end