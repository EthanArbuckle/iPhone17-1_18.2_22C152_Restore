@interface BYODTextFieldTableViewCell
- (BYODTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
@end

@implementation BYODTextFieldTableViewCell

- (BYODTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)BYODTextFieldTableViewCell;
  id v32 = a4;
  v5 = -[BYODTextFieldTableViewCell initWithStyle:reuseIdentifier:](&v34, "initWithStyle:reuseIdentifier:", a3);
  if (v5)
  {
    id v6 = objc_alloc_init((Class)UIStackView);
    [v6 setAxis:0];
    [v6 setAlignment:3];
    [v6 setDistribution:2];
    id v33 = objc_alloc_init((Class)UILabel);
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"BYOD_EMAIL_CREATE_LABEL" value:&stru_B9F70 table:@"AccountPreferences"];
    [v33 setText:v8];

    [v6 addArrangedSubview:v33];
    v9 = (UITextField *)objc_alloc_init((Class)UITextField);
    textField = v5->_textField;
    v5->_textField = v9;

    [(UITextField *)v5->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"BYOD_UPDATE_EMAIL_TEXT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
    [(UITextField *)v5->_textField setPlaceholder:v12];

    [(UITextField *)v5->_textField becomeFirstResponder];
    [v6 addArrangedSubview:v5->_textField];
    v13 = [(BYODTextFieldTableViewCell *)v5 contentView];
    [v13 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)v5->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = [v6 leadingAnchor];
    v28 = [(BYODTextFieldTableViewCell *)v5 contentView];
    v27 = [v28 leadingAnchor];
    v26 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", 20.0);
    v35[0] = v26;
    v30 = [v6 topAnchor];
    v25 = [(BYODTextFieldTableViewCell *)v5 contentView];
    v24 = [v25 topAnchor];
    v23 = objc_msgSend(v30, "constraintEqualToAnchor:");
    v35[1] = v23;
    v29 = [v6 trailingAnchor];
    v22 = [(BYODTextFieldTableViewCell *)v5 contentView];
    v14 = [v22 trailingAnchor];
    v15 = [v29 constraintEqualToAnchor:v14];
    v35[2] = v15;
    v16 = [v6 bottomAnchor];
    v17 = [(BYODTextFieldTableViewCell *)v5 contentView];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v35[3] = v19;
    v20 = +[NSArray arrayWithObjects:v35 count:4];
    +[NSLayoutConstraint activateConstraints:v20];
  }
  return v5;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
}

@end