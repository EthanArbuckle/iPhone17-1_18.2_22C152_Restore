@interface LUILogFilterCurrentPredicateTableViewCell
- (LUILogFilterCurrentPredicateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (LUILogFilterCurrentPredicateTableViewCellDelegate)delegate;
- (UIButton)deleteButton;
- (UILabel)titleLabel;
- (id)_createDeleteButton;
- (id)_createTitleLabel;
- (void)_deleteButtonTapped:(id)a3;
- (void)_setupUI;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation LUILogFilterCurrentPredicateTableViewCell

- (LUILogFilterCurrentPredicateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LUILogFilterCurrentPredicateTableViewCell;
  v4 = [(LUILogFilterCurrentPredicateTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(LUILogFilterCurrentPredicateTableViewCell *)v4 _setupUI];
  }
  return v5;
}

- (void)_setupUI
{
  v3 = [MEMORY[0x263F1C550] clearColor];
  [(LUILogFilterCurrentPredicateTableViewCell *)self setBackgroundColor:v3];

  id v4 = [MEMORY[0x263F1C550] whiteColor];
  uint64_t v5 = [v4 CGColor];
  v6 = [(LUILogFilterCurrentPredicateTableViewCell *)self layer];
  [v6 setBorderColor:v5];

  objc_super v7 = [(LUILogFilterCurrentPredicateTableViewCell *)self layer];
  [v7 setBorderWidth:1.5];

  v8 = [(LUILogFilterCurrentPredicateTableViewCell *)self layer];
  [v8 setCornerRadius:15.0];

  v9 = [(LUILogFilterCurrentPredicateTableViewCell *)self _createTitleLabel];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = [(LUILogFilterCurrentPredicateTableViewCell *)self _createDeleteButton];
  deleteButton = self->_deleteButton;
  self->_deleteButton = v11;

  [(UIButton *)self->_deleteButton addTarget:self action:sel__deleteButtonTapped_ forControlEvents:64];
  [(LUILogFilterCurrentPredicateTableViewCell *)self addSubview:self->_titleLabel];
  v13 = self->_deleteButton;

  [(LUILogFilterCurrentPredicateTableViewCell *)self addSubview:v13];
}

- (void)layoutSubviews
{
  [(LUILogFilterCurrentPredicateTableViewCell *)self frame];
  CGFloat v3 = CGRectGetWidth(v11) + -80.0;
  [(LUILogFilterCurrentPredicateTableViewCell *)self frame];
  double Height = CGRectGetHeight(v12);
  uint64_t v5 = [(LUILogFilterCurrentPredicateTableViewCell *)self titleLabel];
  objc_msgSend(v5, "setFrame:", 20.0, 0.0, v3, Height);

  id v9 = [(LUILogFilterCurrentPredicateTableViewCell *)self titleLabel];
  [v9 frame];
  CGFloat v6 = CGRectGetMaxX(v13) + 20.0;
  [(LUILogFilterCurrentPredicateTableViewCell *)self frame];
  CGFloat v7 = CGRectGetHeight(v14) + -10.0;
  v8 = [(LUILogFilterCurrentPredicateTableViewCell *)self deleteButton];
  objc_msgSend(v8, "setFrame:", v6, 5.0, 20.0, v7);
}

- (id)_createTitleLabel
{
  CGFloat v3 = objc_opt_new();
  [(LUILogFilterCurrentPredicateTableViewCell *)self frame];
  CGFloat v4 = CGRectGetWidth(v9) + -80.0;
  [(LUILogFilterCurrentPredicateTableViewCell *)self frame];
  objc_msgSend(v3, "setFrame:", 20.0, 0.0, v4, CGRectGetHeight(v10));
  uint64_t v5 = [MEMORY[0x263F1C658] systemFontOfSize:17.0 weight:*MEMORY[0x263F1D330]];
  [v3 setFont:v5];

  CGFloat v6 = [MEMORY[0x263F1C550] whiteColor];
  [v3 setTextColor:v6];

  [v3 setTextAlignment:0];

  return v3;
}

- (id)_createDeleteButton
{
  v2 = objc_opt_new();
  CGFloat v3 = [MEMORY[0x263F1C6B0] imageNamed:@"DeleteIcon"];
  CGFloat v4 = [v3 imageWithRenderingMode:2];

  uint64_t v5 = [MEMORY[0x263F1C550] whiteColor];
  CGFloat v6 = [v2 imageView];
  [v6 setTintColor:v5];

  [v2 setImage:v4 forState:0];

  return v2;
}

- (void)_deleteButtonTapped:(id)a3
{
  id v4 = [(LUILogFilterCurrentPredicateTableViewCell *)self delegate];
  [v4 predicateTableViewCellDeleteButtonTapped:self];
}

- (LUILogFilterCurrentPredicateTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LUILogFilterCurrentPredicateTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end