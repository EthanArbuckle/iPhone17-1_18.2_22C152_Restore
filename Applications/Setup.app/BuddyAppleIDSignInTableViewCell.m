@interface BuddyAppleIDSignInTableViewCell
- (BuddyAppleIDSignInTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (id)editableTextField;
- (void)setTextField:(id)a3;
@end

@implementation BuddyAppleIDSignInTableViewCell

- (BuddyAppleIDSignInTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v32 = self;
  SEL v31 = a2;
  int64_t v30 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v32;
  id v32 = 0;
  v28.receiver = v4;
  v28.super_class = (Class)BuddyAppleIDSignInTableViewCell;
  v5 = [(BuddyAppleIDSignInTableViewCell *)&v28 initWithStyle:v30 reuseIdentifier:location];
  id v32 = v5;
  objc_storeStrong(&v32, v5);
  if (v5)
  {
    id v6 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v7 = (void *)*((void *)v32 + 1);
    *((void *)v32 + 1) = v6;

    [*((id *)v32 + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [v32 contentView];
    [v8 addSubview:*((void *)v32 + 1)];

    id v26 = [*((id *)v32 + 1) leadingAnchor];
    id v27 = [v32 contentView];
    id v25 = [v27 leadingAnchor];
    id v24 = [v26 constraintEqualToAnchor:14.0];
    v33[0] = v24;
    id v22 = [*((id *)v32 + 1) trailingAnchor];
    id v23 = [v32 contentView];
    id v21 = [v23 trailingAnchor];
    id v9 = [v22 constraintEqualToAnchor:-14.0];
    v33[1] = v9;
    id v10 = [*((id *)v32 + 1) heightAnchor];
    id v11 = [v32 contentView];
    id v12 = [v11 heightAnchor];
    id v13 = [v10 constraintEqualToAnchor:v12 constant:-30.0];
    v33[2] = v13;
    id v14 = [*((id *)v32 + 1) centerYAnchor];
    id v15 = [v32 contentView];
    id v16 = [v15 centerYAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16];
    v33[3] = v17;
    v18 = +[NSArray arrayWithObjects:v33 count:4];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  v19 = (BuddyAppleIDSignInTableViewCell *)v32;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v32, 0);
  return v19;
}

- (id)editableTextField
{
  return [(BuddyAppleIDSignInTableViewCell *)self textField];
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end