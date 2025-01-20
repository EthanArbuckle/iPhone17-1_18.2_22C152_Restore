@interface HPRFMindSubtitleCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPRFMindSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  id v20 = [v4 propertyForKey:@"HPRFMindSubtitleCellReminderSpecifierKey"];
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setTimeStyle:1];
  v6 = +[NSCalendar currentCalendar];
  v7 = +[NSDate date];
  v8 = [v6 startOfDayForDate:v7];

  v9 = +[NSCalendar currentCalendar];
  v10 = [v20 customDateComponents];
  v11 = [v9 dateByAddingComponents:v10 toDate:v8 options:0];

  v12 = [v5 stringFromDate:v11];
  v13 = [(HPRFMindSubtitleCell *)self titleLabel];
  [v13 setText:v12];

  v14 = +[UIColor whiteColor];
  v15 = [(HPRFMindSubtitleCell *)self titleLabel];
  [v15 setTextColor:v14];

  v16 = [v4 propertyForKey:@"HPRFMindSubtitleCellSubtitleSpecifierKey"];

  v17 = [(HPRFMindSubtitleCell *)self detailTextLabel];
  [v17 setText:v16];

  v18 = +[UIColor systemGrayColor];
  v19 = [(HPRFMindSubtitleCell *)self detailTextLabel];
  [v19 setTextColor:v18];

  [(HPRFMindSubtitleCell *)self setAccessoryType:1];
}

- (BOOL)canReload
{
  return 1;
}

@end