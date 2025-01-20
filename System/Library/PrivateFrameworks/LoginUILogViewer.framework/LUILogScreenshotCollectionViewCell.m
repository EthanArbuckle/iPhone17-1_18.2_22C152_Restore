@interface LUILogScreenshotCollectionViewCell
- (LUILogScreenshotCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIButton)clearButton;
- (UIImageView)screenshotImageView;
- (UILabel)screenshotDateLabel;
- (id)_createClearButton;
- (id)_createScreenshotDateLabel;
- (id)_createScreenshotImageView;
- (id)clearButtonAction;
- (void)_setup;
- (void)clearButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setClearButtonAction:(id)a3;
@end

@implementation LUILogScreenshotCollectionViewCell

- (LUILogScreenshotCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LUILogScreenshotCollectionViewCell;
  v3 = -[LUILogScreenshotCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LUILogScreenshotCollectionViewCell *)v3 _setup];
  }
  return v4;
}

- (void)_setup
{
  v3 = [(LUILogScreenshotCollectionViewCell *)self _createScreenshotImageView];
  screenshotImageView = self->_screenshotImageView;
  self->_screenshotImageView = v3;

  v5 = [(LUILogScreenshotCollectionViewCell *)self _createScreenshotDateLabel];
  screenshotDateLabel = self->_screenshotDateLabel;
  self->_screenshotDateLabel = v5;

  v7 = [(LUILogScreenshotCollectionViewCell *)self _createClearButton];
  clearButton = self->_clearButton;
  self->_clearButton = v7;

  v9 = [(LUILogScreenshotCollectionViewCell *)self contentView];
  [v9 addSubview:self->_screenshotImageView];

  v10 = [(LUILogScreenshotCollectionViewCell *)self contentView];
  [v10 addSubview:self->_screenshotDateLabel];

  id v11 = [(LUILogScreenshotCollectionViewCell *)self contentView];
  [v11 addSubview:self->_clearButton];
}

- (void)layoutSubviews
{
  [(LUILogScreenshotCollectionViewCell *)self frame];
  double Width = CGRectGetWidth(v9);
  [(LUILogScreenshotCollectionViewCell *)self frame];
  -[UIImageView setFrame:](self->_screenshotImageView, "setFrame:", 0.0, 10.0, Width, CGRectGetHeight(v10) + -10.0 + -30.0);
  [(LUILogScreenshotCollectionViewCell *)self frame];
  CGFloat v4 = CGRectGetHeight(v11) + -30.0;
  [(LUILogScreenshotCollectionViewCell *)self frame];
  -[UILabel setFrame:](self->_screenshotDateLabel, "setFrame:", 0.0, v4, CGRectGetWidth(v12), 30.0);
  [(LUILogScreenshotCollectionViewCell *)self frame];
  CGFloat v5 = CGRectGetWidth(v13);
  clearButton = self->_clearButton;
  double v7 = v5 + -20.0;

  -[UIButton setFrame:](clearButton, "setFrame:", v7, 0.0, 20.0, 20.0);
}

- (id)_createClearButton
{
  v3 = objc_opt_new();
  CGFloat v4 = [MEMORY[0x263F1C6B0] imageNamed:@"redDeleteIcon"];
  [v3 setImage:v4 forState:0];

  [v3 addTarget:self action:sel_clearButtonTapped_ forControlEvents:64];

  return v3;
}

- (id)_createScreenshotDateLabel
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F1C550] whiteColor];
  [v2 setTextColor:v3];

  [v2 setTextAlignment:1];

  return v2;
}

- (id)_createScreenshotImageView
{
  v2 = objc_opt_new();
  [v2 setContentMode:1];

  return v2;
}

- (void)clearButtonTapped:(id)a3
{
  CGFloat v4 = [(LUILogScreenshotCollectionViewCell *)self clearButtonAction];

  if (v4)
  {
    CGFloat v5 = [(LUILogScreenshotCollectionViewCell *)self clearButtonAction];
    v5[2]();
  }
}

- (UIImageView)screenshotImageView
{
  return self->_screenshotImageView;
}

- (UILabel)screenshotDateLabel
{
  return self->_screenshotDateLabel;
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (id)clearButtonAction
{
  return self->_clearButtonAction;
}

- (void)setClearButtonAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clearButtonAction, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_screenshotDateLabel, 0);

  objc_storeStrong((id *)&self->_screenshotImageView, 0);
}

@end