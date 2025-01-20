@interface BuddySimplePasscodeInputView
- (BOOL)limitCharactersToNumbers;
- (BuddyPasscodeField)passcodeField;
- (BuddySimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4;
- (id)passcode;
- (id)passcodeDisplayView;
- (void)passcodeField:(id)a3 enteredPasscode:(id)a4;
- (void)setLimitCharactersToNumbers:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeField:(id)a3;
@end

@implementation BuddySimplePasscodeInputView

- (BuddySimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  CGRect v26 = a3;
  SEL v24 = a2;
  unint64_t v23 = a4;
  id location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddySimplePasscodeInputView;
  id location = -[BuddySimplePasscodeInputView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v4 = [BuddyPasscodeField alloc];
    v5 = [(BuddyPasscodeField *)v4 initWithNumberOfEntryFields:v23];
    v6 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v5;

    [*((id *)location + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 3) setDelegate:location];
    [location addSubview:*((void *)location + 3)];
    id v21 = [*((id *)location + 3) leadingAnchor];
    id v20 = [location leadingAnchor];
    id v19 = [v21 constraintEqualToAnchor:];
    v27[0] = v19;
    id v7 = [*((id *)location + 3) trailingAnchor];
    id v8 = [location trailingAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8];
    v27[1] = v9;
    id v10 = [*((id *)location + 3) topAnchor];
    id v11 = [location topAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    v27[2] = v12;
    id v13 = [*((id *)location + 3) bottomAnchor];
    id v14 = [location bottomAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  v17 = (BuddySimplePasscodeInputView *)location;
  objc_storeStrong(&location, 0);
  return v17;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddySimplePasscodeInputView *)v5 passcodeField];
  [(BuddyPasscodeField *)v3 setStringValue:location[0]];

  objc_storeStrong(location, 0);
}

- (id)passcode
{
  v2 = [(BuddySimplePasscodeInputView *)self passcodeField];
  v3 = [(BuddyPasscodeField *)v2 stringValue];

  return v3;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = [(BuddyPasscodeInputView *)v12 delegate];
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v9 = [(BuddyPasscodeInputView *)v12 delegate];
    char v8 = 1;
    char v6 = objc_opt_respondsToSelector();
  }
  if (v8) {

  }
  if (v6)
  {
    id v7 = [(BuddyPasscodeInputView *)v12 delegate];
    [(BuddyPasscodeInputViewDelegate *)v7 passcodeInput:v12 enteredPasscode:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)limitCharactersToNumbers
{
  return self->_limitCharactersToNumbers;
}

- (void)setLimitCharactersToNumbers:(BOOL)a3
{
  self->_limitCharactersToNumbers = a3;
}

- (BuddyPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end