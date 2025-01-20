@interface AXBuddySettingsTitleItem
- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4;
- (void)registerCellClassWithTableView:(id)a3;
@end

@implementation AXBuddySettingsTitleItem

- (id)representativeCellForIndexPath:(id)a3 inTableView:(id)a4
{
  return [a4 dequeueReusableCellWithIdentifier:@"TitleCellReuseIdentifier" forIndexPath:a3];
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"TitleCellReuseIdentifier"];
}

@end