@interface TSSIMUnlockDetailView
- (BOOL)unlocking;
- (CGRect)_calculateEntryViewFrame;
- (NSString)lockedSIMName;
- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4;
- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4 lockedSIMName:(id)a5;
- (TSSIMUnlockEntryView)entryView;
- (double)_descriptionLabelHeightForWidth:(double)a3;
- (double)_titleLabelHeightForWidth:(double)a3;
- (int64_t)actionSubtype;
- (int64_t)actionType;
- (void)_configureDescriptionLabelText;
- (void)_configureTitleLabelText;
- (void)_keyboardWillShow:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setUnlocking:(BOOL)a3;
@end

@implementation TSSIMUnlockDetailView

- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4 lockedSIMName:(id)a5
{
  id v8 = a5;
  v9 = [(TSSIMUnlockDetailView *)self initWithActionType:a3 actionSubtype:a4];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    lockedSIMName = v9->_lockedSIMName;
    v9->_lockedSIMName = v10;

    [(TSSIMUnlockDetailView *)v9 _configureTitleLabelText];
  }

  return v9;
}

- (TSSIMUnlockDetailView)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  v30.receiver = self;
  v30.super_class = (Class)TSSIMUnlockDetailView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[TSSIMUnlockDetailView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    v9->_actionType = a3;
    v9->_actionSubtype = a4;
    v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v11;

    v13 = v10->_titleLabel;
    v14 = sub_100004438();
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v10->_titleLabel setTextAlignment:1];
    [(UILabel *)v10->_titleLabel setNumberOfLines:0];
    [(TSSIMUnlockDetailView *)v10 _configureTitleLabelText];
    [(TSSIMUnlockDetailView *)v10 addSubview:v10->_titleLabel];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, 0, width, height)];
    descriptionLabel = v10->_descriptionLabel;
    v10->_descriptionLabel = v15;

    [(UILabel *)v10->_descriptionLabel setTextAlignment:1];
    v17 = v10->_descriptionLabel;
    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v10->_descriptionLabel setNumberOfLines:0];
    [(TSSIMUnlockDetailView *)v10 _configureDescriptionLabelText];
    [(TSSIMUnlockDetailView *)v10 addSubview:v10->_descriptionLabel];
    v19 = +[UIColor systemBackgroundColor];
    [(TSSIMUnlockDetailView *)v10 setBackgroundColor:v19];

    if ((v10->_actionType & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v20 = [[TSSIMUnlockEntryView alloc] initWithActionType:v10->_actionType actionSubtype:v10->_actionSubtype];
      entryView = v10->_entryView;
      v10->_entryView = v20;

      [(TSSIMUnlockDetailView *)v10 addSubview:v10->_entryView];
      v22 = +[UIPeripheralHost activeInstance];
      unsigned int v23 = [v22 isOnScreen];

      if (v23)
      {
        +[UIPeripheralHost visiblePeripheralFrame];
        v10->_keyboardFrame.origin.x = v24;
        v10->_keyboardFrame.origin.double y = v25;
        v10->_keyboardFrame.size.double width = v26;
        v10->_keyboardFrame.size.double height = v27;
      }
      v28 = +[NSNotificationCenter defaultCenter];
      [v28 addObserver:v10 selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
    }
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockDetailView;
  [(TSSIMUnlockDetailView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)TSSIMUnlockDetailView;
  [(TSSIMUnlockDetailView *)&v27 layoutSubviews];
  v3 = sub_100010734();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[TSSIMUnlockDetailView layoutSubviews]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, " @%s", buf, 0xCu);
  }

  [(TSSIMUnlockDetailView *)self bounds];
  double Width = CGRectGetWidth(v30);
  -[TSSIMUnlockDetailView _titleLabelHeightForWidth:](self, "_titleLabelHeightForWidth:");
  double v6 = v5;
  v31.origin.x = 0.0;
  v31.origin.double y = 0.0;
  v31.size.double width = Width;
  v31.size.double height = v6;
  double MaxY = CGRectGetMaxY(v31);
  double v8 = sub_1000044BC();
  double v10 = v9 + 0.0;
  double v11 = v8 + 0.0;
  double v13 = Width - (v9 + v12);
  double v15 = v6 - (v8 + v14);
  [(TSSIMUnlockDetailView *)self _descriptionLabelHeightForWidth:Width];
  double v17 = v16;
  v32.origin.x = 0.0;
  v32.origin.double y = MaxY;
  v32.size.double width = Width;
  v32.size.double height = v17;
  CGRectGetMaxY(v32);
  double v18 = sub_1000044D0();
  double v20 = v19 + 0.0;
  double v21 = MaxY + v18;
  double v23 = Width - (v19 + v22);
  double v25 = v17 - (v18 + v24);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v10, v11, v13, v15);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", v20, v21, v23, v25);
  entryView = self->_entryView;
  [(TSSIMUnlockDetailView *)self _calculateEntryViewFrame];
  -[TSSIMUnlockEntryView setFrame:](entryView, "setFrame:");
}

- (void)setUnlocking:(BOOL)a3
{
  if (self->_unlocking != a3)
  {
    BOOL v3 = a3;
    self->_unlocking = a3;
    double v5 = [(TSSIMUnlockDetailView *)self entryView];
    [v5 setUnlocking:v3];

    [(TSSIMUnlockDetailView *)self _configureTitleLabelText];
    [(TSSIMUnlockDetailView *)self _configureDescriptionLabelText];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  double v6 = [v5 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v6 CGRectValue];
  self->_keyboardFrame.origin.x = v7;
  self->_keyboardFrame.origin.double y = v8;
  self->_keyboardFrame.size.double width = v9;
  self->_keyboardFrame.size.double height = v10;

  [(TSSIMUnlockEntryView *)self->_entryView frame];
  if (!CGRectIsEmpty(v27))
  {
    double v11 = [v5 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
    uint64_t v12 = (void)[v11 unsignedIntegerValue] << 16;

    double v13 = [v5 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    [v13 doubleValue];
    double v15 = v14;

    [(TSSIMUnlockDetailView *)self _calculateEntryViewFrame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000EE1C;
    v24[3] = &unk_100020900;
    objc_copyWeak(v25, &location);
    v25[1] = v17;
    v25[2] = v19;
    v25[3] = v21;
    v25[4] = v23;
    +[UIView animateWithDuration:v12 delay:v24 options:0 animations:v15 completion:0.0];
    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
}

- (void)_configureTitleLabelText
{
  if (self->_unlocking)
  {
    BOOL v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"SIM_UNLOCKING_TITLE";
LABEL_3:
    id v10 = [v3 localizedStringForKey:v5 value:&stru_100020AC8 table:@"Localizable"];
  }
  else
  {
    switch(self->_actionType)
    {
      case 0:
      case 1:
        goto LABEL_5;
      case 2:
        if (self->_lockedSIMName)
        {
          double v6 = +[NSBundle mainBundle];
          id v4 = v6;
          CFStringRef v7 = @"PIN_LOCKED_TITLE_FORMAT";
          goto LABEL_22;
        }
        BOOL v3 = +[NSBundle mainBundle];
        id v4 = v3;
        CFStringRef v5 = @"PIN_LOCKED_TITLE";
        goto LABEL_3;
      case 3:
        int64_t actionSubtype = self->_actionSubtype;
        switch(actionSubtype)
        {
          case 3:
LABEL_5:
            if ([(NSString *)self->_lockedSIMName length])
            {
              double v6 = +[NSBundle mainBundle];
              id v4 = v6;
              CFStringRef v7 = @"ENTER_NEW_PIN_2_TITLE_FORMAT";
              goto LABEL_22;
            }
            BOOL v3 = +[NSBundle mainBundle];
            id v4 = v3;
            CFStringRef v5 = @"ENTER_NEW_PIN_2_TITLE";
            break;
          case 2:
            if ([(NSString *)self->_lockedSIMName length])
            {
              double v6 = +[NSBundle mainBundle];
              id v4 = v6;
              CFStringRef v7 = @"ENTER_NEW_PIN_1_TITLE_FORMAT";
              goto LABEL_22;
            }
            BOOL v3 = +[NSBundle mainBundle];
            id v4 = v3;
            CFStringRef v5 = @"ENTER_NEW_PIN_1_TITLE";
            break;
          case 1:
            if ([(NSString *)self->_lockedSIMName length])
            {
              double v6 = +[NSBundle mainBundle];
              id v4 = v6;
              CFStringRef v7 = @"PUK_LOCKED_TITLE_FORMAT";
              goto LABEL_22;
            }
            BOOL v3 = +[NSBundle mainBundle];
            id v4 = v3;
            CFStringRef v5 = @"PUK_LOCKED_TITLE";
            break;
          default:
LABEL_14:
            id v10 = 0;
            [(UILabel *)self->_titleLabel setText:0];
            goto LABEL_24;
        }
        goto LABEL_3;
      case 4:
        if (![(NSString *)self->_lockedSIMName length])
        {
          BOOL v3 = +[NSBundle mainBundle];
          id v4 = v3;
          CFStringRef v5 = @"PERMANENTLY_LOCKED_TITLE";
          goto LABEL_3;
        }
        double v6 = +[NSBundle mainBundle];
        id v4 = v6;
        CFStringRef v7 = @"PERMANENTLY_LOCKED_TITLE_FORMAT";
LABEL_22:
        CGFloat v9 = [v6 localizedStringForKey:v7 value:&stru_100020AC8 table:@"Localizable"];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, self->_lockedSIMName);
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_14;
    }
  }

  [(UILabel *)self->_titleLabel setText:v10];
LABEL_24:
  [(TSSIMUnlockDetailView *)self setNeedsDisplay];
}

- (void)_configureDescriptionLabelText
{
  if (self->_unlocking) {
    goto LABEL_2;
  }
  int64_t actionType = self->_actionType;
  if (actionType == 4)
  {
    CFStringRef v5 = +[NSBundle mainBundle];
    double v6 = v5;
    CFStringRef v7 = @"PERMANENTLY_LOCKED_DESCRIPTION";
  }
  else
  {
    if (actionType != 3 || self->_actionSubtype != 1)
    {
LABEL_2:
      id v3 = 0;
      goto LABEL_3;
    }
    CFStringRef v5 = +[NSBundle mainBundle];
    double v6 = v5;
    CFStringRef v7 = @"PUK_LOCKED_DESCRIPTION";
  }
  id v9 = [v5 localizedStringForKey:v7 value:&stru_100020AC8 table:@"Localizable"];

  id v3 = v9;
LABEL_3:
  id v8 = v3;
  [(UILabel *)self->_descriptionLabel setText:v3];
  [(TSSIMUnlockDetailView *)self setNeedsDisplay];
}

- (CGRect)_calculateEntryViewFrame
{
  -[TSSIMUnlockDetailView convertRect:fromView:](self, "convertRect:fromView:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TSSIMUnlockDetailView *)self bounds];
  v25.origin.x = v11;
  v25.origin.double y = v12;
  v25.size.double width = v13;
  v25.size.double height = v14;
  v21.origin.x = v4;
  v21.origin.double y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  CGRect v22 = CGRectIntersection(v21, v25);
  CGRectGetHeight(v22);
  [(UILabel *)self->_descriptionLabel frame];
  CGRectGetHeight(v23);
  entryView = self->_entryView;
  [(TSSIMUnlockDetailView *)self size];
  -[TSSIMUnlockEntryView sizeThatFits:](entryView, "sizeThatFits:");
  [(TSSIMUnlockDetailView *)self bounds];
  UIRectInset();

  UIRectCenteredYInRect();
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.x = v16;
  return result;
}

- (double)_titleLabelHeightForWidth:(double)a3
{
  double v5 = [(UILabel *)self->_titleLabel text];
  id v6 = [v5 length];

  if (!v6) {
    return 0.0;
  }
  double v7 = sub_1000044BC();
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (double)_descriptionLabelHeightForWidth:(double)a3
{
  double v5 = [(UILabel *)self->_descriptionLabel text];
  id v6 = [v5 length];

  if (!v6) {
    return 0.0;
  }
  double v7 = sub_1000044D0();
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (BOOL)unlocking
{
  return self->_unlocking;
}

- (TSSIMUnlockEntryView)entryView
{
  return self->_entryView;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (NSString)lockedSIMName
{
  return self->_lockedSIMName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedSIMName, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end