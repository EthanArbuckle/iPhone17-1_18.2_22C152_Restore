@interface EKReminderUneditableButtonDetailCell
- (EKReminderUneditableButtonDetailCell)initWithEvent:(id)a3 uneditableButtonCellDelegate:(id)a4;
@end

@implementation EKReminderUneditableButtonDetailCell

- (EKReminderUneditableButtonDetailCell)initWithEvent:(id)a3 uneditableButtonCellDelegate:(id)a4
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v66 = a4;
  v72.receiver = self;
  v72.super_class = (Class)EKReminderUneditableButtonDetailCell;
  v6 = [(EKEventDetailCell *)&v72 initWithEvent:v65 editable:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uneditableButtonCellDelegate, a4);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    line = v7->_line;
    v7->_line = v8;

    [(UILabel *)v7->_line setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_line setNumberOfLines:0];
    uint64_t v49 = *MEMORY[0x1E4FB2950];
    v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "_preferredFontForTextStyle:addingSymbolicTraits:");
    [(UILabel *)v7->_line setFont:v10];

    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v7->_line setTextColor:v11];

    v12 = EventKitUIBundle();
    v13 = [v12 localizedStringForKey:@"This is a future repeating reminder. You can only edit the current reminder." value:&stru_1F0CC2140 table:0];
    [(UILabel *)v7->_line setText:v13];

    v14 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
    [v14 addSubview:v7->_line];

    v52 = (void *)MEMORY[0x1E4F28DC8];
    v61 = [(UILabel *)v7->_line leadingAnchor];
    v67 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
    v63 = [v67 layoutMarginsGuide];
    v59 = [v63 leadingAnchor];
    v57 = [v61 constraintEqualToAnchor:v59 constant:6.0];
    v77[0] = v57;
    v55 = [(UILabel *)v7->_line trailingAnchor];
    v15 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
    v16 = [v15 layoutMarginsGuide];
    v17 = [v16 trailingAnchor];
    v18 = [v55 constraintEqualToAnchor:v17 constant:-6.0];
    v77[1] = v18;
    v19 = [(UILabel *)v7->_line topAnchor];
    v20 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
    v21 = [v20 topAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:16.0];
    v77[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
    [v52 activateConstraints:v23];

    if (v7->_uneditableButtonCellDelegate)
    {
      v68 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      v24 = EventKitUIBundle();
      v64 = [v24 localizedStringForKey:@"Show Current Reminder" value:&stru_1F0CC2140 table:0];

      v62 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v49];
      id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v75 = *MEMORY[0x1E4FB06F8];
      v76 = v62;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      v27 = (void *)[v25 initWithString:v64 attributes:v26];
      [v68 setAttributedTitle:v27];

      objc_msgSend(v68, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
      objc_initWeak(&location, v7);
      v28 = (void *)MEMORY[0x1E4FB13F0];
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __83__EKReminderUneditableButtonDetailCell_initWithEvent_uneditableButtonCellDelegate___block_invoke;
      v69[3] = &unk_1E6088B78;
      objc_copyWeak(&v70, &location);
      v45 = [v28 actionWithHandler:v69];
      uint64_t v29 = objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v68);
      button = v7->_button;
      v7->_button = (UIButton *)v29;

      [(UIButton *)v7->_button setTranslatesAutoresizingMaskIntoConstraints:0];
      v31 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
      [v31 addSubview:v7->_button];

      v46 = (void *)MEMORY[0x1E4F28DC8];
      v60 = [(UILabel *)v7->_line bottomAnchor];
      v58 = [(UIButton *)v7->_button topAnchor];
      v56 = [v60 constraintEqualToAnchor:v58 constant:-10.0];
      v74[0] = v56;
      v51 = [(UIButton *)v7->_button leadingAnchor];
      v54 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
      v53 = [v54 layoutMarginsGuide];
      v50 = [v53 leadingAnchor];
      v48 = [v51 constraintEqualToAnchor:v50 constant:6.0];
      v74[1] = v48;
      v47 = [(UIButton *)v7->_button trailingAnchor];
      v32 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
      v33 = [v32 layoutMarginsGuide];
      v34 = [v33 trailingAnchor];
      v35 = [v47 constraintLessThanOrEqualToAnchor:v34 constant:-6.0];
      v74[2] = v35;
      v36 = [(UIButton *)v7->_button bottomAnchor];
      v37 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
      v38 = [v37 bottomAnchor];
      v39 = [v36 constraintEqualToAnchor:v38 constant:-16.0];
      v74[3] = v39;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
      [v46 activateConstraints:v40];

      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
    }
    else
    {
      v41 = (void *)MEMORY[0x1E4F28DC8];
      v68 = [(UILabel *)v7->_line bottomAnchor];
      v64 = [(EKReminderUneditableButtonDetailCell *)v7 contentView];
      v62 = [v64 bottomAnchor];
      v42 = [v68 constraintEqualToAnchor:v62 constant:-16.0];
      v73 = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      [v41 activateConstraints:v43];
    }
  }

  return v7;
}

void __83__EKReminderUneditableButtonDetailCell_initWithEvent_uneditableButtonCellDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 141);
    if (v3)
    {
      v4 = v2;
      [v3 uneditableButtonCellRequestedShowFirstUncompletedReminder:v2];
      v2 = v4;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uneditableButtonCellDelegate, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_line, 0);
}

@end