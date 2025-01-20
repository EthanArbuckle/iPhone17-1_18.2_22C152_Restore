@interface CDPUICodeEntryPane
- (CDPUICodeEntryPane)initWithFrame:(CGRect)a3;
- (CGSize)preferredContentSize;
- (id)_createFooterButton;
- (void)didFinishResizingHeaderView;
- (void)didFinishResizingPinView;
- (void)setViewModel:(id)a3;
@end

@implementation CDPUICodeEntryPane

- (CDPUICodeEntryPane)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CDPUICodeEntryPane;
  v3 = -[CDPPassphraseEntryPane initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    containerView = v3->super._containerView;
    v6 = [(CDPUICodeEntryPane *)v3 _createFooterButton];
    [(UIScrollView *)containerView addSubview:v6];
  }
  return v4;
}

- (id)_createFooterButton
{
  v3 = [MEMORY[0x263F824E8] buttonWithType:1];
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  v5 = [(UIButton *)self->_footerButton titleLabel];
  [v5 setNumberOfLines:0];

  v6 = [(UIButton *)self->_footerButton titleLabel];
  [v6 setTextAlignment:1];

  [(UIButton *)self->_footerButton setAutoresizingMask:12];
  v7 = self->_footerButton;

  return v7;
}

- (void)didFinishResizingHeaderView
{
  v3.receiver = self;
  v3.super_class = (Class)CDPUICodeEntryPane;
  [(CDPPassphraseEntryPane *)&v3 didFinishResizingHeaderView];
  [(CDPUICodeEntryPane *)self setViewModel:self->_viewModel];
}

- (void)didFinishResizingPinView
{
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48]) frame];
  CGFloat v3 = CGRectGetMaxY(v55) + self->super._keyboardOffset;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v3);
  containerView = self->super._containerView;
  [(UIScrollView *)containerView frame];
  double v47 = v3;
  -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, fmax(v3 - CGRectGetHeight(v56), 0.0));
  if ([(CDPPassphraseEntryPane *)self isSmallScreen]) {
    double v5 = 8.0;
  }
  else {
    double v5 = 24.0;
  }
  uint64_t v6 = *MEMORY[0x263F83570];
  v7 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v7 scaledValueForValue:v5];
  double v9 = v8;
  double v49 = v8;

  v10 = (void *)MEMORY[0x263F81708];
  v11 = [MEMORY[0x263F82B60] mainScreen];
  v12 = [v11 traitCollection];
  v13 = [v10 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v12];
  v14 = [(UIButton *)self->_footerButton titleLabel];
  [v14 setFont:v13];

  [(UIButton *)self->_footerButton frame];
  CGFloat v51 = v16;
  CGFloat v52 = v15;
  v17 = [(UIButton *)self->_footerButton titleLabel];
  [(CDPUICodeEntryPane *)self frame];
  objc_msgSend(v17, "sizeThatFits:", CGRectGetWidth(v57), 1.79769313e308);
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = (int)*MEMORY[0x263F5FD40];
  v23 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v22) superview];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v58.origin.x = v25;
  v58.origin.y = v27;
  v58.size.width = v29;
  v58.size.height = v31;
  double Height = CGRectGetHeight(v58);
  [(CDPPassphraseEntryPane *)self desiredMinPinHeight];
  double v33 = v32;
  double v48 = v9 + v21;
  [(CDPUICodeEntryPane *)self bounds];
  double MidX = CGRectGetMidX(v59);
  v60.origin.y = v51;
  v60.origin.x = v52;
  v60.size.width = v19;
  v60.size.height = v21;
  double Width = CGRectGetWidth(v60);
  double v36 = 0.0;
  if (Height > v33) {
    double v36 = v48;
  }
  double v37 = v31 - v36;
  double v38 = MidX + Width * -0.5;
  double v39 = 8.0;
  if (Height > v33) {
    double v39 = v49;
  }
  double v53 = v39;
  v61.origin.x = v25;
  v61.origin.y = v27;
  v61.size.width = v29;
  v61.size.height = v37;
  double MaxY = CGRectGetMaxY(v61);
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v38, MaxY, v19, v21);
  v41 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v22) superview];
  objc_msgSend(v41, "setFrame:", v25, v27, v29, v37);

  v42 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v22);
  v43 = [v42 superview];
  [v43 bounds];
  objc_msgSend(v42, "setFrame:");

  v62.origin.x = v38;
  v62.origin.y = MaxY;
  v62.size.width = v19;
  v62.size.height = v21;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v53 + CGRectGetMaxY(v62) + self->super._keyboardOffset);
  v44 = [(UIButton *)self->_footerButton superview];

  if (v44)
  {
    v45 = self->super._containerView;
    [(UIScrollView *)v45 frame];
    double v46 = v47 - CGRectGetHeight(v63);
    -[UIScrollView setContentOffset:](v45, "setContentOffset:", 0.0, v46);
  }
}

- (void)setViewModel:(id)a3
{
  id v22 = a3;
  p_viewModel = &self->_viewModel;
  objc_storeStrong((id *)&self->_viewModel, a3);
  headerView = self->super._headerView;
  v7 = [(CDPUICodeEntryViewModel *)self->_viewModel promptTitle];
  [(CDPPaneHeaderView *)headerView setTitleText:v7];

  double v8 = [(CDPUICodeEntryViewModel *)self->_viewModel promptMessage];
  double v9 = [(CDPPaneHeaderView *)self->super._headerView subLabel];
  [v9 setText:v8];

  v10 = (void *)MEMORY[0x263F81708];
  uint64_t v11 = *MEMORY[0x263F83570];
  v12 = [MEMORY[0x263F82B60] mainScreen];
  v13 = [v12 traitCollection];
  v14 = [v10 preferredFontForTextStyle:v11 compatibleWithTraitCollection:v13];
  double v15 = [(CDPPaneHeaderView *)self->super._headerView subLabel];
  [v15 setFont:v14];

  [(CDPPaneHeaderView *)self->super._headerView makeAllTheTextFits];
  double v16 = [(CDPUICodeEntryViewModel *)self->_viewModel escapeOffer];

  footerButton = self->_footerButton;
  if (v16)
  {
    double v18 = [(CDPUICodeEntryViewModel *)*p_viewModel escapeOffer];
    [(UIButton *)footerButton addTarget:v18 action:sel_handleEscapeAction_ forControlEvents:64];

    double v19 = self->_footerButton;
    double v20 = [(CDPUICodeEntryViewModel *)*p_viewModel escapeOffer];
    double v21 = [v20 title];
    [(UIButton *)v19 setTitle:v21 forState:0];
  }
  else
  {
    [(UIButton *)self->_footerButton removeFromSuperview];
  }
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end