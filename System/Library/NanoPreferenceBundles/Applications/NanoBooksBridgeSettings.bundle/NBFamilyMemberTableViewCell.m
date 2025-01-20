@interface NBFamilyMemberTableViewCell
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation NBFamilyMemberTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NBFamilyMemberTableViewCell;
  id v4 = a3;
  [(NBFamilyMemberTableViewCell *)&v13 refreshCellContentsWithSpecifier:v4];
  objc_opt_class();
  v5 = [v4 propertyForKey:@"NBUISpecifierAudiobookCountKey"];

  v6 = BUDynamicCast();

  v7 = NBBundle();
  v8 = [v7 localizedStringForKey:@"No Audiobooks" value:&stru_20DD8 table:&stru_20DD8];

  if ([v6 unsignedIntegerValue] == (char *)&dword_0 + 1)
  {
    v9 = NBBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"1 Audiobook" value:&stru_20DD8 table:&stru_20DD8];
LABEL_5:

    v8 = (void *)v10;
    goto LABEL_6;
  }
  if ((unint64_t)[v6 unsignedIntegerValue] >= 2)
  {
    v9 = NBBundle();
    uint64_t v11 = [v9 localizedStringForKey:@"%ld Audiobooks" value:&stru_20DD8 table:&stru_20DD8];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, [v6 unsignedIntegerValue]);

    v8 = (void *)v11;
    goto LABEL_5;
  }
LABEL_6:
  v12 = [(NBFamilyMemberTableViewCell *)self detailTextLabel];
  [v12 setText:v8];
}

@end