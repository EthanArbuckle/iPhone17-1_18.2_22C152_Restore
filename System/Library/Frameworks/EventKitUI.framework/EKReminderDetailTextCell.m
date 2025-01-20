@interface EKReminderDetailTextCell
- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 allowDataDetector:(BOOL)a7 title:(id)a8 textFromEventAndReminderBlock:(id)a9;
- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 title:(id)a7 attributedText:(id)a8;
- (void)commonSetupCellWithTitle:(id)a3 showExtraSpaceAtBottom:(BOOL)a4;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation EKReminderDetailTextCell

- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 allowDataDetector:(BOOL)a7 title:(id)a8 textFromEventAndReminderBlock:(id)a9
{
  uint64_t v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v18 = (void (**)(id, id, id))a9;
  v23.receiver = self;
  v23.super_class = (Class)EKReminderDetailTextCell;
  v19 = [(EKEventDetailCell *)&v23 initWithEvent:v15 editable:v12];
  v20 = v19;
  if (v19)
  {
    [(EKReminderDetailTextCell *)v19 commonSetupCellWithTitle:v17 showExtraSpaceAtBottom:v11];
    [(UITextView *)v20->_textView setDataDetectorTypes:v10 << 63 >> 63];
    v21 = v18[2](v18, v15, v16);
    [(UITextView *)v20->_textView setText:v21];
  }
  return v20;
}

- (EKReminderDetailTextCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5 showExtraSpaceAtBottom:(BOOL)a6 title:(id)a7 attributedText:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v13 = a7;
  id v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)EKReminderDetailTextCell;
  id v15 = [(EKEventDetailCell *)&v20 initWithEvent:a3 editable:v10];
  id v16 = v15;
  if (v15)
  {
    [(EKReminderDetailTextCell *)v15 commonSetupCellWithTitle:v13 showExtraSpaceAtBottom:v9];
    [(UITextView *)v16->_textView setAttributedText:v14];
    id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UITextView *)v16->_textView setTextColor:v17];

    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UITextView *)v16->_textView setFont:v18];
  }
  return v16;
}

- (void)commonSetupCellWithTitle:(id)a3 showExtraSpaceAtBottom:(BOOL)a4
{
  BOOL v55 = a4;
  v56[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(EKReminderDetailTextCell *)self setSeparatorStyle:0];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  title = self->_title;
  self->_title = v6;

  [(UILabel *)self->_title setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] addingSymbolicTraits:2];
  [(UILabel *)self->_title setFont:v8];

  BOOL v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_title setTextColor:v9];

  [(UILabel *)self->_title setText:v5];
  BOOL v10 = [(EKReminderDetailTextCell *)self contentView];
  [v10 addSubview:self->_title];

  BOOL v11 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  textView = self->_textView;
  self->_textView = v11;

  id v13 = [(UITextView *)self->_textView textLayoutManager];
  [v13 setLimitsLayoutForSuspiciousContents:1];

  id v14 = [MEMORY[0x1E4FB1618] clearColor];
  [(UITextView *)self->_textView setBackgroundColor:v14];

  [(UITextView *)self->_textView setEditable:0];
  id v15 = [(UITextView *)self->_textView textContainer];
  [v15 setMaximumNumberOfLines:7];

  id v16 = [(UITextView *)self->_textView textContainer];
  [v16 setLineBreakMode:4];

  id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UITextView *)self->_textView setTextColor:v17];

  [(UITextView *)self->_textView setScrollEnabled:0];
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 4.0, 0.0, 0.0, 0.0);
  v18 = [(UITextView *)self->_textView textContainer];
  [v18 setLineFragmentPadding:0.0];

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UITextView *)self->_textView setFont:v19];

  objc_super v20 = [(EKReminderDetailTextCell *)self contentView];
  [v20 addSubview:self->_textView];

  v41 = (void *)MEMORY[0x1E4F28DC8];
  v52 = [(UILabel *)self->_title leadingAnchor];
  v54 = [(EKReminderDetailTextCell *)self contentView];
  v53 = [v54 layoutMarginsGuide];
  v51 = [v53 leadingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:6.0];
  v56[0] = v50;
  v47 = [(UILabel *)self->_title trailingAnchor];
  v49 = [(EKReminderDetailTextCell *)self contentView];
  v48 = [v49 layoutMarginsGuide];
  v46 = [v48 trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 constant:-6.0];
  v56[1] = v45;
  v43 = [(UITextView *)self->_textView leadingAnchor];
  v44 = [(EKReminderDetailTextCell *)self contentView];
  v42 = [v44 layoutMarginsGuide];
  v40 = [v42 leadingAnchor];
  v39 = [v43 constraintEqualToAnchor:v40 constant:6.0];
  v56[2] = v39;
  v37 = [(UITextView *)self->_textView trailingAnchor];
  v38 = [(EKReminderDetailTextCell *)self contentView];
  v36 = [v38 layoutMarginsGuide];
  v35 = [v36 trailingAnchor];
  v34 = [v37 constraintEqualToAnchor:v35 constant:-6.0];
  v56[3] = v34;
  v32 = [(UILabel *)self->_title topAnchor];
  v33 = [(EKReminderDetailTextCell *)self contentView];
  v21 = [v33 topAnchor];
  v22 = [v32 constraintEqualToAnchor:v21 constant:15.0];
  v56[4] = v22;
  objc_super v23 = [(UITextView *)self->_textView topAnchor];
  v24 = [(UILabel *)self->_title bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v56[5] = v25;
  v26 = [(UITextView *)self->_textView bottomAnchor];
  v27 = [(EKReminderDetailTextCell *)self contentView];
  v28 = [v27 bottomAnchor];
  double v29 = -15.0;
  if (!v55) {
    double v29 = 0.0;
  }
  v30 = [v26 constraintEqualToAnchor:v28 constant:v29];
  v56[6] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:7];
  [v41 activateConstraints:v31];
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKReminderDetailTextCell;
  [(EKReminderDetailTextCell *)&v3 setSeparatorStyle:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end