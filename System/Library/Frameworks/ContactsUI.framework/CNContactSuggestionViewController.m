@interface CNContactSuggestionViewController
+ (id)viewControllerWithDataSource:(id)a3;
- (BOOL)shouldShowAddRejectActions;
- (BOOL)shouldShowPreview;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CNContactSuggestionViewControllerDataSource)dataSource;
- (CNPropertyCell)propertyCell;
- (CNPropertySuggestionAction)action;
- (NSLayoutConstraint)addToContactLeadingMargin;
- (NSLayoutConstraint)addToContactTrailingMargin;
- (NSLayoutConstraint)dateTrailingMargin;
- (NSLayoutConstraint)fromLeadingMargin;
- (NSLayoutConstraint)ignoreLeadingMargin;
- (NSLayoutConstraint)ignoreTrailingMargin;
- (UIButton)addToContactButton;
- (UIButton)ignoreButton;
- (UILabel)contentLabel;
- (UILabel)dateLabel;
- (UILabel)subjectLabel;
- (UILabel)withLabel;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)alertMessageForIgnoreContactDetail;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleForIgnoreContactDetail;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addToContact:(id)a3;
- (void)ignore:(id)a3;
- (void)setAction:(id)a3;
- (void)setAddToContactButton:(id)a3;
- (void)setAddToContactLeadingMargin:(id)a3;
- (void)setAddToContactTrailingMargin:(id)a3;
- (void)setContentLabel:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDateTrailingMargin:(id)a3;
- (void)setFromLeadingMargin:(id)a3;
- (void)setIgnoreButton:(id)a3;
- (void)setIgnoreLeadingMargin:(id)a3;
- (void)setIgnoreTrailingMargin:(id)a3;
- (void)setPropertyCell:(id)a3;
- (void)setSubjectLabel:(id)a3;
- (void)setWithLabel:(id)a3;
- (void)showSource:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updatePreview;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNContactSuggestionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTrailingMargin, 0);
  objc_storeStrong((id *)&self->_fromLeadingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreTrailingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreLeadingMargin, 0);
  objc_storeStrong((id *)&self->_addToContactTrailingMargin, 0);
  objc_storeStrong((id *)&self->_addToContactLeadingMargin, 0);
  objc_storeStrong((id *)&self->_ignoreButton, 0);
  objc_storeStrong((id *)&self->_addToContactButton, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_withLabel, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_propertyCell, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setDateTrailingMargin:(id)a3
{
}

- (NSLayoutConstraint)dateTrailingMargin
{
  return self->_dateTrailingMargin;
}

- (void)setFromLeadingMargin:(id)a3
{
}

- (NSLayoutConstraint)fromLeadingMargin
{
  return self->_fromLeadingMargin;
}

- (void)setIgnoreTrailingMargin:(id)a3
{
}

- (NSLayoutConstraint)ignoreTrailingMargin
{
  return self->_ignoreTrailingMargin;
}

- (void)setIgnoreLeadingMargin:(id)a3
{
}

- (NSLayoutConstraint)ignoreLeadingMargin
{
  return self->_ignoreLeadingMargin;
}

- (void)setAddToContactTrailingMargin:(id)a3
{
}

- (NSLayoutConstraint)addToContactTrailingMargin
{
  return self->_addToContactTrailingMargin;
}

- (void)setAddToContactLeadingMargin:(id)a3
{
}

- (NSLayoutConstraint)addToContactLeadingMargin
{
  return self->_addToContactLeadingMargin;
}

- (void)setIgnoreButton:(id)a3
{
}

- (UIButton)ignoreButton
{
  return self->_ignoreButton;
}

- (void)setAddToContactButton:(id)a3
{
}

- (UIButton)addToContactButton
{
  return self->_addToContactButton;
}

- (void)setContentLabel:(id)a3
{
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setSubjectLabel:(id)a3
{
}

- (UILabel)subjectLabel
{
  return self->_subjectLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setWithLabel:(id)a3
{
}

- (UILabel)withLabel
{
  return self->_withLabel;
}

- (void)setDataSource:(id)a3
{
}

- (CNContactSuggestionViewControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setPropertyCell:(id)a3
{
}

- (CNPropertyCell)propertyCell
{
  return self->_propertyCell;
}

- (CNPropertySuggestionAction)action
{
  return self->_action;
}

- (id)alertMessageForIgnoreContactDetail
{
  v3 = CNContactsUIBundle();
  v4 = [v3 localizedStringForKey:@"SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL" value:&stru_1ED8AC728 table:@"Localized"];

  v5 = [(CNContactSuggestionViewController *)self propertyCell];
  v6 = [v5 propertyItem];
  v7 = [v6 group];
  v8 = [v7 property];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v9)
  {
    v10 = CNContactsUIBundle();
    v11 = v10;
    v12 = @"SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_PHONE";
  }
  else
  {
    v13 = [(CNContactSuggestionViewController *)self propertyCell];
    v14 = [v13 propertyItem];
    v15 = [v14 group];
    v16 = [v15 property];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1ADC8]];

    if (v17)
    {
      v10 = CNContactsUIBundle();
      v11 = v10;
      v12 = @"SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_EMAIL";
    }
    else
    {
      v18 = [(CNContactSuggestionViewController *)self propertyCell];
      v19 = [v18 propertyItem];
      v20 = [v19 group];
      v21 = [v20 property];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1AF10]];

      if (v22)
      {
        v10 = CNContactsUIBundle();
        v11 = v10;
        v12 = @"SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_ADDRESS";
      }
      else
      {
        v23 = [(CNContactSuggestionViewController *)self propertyCell];
        v24 = [v23 propertyItem];
        v25 = [v24 group];
        v26 = [v25 property];
        int v27 = [v26 isEqualToString:@"birthdays"];

        if (!v27) {
          goto LABEL_10;
        }
        v10 = CNContactsUIBundle();
        v11 = v10;
        v12 = @"SUGGESTION_IGNORE_ALERT_CONTROLLER_INFO_DETAIL_BIRTHDAY";
      }
    }
  }
  uint64_t v28 = [v10 localizedStringForKey:v12 value:&stru_1ED8AC728 table:@"Localized"];

  v4 = (void *)v28;
LABEL_10:

  return v4;
}

- (id)titleForIgnoreContactDetail
{
  v3 = CNContactsUIBundle();
  v4 = [v3 localizedStringForKey:@"SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_DETAIL" value:&stru_1ED8AC728 table:@"Localized"];

  v5 = [(CNContactSuggestionViewController *)self propertyCell];
  v6 = [v5 propertyItem];
  v7 = [v6 group];
  v8 = [v7 property];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v9)
  {
    v10 = CNContactsUIBundle();
    v11 = v10;
    v12 = @"SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_PHONE";
  }
  else
  {
    v13 = [(CNContactSuggestionViewController *)self propertyCell];
    v14 = [v13 propertyItem];
    v15 = [v14 group];
    v16 = [v15 property];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1ADC8]];

    if (v17)
    {
      v10 = CNContactsUIBundle();
      v11 = v10;
      v12 = @"SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_EMAIL";
    }
    else
    {
      v18 = [(CNContactSuggestionViewController *)self propertyCell];
      v19 = [v18 propertyItem];
      v20 = [v19 group];
      v21 = [v20 property];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F1AF10]];

      if (v22)
      {
        v10 = CNContactsUIBundle();
        v11 = v10;
        v12 = @"SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_ADDRESS";
      }
      else
      {
        v23 = [(CNContactSuggestionViewController *)self propertyCell];
        v24 = [v23 propertyItem];
        v25 = [v24 group];
        v26 = [v25 property];
        int v27 = [v26 isEqualToString:@"birthdays"];

        if (!v27) {
          goto LABEL_10;
        }
        v10 = CNContactsUIBundle();
        v11 = v10;
        v12 = @"SUGGESTION_IGNORE_CONTACT_DETAIL_BUTTON_BIRTHDAY";
      }
    }
  }
  uint64_t v28 = [v10 localizedStringForKey:v12 value:&stru_1ED8AC728 table:@"Localized"];

  v4 = (void *)v28;
LABEL_10:

  return v4;
}

- (void)showSource:(id)a3
{
  id v3 = [(CNContactSuggestionViewController *)self action];
  [v3 setSelectedChoice:3];
}

- (void)ignore:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CNContactSuggestionViewController *)self titleForIgnoreContactDetail];
  v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  v7 = [(CNContactSuggestionViewController *)self alertMessageForIgnoreContactDetail];
  [v6 setMessage:v7];

  v8 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __44__CNContactSuggestionViewController_ignore___block_invoke;
  int v17 = &unk_1E5499870;
  objc_copyWeak(&v18, &location);
  int v9 = [v8 actionWithTitle:v5 style:2 handler:&v14];
  objc_msgSend(v6, "addAction:", v9, v14, v15, v16, v17);

  v10 = (void *)MEMORY[0x1E4FB1410];
  v11 = CNContactsUIBundle();
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v13 = [v10 actionWithTitle:v12 style:1 handler:0];
  [v6 addAction:v13];

  [(CNContactSuggestionViewController *)self presentViewController:v6 animated:1 completion:0];
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

void __44__CNContactSuggestionViewController_ignore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained action];
  [v1 setSelectedChoice:2];
}

- (void)addToContact:(id)a3
{
  id v3 = [(CNContactSuggestionViewController *)self action];
  [v3 setSelectedChoice:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactSuggestionViewController;
  [(CNContactSuggestionViewController *)&v4 viewDidDisappear:a3];
  if (([(CNContactSuggestionViewController *)self isBeingDismissed] & 1) != 0
    || [(CNContactSuggestionViewController *)self isMovingFromParentViewController])
  {
    [(CNContactSuggestionViewController *)self setAction:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 section] || objc_msgSend(v6, "row"))
  {
    if ([v6 section] != 1) {
      goto LABEL_7;
    }
    v7 = [(CNContactSuggestionViewController *)self dataSource];
    v8 = [v7 url];

    if (v8) {
      [(id)*MEMORY[0x1E4FB2608] openURL:v8 withCompletionHandler:0];
    }
  }
  else
  {
    v8 = [v9 cellForRowAtIndexPath:v6];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 shouldPerformDefaultAction]) {
      [v8 performDefaultAction];
    }
  }

LABEL_7:
  [v9 deselectRowAtIndexPath:v6 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v27 = a4;
  id v7 = a5;
  if ([v7 section] || objc_msgSend(v7, "row") != 1)
  {
    if ([v7 section] || objc_msgSend(v7, "row") != 2)
    {
      if ([v7 section] != 1) {
        goto LABEL_10;
      }
      [v27 setPreservesSuperviewLayoutMargins:0];
      v21 = [(CNContactSuggestionViewController *)self propertyCell];
      [v21 layoutMargins];
      double v23 = v22;
      v24 = [(CNContactSuggestionViewController *)self fromLeadingMargin];
      [v24 setConstant:v23];

      v12 = [(CNContactSuggestionViewController *)self propertyCell];
      [v12 layoutMargins];
      double v14 = v25;
      uint64_t v15 = [(CNContactSuggestionViewController *)self dateTrailingMargin];
    }
    else
    {
      v16 = [(CNContactSuggestionViewController *)self propertyCell];
      [v16 layoutMargins];
      double v18 = v17;
      v19 = [(CNContactSuggestionViewController *)self ignoreLeadingMargin];
      [v19 setConstant:v18];

      v12 = [(CNContactSuggestionViewController *)self propertyCell];
      [v12 layoutMargins];
      double v14 = v20;
      uint64_t v15 = [(CNContactSuggestionViewController *)self ignoreTrailingMargin];
    }
  }
  else
  {
    v8 = [(CNContactSuggestionViewController *)self propertyCell];
    [v8 layoutMargins];
    double v10 = v9;
    v11 = [(CNContactSuggestionViewController *)self addToContactLeadingMargin];
    [v11 setConstant:v10];

    v12 = [(CNContactSuggestionViewController *)self propertyCell];
    [v12 layoutMargins];
    double v14 = v13;
    uint64_t v15 = [(CNContactSuggestionViewController *)self addToContactTrailingMargin];
  }
  v26 = v15;
  [v15 setConstant:v14];

LABEL_10:
  objc_msgSend(v27, "_cnui_applyContactStyle");
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = a4;
  BOOL v5 = ![v4 section] && !objc_msgSend(v4, "row") || objc_msgSend(v4, "section") == 1;

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 section] || objc_msgSend(v7, "row")) && objc_msgSend(v7, "section") != 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)CNContactSuggestionViewController;
    [(CNContactSuggestionViewController *)&v11 tableView:v6 heightForRowAtIndexPath:v7];
    double v8 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2F28];
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] || objc_msgSend(v7, "row"))
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactSuggestionViewController;
    double v8 = [(CNContactSuggestionViewController *)&v10 tableView:v6 cellForRowAtIndexPath:v7];
    if ([v7 section] == 1) {
      [(CNContactSuggestionViewController *)self updatePreview];
    }
    [(UITableViewCell *)v8 _cnui_applyContactStyle];
  }
  else
  {
    double v8 = self->_propertyCell;
  }

  return v8;
}

- (BOOL)shouldShowAddRejectActions
{
  id v3 = [(CNContactSuggestionViewController *)self action];
  id v4 = [v3 propertyItem];
  BOOL v5 = [v4 contact];
  if ([v5 isSuggested])
  {
    id v6 = [(CNContactSuggestionViewController *)self action];
    id v7 = [v6 propertyItem];
    double v8 = [v7 contact];
    char v9 = [v8 isSuggestedMe];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  if ([(CNContactSuggestionViewController *)self shouldShowAddRejectActions]) {
    return 3;
  }
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(CNContactSuggestionViewController *)self shouldShowPreview]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  id v6 = [(CNContactSuggestionViewController *)self dataSource];
  id v7 = [v6 appName];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

  if ((v5 & 1) == 0)
  {
    char v9 = NSString;
    objc_super v10 = CNContactsUIBundle();
    objc_super v11 = [v10 localizedStringForKey:@"SUGGESTION_RELATED_INFO_FROM_APP" value:&stru_1ED8AC728 table:@"Localized"];
    v12 = [(CNContactSuggestionViewController *)self dataSource];
    double v13 = [v12 appName];
    double v8 = objc_msgSend(v9, "stringWithFormat:", v11, v13);
  }
  else
  {
LABEL_3:
    double v8 = 0;
  }

  return v8;
}

- (void)updatePreview
{
  id v3 = [(CNContactSuggestionViewController *)self dataSource];
  uint64_t v4 = [v3 formattedSnippet];
  uint64_t v5 = [(CNContactSuggestionViewController *)self contentLabel];
  [v5 setAttributedText:v4];

  id v6 = [(CNContactSuggestionViewController *)self dataSource];
  id v7 = [v6 title];
  double v8 = [(CNContactSuggestionViewController *)self subjectLabel];
  [v8 setText:v7];

  char v9 = [(CNContactSuggestionViewController *)self dataSource];
  objc_super v10 = [v9 date];
  objc_super v11 = [(CNContactSuggestionViewController *)self dateLabel];
  [v11 setText:v10];

  id v14 = [(CNContactSuggestionViewController *)self dataSource];
  v12 = [v14 with];
  double v13 = [(CNContactSuggestionViewController *)self withLabel];
  [v13 setText:v12];
}

- (BOOL)shouldShowPreview
{
  id v3 = [(CNContactSuggestionViewController *)self dataSource];
  uint64_t v4 = [v3 type];

  if (v4 == 5)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F5A298];
    id v7 = [(CNContactSuggestionViewController *)self dataSource];
    double v8 = [v7 formattedSnippet];
    char v9 = [v8 string];
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v9))
    {
      objc_super v10 = [(CNContactSuggestionViewController *)self dataSource];
      objc_super v11 = [v10 title];
      if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v11))
      {
        v12 = [(CNContactSuggestionViewController *)self dataSource];
        double v13 = [v12 date];
        if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v13))
        {
          v16 = [(CNContactSuggestionViewController *)self dataSource];
          [v16 with];
          v14 = double v17 = v12;
          int v5 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v14) ^ 1;

          v12 = v17;
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setAction:(id)a3
{
  int v5 = (CNPropertySuggestionAction *)a3;
  if (self->_action != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    uint64_t v6 = [(CNContactSuggestionViewController *)self tableView];
    [v6 reloadData];

    int v5 = v7;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewController;
  [(CNContactSuggestionViewController *)&v10 viewWillAppear:a3];
  uint64_t v4 = [(CNContactSuggestionViewController *)self addToContactButton];
  int v5 = [v4 titleLabel];
  uint64_t v6 = [v5 tintColorOverride];
  id v7 = [(CNContactSuggestionViewController *)self addToContactButton];
  [v7 setTintColor:v6];

  double v8 = [(CNContactSuggestionViewController *)self ignoreButton];
  char v9 = [(CNContactSuggestionViewController *)self titleForIgnoreContactDetail];
  [v8 setTitle:v9 forState:0];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)CNContactSuggestionViewController;
  [(CNContactSuggestionViewController *)&v29 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v3 _scaledValueForValue:44.0];
  double v5 = v4;
  uint64_t v6 = [(CNContactSuggestionViewController *)self tableView];
  [v6 setEstimatedRowHeight:v5];

  id v7 = CNContactsUIBundle();
  double v8 = [v7 localizedStringForKey:@"SUGGESTION_REVIEW_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  char v9 = [(CNContactSuggestionViewController *)self navigationItem];
  [v9 setTitle:v8];

  objc_super v10 = [(CNContactSuggestionViewController *)self contentLabel];
  objc_super v11 = [v10 text];
  if ([v11 isNaturallyRTL]) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  double v13 = [(CNContactSuggestionViewController *)self contentLabel];
  [v13 setTextAlignment:v12];

  id v14 = [(CNContactSuggestionViewController *)self tableView];
  objc_msgSend(v14, "_cnui_applyContactStyle");

  uint64_t v15 = [(CNContactSuggestionViewController *)self withLabel];
  objc_msgSend(v15, "_cnui_applyContactStyle");

  v16 = +[CNContactStyle currentStyle];
  double v17 = [v16 textColor];
  double v18 = [(CNContactSuggestionViewController *)self withLabel];
  [v18 setTextColor:v17];

  v19 = +[CNContactStyle currentStyle];
  double v20 = [v19 suggestedValueTextColor];
  v21 = [(CNContactSuggestionViewController *)self dateLabel];
  [v21 setTextColor:v20];

  double v22 = +[CNContactStyle currentStyle];
  double v23 = [v22 suggestedValueTextColor];
  v24 = [(CNContactSuggestionViewController *)self subjectLabel];
  [v24 setTextColor:v23];

  double v25 = +[CNContactStyle currentStyle];
  v26 = [v25 suggestedValueTextColor];
  id v27 = [(CNContactSuggestionViewController *)self contentLabel];
  [v27 setTextColor:v26];

  uint64_t v28 = [(CNContactSuggestionViewController *)self navigationItem];
  [v28 setLargeTitleDisplayMode:2];
}

+ (id)viewControllerWithDataSource:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB1CB0];
  id v4 = a3;
  double v5 = CNContactsUIBundle();
  uint64_t v6 = [v3 storyboardWithName:@"Suggestion" bundle:v5];
  id v7 = [v6 instantiateInitialViewController];

  [v7 setDataSource:v4];

  return v7;
}

@end