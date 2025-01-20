@interface CNPropertyNoteCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)allowsCellSelection;
- (BOOL)displaysCellSelectionState;
- (BOOL)shouldPerformDefaultAction;
- (BOOL)supportsTintColorValue;
- (CNPropertyNoteCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)labelLabel;
- (UITextView)textView;
- (double)valueViewBottomMargin;
- (id)labelView;
- (id)valueView;
- (void)dealloc;
- (void)performDefaultAction;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setProperty:(id)a3;
- (void)setTextView:(id)a3;
- (void)setValueTextAttributes:(id)a3;
- (void)textViewChanged:(id)a3;
- (void)textViewEditingDidEnd:(id)a3;
@end

@implementation CNPropertyNoteCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLabel, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (void)setTextView:(id)a3
{
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setAllowsEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNPropertyCell *)self allowsEditing] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CNPropertyNoteCell;
    [(CNPropertyCell *)&v6 setAllowsEditing:v3];
    v5 = [(CNPropertyNoteCell *)self textView];
    [v5 setEditable:v3];
  }
}

- (void)textViewEditingDidEnd:(id)a3
{
  id v5 = [a3 object];
  objc_msgSend(v5, "setContentOffset:animated:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (([(CNPropertyNoteCell *)self isEditing] & 1) == 0)
  {
    v4 = [(CNPropertyCell *)self propertyItem];
    [v4 saveChangesImmediately:1];
  }
}

- (void)textViewChanged:(id)a3
{
  id v8 = [a3 object];
  v4 = [(CNPropertyCell *)self delegate];
  id v5 = [(CNPropertyCell *)self propertyItem];
  objc_super v6 = [v8 text];
  [v4 propertyCell:self didUpdateItem:v5 withNewValue:v6];

  v7 = [(CNPropertyCell *)self delegate];
  [v7 propertyCellDidChangeLayout:self];
}

- (void)setValueTextAttributes:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
  objc_super v6 = [(CNPropertyNoteCell *)self textView];
  [v6 setTextColor:v5];

  v10[0] = *MEMORY[0x1E4FB06F8];
  v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v10[1] = v4;
  v11[0] = v7;
  v11[1] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyNoteCell;
  [(CNLabeledCell *)&v9 setValueTextAttributes:v8];
}

- (void)performDefaultAction
{
  id v2 = [(CNPropertyNoteCell *)self textView];
  [v2 becomeFirstResponder];
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (double)valueViewBottomMargin
{
  [(CNPropertyNoteCell *)self layoutMargins];
  return 44.0 - v2;
}

- (id)valueView
{
  textView = self->_textView;
  if (!textView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    id v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v6 = self->_textView;
    self->_textView = v5;

    [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredFontForTextStyle:", *MEMORY[0x1E4FB2950]);
    [(UITextView *)self->_textView setFont:v7];

    id v8 = [(UITextView *)self->_textView textContainer];
    [v8 setLineFragmentPadding:0.0];

    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)self->_textView setScrollEnabled:0];
    [(UITextView *)self->_textView _cnui_applyContactStyle];
    textView = self->_textView;
  }

  return textView;
}

- (id)labelView
{
  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    id v4 = [(CNLabeledCell *)self standardLabelView];
    id v5 = self->_labelLabel;
    self->_labelLabel = v4;

    labelLabel = self->_labelLabel;
  }

  return labelLabel;
}

- (BOOL)displaysCellSelectionState
{
  return 0;
}

- (BOOL)allowsCellSelection
{
  return 1;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)setProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyNoteCell *)self labelView];
  objc_msgSend(v5, "setAb_text:", @"Notes");

  id v6 = [(CNPropertyNoteCell *)self valueView];
  objc_msgSend(v6, "setAb_text:", v4);
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNoteCell;
  [(CNContactCell *)&v4 dealloc];
}

- (CNPropertyNoteCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyNoteCell;
  objc_super v4 = [(CNPropertyCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(CNPropertyNoteCell *)v4 setAllowsEditing:1];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel_textViewChanged_ name:*MEMORY[0x1E4FB30A0] object:v5->_textView];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel_textViewEditingDidEnd_ name:*MEMORY[0x1E4FB30A8] object:v5->_textView];
  }
  return v5;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end