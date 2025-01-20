@interface EKRecurrenceOrdinalChooserController
- (EKRecurrenceOrdinalChooserController)initWithDate:(id)a3;
- (double)heightForRow:(int64_t)a3;
- (id)cellForRow:(int64_t)a3;
- (int64_t)frequency;
- (int64_t)numberOfRows;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation EKRecurrenceOrdinalChooserController

- (EKRecurrenceOrdinalChooserController)initWithDate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKRecurrenceOrdinalChooserController;
  v3 = [(EKRecurrenceChooserController *)&v7 initWithDate:a3];
  if (v3)
  {
    v4 = (EKRecurrenceOrdinalPickerViewController *)objc_opt_new();
    [(EKRecurrenceOrdinalPickerViewController *)v4 setDelegate:v3];
    pickerViewController = v3->_pickerViewController;
    v3->_pickerViewController = v4;
  }
  return v3;
}

- (int64_t)frequency
{
  return 2;
}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)heightForRow:(int64_t)a3
{
  v3 = [(EKRecurrenceOrdinalPickerViewController *)self->_pickerViewController view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v5 = v4;

  return v5;
}

- (id)cellForRow:(int64_t)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  cell = self->_cell;
  if (!cell)
  {
    double v5 = [(EKRecurrenceOrdinalPickerViewController *)self->_pickerViewController view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(EKRecurrenceChooserController *)self backgroundColor];

    if (v6)
    {
      objc_super v7 = [(EKRecurrenceChooserController *)self backgroundColor];
      [v5 setBackgroundColor:v7];
    }
    v8 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    v9 = self->_cell;
    self->_cell = &v8->super;

    v10 = [(UITableViewCell *)self->_cell contentView];
    [v10 addSubview:v5];

    v11 = [(UITableViewCell *)self->_cell contentView];
    v12 = (void *)MEMORY[0x1E4F28DC8];
    v13 = [(UITableViewCell *)self->_cell contentView];
    v14 = [v12 constraintWithItem:v13 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v14];

    v15 = [(UITableViewCell *)self->_cell contentView];
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [(UITableViewCell *)self->_cell contentView];
    v18 = [v16 constraintWithItem:v5 attribute:7 relatedBy:0 toItem:v17 attribute:7 multiplier:1.0 constant:1.0];
    [v15 addConstraint:v18];

    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(UITableViewCell *)self->_cell contentView];
    v21 = [v19 constraintWithItem:v20 attribute:8 relatedBy:1 toItem:v5 attribute:8 multiplier:1.0 constant:0.0];

    LODWORD(v22) = 1148829696;
    [v21 setPriority:v22];
    v23 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(UITableViewCell *)self->_cell contentView];
    v25 = [v23 constraintWithItem:v24 attribute:3 relatedBy:0 toItem:v5 attribute:3 multiplier:1.0 constant:0.0];

    v26 = [(UITableViewCell *)self->_cell contentView];
    v29[0] = v21;
    v29[1] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v26 addConstraints:v27];

    cell = self->_cell;
  }

  return cell;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
}

- (void)updateFromRecurrenceRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);

  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end