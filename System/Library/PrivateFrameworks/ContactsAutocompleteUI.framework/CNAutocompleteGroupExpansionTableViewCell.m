@interface CNAutocompleteGroupExpansionTableViewCell
+ (id)identifier;
- (BOOL)canCollapseRecipient;
- (BOOL)canExpandRecipient;
- (CNAutocompleteGroupExpansionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3;
@end

@implementation CNAutocompleteGroupExpansionTableViewCell

+ (id)identifier
{
  return @"CNAutocompleteGroupExpansionTableViewCell";
}

- (CNAutocompleteGroupExpansionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteGroupExpansionTableViewCell;
  v4 = [(CNComposeRecipientTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(CNComposeTableViewCell *)v4 titleLabel];
    [v6 setNumberOfLines:0];

    v7 = [(CNComposeTableViewCell *)v5 detailLabel];
    [v7 setNumberOfLines:0];
  }
  return v5;
}

- (BOOL)canCollapseRecipient
{
  return 1;
}

- (BOOL)canExpandRecipient
{
  return 0;
}

- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3
{
  double leading = a3.leading;
  BOOL v5 = +[CNAutocompleteResultsTableViewController avatarsAreHidden];
  double result = 0.0;
  if (!v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNAutocompleteGroupExpansionTableViewCell;
    objc_msgSend(-[CNAutocompleteGroupExpansionTableViewCell class](&v8, sel_class, 0.0), "additionalSeparatorInset");
    return leading + v7;
  }
  return result;
}

@end