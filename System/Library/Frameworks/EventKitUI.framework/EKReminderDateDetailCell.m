@interface EKReminderDateDetailCell
- (BOOL)hideBottomCellSeparator;
- (EKReminderDateDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5;
- (void)setHideBottomCellSeparator:(BOOL)a3;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation EKReminderDateDetailCell

- (EKReminderDateDetailCell)initWithEvent:(id)a3 reminder:(id)a4 editable:(BOOL)a5
{
  BOOL v5 = a5;
  v50[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)EKReminderDateDetailCell;
  v10 = [(EKReminderDetailCell *)&v49 initWithEvent:v8 reminder:v9 editable:v5];
  if (v10)
  {
    v47 = v9;
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    line = v10->_line;
    v10->_line = v11;

    [(UILabel *)v10->_line setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v10->_line setNumberOfLines:0];
    v13 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x10000];
    [(UILabel *)v10->_line setFont:v13];

    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v10->_line setTextColor:v14];

    v15 = [(EKReminderDateDetailCell *)v10 contentView];
    [v15 addSubview:v10->_line];

    v38 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(UILabel *)v10->_line leadingAnchor];
    v46 = [(EKReminderDateDetailCell *)v10 contentView];
    v45 = [v46 layoutMarginsGuide];
    v43 = [v45 leadingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:6.0];
    v50[0] = v42;
    v39 = [(UILabel *)v10->_line trailingAnchor];
    v41 = [(EKReminderDateDetailCell *)v10 contentView];
    v40 = [v41 layoutMarginsGuide];
    v37 = [v40 trailingAnchor];
    v36 = [v39 constraintEqualToAnchor:v37 constant:-6.0];
    v50[1] = v36;
    v35 = [(UILabel *)v10->_line topAnchor];
    v16 = [(EKReminderDateDetailCell *)v10 contentView];
    v17 = [v16 topAnchor];
    v18 = [v35 constraintEqualToAnchor:v17 constant:5.0];
    v50[2] = v18;
    [(UILabel *)v10->_line bottomAnchor];
    v19 = v48 = v8;
    v20 = [(EKReminderDateDetailCell *)v10 contentView];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:-15.0];
    v50[3] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [v38 activateConstraints:v23];

    id v8 = v48;
    id v24 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v24 setDateStyle:4];
    if ([v48 completed])
    {
      [v24 setTimeStyle:1];
      id v9 = v47;
      v25 = [v47 completionDate];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        id v27 = [MEMORY[0x1E4F1C9C8] now];
      }
      v28 = v27;

      v30 = NSString;
      v29 = EventKitUIBundle();
      v31 = [v29 localizedStringForKey:@"Completed: %@" value:&stru_1F0CC2140 table:0];
      v32 = [v24 stringFromDate:v28];
      v33 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v32);
      [(UILabel *)v10->_line setText:v33];
    }
    else
    {
      [v24 setTimeStyle:0];
      v28 = [v48 startDate];
      v29 = [v24 stringFromDate:v28];
      [(UILabel *)v10->_line setText:v29];
      id v9 = v47;
    }
  }
  return v10;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  BOOL v3 = !self->_hideBottomCellSeparator;
  v4.receiver = self;
  v4.super_class = (Class)EKReminderDateDetailCell;
  [(EKReminderDateDetailCell *)&v4 setSeparatorStyle:v3];
}

- (BOOL)hideBottomCellSeparator
{
  return self->_hideBottomCellSeparator;
}

- (void)setHideBottomCellSeparator:(BOOL)a3
{
  self->_hideBottomCellSeparator = a3;
}

- (void).cxx_destruct
{
}

@end