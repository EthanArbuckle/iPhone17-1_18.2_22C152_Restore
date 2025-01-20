@interface HKHealthHeadphoneLevelSection
- (BOOL)shouldHideHeader;
- (UIViewController)parentViewController;
- (id)cellForRow:(unint64_t)a3 table:(id)a4;
- (unint64_t)numberOfRows;
- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5;
- (void)setParentViewController:(id)a3;
- (void)setShouldHideHeader:(BOOL)a3;
@end

@implementation HKHealthHeadphoneLevelSection

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  id v4 = [a4 dequeueReusableCellWithIdentifier:@"HKHealthHeadphonesLevelCellIdentifier"];
  if (!v4) {
    id v4 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"HKHealthHeadphonesLevelCellIdentifier"];
  }
  [v4 setAccessoryType:1];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"HEADPHONE_AUDIO_LEVELS" value:&stru_8350 table:0];
  v7 = [v4 textLabel];
  [v7 setText:v6];

  v8 = +[UIFont hk_preferredFontForTextStyle:UIFontTextStyleBody];
  v9 = [v4 textLabel];
  [v9 setFont:v8];

  v10 = HKUIJoinStringsForAutomationIdentifier();
  [v4 setAccessibilityIdentifier:v10];

  return v4;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  v6 = (void (**)(id, uint64_t, uint64_t))a5;
  v10 = objc_alloc_init(HKHealthPrivacyHeadphoneLevelsViewController);
  v7 = [(HKHealthHeadphoneLevelSection *)self delegate];
  v8 = [v7 parentController];

  if (v8)
  {
    v9 = [(HKHealthHeadphoneLevelSection *)self delegate];
    [v9 showController:v10 animate:1];
  }
  else
  {
    v9 = [(HKHealthHeadphoneLevelSection *)self parentViewController];
    [v9 showViewController:v10 sender:0];
  }

  v6[2](v6, 1, 1);
}

- (BOOL)shouldHideHeader
{
  return self->_shouldHideHeader;
}

- (void)setShouldHideHeader:(BOOL)a3
{
  self->_shouldHideHeader = a3;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end