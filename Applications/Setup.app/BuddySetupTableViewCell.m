@interface BuddySetupTableViewCell
- (BuddySetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BuddySetupTableViewCell

- (BuddySetupTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v13;
  id v13 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)BuddySetupTableViewCell;
  id v13 = [(BuddySetupTableViewCell *)&v9 initWithStyle:v11 reuseIdentifier:location];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    id v5 = +[BFFStyle sharedStyle];
    [v5 applyThemeToTableCell:v13];

    id v6 = [v13 textLabel];
    [v6 setNumberOfLines:0];
  }
  v7 = (BuddySetupTableViewCell *)v13;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v7;
}

@end