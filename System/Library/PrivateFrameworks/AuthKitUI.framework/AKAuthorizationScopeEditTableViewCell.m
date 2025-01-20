@interface AKAuthorizationScopeEditTableViewCell
- (AKAuthorizationScopeEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)detailTextField;
- (void)_setup;
- (void)_setupDetailTextField;
@end

@implementation AKAuthorizationScopeEditTableViewCell

- (AKAuthorizationScopeEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeEditTableViewCell;
  v4 = [(AKAuthorizationScopeEditTableViewCell *)&v7 initWithStyle:2 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(AKAuthorizationScopeEditTableViewCell *)v4 _setup];
  }
  return v5;
}

- (void)_setup
{
  v3 = +[AKAuthorizationAppearance editScopeRowBackgroundColor];
  [(AKAuthorizationScopeEditTableViewCell *)self setBackgroundColor:v3];

  [(AKAuthorizationScopeEditTableViewCell *)self setSelectionStyle:1];
  [(AKAuthorizationScopeEditTableViewCell *)self setAccessoryType:0];
  v4 = +[AKAuthorizationAppearance editScopeInfoLabelTextColor];
  v5 = [(AKAuthorizationScopeEditTableViewCell *)self textLabel];
  [v5 setTextColor:v4];

  v6 = +[AKAuthorizationAppearance editScopeInfoLabelFont];
  objc_super v7 = [(AKAuthorizationScopeEditTableViewCell *)self textLabel];
  [v7 setFont:v6];

  v8 = [(AKAuthorizationScopeEditTableViewCell *)self textLabel];
  [v8 setAdjustsFontSizeToFitWidth:1];

  [(AKAuthorizationScopeEditTableViewCell *)self _setupDetailTextField];
}

- (void)_setupDetailTextField
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v3 = (UITextField *)objc_alloc_init(MEMORY[0x1E4F42F10]);
  detailTextField = self->_detailTextField;
  self->_detailTextField = v3;

  [(UITextField *)self->_detailTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_detailTextField setAutocorrectionType:1];
  [(UITextField *)self->_detailTextField setReturnKeyType:4];
  v5 = +[AKAuthorizationAppearance editScopeInputFieldFont];
  [(UITextField *)self->_detailTextField setFont:v5];

  v6 = +[AKAuthorizationAppearance editScopeInputFieldTextColor];
  [(UITextField *)self->_detailTextField setTextColor:v6];

  objc_super v7 = [(AKAuthorizationScopeEditTableViewCell *)self detailTextLabel];
  [v7 setHidden:1];

  v8 = [(AKAuthorizationScopeEditTableViewCell *)self contentView];
  v9 = [(AKAuthorizationScopeEditTableViewCell *)self detailTextField];
  [v8 addSubview:v9];

  v23 = (void *)MEMORY[0x1E4F28DC8];
  v29 = [(AKAuthorizationScopeEditTableViewCell *)self contentView];
  v28 = [v29 heightAnchor];
  +[AKAuthorizationPaneMetrics nameCellHeight];
  v27 = objc_msgSend(v28, "constraintEqualToConstant:");
  v30[0] = v27;
  v26 = [(AKAuthorizationScopeEditTableViewCell *)self detailTextField];
  v24 = [v26 leadingAnchor];
  v25 = [(AKAuthorizationScopeEditTableViewCell *)self textLabel];
  v22 = [v25 trailingAnchor];
  +[AKAuthorizationSubPaneMetrics editInfoLabelToInputFieldSpacing];
  v21 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v22);
  v30[1] = v21;
  v20 = [(AKAuthorizationScopeEditTableViewCell *)self detailTextField];
  v10 = [v20 trailingAnchor];
  v11 = [(AKAuthorizationScopeEditTableViewCell *)self contentView];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v30[2] = v13;
  v14 = [(AKAuthorizationScopeEditTableViewCell *)self detailTextField];
  v15 = [v14 centerYAnchor];
  v16 = [(AKAuthorizationScopeEditTableViewCell *)self contentView];
  v17 = [v16 centerYAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v30[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v23 activateConstraints:v19];
}

- (UITextField)detailTextField
{
  return self->_detailTextField;
}

- (void).cxx_destruct
{
}

@end