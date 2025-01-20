@interface ASCredentialRequestPaneContext
- (ASCredentialRequestPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4;
- (ASCredentialRequestPaneViewController)paneViewController;
- (BOOL)_useBoldTitleLayout;
- (UIStackView)stackView;
- (double)_boldTitle_customSpacingAfterTitle;
- (double)_boldTitle_stackViewTopSpacing;
- (double)_customSpacingAfterIcon;
- (double)_customSpacingAfterSubtitle;
- (double)_customSpacingAfterTitle;
- (double)_stackViewTopSpacing;
- (void)addEmptyViewWithSpacing:(double)a3;
- (void)addIcon:(id)a3 iconStyle:(int64_t)a4 title:(id)a5 titleStyle:(int64_t)a6 subtitlePane:(id)a7 subtitleStyle:(int64_t)a8 subtitleBottomSpacing:(id)a9;
- (void)addSubPane:(id)a3 withCustomSpacingAfter:(double)a4;
@end

@implementation ASCredentialRequestPaneContext

- (ASCredentialRequestPaneContext)initWithPaneViewController:(id)a3 stackView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASCredentialRequestPaneContext;
  v8 = [(ASCredentialRequestPaneContext *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_paneViewController, v6);
    objc_storeStrong((id *)&v9->_stackView, a4);
    v10 = v9;
  }

  return v9;
}

- (void)addSubPane:(id)a3 withCustomSpacingAfter:(double)a4
{
  id v6 = a3;
  id v7 = [(ASCredentialRequestPaneContext *)self stackView];
  [v6 addToStackView:v7 withCustomSpacingAfter:self context:a4];
}

- (void)addEmptyViewWithSpacing:(double)a3
{
  id v7 = objc_alloc_init(_ASStackSpacerView);
  v5 = [(ASCredentialRequestPaneContext *)self stackView];
  [v5 addArrangedSubview:v7];

  id v6 = [(ASCredentialRequestPaneContext *)self stackView];
  [v6 setCustomSpacing:v7 afterView:a3];
}

- (void)addIcon:(id)a3 iconStyle:(int64_t)a4 title:(id)a5 titleStyle:(int64_t)a6 subtitlePane:(id)a7 subtitleStyle:(int64_t)a8 subtitleBottomSpacing:(id)a9
{
  id v24 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  objc_storeStrong((id *)&self->_icon, a3);
  self->_iconStyle = a4;
  objc_storeStrong((id *)&self->_title, a5);
  self->_titleStyle = a6;
  objc_storeStrong((id *)&self->_subtitleSubPane, a7);
  self->_subtitleStyle = a8;
  if (self->_icon)
  {
    [(ASCredentialRequestPaneContext *)self _stackViewTopSpacing];
    -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:");
    v19 = [[ASCredentialRequestImageSubPane alloc] initWithImage:self->_icon imageStyle:self->_iconStyle];
    [(ASCredentialRequestPaneContext *)self _customSpacingAfterIcon];
    -[ASCredentialRequestPaneContext addSubPane:withCustomSpacingAfter:](self, "addSubPane:withCustomSpacingAfter:", v19);
  }
  else
  {
    [(ASCredentialRequestPaneContext *)self _customSpacingAfterIcon];
    -[ASCredentialRequestPaneContext addEmptyViewWithSpacing:](self, "addEmptyViewWithSpacing:");
  }
  if ([MEMORY[0x263F29440] isPad]) {
    [(ASCredentialRequestPaneContext *)self addEmptyViewWithSpacing:16.0];
  }
  if ([(NSString *)self->_title length])
  {
    v20 = [[ASCredentialRequestInfoLabelSubPane alloc] initWithString:self->_title labelStyle:self->_titleStyle];
    [(ASCredentialRequestPaneContext *)self _customSpacingAfterTitle];
    -[ASCredentialRequestPaneContext addSubPane:withCustomSpacingAfter:](self, "addSubPane:withCustomSpacingAfter:", v20);
  }
  subtitleSubPane = self->_subtitleSubPane;
  if (subtitleSubPane)
  {
    if (v18)
    {
      [v18 floatValue];
      double v23 = v22;
    }
    else
    {
      [(ASCredentialRequestPaneContext *)self _customSpacingAfterSubtitle];
    }
    [(ASCredentialRequestPaneContext *)self addSubPane:subtitleSubPane withCustomSpacingAfter:v23];
  }
  [(ASCredentialRequestPaneContext *)self addEmptyViewWithSpacing:0.0];
}

- (BOOL)_useBoldTitleLayout
{
  return self->_titleStyle == 2 || self->_subtitleStyle == 3;
}

- (double)_stackViewTopSpacing
{
  if ([(ASCredentialRequestPaneContext *)self _useBoldTitleLayout])
  {
    [(ASCredentialRequestPaneContext *)self _boldTitle_stackViewTopSpacing];
  }
  else
  {
    double result = 80.0;
    if (self->_icon) {
      return 30.0;
    }
  }
  return result;
}

- (double)_boldTitle_stackViewTopSpacing
{
  icon = self->_icon;
  int v3 = [MEMORY[0x263F29440] isPad];
  double result = 10.0;
  if (v3) {
    double result = 20.0;
  }
  double v5 = 60.0;
  if (v3) {
    double v5 = 40.0;
  }
  if (!icon) {
    return v5;
  }
  return result;
}

- (double)_customSpacingAfterIcon
{
  BOOL v2 = [(ASCredentialRequestPaneContext *)self _useBoldTitleLayout];
  double result = 24.0;
  if (v2) {
    return 14.0;
  }
  return result;
}

- (double)_customSpacingAfterTitle
{
  if ([(ASCredentialRequestPaneContext *)self _useBoldTitleLayout])
  {
    [(ASCredentialRequestPaneContext *)self _boldTitle_customSpacingAfterTitle];
  }
  else
  {
    double result = 80.0;
    if (self->_subtitleSubPane) {
      return 24.0;
    }
  }
  return result;
}

- (double)_boldTitle_customSpacingAfterTitle
{
  double result = 10.0;
  if (!self->_subtitleSubPane)
  {
    int v3 = objc_msgSend(MEMORY[0x263F29440], "isPad", 10.0);
    double result = 64.0;
    if (v3) {
      return 50.0;
    }
  }
  return result;
}

- (double)_customSpacingAfterSubtitle
{
  if (![(ASCredentialRequestPaneContext *)self _useBoldTitleLayout]) {
    return 80.0;
  }
  int v2 = [MEMORY[0x263F29440] isPad];
  double result = 64.0;
  if (v2) {
    return 50.0;
  }
  return result;
}

- (ASCredentialRequestPaneViewController)paneViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paneViewController);

  return (ASCredentialRequestPaneViewController *)WeakRetained;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_paneViewController);
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end