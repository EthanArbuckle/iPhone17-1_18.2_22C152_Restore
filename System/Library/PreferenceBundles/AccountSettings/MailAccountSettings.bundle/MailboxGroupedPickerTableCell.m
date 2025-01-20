@interface MailboxGroupedPickerTableCell
- (BOOL)isCellEnabled;
- (MailboxGroupedPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_mailboxTextFont;
- (id)nameForMailbox:(id)a3;
- (int)levelForMailbox:(id)a3;
- (void)_setText:(id)a3 image:(id)a4;
- (void)dealloc;
- (void)setCellEnabled:(BOOL)a3;
- (void)setCurrentMailbox:(BOOL)a3;
- (void)setMailbox:(id)a3;
- (void)setMailboxType:(int64_t)a3;
@end

@implementation MailboxGroupedPickerTableCell

- (MailboxGroupedPickerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MailboxGroupedPickerTableCell;
  v7 = [(MailboxGroupedPickerTableCell *)&v13 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_740CC;
    v11[3] = &unk_B9CA0;
    v9 = v7;
    v12 = v9;
    [(MailboxGroupedPickerTableCell *)v9 mf_updateContentConfigurationWithBlock:v11];
    [(MailboxGroupedPickerTableCell *)v9 setIndentationWidth:30.0];
  }
  return v8;
}

- (id)_mailboxTextFont
{
  if (+[UIScreen mui_isLargeFormatPad]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = 2;
  }
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:v2];
  v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (void)setMailboxType:(int64_t)a3
{
  v5 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    id v9 = 0;
  }
  else
  {
    v7 = preferencesBundle();
    id v9 = +[MFMailboxUid iconFromBundle:v7 forType:a3];
  }
  v8 = +[MFMailboxUid specialNameForType:a3];
  [(MailboxGroupedPickerTableCell *)self _setText:v8 image:v9];
}

- (void)_setText:(id)a3 image:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_74438;
  v8[3] = &unk_B9CC8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(MailboxGroupedPickerTableCell *)self mf_updateContentConfigurationWithBlock:v8];
}

- (id)nameForMailbox:(id)a3
{
  id v3 = a3;
  if ([v3 mailboxType] == (char *)&dword_4 + 3) {
    [v3 displayNameUsingSpecialNames];
  }
  else {
  v4 = [v3 displayName];
  }

  return v4;
}

- (void)setMailbox:(id)a3
{
  id v10 = a3;
  v4 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    id v6 = 0;
  }
  else
  {
    if ([v10 mailboxType] == &dword_8)
    {
      id v7 = [v10 account];
      v8 = +[NSSet setWithObject:v7];
      id v6 = +[MailAccount accountImageForAccounts:v8];
    }
    else
    {
      id v7 = preferencesBundle();
      id v6 = [v10 iconFromBundle:v7];
    }
  }
  id v9 = [(MailboxGroupedPickerTableCell *)self nameForMailbox:v10];
  [(MailboxGroupedPickerTableCell *)self _setText:v9 image:v6];

  [(MailboxGroupedPickerTableCell *)self setIndentationLevel:[(MailboxGroupedPickerTableCell *)self levelForMailbox:v10]];
}

- (int)levelForMailbox:(id)a3
{
  id v3 = a3;
  if ([v3 mailboxType]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 level];
  }

  return v4;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MailboxGroupedPickerTableCell;
  [(MailboxGroupedPickerTableCell *)&v4 dealloc];
}

- (BOOL)isCellEnabled
{
  return (*((unsigned char *)self + 8) & 1) == 0;
}

- (void)setCellEnabled:(BOOL)a3
{
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFE | !a3;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_74854;
  v3[3] = &unk_B9CE8;
  BOOL v4 = a3;
  [(MailboxGroupedPickerTableCell *)self mf_updateContentConfigurationWithBlock:v3];
}

- (void)setCurrentMailbox:(BOOL)a3
{
  if (!a3
    || (+[UIColor tableCellEligibleColor],
        (BOOL v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([(MailboxGroupedPickerTableCell *)self isCellEnabled]) {
      +[UIColor tableCellEligibleColor];
    }
    else {
    BOOL v4 = +[UIColor tableCellIneligibleColor];
    }
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_74A0C;
  v6[3] = &unk_B9CA0;
  id v7 = v4;
  id v5 = v4;
  [(MailboxGroupedPickerTableCell *)self mf_updateContentConfigurationWithBlock:v6];
}

@end