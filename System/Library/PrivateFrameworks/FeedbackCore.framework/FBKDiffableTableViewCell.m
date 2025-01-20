@interface FBKDiffableTableViewCell
- (NSString)itemIdentifier;
- (void)configureForTeam:(id)a3 disclosesMoreTeams:(BOOL)a4;
- (void)setItemIdentifier:(id)a3;
@end

@implementation FBKDiffableTableViewCell

- (void)configureForTeam:(id)a3 disclosesMoreTeams:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v7 = [(FBKDiffableTableViewCell *)self textLabel];
  [v7 setFont:v6];

  v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v9 = [(FBKDiffableTableViewCell *)self detailTextLabel];
  [v9 setFont:v8];

  if (v21)
  {
    v10 = [v21 name];
    v11 = [(FBKDiffableTableViewCell *)self textLabel];
    [v11 setText:v10];

    v12 = [v21 typeString];
    v13 = [(FBKDiffableTableViewCell *)self detailTextLabel];
    [v13 setText:v12];
  }
  else
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"LOADING_ELLIPSES" value:&stru_26DDF6A30 table:0];
    v16 = [(FBKDiffableTableViewCell *)self textLabel];
    [v16 setText:v15];

    v17 = [(FBKDiffableTableViewCell *)self detailTextLabel];
    [v17 setText:0];

    [(FBKDiffableTableViewCell *)self setAccessoryType:0];
  }
  BOOL v18 = v4;
  if (v4) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [(FBKDiffableTableViewCell *)self setAccessoryType:v18];
  [(FBKDiffableTableViewCell *)self setSelectionStyle:v19];
  v20 = [(FBKDiffableTableViewCell *)self textLabel];
  NSLog(&stru_26DDF9590.isa, v20);
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