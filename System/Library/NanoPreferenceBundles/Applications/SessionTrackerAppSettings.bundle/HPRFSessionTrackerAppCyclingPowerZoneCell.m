@interface HPRFSessionTrackerAppCyclingPowerZoneCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPRFSessionTrackerAppCyclingPowerZoneCell

+ (int64_t)cellStyle
{
  return 1;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v21 = [v4 propertyForKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellEditableKey"];
  v5 = [v4 propertyForKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellTitleKey"];
  v6 = [v4 propertyForKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellDisplayRangeKey"];
  v7 = [v4 propertyForKey:@"HPRFSessionTrackerAppCyclingPowerZoneCellPercentageRangeKey"];

  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v24 = NSForegroundColorAttributeName;
  v9 = +[UIColor systemGrayColor];
  v25 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v11 = [v8 initWithString:v7 attributes:v10];

  id v12 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v22 = NSForegroundColorAttributeName;
  v13 = +[UIColor whiteColor];
  v23 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v15 = [v12 initWithString:v5 attributes:v14];

  id v16 = [objc_alloc((Class)NSAttributedString) initWithString:@"  "];
  [v15 appendAttributedString:v16];

  [v15 appendAttributedString:v11];
  v17 = [(HPRFSessionTrackerAppCyclingPowerZoneCell *)self titleLabel];
  [v17 setAttributedText:v15];

  v18 = [(HPRFSessionTrackerAppCyclingPowerZoneCell *)self valueLabel];
  [v18 setText:v6];

  v19 = +[UIColor whiteColor];
  v20 = [(HPRFSessionTrackerAppCyclingPowerZoneCell *)self valueLabel];
  [v20 setTextColor:v19];

  if ([v21 BOOLValue]) {
    [(HPRFSessionTrackerAppCyclingPowerZoneCell *)self setAccessoryType:1];
  }
  -[HPRFSessionTrackerAppCyclingPowerZoneCell setCellEnabled:](self, "setCellEnabled:", [v21 BOOLValue]);
}

- (BOOL)canReload
{
  return 1;
}

@end