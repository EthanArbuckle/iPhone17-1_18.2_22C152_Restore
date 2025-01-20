@interface BTWarningCell
+ (int64_t)cellStyle;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (BTWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation BTWarningCell

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return 1;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BTWarningCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(BTWarningCell *)self setNeedsUpdateConstraints];
}

- (BTWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BTWarningCell;
  v4 = [(BTWarningCell *)&v11 initWithStyle:a3 reuseIdentifier:0];
  if (v4)
  {
    uint64_t v5 = createWarningCellTitle();
    titleTextView = v4->_titleTextView;
    v4->_titleTextView = (UITextView *)v5;

    uint64_t v7 = createWarningCellBody();
    bodyTextView = v4->_bodyTextView;
    v4->_bodyTextView = (UITextView *)v7;

    [(UITextView *)v4->_bodyTextView setDelegate:v4];
    v9 = [(BTWarningCell *)v4 contentView];
    [v9 addSubview:v4->_titleTextView];
    [v9 addSubview:v4->_bodyTextView];
    [(BTWarningCell *)v4 layoutSubviews];
  }
  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)BTWarningCell;
  [(PSTableCell *)&v24 refreshCellContentsWithSpecifier:a3];
  v4 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F78]);
  id WeakRetained = objc_loadWeakRetained(v4);
  v6 = [WeakRetained userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"warning-cell-title"];

  id v8 = objc_loadWeakRetained(v4);
  v9 = [v8 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"warning-cell-body-link-text"];

  id v11 = objc_loadWeakRetained(v4);
  v12 = [v11 userInfo];
  v13 = [v12 objectForKeyedSubscript:@"warning-cell-body-url"];

  [(UITextView *)self->_titleTextView setText:v7];
  id v14 = objc_loadWeakRetained(v4);
  v15 = [v14 userInfo];
  v16 = [v15 objectForKeyedSubscript:@"warning-cell-body"];

  if (v10 && v13)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v16];
    [v17 setAsLink:v10 linkURL:v13];
    uint64_t v18 = *MEMORY[0x1E4FB06F8];
    v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    objc_msgSend(v17, "addAttribute:value:range:", v18, v19, 0, objc_msgSend(v17, "length"));

    uint64_t v20 = *MEMORY[0x1E4FB0700];
    v21 = [MEMORY[0x1E4F92E40] appearance];
    v22 = [v21 textColor];
    v23 = v22;
    if (!v22)
    {
      v23 = [MEMORY[0x1E4FB1618] blackColor];
    }
    objc_msgSend(v17, "addAttribute:value:range:", v20, v23, 0, objc_msgSend(v17, "length"));
    if (!v22) {

    }
    [(UITextView *)self->_bodyTextView setAttributedText:v17];
  }
  else
  {
    [(UITextView *)self->_bodyTextView setText:v16];
  }

  [(BTWarningCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  objc_super v3 = _NSDictionaryOfVariableBindings(&cfstr_TitletextviewB.isa, self->_titleTextView, self->_bodyTextView, 0);
  v4 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_titleTextView]-|" options:0 metrics:0 views:v3];
  uint64_t v5 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[_bodyTextView]-|" options:0 metrics:0 views:v3];
  v6 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-11-[_titleTextView]-[_bodyTextView]-11-|" options:0 metrics:0 views:v3];
  uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v5];
  id v8 = [v7 arrayByAddingObjectsFromArray:v6];
  constraints = self->_constraints;
  self->_constraints = v8;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  v10.receiver = self;
  v10.super_class = (Class)BTWarningCell;
  [(BTWarningCell *)&v10 updateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);

  objc_storeStrong((id *)&self->_titleTextView, 0);
}

@end