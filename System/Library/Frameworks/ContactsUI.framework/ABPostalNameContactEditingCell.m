@interface ABPostalNameContactEditingCell
- (ABPostalNameContactEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)firstResponderItem;
- (void)_cnui_applyContactStyle;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCardGroupItem:(id)a3;
- (void)textFieldDidChange:(id)a3;
@end

@implementation ABPostalNameContactEditingCell

- (void).cxx_destruct
{
}

- (void)_cnui_applyContactStyle
{
  v3.receiver = self;
  v3.super_class = (Class)ABPostalNameContactEditingCell;
  [(UITableViewCell *)&v3 _cnui_applyContactStyle];
  [(UITextField *)self->_editingTextField _cnui_applyContactStyle];
}

- (void)textFieldDidChange:(id)a3
{
  v4 = [a3 object];
  editingTextField = self->_editingTextField;

  if (v4 == editingTextField)
  {
    id v10 = [(CNContactCell *)self cardGroupItem];
    v6 = [v10 contact];
    v7 = (const char *)[v10 setter];
    v8 = [(UITextField *)self->_editingTextField text];
    objc_msgSend(v6, v7, v8);

    v9 = [(UITextField *)self->_editingTextField text];
    [v10 setValue:v9];
  }
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABPostalNameContactEditingCell;
  [(CNContactCell *)&v10 setCardGroupItem:v4];
  editingTextField = self->_editingTextField;
  id v6 = v4;
  v7 = [v6 value];
  [(UITextField *)editingTextField setText:v7];

  v8 = self->_editingTextField;
  v9 = [v6 placeholder];

  [(UITextField *)v8 setPlaceholder:v9];
}

- (id)firstResponderItem
{
  return self->_editingTextField;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)ABPostalNameContactEditingCell;
  [(CNContactCell *)&v3 prepareForReuse];
  [(UITextField *)self->_editingTextField setText:0];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)ABPostalNameContactEditingCell;
  [(ABPostalNameContactEditingCell *)&v14 layoutSubviews];
  uint64_t v3 = [(ABPostalNameContactEditingCell *)self contentView];
  [(id)v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  LOBYTE(v3) = [(ABPostalNameContactEditingCell *)self _shouldReverseLayoutDirection];
  [(ABPostalNameContactEditingCell *)self separatorInset];
  if (v3)
  {
    double v12 = v11;
    [(ABPostalNameContactEditingCell *)self separatorInset];
    double v7 = v7 - v13 + -32.0;
    double v10 = v12;
  }
  -[UITextField setFrame:](self->_editingTextField, "setFrame:", v10 + 16.0, v5, v7, v9);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3018] object:self->_editingTextField];

  v4.receiver = self;
  v4.super_class = (Class)ABPostalNameContactEditingCell;
  [(CNContactCell *)&v4 dealloc];
}

- (ABPostalNameContactEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ABPostalNameContactEditingCell;
  objc_super v4 = [(CNContactCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    editingTextField = v4->_editingTextField;
    v4->_editingTextField = v5;

    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel_textFieldDidChange_ name:*MEMORY[0x1E4FB3018] object:v4->_editingTextField];

    double v8 = [(ABPostalNameContactEditingCell *)v4 contentView];
    [v8 addSubview:v4->_editingTextField];
  }
  return v4;
}

@end