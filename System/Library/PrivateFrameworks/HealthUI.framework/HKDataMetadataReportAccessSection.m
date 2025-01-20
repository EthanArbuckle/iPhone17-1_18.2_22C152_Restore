@interface HKDataMetadataReportAccessSection
- (HKDataMetadataReportAccessSection)initWithSample:(id)a3 healthStore:(id)a4 delegate:(id)a5;
- (UIViewController)accessViewController;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (unint64_t)numberOfRowsInSection;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
@end

@implementation HKDataMetadataReportAccessSection

- (HKDataMetadataReportAccessSection)initWithSample:(id)a3 healthStore:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKDataMetadataReportAccessSection;
  v11 = [(HKDataMetadataReportAccessSection *)&v17 init];
  if (!v11)
  {
LABEL_6:
    v13 = v11;
    goto LABEL_7;
  }
  int v12 = [v8 hasAssociatedReport];
  v13 = 0;
  if (v9 && v10 && v12)
  {
    uint64_t v14 = [v10 accessViewControllerForSample:v8 healthStore:v9];
    accessViewController = v11->_accessViewController;
    v11->_accessViewController = (UIViewController *)v14;

    if (!v11->_accessViewController)
    {
      v13 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  v4 = [a4 dequeueReusableCellWithIdentifier:@"access"];
  if (!v4) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"access"];
  }
  [v4 setAccessoryType:1];
  v5 = [v4 textLabel];
  v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = [v6 localizedStringForKey:@"SHARE_DATA_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v5 setText:v7];

  id v8 = [v4 textLabel];
  id v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [v8 setFont:v9];

  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
}

- (UIViewController)accessViewController
{
  return self->_accessViewController;
}

- (void).cxx_destruct
{
}

@end