@interface TTRIListSummaryCell
+ (id)specifierWithViewModel:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9;
+ (int64_t)cellStyle;
- (TTRIListSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation TTRIListSummaryCell

+ (id)specifierWithViewModel:(id)a3 target:(id)a4 cell:(int64_t)a5 detail:(Class)a6 keyName:(id)a7 defaultValue:(id)a8 scope:(unint64_t)a9
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a4;
  v18 = [v14 name];
  v19 = +[REMSettingsUtilities standardPreferenceSpecifierNamed:v18 target:v17 cell:a5 detail:a6 keyName:v16 defaultValue:v15 scope:a9];

  [v19 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  v20 = [v14 subtitle];
  if ([v20 length])
  {
    v21 = [v14 subtitle];
    [v19 setObject:v21 forKeyedSubscript:@"TTRIListSummarySubtitle"];
  }

  return v19;
}

+ (int64_t)cellStyle
{
  return 3;
}

- (TTRIListSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TTRIListSummaryCell;
  v9 = [(TTRIListSummaryCell *)&v13 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    v10 = [v8 objectForKeyedSubscript:@"TTRIListSummarySubtitle"];
    v11 = [(TTRIListSummaryCell *)v9 detailTextLabel];
    [v11 setText:v10];
  }
  return v9;
}

@end