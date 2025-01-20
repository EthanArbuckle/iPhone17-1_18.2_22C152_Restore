@interface WDClinicalSettingsViewAnalyticsDataViewControllerFileCell
- (NSURL)fileURL;
- (WDClinicalSettingsViewAnalyticsDataViewControllerFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)description;
- (void)setFileURL:(id)a3;
@end

@implementation WDClinicalSettingsViewAnalyticsDataViewControllerFileCell

- (WDClinicalSettingsViewAnalyticsDataViewControllerFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalSettingsViewAnalyticsDataViewControllerFileCell;
  v4 = [(WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *)v4 setAccessoryType:1];
  }
  return v5;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
  id v5 = a3;
  id v7 = [v5 lastPathComponent];

  v6 = [(WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *)self textLabel];
  [v6 setText:v7];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WDClinicalSettingsViewAnalyticsDataViewControllerFileCell *)self fileURL];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
}

@end