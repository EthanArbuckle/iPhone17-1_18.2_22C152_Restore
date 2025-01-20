@interface GKRemoteUITableFooterView
- (BOOL)pinToBottom;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GKButton)button;
- (GKRemoteUIAuxiliaryViewDelegate)delegate;
- (GKRemoteUITableFooterView)initWithAttributes:(id)a3;
- (NSArray)replaceableConstraints;
- (NSDictionary)attributes;
- (double)buttonBaselineOffset;
- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4;
- (int)layoutStyle;
- (void)adjustSizeToFillSuperview:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)createButtonWithAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)objectModelDidChange:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonBaselineOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setPinToBottom:(BOOL)a3;
- (void)setReplaceableConstraints:(id)a3;
- (void)tableViewDidUpdateContentInset:(id)a3;
@end

@implementation GKRemoteUITableFooterView

- (GKRemoteUITableFooterView)initWithAttributes:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKRemoteUITableFooterView;
  v6 = -[GKRemoteUITableFooterView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributes, a3);
    v8 = [v5 objectForKeyedSubscript:@"GKLayoutStyle"];
    v7->_layoutStyle = [v8 integerValue];

    double v9 = 60.0;
    if (!v7->_layoutStyle) {
      double v9 = 38.0;
    }
    v7->_buttonBaselineOffset = v9;
    [(GKRemoteUITableFooterView *)v7 createButtonWithAttributes:v5];
    [(GKRemoteUITableFooterView *)v7 setNeedsLayout];
    v10 = v7;
  }

  return v7;
}

- (void)createButtonWithAttributes:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F639F8];
  id v5 = a3;
  id v11 = [v4 textStyle];
  v6 = [v5 objectForKeyedSubscript:@"buttonStyle"];
  v7 = objc_msgSend(v11, "styleWithName:fallback:layoutMode:", v6, @"remoteUITableFooterButton", -[GKRemoteUITableFooterView layoutStyle](self, "layoutStyle"));

  v8 = [v5 objectForKeyedSubscript:@"button"];

  double v9 = +[GKButton buttonWithType:1];
  button = self->_button;
  self->_button = v9;

  [(GKButton *)self->_button setTitle:v8 forState:0];
  [(GKButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GKButton *)self->_button addTarget:self action:sel_buttonTapped_ forControlEvents:64];
  [(GKButton *)self->_button applyTextStyle:v7];
  [(GKRemoteUITableFooterView *)self addSubview:self->_button];
}

- (GKRemoteUIAuxiliaryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKRemoteUIAuxiliaryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)GKRemoteUITableFooterView;
  [(GKRemoteUITableFooterView *)&v29 layoutSubviews];
  [(GKRemoteUITableFooterView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(GKRemoteUITableFooterView *)self button];
  objc_super v12 = [v11 titleLabel];
  v13 = [v12 font];
  objc_msgSend(v11, "sizeThatFits:", v8, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  [v12 frame];
  double v19 = (v17 - v18) * 0.5;
  if ([(GKRemoteUITableFooterView *)self pinToBottom])
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGFloat v20 = CGRectGetMaxY(v30) - v17;
    [(GKRemoteUITableFooterView *)self buttonBaselineOffset];
    CGFloat v22 = v20 - v21;
    [v13 descender];
    double v24 = v19 + v22 + fabs(v23);
  }
  else
  {
    [(GKRemoteUITableFooterView *)self buttonBaselineOffset];
    double v26 = v25;
    [v13 ascender];
    double v24 = v26 - v27 - v19;
  }
  float v28 = v24;
  objc_msgSend(v11, "setFrame:", round(v4 + (v8 - v15) * 0.5), ceilf(v28), v15, v17);
}

- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4
{
  -[GKRemoteUITableFooterView sizeThatFits:](self, "sizeThatFits:", a4, a3, 1.79769313e308);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = [(GKRemoteUITableFooterView *)self button];
  CGFloat v6 = [v5 titleLabel];
  double v7 = [v6 font];
  [v5 sizeToFit];
  [v5 intrinsicContentSize];
  double v9 = v8;
  [(GKRemoteUITableFooterView *)self buttonBaselineOffset];
  double v11 = v10;
  [v7 ascender];
  double v13 = v9 + v11 - v12;

  double v14 = width;
  double v15 = v13;
  result.height = v15;
  result.CGFloat width = v14;
  return result;
}

- (void)adjustSizeToFillSuperview:(id)a3
{
  id v4 = a3;
  [v4 setTableFooterView:self];
  id v39 = v4;
  [v39 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = (void *)MEMORY[0x1E4FB1EC0];
  double v12 = [v39 superview];

  double v13 = [v11 viewControllerForView:v12];

  double v14 = [v13 navigationController];
  double v15 = 0.0;
  if ([v14 modalPresentationStyle] != 16 && objc_msgSend(v14, "modalPresentationStyle") != 2)
  {
    double v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v16 statusBarFrame];
    double v15 = v17 + 0.0;
  }
  if (v14 && ([v14 isNavigationBarHidden] & 1) == 0)
  {
    double v18 = [v14 navigationBar];
    [v18 frame];
    double v15 = v15 + v19;
  }
  [v39 frame];
  double v21 = v20 - (v6 + v10);
  double v23 = v22 - (v8 + v15);
  [(GKRemoteUITableFooterView *)self frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [v39 contentSize];
  double v33 = v32;
  double v35 = v34;
  -[GKRemoteUITableFooterView sizeThatFits:](self, "sizeThatFits:", v21, 1.79769313e308);
  double v37 = v35 - v31;
  double v38 = v23 - (v35 - v31);
  if (v38 <= v36)
  {
    if (v38 < v31)
    {
      if (v38 >= v36) {
        double v31 = v23 - (v35 - v31);
      }
      else {
        double v31 = v36;
      }
    }
  }
  else
  {
    double v31 = v23 - (v35 - v31);
  }
  objc_msgSend(v39, "setContentSize:", v33, v37 + v31);
  -[GKRemoteUITableFooterView setFrame:](self, "setFrame:", v25, v27, v29, v31);
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)GKRemoteUITableFooterView;
  [(GKRemoteUITableFooterView *)&v4 didMoveToSuperview];
  if ([(GKRemoteUITableFooterView *)self pinToBottom])
  {
    double v3 = [(GKRemoteUITableFooterView *)self superview];
    [(GKRemoteUITableFooterView *)self adjustSizeToFillSuperview:v3];
  }
}

- (void)buttonTapped:(id)a3
{
  id v6 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"url"];
  objc_super v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"name"];
  double v5 = [(GKRemoteUITableFooterView *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 auxiliaryView:self pressedLink:v6 attributes:self->_attributes];
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 auxiliaryView:self pressedButton:v4 attributes:self->_attributes];
  }
}

- (void)objectModelDidChange:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"enabledFunction"];
  if (v4) {
    -[GKButton setEnabled:](self->_button, "setEnabled:", [v5 validateWithFunction:v4]);
  }
}

- (void)tableViewDidUpdateContentInset:(id)a3
{
  if ([(GKRemoteUITableFooterView *)self pinToBottom])
  {
    id v4 = [(GKRemoteUITableFooterView *)self superview];
    [(GKRemoteUITableFooterView *)self adjustSizeToFillSuperview:v4];
  }
}

- (GKButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (BOOL)pinToBottom
{
  return self->_pinToBottom;
}

- (void)setPinToBottom:(BOOL)a3
{
  self->_pinToBottom = a3;
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
}

- (double)buttonBaselineOffset
{
  return self->_buttonBaselineOffset;
}

- (void)setButtonBaselineOffset:(double)a3
{
  self->_buttonBaselineOffset = a3;
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceableConstraints, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end