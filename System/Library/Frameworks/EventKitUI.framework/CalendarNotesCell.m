@interface CalendarNotesCell
- (BOOL)becomeFirstResponder;
- (CalendarNotesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)placeholder;
- (NSString)text;
- (UITextView)textView;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CalendarNotesCell

- (CalendarNotesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v38[4] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)CalendarNotesCell;
  v4 = [(EKUITableViewCell *)&v37 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CalendarNotesCell *)v4 setSelectionStyle:0];
    v6 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v5->_textView;
    v5->_textView = v6;

    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UITextView *)v5->_textView setFont:v8];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v5->_textView setTextColor:v9];

    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v5->_textView setBackgroundColor:v10];

    [(UITextView *)v5->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UITextView setTextContainerInset:](v5->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v11 = [(UITextView *)v5->_textView textContainer];
    [v11 setLineFragmentPadding:0.0];

    v12 = [(UITextView *)v5->_textView textLayoutManager];
    [v12 setLimitsLayoutForSuspiciousContents:1];

    [(UITextView *)v5->_textView setAccessibilityIdentifier:@"Notes"];
    v13 = [(CalendarNotesCell *)v5 contentView];
    [v13 addSubview:v5->_textView];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UITextView *)v5->_textView leadingAnchor];
    v36 = [(CalendarNotesCell *)v5 contentView];
    v34 = [v36 layoutMarginsGuide];
    v33 = [v34 leadingAnchor];
    v32 = [v35 constraintEqualToAnchor:v33];
    v38[0] = v32;
    v30 = [(UITextView *)v5->_textView trailingAnchor];
    v31 = [(CalendarNotesCell *)v5 contentView];
    v29 = [v31 layoutMarginsGuide];
    v28 = [v29 trailingAnchor];
    v26 = [v30 constraintEqualToAnchor:v28];
    v38[1] = v26;
    v24 = [(UITextView *)v5->_textView topAnchor];
    v25 = [(CalendarNotesCell *)v5 contentView];
    v14 = [v25 layoutMarginsGuide];
    v15 = [v14 topAnchor];
    v16 = [v24 constraintEqualToAnchor:v15];
    v38[2] = v16;
    v17 = [(UITextView *)v5->_textView bottomAnchor];
    v18 = [(CalendarNotesCell *)v5 contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 bottomAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    v38[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    [v27 activateConstraints:v22];
  }
  return v5;
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)becomeFirstResponder
{
  return [(UITextView *)self->_textView becomeFirstResponder];
}

- (void)setPlaceholder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = *MEMORY[0x1E4FB06F8];
  v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB28C8];
  id v6 = a3;
  v7 = [v4 preferredFontForTextStyle:v5];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB0700];
  v8 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v9];
  [(UITextView *)self->_textView setAttributedPlaceholder:v10];
}

- (NSString)placeholder
{
  v2 = [(UITextView *)self->_textView attributedPlaceholder];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end