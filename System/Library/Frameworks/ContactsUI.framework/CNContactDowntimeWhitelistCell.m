@interface CNContactDowntimeWhitelistCell
+ (BOOL)shouldIndentWhileEditing;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CNContactDowntimeWhitelistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation CNContactDowntimeWhitelistCell

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (CNContactDowntimeWhitelistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CNContactDowntimeWhitelistCell;
  v4 = [(CNContactCell *)&v14 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CNContactDowntimeWhitelistCell *)v4 textLabel];
    [v6 setNumberOfLines:4];

    v7 = CNContactsUIBundle();
    v8 = [v7 localizedStringForKey:@"DOWNTIME_WARNING" value:&stru_1ED8AC728 table:@"Localized"];
    v9 = [(CNContactDowntimeWhitelistCell *)v5 textLabel];
    [v9 setText:v8];

    v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v11 = [(CNContactDowntimeWhitelistCell *)v5 textLabel];
    [v11 setFont:v10];

    v12 = v5;
  }

  return v5;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end