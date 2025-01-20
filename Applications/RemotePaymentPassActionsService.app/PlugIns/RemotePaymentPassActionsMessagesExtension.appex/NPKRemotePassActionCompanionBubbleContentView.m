@interface NPKRemotePassActionCompanionBubbleContentView
+ (double)_roundedTextHeightForAttributedText:(id)a3 withAvailableWidth:(double)a4;
+ (double)contentViewHeightForViewModel:(id)a3 withWidth:(double)a4;
+ (id)_attributedTextFromText:(id)a3 inFont:(id)a4;
+ (id)_defaultParagraphStyle;
+ (id)_primaryFont;
+ (id)_secondaryFont;
- (BOOL)shouldDimPass;
- (NPKRemotePassActionCompanionBubbleContentView)initWithDelegate:(id)a3;
- (NPKRemotePassActionCompanionBubbleContentView)initWithFrame:(CGRect)a3;
- (NPKRemotePassActionCompanionBubbleContentViewDelegate)delegate;
- (NPKRemotePassActionCompanionBubbleContentViewModel)viewModel;
- (NSLayoutConstraint)cardArtImageViewHeightConstraint;
- (UIButton)actionButton;
- (UIGestureRecognizer)tapGestureRecognizer;
- (UIImageView)cardArtImageView;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (UIStackView)bottomContentStackView;
- (UIStackView)labelStackView;
- (id)_makeHorizontalConstraints;
- (id)_makeRelativeConstraints;
- (id)_makeVerticalConstraints;
- (void)_handleTap;
- (void)_setUpActionButton;
- (void)_setUpAppearance;
- (void)_setUpBottomContentStackView;
- (void)_setUpCardArtImageView;
- (void)_setUpConstraints;
- (void)_setUpDetailLabel;
- (void)_setUpLabelStackView;
- (void)_setUpSubviews;
- (void)_setUpTapGestureRecognizer;
- (void)_setUpTitleLabel;
- (void)_updateViewForViewModel:(id)a3;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setBottomContentStackView:(id)a3;
- (void)setCardArtImageView:(id)a3;
- (void)setCardArtImageViewHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setShouldDimPass:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation NPKRemotePassActionCompanionBubbleContentView

- (NPKRemotePassActionCompanionBubbleContentView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKRemotePassActionCompanionBubbleContentView;
  v5 = [(NPKRemotePassActionCompanionBubbleContentView *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (NPKRemotePassActionCompanionBubbleContentView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NPKRemotePassActionCompanionBubbleContentView;
  v3 = -[NPKRemotePassActionCompanionBubbleContentView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    cardArtImageView = v3->_cardArtImageView;
    v3->_cardArtImageView = v4;

    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    objc_super v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v8;

    v10 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    labelStackView = v3->_labelStackView;
    v3->_labelStackView = v10;

    v12 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    bottomContentStackView = v3->_bottomContentStackView;
    v3->_bottomContentStackView = v12;

    v14 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_handleTap"];
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = v14;

    [(NPKRemotePassActionCompanionBubbleContentView *)v3 _setUpSubviews];
    [(NPKRemotePassActionCompanionBubbleContentView *)v3 _setUpConstraints];
    [(NPKRemotePassActionCompanionBubbleContentView *)v3 _setUpAppearance];
    [(NPKRemotePassActionCompanionBubbleContentView *)v3 _setUpTapGestureRecognizer];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NPKRemotePassActionCompanionBubbleContentView;
  [(NPKRemotePassActionCompanionBubbleContentView *)&v12 layoutSubviews];
  [(NPKRemotePassActionCompanionBubbleContentView *)self frame];
  double Width = CGRectGetWidth(v13);
  id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self viewModel];
  v5 = [v4 cardArtImage];

  if (v5)
  {
    double v6 = fmax(Width + -12.0 + -12.0, 0.0);
    [v5 size];
    double v8 = v7;
    [v5 size];
    double v10 = v6 / (v8 / v9);
  }
  else
  {
    double v10 = 0.0;
  }
  v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageViewHeightConstraint];
  [v11 setConstant:v10];
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
  id v5 = a3;
  [(NPKRemotePassActionCompanionBubbleContentView *)self _updateViewForViewModel:v5];
}

- (UIButton)actionButton
{
  actionButton = self->_actionButton;
  if (!actionButton)
  {
    id v4 = +[UIButtonConfiguration filledButtonConfiguration];
    id v5 = +[UIColor labelColor];
    [v4 setBaseForegroundColor:v5];

    double v6 = +[UIColor systemBackgroundColor];
    [v4 setBaseBackgroundColor:v6];

    [v4 setCornerStyle:4];
    [v4 setButtonSize:1];
    [v4 setTitleAlignment:2];
    [v4 setTitleLineBreakMode:4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004DB4;
    v13[3] = &unk_1000144D8;
    v13[4] = self;
    double v7 = +[UIAction actionWithHandler:v13];
    double v8 = +[UIButton buttonWithConfiguration:v4 primaryAction:v7];
    double v9 = self->_actionButton;
    self->_actionButton = v8;

    double v10 = [(UIButton *)self->_actionButton titleLabel];
    [v10 setMinimumScaleFactor:0.699999988];

    v11 = [(UIButton *)self->_actionButton titleLabel];
    [v11 setAdjustsFontSizeToFitWidth:1];

    actionButton = self->_actionButton;
  }

  return actionButton;
}

+ (double)contentViewHeightForViewModel:(id)a3 withWidth:(double)a4
{
  id v6 = a3;
  double v7 = a4 + -12.0 + -12.0;
  double v8 = [v6 cardArtImage];
  double v9 = v8;
  if (v8)
  {
    [v8 size];
    double v11 = v10;
    [v9 size];
    double v13 = v7 / (v11 / v12) + 12.0 + 8.0;
  }
  else
  {
    double v13 = 20.0;
  }
  if ([v6 showsActionButton]) {
    double v14 = v7 * 0.5 + -8.0;
  }
  else {
    double v14 = v7;
  }
  v15 = [v6 titleText];
  v16 = [a1 _primaryFont];
  objc_super v17 = [a1 _attributedTextFromText:v15 inFont:v16];

  [a1 _roundedTextHeightForAttributedText:v17 withAvailableWidth:v14];
  double v19 = v18;
  v20 = [v6 detailText];
  v21 = [a1 _secondaryFont];
  v22 = [a1 _attributedTextFromText:v20 inFont:v21];

  [a1 _roundedTextHeightForAttributedText:v22 withAvailableWidth:v14];
  double v24 = v23;
  double v25 = 0.0;
  if ([v6 showsActionButton])
  {
    v26 = [v6 actionButtonText];
    id v27 = [v26 length];

    if (v27)
    {
      v28 = [v6 actionButtonText];
      v29 = [a1 _primaryFont];
      v30 = [a1 _attributedTextFromText:v28 inFont:v29];

      [a1 _roundedTextHeightForAttributedText:v30 withAvailableWidth:v14];
      double v25 = v31 + v31;
    }
  }

  return v13 + fmax(v19 + 2.0 + v24, v25) + 8.0;
}

- (void)_setUpConstraints
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(NPKRemotePassActionCompanionBubbleContentView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self _makeVerticalConstraints];
  [v8 addObjectsFromArray:v5];

  id v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self _makeHorizontalConstraints];
  [v8 addObjectsFromArray:v6];

  double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self _makeRelativeConstraints];
  [v8 addObjectsFromArray:v7];

  +[NSLayoutConstraint activateConstraints:v8];
}

- (id)_makeVerticalConstraints
{
  v22 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  v21 = [v22 topAnchor];
  v20 = [(NPKRemotePassActionCompanionBubbleContentView *)self topAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20 constant:12.0];
  v23[0] = v19;
  double v18 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
  v16 = [v18 topAnchor];
  objc_super v17 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  v15 = [v17 bottomAnchor];
  v3 = [v16 constraintEqualToAnchor:v15 constant:8.0];
  v23[1] = v3;
  id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
  id v5 = [v4 topAnchor];
  id v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  double v7 = [v6 bottomAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7 constant:8.0];
  v23[2] = v8;
  double v9 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomAnchor];
  double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
  double v11 = [v10 bottomAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11 constant:8.0];
  v23[3] = v12;
  id v14 = +[NSArray arrayWithObjects:v23 count:4];

  return v14;
}

- (id)_makeHorizontalConstraints
{
  v20 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  double v19 = [v20 leadingAnchor];
  double v18 = [(NPKRemotePassActionCompanionBubbleContentView *)self leadingAnchor];
  objc_super v17 = [v19 constraintEqualToAnchor:v18 constant:12.0];
  v21[0] = v17;
  v15 = [(NPKRemotePassActionCompanionBubbleContentView *)self trailingAnchor];
  v16 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  v3 = [v16 trailingAnchor];
  id v4 = [v15 constraintEqualToAnchor:v3 constant:12.0];
  v21[1] = v4;
  id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
  id v6 = [v5 leadingAnchor];
  double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7 constant:12.0];
  v21[2] = v8;
  double v9 = [(NPKRemotePassActionCompanionBubbleContentView *)self trailingAnchor];
  double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
  double v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11 constant:12.0];
  v21[3] = v12;
  id v14 = +[NSArray arrayWithObjects:v21 count:4];

  return v14;
}

- (id)_makeRelativeConstraints
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  id v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:0.0];
  [(NPKRemotePassActionCompanionBubbleContentView *)self setCardArtImageViewHeightConstraint:v5];

  id v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageViewHeightConstraint];
  double v9 = v6;
  double v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (void)_setUpSubviews
{
  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpCardArtImageView];
  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpTitleLabel];
  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpDetailLabel];
  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpLabelStackView];
  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpActionButton];

  [(NPKRemotePassActionCompanionBubbleContentView *)self _setUpBottomContentStackView];
}

- (void)_setUpCardArtImageView
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];

  if (v3)
  {
    id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
    [v4 setContentMode:1];

    id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
    id v6 = [v5 layer];
    [v6 setMasksToBounds:1];

    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
    [v7 _setContinuousCornerRadius:7.0];

    id v12 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
    -[NPKRemotePassActionCompanionBubbleContentView addSubview:](self, "addSubview:");
  }
  else
  {
    id v8 = pk_RemotePassAction_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      double v10 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find a card art image view, but instead found nil! cardArtImageView: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpTitleLabel
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];

  if (v3)
  {
    id v4 = +[UIColor labelColor];
    id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
    [v5 setTextColor:v4];

    id v6 = [(id)objc_opt_class() _primaryFont];
    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
    [v7 setFont:v6];

    id v12 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
    [v12 setNumberOfLines:0];
  }
  else
  {
    id v8 = pk_RemotePassAction_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      double v10 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find a title label, but instead found nil! titleLabel: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpDetailLabel
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];

  if (v3)
  {
    id v4 = +[UIColor secondaryLabelColor];
    id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
    [v5 setTextColor:v4];

    id v6 = [(id)objc_opt_class() _secondaryFont];
    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
    [v7 setFont:v6];

    id v12 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
    [v12 setNumberOfLines:0];
  }
  else
  {
    id v8 = pk_RemotePassAction_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      double v10 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find a detail label, but instead found nil! detailLabel: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpLabelStackView
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];

  if (v3)
  {
    id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
    [v4 setAxis:1];

    id v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
    [v5 setDistribution:2];

    id v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
    [v6 setAlignment:0];

    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
    [v7 setSpacing:2.0];

    id v8 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];

    if (v8)
    {
      BOOL v9 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
      double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
      [v9 addArrangedSubview:v10];
    }
    double v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];

    if (v11)
    {
      id v12 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
      double v13 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
      [v12 addArrangedSubview:v13];
    }
    id v18 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
    -[NPKRemotePassActionCompanionBubbleContentView addSubview:](self, "addSubview:");
  }
  else
  {
    id v14 = pk_RemotePassAction_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v17 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find a label container view, but instead found nil! labelStackView: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpActionButton
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];

  if (!v3)
  {
    id v4 = pk_RemotePassAction_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];
        int v8 = 138412290;
        BOOL v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find an action button, but instead found nil! actionButton: %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (void)_setUpBottomContentStackView
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];

  if (v3)
  {
    id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
    [v4 setAxis:0];

    BOOL v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
    [v5 setDistribution:0];

    id v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
    [v6 setAlignment:3];

    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
    [v7 setSpacing:8.0];

    int v8 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];

    if (v8)
    {
      BOOL v9 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
      double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self labelStackView];
      [v9 addArrangedSubview:v10];
    }
    double v11 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];

    if (v11)
    {
      id v12 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
      double v13 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];
      [v12 addArrangedSubview:v13];
    }
    id v18 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
    -[NPKRemotePassActionCompanionBubbleContentView addSubview:](self, "addSubview:");
  }
  else
  {
    id v14 = pk_RemotePassAction_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v17 = [(NPKRemotePassActionCompanionBubbleContentView *)self bottomContentStackView];
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find an bottom content stack view, but instead found nil! bottomContentStackView: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpTapGestureRecognizer
{
  v3 = [(NPKRemotePassActionCompanionBubbleContentView *)self tapGestureRecognizer];

  if (v3)
  {
    id v4 = [(NPKRemotePassActionCompanionBubbleContentView *)self gestureRecognizers];
    BOOL v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self tapGestureRecognizer];
    unsigned __int8 v6 = [v4 containsObject:v5];

    if (v6)
    {
      double v7 = pk_RemotePassAction_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        BOOL v9 = pk_RemotePassAction_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Gesture recognizer is already observing taps; no update required",
            buf,
            2u);
        }
      }
    }
    else
    {
      id v14 = [(NPKRemotePassActionCompanionBubbleContentView *)self tapGestureRecognizer];
      -[NPKRemotePassActionCompanionBubbleContentView addGestureRecognizer:](self, "addGestureRecognizer:");
    }
  }
  else
  {
    double v10 = pk_RemotePassAction_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = [(NPKRemotePassActionCompanionBubbleContentView *)self tapGestureRecognizer];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: Expected to find a tap gesture recognizer, but instead found nil!: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_setUpAppearance
{
  id v3 = +[UIColor tertiarySystemGroupedBackgroundColor];
  [(NPKRemotePassActionCompanionBubbleContentView *)self setBackgroundColor:v3];
}

+ (id)_primaryFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption1 variant:1024 maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
}

+ (id)_secondaryFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption1 variant:0 maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
}

+ (id)_defaultParagraphStyle
{
  id v2 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v3) = 1045220557;
  [v2 setHyphenationFactor:v3];
  id v4 = [v2 copy];

  return v4;
}

- (void)_handleTap
{
  double v3 = pk_RemotePassAction_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Did receive tap", (uint8_t *)&v11, 2u);
    }
  }
  unsigned __int8 v6 = [(NPKRemotePassActionCompanionBubbleContentView *)self delegate];

  if (v6)
  {
    double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self delegate];
    [v7 remotePassActionRequestBubbleContentViewDidReceiveTap:self];
LABEL_7:

    return;
  }
  BOOL v8 = pk_RemotePassAction_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    double v7 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self delegate];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Unable to handle tap. Did you forget to set the delegate? delegate: %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_7;
  }
}

- (void)_updateViewForViewModel:(id)a3
{
  id v32 = a3;
  BOOL v4 = [v32 cardArtImage];
  BOOL v5 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  [v5 setImage:v4];

  if ([v32 shouldDimPass]) {
    double v6 = 0.5;
  }
  else {
    double v6 = 1.0;
  }
  double v7 = [(NPKRemotePassActionCompanionBubbleContentView *)self cardArtImageView];
  [v7 setAlpha:v6];

  BOOL v8 = objc_opt_class();
  BOOL v9 = [v32 titleText];
  double v10 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
  int v11 = [v10 font];
  id v12 = [v8 _attributedTextFromText:v9 inFont:v11];

  double v13 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
  [v13 setAttributedText:v12];

  BOOL v14 = [v12 length] == 0;
  BOOL v15 = [(NPKRemotePassActionCompanionBubbleContentView *)self titleLabel];
  [v15 setHidden:v14];

  v16 = objc_opt_class();
  objc_super v17 = [v32 detailText];
  id v18 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
  double v19 = [v18 font];
  v20 = [v16 _attributedTextFromText:v17 inFont:v19];

  v21 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
  [v21 setAttributedText:v20];

  BOOL v22 = [v20 length] == 0;
  double v23 = [(NPKRemotePassActionCompanionBubbleContentView *)self detailLabel];
  [v23 setHidden:v22];

  double v24 = objc_opt_class();
  double v25 = [v32 actionButtonText];
  v26 = [(id)objc_opt_class() _primaryFont];
  id v27 = [v24 _attributedTextFromText:v25 inFont:v26];

  v28 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];
  [v28 setAttributedTitle:v27 forState:0];

  unsigned int v29 = [v32 showsActionButton];
  if (v29)
  {
    v26 = [v32 actionButtonText];
    BOOL v30 = [v26 length] == 0;
  }
  else
  {
    BOOL v30 = 1;
  }
  double v31 = [(NPKRemotePassActionCompanionBubbleContentView *)self actionButton];
  [v31 setHidden:v30];

  if (v29) {
  [(NPKRemotePassActionCompanionBubbleContentView *)self setNeedsLayout];
  }
  [(NPKRemotePassActionCompanionBubbleContentView *)self layoutIfNeeded];
}

+ (id)_attributedTextFromText:(id)a3 inFont:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    BOOL v8 = [a1 _defaultParagraphStyle];
    id v9 = objc_alloc((Class)NSAttributedString);
    v13[0] = NSFontAttributeName;
    v13[1] = NSParagraphStyleAttributeName;
    v14[0] = v6;
    v14[1] = v8;
    double v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

    id v11 = [v9 initWithString:v7 attributes:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (double)_roundedTextHeightForAttributedText:(id)a3 withAvailableWidth:(double)a4
{
  if (a3)
  {
    [a3 boundingRectWithSize:3 options:0 context:a4];
    CGFloat Height = CGRectGetHeight(v12);
  }
  else
  {
    CGFloat Height = 0.0;
  }
  BOOL v5 = +[UIScreen mainScreen];
  [v5 scale];
  unint64_t v7 = v6;

  v8.n128_f64[0] = Height;
  v9.n128_u64[0] = v7;

  _UIRoundToScale(v8, v9);
  return result;
}

- (NPKRemotePassActionCompanionBubbleContentViewModel)viewModel
{
  return self->_viewModel;
}

- (UIImageView)cardArtImageView
{
  return self->_cardArtImageView;
}

- (void)setCardArtImageView:(id)a3
{
}

- (NSLayoutConstraint)cardArtImageViewHeightConstraint
{
  return self->_cardArtImageViewHeightConstraint;
}

- (void)setCardArtImageViewHeightConstraint:(id)a3
{
}

- (BOOL)shouldDimPass
{
  return self->_shouldDimPass;
}

- (void)setShouldDimPass:(BOOL)a3
{
  self->_shouldDimPass = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (void)setActionButton:(id)a3
{
}

- (UIStackView)bottomContentStackView
{
  return self->_bottomContentStackView;
}

- (void)setBottomContentStackView:(id)a3
{
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NPKRemotePassActionCompanionBubbleContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPKRemotePassActionCompanionBubbleContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomContentStackView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cardArtImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_cardArtImageView, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end