@interface EKUIDividedGridViewCell
- (BOOL)selected;
- (EKUIDividedGridViewCell)init;
- (EKUIDividedGridViewCell)initWithBackgroundColor:(id)a3;
- (EKUIDividedGridViewController)viewController;
- (NSLayoutConstraint)widthConstraint;
- (UILabel)label;
- (id)selectedTextColor;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation EKUIDividedGridViewCell

- (EKUIDividedGridViewCell)initWithBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = [(EKUIDividedGridViewCell *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bgColor, a3);
    [(EKUIDividedGridViewCell *)v7 setBackgroundColor:v7->_bgColor];
  }

  return v7;
}

- (EKUIDividedGridViewCell)init
{
  v14.receiver = self;
  v14.super_class = (Class)EKUIDividedGridViewCell;
  v2 = [(EKUIDividedGridViewCell *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v3;

    [(UILabel *)v2->_label setTextAlignment:1];
    id v5 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v2->_label setTextColor:v5];

    [(UILabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIDividedGridViewCell *)v2 addSubview:v2->_label];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = _NSDictionaryOfVariableBindings(&cfstr_Label_0.isa, v2->_label, 0);
    v8 = [v6 constraintsWithVisualFormat:@"H:|-(7)-[_label]-(7)-|" options:1024 metrics:0 views:v7];
    [(EKUIDividedGridViewCell *)v2 addConstraints:v8];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = _NSDictionaryOfVariableBindings(&cfstr_Label_0.isa, v2->_label, 0);
    v11 = [v9 constraintsWithVisualFormat:@"V:|-(0)-[_label]-(0)-|" options:512 metrics:0 views:v10];
    [(EKUIDividedGridViewCell *)v2 addConstraints:v11];

    v12 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
    [(EKUIDividedGridViewCell *)v2 setBackgroundColor:v12];
  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [(EKUIDividedGridViewCell *)self viewController];
  [v5 cellTapped:self];
}

- (id)selectedTextColor
{
  uint64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  v4 = [(EKUIDividedGridViewCell *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] blackColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (![(EKUIDividedGridViewCell *)self selected])
  {
    if (self->_bgColor)
    {
      -[EKUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:");
      goto LABEL_9;
    }
    v4 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
    goto LABEL_7;
  }
  v4 = [(EKUIDividedGridViewCell *)self tintColor];
  if (v4)
  {
LABEL_7:
    [(EKUIDividedGridViewCell *)self setBackgroundColor:v4];
    goto LABEL_8;
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] darkGrayColor];
  [(EKUIDividedGridViewCell *)self setBackgroundColor:v5];

LABEL_8:
LABEL_9:
  if ([(EKUIDividedGridViewCell *)self selected]) {
    [(EKUIDividedGridViewCell *)self selectedTextColor];
  }
  else {
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  }
  uint64_t v6 = [(EKUIDividedGridViewCell *)self label];
  [v6 setTextColor:v7];
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLabel:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (EKUIDividedGridViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (EKUIDividedGridViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widthConstraint);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end