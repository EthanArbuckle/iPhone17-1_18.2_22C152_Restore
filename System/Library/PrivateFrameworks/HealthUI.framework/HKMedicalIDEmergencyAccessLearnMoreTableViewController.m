@interface HKMedicalIDEmergencyAccessLearnMoreTableViewController
- (HKMedicalIDEmergencyAccessLearnMoreTableViewController)init;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapDone:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKMedicalIDEmergencyAccessLearnMoreTableViewController

- (HKMedicalIDEmergencyAccessLearnMoreTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreTableViewController;
  return [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)&v3 initWithStyle:2];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HKMedicalIDEmergencyAccessLearnMoreTableViewController;
  [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)&v10 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v4 = [v3 localizedStringForKey:@"emergency_access_learn_more_navigation_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)self setTitle:v4];

  v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v6 = [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)self view];
  [v6 setBackgroundColor:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone_];
  v8 = [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(HKMedicalIDEmergencyAccessLearnMoreTableViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"LearnMoreCell"];
}

- (void)didTapDone:(id)a3
{
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 90.0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(LearnMoreItem);
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"emergency_access_learn_more_share_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(LearnMoreItem *)v7 setTitle:v9];

  objc_super v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"emergency_access_learn_more_share_body" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(LearnMoreItem *)v7 setBody:v11];

  v12 = objc_alloc_init(LearnMoreItem);
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"emergency_access_learn_more_privacy_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(LearnMoreItem *)v12 setTitle:v14];

  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"emergency_access_learn_more_privacy_body" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(LearnMoreItem *)v12 setBody:v16];

  v17 = [v6 dequeueReusableCellWithIdentifier:@"LearnMoreCell" forIndexPath:v5];

  v20[0] = v7;
  v20[1] = v12;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v17 setItems:v18];

  return v17;
}

@end