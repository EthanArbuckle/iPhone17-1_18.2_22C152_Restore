@interface CNLimitedAccessSelectedContactsCell
+ (id)reuseIdentifier;
- (CNContactFormatter)formatter;
- (CNLimitedAccessSelectedContactsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setFormatter:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CNLimitedAccessSelectedContactsCell

- (void).cxx_destruct
{
}

- (void)setFormatter:(id)a3
{
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  [(CNLimitedAccessSelectedContactsCell *)&v4 setSelected:a3 animated:a4];
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  [(CNLimitedAccessSelectedContactsCell *)&v2 awakeFromNib];
}

- (CNLimitedAccessSelectedContactsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CNLimitedAccessSelectedContactsCell;
  objc_super v4 = [(CNLimitedAccessSelectedContactsCell *)&v14 initWithStyle:1 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(CNLimitedAccessSelectedContactsCell *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    [(CNLimitedAccessSelectedContactsCell *)v4 setFormatter:v6];

    v7 = [(CNLimitedAccessSelectedContactsCell *)v4 formatter];
    [v7 setEmphasizesPrimaryNameComponent:1];

    v8 = [(CNLimitedAccessSelectedContactsCell *)v4 formatter];
    [v8 setIgnoresNickname:1];

    v9 = [(CNLimitedAccessSelectedContactsCell *)v4 formatter];
    [v9 setIgnoresOrganization:1];

    v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v11 = [(CNLimitedAccessSelectedContactsCell *)v4 textLabel];
    [v11 setFont:v10];

    v12 = v4;
  }

  return v4;
}

+ (id)reuseIdentifier
{
  return @"CNLimitedAccessSelectedContactsCellIdentifier";
}

@end