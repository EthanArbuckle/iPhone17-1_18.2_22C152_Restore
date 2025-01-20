@interface FBADiffableTableViewCell
- (NSString)itemIdentifier;
- (void)configureForTeam:(id)a3 disclosesMoreTeams:(BOOL)a4;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBADiffableTableViewCell

- (void)configureForTeam:(id)a3 disclosesMoreTeams:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  v7 = [(FBADiffableTableViewCell *)self textLabel];
  [v7 setFont:v6];

  v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v9 = [(FBADiffableTableViewCell *)self detailTextLabel];
  [v9 setFont:v8];

  if (v21)
  {
    v10 = [v21 name];
    v11 = [(FBADiffableTableViewCell *)self textLabel];
    [v11 setText:v10];

    v12 = [v21 typeString];
    v13 = [(FBADiffableTableViewCell *)self detailTextLabel];
    [v13 setText:v12];
  }
  else
  {
    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_1000F6658 table:0];
    v16 = [(FBADiffableTableViewCell *)self textLabel];
    [v16 setText:v15];

    v17 = [(FBADiffableTableViewCell *)self detailTextLabel];
    [v17 setText:0];

    [(FBADiffableTableViewCell *)self setAccessoryType:0];
  }
  BOOL v18 = v4;
  if (v4) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [(FBADiffableTableViewCell *)self setAccessoryType:v18];
  [(FBADiffableTableViewCell *)self setSelectionStyle:v19];
  v20 = [(FBADiffableTableViewCell *)self textLabel];
  NSLog(@"%@", v20);
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end