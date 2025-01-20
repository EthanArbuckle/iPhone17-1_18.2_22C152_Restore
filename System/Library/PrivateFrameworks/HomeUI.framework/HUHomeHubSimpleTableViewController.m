@interface HUHomeHubSimpleTableViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUHomeHubSimpleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 descriptionStringWithFormatKey:(id)a5;
- (NSString)descriptionStringWithFormatKey;
- (void)loadView;
- (void)setDescriptionStringWithFormatKey:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
@end

@implementation HUHomeHubSimpleTableViewController

- (HUHomeHubSimpleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 descriptionStringWithFormatKey:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HUHomeHubSimpleTableViewController;
  result = [(HUItemTableViewController *)&v7 initWithItemManager:a3 tableViewStyle:a4];
  if (result) {
    result->_descriptionStringWithFormatKey = (NSString *)a5;
  }
  return result;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)HUHomeHubSimpleTableViewController;
  [(HUHomeHubSimpleTableViewController *)&v4 loadView];
  v3 = [(HUHomeHubSimpleTableViewController *)self tableView];
  [v3 setAllowsSelection:0];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v30 = a4;
  objc_super v7 = (void *)MEMORY[0x1E4F42B58];
  id v8 = a3;
  v9 = [v7 cellConfiguration];
  v10 = [v30 latestResults];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v9 setText:v11];

  v12 = [v9 textProperties];
  [v12 setAlignment:4];

  v13 = [v30 latestResults];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68990]];

  v15 = [(HUHomeHubSimpleTableViewController *)self descriptionStringWithFormatKey];
  if (v15)
  {
    v16 = [(HUHomeHubSimpleTableViewController *)self descriptionStringWithFormatKey];
    v23 = HULocalizedStringWithFormat(v16, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
  }
  else
  {
    v23 = _HULocalizedStringWithDefaultValue(v14, v14, 1);
  }

  if ([v14 length]) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  [v9 setSecondaryText:v24];
  v25 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v26 = [v9 secondaryTextProperties];
  [v26 setColor:v25];

  v27 = [v30 latestResults];
  v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
  [v9 setImage:v28];

  [v8 setContentConfiguration:v9];
  v29 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v29];
}

- (NSString)descriptionStringWithFormatKey
{
  return self->_descriptionStringWithFormatKey;
}

- (void)setDescriptionStringWithFormatKey:(id)a3
{
  self->_descriptionStringWithFormatKey = (NSString *)a3;
}

@end