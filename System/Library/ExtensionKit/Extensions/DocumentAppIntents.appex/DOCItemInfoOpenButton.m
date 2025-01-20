@interface DOCItemInfoOpenButton
- (NSLayoutConstraint)progressViewHeightConstraint;
- (UIButton)downloadButton;
- (UIButton)openButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)commonInit;
- (void)setDownloadButton:(id)a3;
- (void)setNode:(id)a3;
- (void)setNodeCanBeOpened:(BOOL)a3;
- (void)setOpenButton:(id)a3;
- (void)setProgressViewHeightConstraint:(id)a3;
- (void)updateForChangedContentSizeCategory;
- (void)updateForState;
- (void)updateProgressViewSizeConstraints;
- (void)userDidTapOpenButton;
@end

@implementation DOCItemInfoOpenButton

- (void)commonInit
{
  v36.receiver = self;
  v36.super_class = (Class)DOCItemInfoOpenButton;
  [(DOCItemInfoDownloadButton *)&v36 commonInit];
  objc_initWeak(&location, self);
  v29 = +[UIImage systemImageNamed:@"icloud.and.arrow.down"];
  v3 = +[UIButtonConfiguration plainGazeableConfiguration];
  [v3 setImage:v29];
  [v3 configureWithZeroInsetsIfAllowed];
  v4 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:3];
  [v3 setPreferredSymbolConfigurationForImage:v4];
  v30 = v3;

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000066C4;
  v33[3] = &unk_1005E4530;
  objc_copyWeak(&v34, &location);
  v5 = +[UIAction actionWithHandler:v33];
  v6 = +[UIButton buttonWithConfiguration:v3 primaryAction:v5];

  [v6 setConfiguration:v3];
  v7 = _DocumentManagerBundle();
  v8 = [v7 localizedStringForKey:@"DOWNLOAD" value:@"DOWNLOAD" table:@"Localizable"];
  [v6 setAccessibilityLabel:v8];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
  v9 = +[UIButtonConfiguration borderedProminentButtonConfiguration];
  v10 = _DocumentManagerBundle();
  v11 = [v10 localizedStringForKey:@"OPEN" value:@"OPEN" table:@"Localizable"];
  v12 = [v11 localizedUppercaseString];

  [v9 setTitle:v12];
  [v9 setButtonSize:0];
  [v9 setCornerStyle:4];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100006704;
  v31[3] = &unk_1005E4530;
  objc_copyWeak(&v32, &location);
  v13 = +[UIAction actionWithHandler:v31];
  v14 = +[UIButton buttonWithConfiguration:v9 primaryAction:v13];

  [v14 setRole:1];
  [v14 setConfiguration:v9];
  [(DOCItemInfoOpenButton *)self bounds];
  objc_msgSend(v14, "setFrame:");
  [v14 setTranslatesAutoresizingMaskIntoConstraints:1];
  LODWORD(v15) = 1148846080;
  [v14 setContentCompressionResistancePriority:0 forAxis:v15];
  id v16 = objc_alloc((Class)DOCDownloadProgressView);
  [(DOCItemInfoOpenButton *)self bounds];
  id v17 = objc_msgSend(v16, "initWithFrame:");
  [v17 setTranslatesAutoresizingMaskIntoConstraints:1];
  [v17 setUserInteractionEnabled:0];
  id v18 = objc_alloc((Class)UIStackView);
  v38[0] = v6;
  v38[1] = v14;
  v38[2] = v17;
  v19 = +[NSArray arrayWithObjects:v38 count:3];
  id v20 = [v18 initWithArrangedSubviews:v19];

  [v20 setAxis:0];
  [v20 setDistribution:0];
  [v20 setAlignment:3];
  [v20 setSpacing:6.0];
  [(DOCItemInfoOpenButton *)self addSubview:v20];
  v21 = +[NSMutableArray array];
  v22 = DOCConstraintsToResizeWithSuperview();
  [v21 addObjectsFromArray:v22];

  v23 = [v17 widthAnchor];
  v24 = [v17 heightAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v21 addObject:v25];

  +[NSLayoutConstraint activateConstraints:v21];
  [(DOCItemInfoDownloadButton *)self setProgressView:v17];
  [(DOCItemInfoOpenButton *)self setDownloadButton:v6];
  [(DOCItemInfoOpenButton *)self setOpenButton:v14];
  [(DOCItemInfoOpenButton *)self updateProgressViewSizeConstraints];
  [(DOCItemInfoOpenButton *)self updateForState];
  v26 = self;
  v37 = v26;
  v27 = +[NSArray arrayWithObjects:&v37 count:1];
  id v28 = [(DOCItemInfoOpenButton *)self registerForTraitChanges:v27 withAction:"updateForChangedContentSizeCategory"];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&location);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)DOCItemInfoOpenButton;
  v7 = -[DOCItemInfoOpenButton hitTest:withEvent:](&v10, "hitTest:withEvent:", a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DOCItemInfoOpenButton *)self bounds];
    v12.CGFloat x = x;
    v12.CGFloat y = y;
    if (CGRectContainsPoint(v13, v12))
    {
      uint64_t v8 = [(DOCItemInfoDownloadButton *)self underlyingButton];
    }
    else
    {
      uint64_t v8 = 0;
    }

    v7 = (void *)v8;
  }

  return v7;
}

- (void)setNode:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoOpenButton;
  [(DOCItemInfoDownloadButton *)&v6 setNode:a3];
  BOOL v4 = [(DOCItemInfoDownloadButton *)self nodeCanBeOpened];
  v5 = [(DOCItemInfoOpenButton *)self openButton];
  [v5 setEnabled:v4];
}

- (void)setNodeCanBeOpened:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoOpenButton;
  [(DOCItemInfoDownloadButton *)&v6 setNodeCanBeOpened:a3];
  BOOL v4 = [(DOCItemInfoDownloadButton *)self nodeCanBeOpened];
  v5 = [(DOCItemInfoOpenButton *)self openButton];
  [v5 setEnabled:v4];
}

- (void)updateForState
{
  unint64_t v3 = [(DOCItemInfoDownloadButton *)self downloadState];
  if (v3 == 2)
  {
    uint64_t v8 = [(DOCItemInfoOpenButton *)self downloadButton];
    [v8 setHidden:1];

    v9 = [(DOCItemInfoDownloadButton *)self progressView];
    [v9 setHidden:1];

    objc_super v10 = [(DOCItemInfoOpenButton *)self openButton];
    id v13 = v10;
    uint64_t v11 = 0;
  }
  else
  {
    if (v3 == 1)
    {
      CGPoint v12 = [(DOCItemInfoOpenButton *)self downloadButton];
      [v12 setHidden:1];

      v5 = [(DOCItemInfoDownloadButton *)self progressView];
      objc_super v6 = v5;
      uint64_t v7 = 0;
    }
    else
    {
      if (v3) {
        return;
      }
      BOOL v4 = [(DOCItemInfoOpenButton *)self downloadButton];
      [v4 setHidden:0];

      v5 = [(DOCItemInfoDownloadButton *)self progressView];
      objc_super v6 = v5;
      uint64_t v7 = 1;
    }
    [v5 setHidden:v7];

    objc_super v10 = [(DOCItemInfoOpenButton *)self openButton];
    id v13 = v10;
    uint64_t v11 = 1;
  }
  [v10 setHidden:v11];
}

- (void)userDidTapOpenButton
{
  unint64_t v3 = [(DOCItemInfoDownloadButton *)self node];
  if (v3)
  {
    id v12 = v3;
    if ([v3 isCloudItem]
      && ([v12 isDownloaded] & 1) == 0
      && (DOCIsNetworkReachable() & 1) == 0)
    {
      v9 = [(DOCItemInfoDownloadButton *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      unint64_t v3 = v12;
      if ((v10 & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v7 = [(DOCItemInfoDownloadButton *)self delegate];
      uint64_t v8 = [(DOCItemInfoDownloadButton *)self node];
      uint64_t v11 = +[NSError errorWithDomain:NSURLErrorDomain code:-1009 userInfo:0];
      [v7 nodeDownloadButton:self downloadingNode:v8 encounteredError:v11];

      goto LABEL_11;
    }
    BOOL v4 = (id)[(DOCItemInfoDownloadButton *)self downloadState] == (id)2;
    unint64_t v3 = v12;
    if (v4)
    {
      v5 = [(DOCItemInfoDownloadButton *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      unint64_t v3 = v12;
      if (v6)
      {
        uint64_t v7 = [(DOCItemInfoDownloadButton *)self delegate];
        uint64_t v8 = [(DOCItemInfoDownloadButton *)self node];
        [v7 nodeDownloadButton:self requestedOpeningNode:v8];
LABEL_11:

        unint64_t v3 = v12;
      }
    }
  }
LABEL_12:
}

- (void)updateForChangedContentSizeCategory
{
  unint64_t v3 = [(DOCItemInfoOpenButton *)self openButton];
  [v3 invalidateIntrinsicContentSize];

  [(DOCItemInfoOpenButton *)self updateProgressViewSizeConstraints];
}

- (void)updateProgressViewSizeConstraints
{
  unint64_t v3 = +[UIFontMetrics defaultMetrics];
  [v3 scaledValueForValue:28.0];
  double v5 = v4;

  char v6 = [(DOCItemInfoOpenButton *)self progressViewHeightConstraint];

  if (v6)
  {
    uint64_t v7 = [(DOCItemInfoOpenButton *)self progressViewHeightConstraint];
    [v7 setConstant:v5];
  }
  else
  {
    uint64_t v8 = [(DOCItemInfoDownloadButton *)self progressView];
    v9 = [v8 heightAnchor];
    char v10 = [v9 constraintEqualToConstant:v5];
    [(DOCItemInfoOpenButton *)self setProgressViewHeightConstraint:v10];

    uint64_t v7 = [(DOCItemInfoOpenButton *)self progressViewHeightConstraint];
    [v7 setActive:1];
  }

  [(DOCItemInfoOpenButton *)self invalidateIntrinsicContentSize];
}

- (UIButton)openButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_openButton);

  return (UIButton *)WeakRetained;
}

- (void)setOpenButton:(id)a3
{
}

- (UIButton)downloadButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadButton);

  return (UIButton *)WeakRetained;
}

- (void)setDownloadButton:(id)a3
{
}

- (NSLayoutConstraint)progressViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressViewHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setProgressViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressViewHeightConstraint);
  objc_destroyWeak((id *)&self->_downloadButton);

  objc_destroyWeak((id *)&self->_openButton);
}

@end