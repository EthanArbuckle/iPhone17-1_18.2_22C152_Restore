@interface BuddyPasscodeField
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)isSecureTextEntry;
- (BuddyPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3;
- (BuddyPasscodeFieldDelegate)delegate;
- (NSArray)dotViews;
- (NSMutableString)value;
- (NSString)stringValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)keyboardType;
- (unint64_t)numberOfEntryFields;
- (void)_passcodeFieldTapped:(id)a3;
- (void)_updateDots;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDotViews:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNumberOfEntryFields:(unint64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BuddyPasscodeField

- (BuddyPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  SEL v15 = a2;
  unint64_t v14 = a3;
  id location = 0;
  v13.receiver = self;
  v13.super_class = (Class)BuddyPasscodeField;
  id location = -[BuddyPasscodeField initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    id v3 = objc_alloc_init((Class)NSMutableString);
    v4 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v3;

    *((void *)location + 3) = v14;
    *((unsigned char *)location + 8) = 1;
    id obj = objc_alloc_init((Class)NSMutableArray);
    for (unint64_t i = 0; i < v14; ++i)
    {
      v10 = objc_alloc_init(BuddyPasscodeFieldDot);
      [(BuddyPasscodeFieldDot *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      [obj addObject:v10];
      [location addArrangedSubview:v10];
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong((id *)location + 5, obj);
    [location setSpacing:28.0];
    [location setSemanticContentAttribute:3];
    [location setAccessibilityIdentifier:@"passcodeField"];
    id v5 = location;
    id v6 = objc_alloc((Class)UITapGestureRecognizer);
    id v7 = [v6 initWithTarget:location action:"_passcodeFieldTapped:"];
    [v5 addGestureRecognizer:v7];

    objc_storeStrong(&obj, 0);
  }
  v8 = (BuddyPasscodeField *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (NSString)stringValue
{
  v2 = [(BuddyPasscodeField *)self value];
  id v3 = [(NSMutableString *)v2 copy];

  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyPasscodeField *)v12 value];
  [(NSMutableString *)v3 setString:location[0]];

  [(BuddyPasscodeField *)v12 _updateDots];
  v4 = [(BuddyPasscodeField *)v12 value];
  id v5 = [(NSMutableString *)v4 length];
  id v6 = [(BuddyPasscodeField *)v12 numberOfEntryFields];

  if (v5 == v6)
  {
    id v7 = [(BuddyPasscodeField *)v12 delegate];
    v8 = v12;
    v9 = [(BuddyPasscodeField *)v12 value];
    id v10 = [(NSMutableString *)v9 copy];
    [(BuddyPasscodeFieldDelegate *)v7 passcodeField:v8 enteredPasscode:v10];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [(NSBundle *)v2 localizedStringForKey:@"PASSCODE" value:&stru_1002B4E18 table:@"Localizable"];

  return v3;
}

- (id)accessibilityValue
{
  v2 = +[NSBundle mainBundle];
  id v3 = [(NSBundle *)v2 localizedStringForKey:@"PASSCODE_VALUES" value:&stru_1002B4E18 table:@"Localizable"];
  v4 = [(BuddyPasscodeField *)self value];
  id v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, [(NSMutableString *)v4 length], [(BuddyPasscodeField *)self numberOfEntryFields]);

  return v5;
}

- (void)_passcodeFieldTapped:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyPasscodeField *)v4 becomeFirstResponder];
  objc_storeStrong(location, 0);
}

- (void)_updateDots
{
  id v10 = self;
  SEL v9 = a2;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v2 = i;
    if (v2 >= [(BuddyPasscodeField *)v10 numberOfEntryFields]) {
      break;
    }
    id v3 = [(BuddyPasscodeField *)v10 dotViews];
    id v7 = [(NSArray *)v3 objectAtIndex:i];

    unint64_t v4 = i;
    id v5 = [(BuddyPasscodeField *)v10 stringValue];
    BOOL v6 = v4 < [(NSString *)v5 length];
    [v7 setFilled:v6];

    objc_storeStrong(&v7, 0);
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return [(BuddyPasscodeField *)self isEnabled];
}

- (BOOL)becomeFirstResponder
{
  id v7 = self;
  SEL v6 = a2;
  char v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPasscodeField;
  char v5 = [(BuddyPasscodeField *)&v4 becomeFirstResponder];
  if (v5)
  {
    id v2 = +[UIKeyboard activeKeyboard];
    [v2 setReturnKeyEnabled:0];
  }
  return v5 & 1;
}

- (int64_t)keyboardType
{
  id v2 = +[UIDevice currentDevice];
  id v3 = [(UIDevice *)v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 11;
  }
  else {
    return 127;
  }
}

- (BOOL)hasText
{
  id v2 = [(BuddyPasscodeField *)self stringValue];
  BOOL v3 = [(NSString *)v2 length] != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v13 = 0;
  BOOL v3 = 1;
  if ([(BuddyPasscodeField *)v16 isEnabled])
  {
    unint64_t v14 = [(BuddyPasscodeField *)v16 stringValue];
    char v13 = 1;
    id v4 = [(NSString *)v14 length];
    BOOL v3 = v4 == (id)[(BuddyPasscodeField *)v16 numberOfEntryFields];
  }
  if (v13) {

  }
  if (!v3 && ([location[0] isEqualToString:@"\n"] & 1) == 0)
  {
    if ([location[0] length])
    {
      char v5 = [(BuddyPasscodeField *)v16 value];
      [(NSMutableString *)v5 appendString:location[0]];

      [(BuddyPasscodeField *)v16 _updateDots];
      SEL v6 = [(BuddyPasscodeField *)v16 stringValue];
      id v7 = [(NSString *)v6 length];
      id v8 = [(BuddyPasscodeField *)v16 numberOfEntryFields];

      if (v7 == v8)
      {
        SEL v9 = [(BuddyPasscodeField *)v16 delegate];
        id v10 = v16;
        v11 = [(BuddyPasscodeField *)v16 value];
        id v12 = [(NSMutableString *)v11 copy];
        [(BuddyPasscodeFieldDelegate *)v9 passcodeField:v10 enteredPasscode:v12];
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)deleteBackward
{
  id v2 = [(BuddyPasscodeField *)self stringValue];
  NSUInteger v3 = [(NSString *)v2 length];

  if (v3)
  {
    id v4 = [(BuddyPasscodeField *)self value];
    char v5 = [(BuddyPasscodeField *)self stringValue];
    id v7 = (char *)[(NSString *)v5 length] - 1;
    -[NSMutableString deleteCharactersInRange:](v4, "deleteCharactersInRange:", v7, 1, v7, 1);

    [(BuddyPasscodeField *)self _updateDots];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BuddyPasscodeFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BuddyPasscodeFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  self->_numberOfEntryFields = a3;
}

- (NSMutableString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (void)setDotViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end