@interface WDStoredDataCategoryTableViewCell
- (HKDisplayCategory)category;
- (HKDisplayType)displayType;
- (void)setCategory:(id)a3;
- (void)setDisplayType:(id)a3;
@end

@implementation WDStoredDataCategoryTableViewCell

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
  id v5 = a3;
  id v8 = [v5 localization];

  v6 = [v8 displayName];
  v7 = [(WDStoredDataCategoryTableViewCell *)self textLabel];
  [v7 setText:v6];
}

- (HKDisplayCategory)category
{
  return (HKDisplayCategory *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCategory:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end