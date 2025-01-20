@interface WDClinicalSettingsViewAnalyticsDataCell
- (Class)viewControllerClass;
- (WDClinicalSettingsViewAnalyticsDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setViewControllerClass:(Class)a3;
@end

@implementation WDClinicalSettingsViewAnalyticsDataCell

- (WDClinicalSettingsViewAnalyticsDataCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalSettingsViewAnalyticsDataCell;
  v4 = [(WDClinicalSettingsViewAnalyticsDataCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDClinicalSettingsViewAnalyticsDataCell *)v4 setAccessoryType:1];
  }
  return v5;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (void)setViewControllerClass:(Class)a3
{
}

- (void).cxx_destruct
{
}

@end