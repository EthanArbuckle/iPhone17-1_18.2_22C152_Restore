@interface CNPropertyDateEditingCell
- (BOOL)_shouldUseYearlessPickerForDateComponents:(id)a3;
- (BOOL)shouldEditDatesTextually;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (CNDatePickerContainerView)datePickerContainerView;
- (CNPropertyDateEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)currentCalendarIdentifier;
- (UIDatePicker)datePicker;
- (UIViewController)contentViewController;
- (void)applyCalendarAndDate;
- (void)dateChanged:(id)a3;
- (void)labelButtonClicked:(id)a3;
- (void)localeUpdated:(id)a3;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)prepareForReuse;
- (void)regainFocus;
- (void)setContentViewController:(id)a3;
- (void)setCurrentCalendarIdentifier:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setDatePickerContainerView:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)updateValueWithPropertyItem:(id)a3;
@end

@implementation CNPropertyDateEditingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_datePickerContainerView, 0);

  objc_storeStrong((id *)&self->_datePicker, 0);
}

- (void)setCurrentCalendarIdentifier:(id)a3
{
}

- (NSString)currentCalendarIdentifier
{
  return self->_currentCalendarIdentifier;
}

- (BOOL)shouldEditDatesTextually
{
  return self->_shouldEditDatesTextually;
}

- (void)setContentViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setDatePickerContainerView:(id)a3
{
}

- (CNDatePickerContainerView)datePickerContainerView
{
  return self->_datePickerContainerView;
}

- (void)setDatePicker:(id)a3
{
}

- (void)regainFocus
{
  id v2 = [(CNPropertySimpleEditingCell *)self textField];
  [v2 becomeFirstResponder];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNPropertyCell *)self delegate];
  v9 = [(CNPropertyCell *)self propertyItem];
  [v8 propertyCell:self didUpdateItem:v9 withNewLabel:v6];

  [(CNPropertyDateEditingCell *)self applyCalendarAndDate];
  v10 = [(CNPropertyCell *)self presentingDelegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__CNPropertyDateEditingCell_picker_didPickItem___block_invoke;
  v11[3] = &unk_1E549B488;
  v11[4] = self;
  [v10 sender:self dismissViewController:v7 completionHandler:v11];
}

uint64_t __48__CNPropertyDateEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyCell *)self presentingDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CNPropertyDateEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 sender:self dismissViewController:v4 completionHandler:v6];
}

uint64_t __45__CNPropertyDateEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v10 = a3;
  if ([(CNPropertyDateEditingCell *)self shouldEditDatesTextually])
  {
    v5 = [(CNPropertyCell *)self propertyItem];
    id v6 = [v10 text];
    id v7 = [v5 valueForDisplayString:v6];

    v8 = [(CNPropertyCell *)self delegate];
    v9 = [(CNPropertyCell *)self propertyItem];
    [v8 propertyCell:self didUpdateItem:v9 withNewValue:v7];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyCell *)self propertyItem];
  char v6 = [v5 isReadonly];

  if ((v6 & 1) == 0)
  {
    v8 = [(CNPropertySimpleEditingCell *)self textField];
    objc_msgSend(v8, "_cnui_applyContactStyle");

    if ([(CNPropertyDateEditingCell *)self shouldEditDatesTextually])
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1
      && ([(CNPropertyDateEditingCell *)self traitCollection],
          v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 horizontalSizeClass],
          v11,
          v12 != 1))
    {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_41_29560);
      contentViewController = self->_contentViewController;
      if (!contentViewController)
      {
        v23 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
        v24 = self->_contentViewController;
        self->_contentViewController = v23;

        v25 = [(CNPropertyDateEditingCell *)self datePicker];
        [(UIViewController *)self->_contentViewController setView:v25];

        v26 = [(CNPropertyDateEditingCell *)self datePicker];
        [v26 bounds];
        -[UIViewController setPreferredContentSize:](self->_contentViewController, "setPreferredContentSize:", v27, v28);

        contentViewController = self->_contentViewController;
      }
      if ([(UIViewController *)contentViewController isBeingPresented]) {
        goto LABEL_2;
      }
      if ([(UIViewController *)self->_contentViewController isBeingDismissed]) {
        goto LABEL_2;
      }
      v29 = [(UIViewController *)self->_contentViewController view];
      v30 = [v29 window];

      if (v30) {
        goto LABEL_2;
      }
      v19 = [(CNPropertyCell *)self presentingDelegate];
      [v19 sender:v4 presentViewController:self->_contentViewController];
      BOOL v7 = 0;
    }
    else
    {
      v13 = [(CNPropertyDateEditingCell *)self datePickerContainerView];

      if (!v13)
      {
        v14 = [CNDatePickerContainerView alloc];
        v15 = [(CNPropertyDateEditingCell *)self datePicker];
        v16 = [(CNDatePickerContainerView *)v14 initWithDatePicker:v15];

        [(CNDatePickerContainerView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(CNPropertyDateEditingCell *)self setDatePickerContainerView:v16];
        v17 = [(CNPropertyDateEditingCell *)self datePickerContainerView];
        v18 = [(CNPropertySimpleEditingCell *)self textField];
        [v18 setInputView:v17];
      }
      v19 = [MEMORY[0x1E4FB1618] clearColor];
      v20 = [(CNPropertySimpleEditingCell *)self textField];
      [v20 setInsertionPointColor:v19];

      BOOL v7 = 1;
    }

    goto LABEL_11;
  }
LABEL_2:
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

void __57__CNPropertyDateEditingCell_textFieldShouldBeginEditing___block_invoke()
{
  id v1 = [MEMORY[0x1E4FB1F48] keyWindow];
  v0 = [v1 firstResponder];
  [v0 resignFirstResponder];
}

- (void)applyCalendarAndDate
{
  v3 = [(CNPropertyCell *)self propertyItem];
  id v4 = [v3 labeledValue];
  id v18 = [v4 value];

  if ([(CNPropertyDateEditingCell *)self _shouldUseYearlessPickerForDateComponents:v18])
  {
    uint64_t v5 = 4271;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(UIDatePicker *)self->_datePicker setDatePickerMode:v5];
  char v6 = [v18 calendar];
  BOOL v7 = (void *)[v6 copy];

  v8 = [v7 calendarIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C318]];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];

    BOOL v7 = (void *)v10;
  }
  v11 = [(UIDatePicker *)self->_datePicker timeZone];
  [v7 setTimeZone:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F70FE8];
  v13 = [v7 calendarIdentifier];
  v14 = [v12 localeForCalendarID:v13];

  [(UIDatePicker *)self->_datePicker setLocale:v14];
  v15 = +[CNUIDate dateFromComponents:v18 destinationCalendar:v7];
  [(UIDatePicker *)self->_datePicker setDate:v15];

  [(UIDatePicker *)self->_datePicker setCalendar:v7];
  v16 = [v7 calendarIdentifier];
  currentCalendarIdentifier = self->_currentCalendarIdentifier;
  self->_currentCalendarIdentifier = v16;
}

- (UIDatePicker)datePicker
{
  if (!self->_datePicker)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB16B0]);
    id v4 = (UIDatePicker *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    datePicker = self->_datePicker;
    self->_datePicker = v4;

    char v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [(UIDatePicker *)self->_datePicker setTimeZone:v6];

    [(UIDatePicker *)self->_datePicker addTarget:self action:sel_dateChanged_ forControlEvents:4096];
  }
  [(CNPropertyDateEditingCell *)self applyCalendarAndDate];
  BOOL v7 = [(CNPropertyCell *)self delegate];
  v8 = [(CNPropertyCell *)self propertyItem];
  int v9 = [(CNPropertyCell *)self propertyItem];
  uint64_t v10 = [v9 labeledValue];
  v11 = [v10 value];
  [v7 propertyCell:self didUpdateItem:v8 withNewValue:v11];

  uint64_t v12 = self->_datePicker;

  return v12;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  id v21 = a3;
  id v4 = [(CNPropertyDateEditingCell *)self currentCalendarIdentifier];
  uint64_t v5 = [v21 labeledValue];
  char v6 = [v5 value];

  BOOL v7 = [v6 calendar];
  v8 = [v7 calendarIdentifier];
  [(CNPropertyDateEditingCell *)self setCurrentCalendarIdentifier:v8];

  int v9 = [(CNPropertyEditingCell *)self valueString];
  uint64_t v10 = [(CNPropertySimpleEditingCell *)self valueView];
  v11 = objc_msgSend(v10, "ab_text");
  char v12 = [v9 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    if (![(CNPropertyDateEditingCell *)self shouldEditDatesTextually]) {
      goto LABEL_6;
    }
    v13 = [(CNPropertySimpleEditingCell *)self textField];
    int v14 = [v13 isEditing];

    if (!v14
      || v4
      && ([(CNPropertyDateEditingCell *)self currentCalendarIdentifier],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v4 isEqualToString:v15],
          v15,
          (v16 & 1) == 0))
    {
LABEL_6:
      v17 = [(CNPropertyEditingCell *)self valueString];
      id v18 = [(CNPropertySimpleEditingCell *)self valueView];
      objc_msgSend(v18, "setAb_text:", v17);
    }
    if ([(CNPropertyDateEditingCell *)self shouldEditDatesTextually])
    {
      v19 = [v21 placeholderString];
      v20 = [(CNPropertySimpleEditingCell *)self textField];
      [v20 setPlaceholder:v19];
    }
  }
}

- (BOOL)_shouldUseYearlessPickerForDateComponents:(id)a3
{
  return 1;
}

- (void)dateChanged:(id)a3
{
  id v21 = a3;
  id v4 = [(CNPropertyCell *)self propertyItem];
  uint64_t v5 = [v4 property];
  int v6 = [v5 isEqualToString:@"birthdays"];

  if (!v6) {
    goto LABEL_3;
  }
  BOOL v7 = [(CNPropertyCell *)self propertyItem];
  v8 = [v7 labeledValue];
  int v9 = [v8 label];
  int v10 = [v9 isEqualToString:@"_systemCalendar"];

  if (!v10)
  {
    v11 = [v21 date];
    char v12 = [v21 calendar];
    int v14 = [v21 calendar];
    v13 = +[CNUIDate componentsFromDate:v11 sourceCalendar:v12 destinationCalendar:v14];
  }
  else
  {
LABEL_3:
    v11 = [v21 date];
    char v12 = [v21 calendar];
    v13 = +[CNUIDate GMTComponentsFromDate:v11 sourceCalendar:v12];
  }

  v15 = [(CNPropertyCell *)self propertyItem];
  [v15 updateLabeledValueWithValue:v13];

  char v16 = [(CNPropertyCell *)self propertyItem];
  v17 = [v16 displayValue];
  id v18 = [(CNPropertySimpleEditingCell *)self textField];
  [v18 setText:v17];

  v19 = [(CNPropertyCell *)self delegate];
  v20 = [(CNPropertyCell *)self propertyItem];
  [v19 propertyCell:self didUpdateItem:v20 withNewValue:v13];
}

- (void)labelButtonClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNPropertyCell *)self propertyItem];
  int v6 = [v5 property];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1ADB0]];

  if (v7)
  {
    v21.receiver = self;
    v21.super_class = (Class)CNPropertyDateEditingCell;
    [(CNPropertyEditingCell *)&v21 labelButtonClicked:v4];
  }
  else
  {
    v8 = [(CNPropertyCell *)self propertyItem];
    int v9 = [v8 extendedLabels];
    unint64_t v10 = [v9 count];

    if (v10 >= 2)
    {
      v11 = [CNLabelPickerController alloc];
      char v12 = [(CNPropertyCell *)self propertyItem];
      id v13 = [(CNLabelPickerController *)v11 initForPropertyItem:v12];

      int v14 = CNContactsUIBundle();
      v15 = [v14 localizedStringForKey:@"SELECT_BIRTHDAY_CALENDAR_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
      [v13 setTitle:v15];

      [v13 setItemLocalizationBlock:&__block_literal_global_29578];
      char v16 = [(CNPropertyCell *)self propertyItem];
      v17 = [v16 labeledValue];
      id v18 = [v17 label];
      [v13 setSelectedItem:v18];

      [v13 setDelegate:self];
      [v13 setAllowsCustomItems:0];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v13];
      v20 = [(CNPropertyCell *)self presentingDelegate];
      [v20 sender:v4 presentViewController:v19];
    }
  }
}

id __48__CNPropertyDateEditingCell_labelButtonClicked___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (![v2 isEqualToString:@"_systemCalendar"])
    {
      int v9 = CNContactsUIBundle();
      v11 = [NSString stringWithFormat:@"BIRTHDAY_CALENDAR_LABEL_FORMAT-%@", v3];
      char v12 = [v9 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized"];

      goto LABEL_9;
    }
    id v4 = (void *)MEMORY[0x1E4F5A3A0];
    uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v6 = [v5 calendarIdentifier];
    char v7 = [v4 isGregorianDerivedCalendarIdentifier:v6];

    v8 = CNContactsUIBundle();
    int v9 = v8;
    if (v7) {
      unint64_t v10 = @"BIRTHDAY_CALENDAR_LABEL_DEFAULT";
    }
    else {
      unint64_t v10 = @"BIRTHDAY_CALENDAR_LABEL_GREGORIAN";
    }
  }
  else
  {
    v8 = CNContactsUIBundle();
    int v9 = v8;
    unint64_t v10 = @"BIRTHDAY_CALENDAR_LABEL_DEFAULT";
  }
  char v12 = [v8 localizedStringForKey:v10 value:&stru_1ED8AC728 table:@"Localized"];
LABEL_9:

  return v12;
}

- (void)localeUpdated:(id)a3
{
  id v9 = [(CNPropertyCell *)self propertyItem];
  id v4 = [(CNPropertyCell *)self propertyItem];
  uint64_t v5 = [v4 labeledValue];
  int v6 = [v5 value];
  char v7 = [v9 displayStringForValue:v6];
  v8 = [(CNPropertySimpleEditingCell *)self textField];
  [v8 setText:v7];
}

- (void)prepareForReuse
{
  datePicker = self->_datePicker;
  self->_datePicker = 0;

  datePickerContainerView = self->_datePickerContainerView;
  self->_datePickerContainerView = 0;

  contentViewController = self->_contentViewController;
  self->_contentViewController = 0;

  currentCalendarIdentifier = self->_currentCalendarIdentifier;
  self->_currentCalendarIdentifier = 0;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyDateEditingCell;
  [(CNPropertySimpleEditingCell *)&v7 prepareForReuse];
}

- (CNPropertyDateEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CNPropertyDateEditingCell;
  id v4 = [(CNPropertyEditingCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_localeUpdated_ name:@"_UIApplicationLocaleDidChange" object:0];

    if (!v4->_shouldEditDatesTextually)
    {
      int v6 = [(CNPropertySimpleEditingCell *)v4 textField];
      [v6 setClearButtonMode:0];

      objc_super v7 = [(CNPropertySimpleEditingCell *)v4 textField];
      [v7 setTextLoupeVisibility:1];

      v8 = [MEMORY[0x1E4FB1618] clearColor];
      id v9 = [(CNPropertySimpleEditingCell *)v4 textField];
      [v9 setInsertionPointColor:v8];
    }
    unint64_t v10 = [(CNPropertySimpleEditingCell *)v4 textField];
    [v10 setDelegate:v4];
  }
  return v4;
}

@end