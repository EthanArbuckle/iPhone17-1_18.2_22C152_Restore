@interface HangsDataControllerViewController
- (HangsDataControllerViewController)init;
- (NSArray)cachedEntries;
- (NSArray)cachedSpecifiers;
- (NSDateFormatter)dateFormatter;
- (NSMeasurementFormatter)durationFormatter;
- (id)entries;
- (id)getHangEventDuration;
- (id)getHangEventProcessCreationDate;
- (id)getHangEventProcessName;
- (id)makeSpecifierForHangsDataEntry:(id)a3;
- (id)specifierNameForEntry:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)setCachedEntries:(id)a3;
- (void)setCachedSpecifiers:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)shareAllEntries:(id)a3;
- (void)shareEntry:(id)a3 forRowAtIndexPath:(id)a4;
- (void)updateRightBarButtonItems;
- (void)viewDidLoad;
@end

@implementation HangsDataControllerViewController

- (HangsDataControllerViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)HangsDataControllerViewController;
  v2 = [(HangsDataControllerViewController *)&v9 init];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    [(NSDateFormatter *)v2->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)v2->_dateFormatter setTimeStyle:1];
    v5 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v5;

    [(NSMeasurementFormatter *)v2->_durationFormatter setUnitStyle:1];
    [(NSMeasurementFormatter *)v2->_durationFormatter setUnitOptions:1];
    id v7 = objc_alloc_init((Class)NSNumberFormatter);
    [v7 setNumberStyle:0];
    [v7 setMaximumFractionDigits:0];
    [(NSMeasurementFormatter *)v2->_durationFormatter setNumberFormatter:v7];
  }
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  [(HangsDataControllerViewController *)self setCachedEntries:0];
  [(HangsDataControllerViewController *)self setCachedSpecifiers:0];
  v5.receiver = self;
  v5.super_class = (Class)HangsDataControllerViewController;
  [(HangsDataControllerViewController *)&v5 setSpecifier:v4];

  [(HangsDataControllerViewController *)self reloadSpecifiers];
  [(HangsDataControllerViewController *)self updateRightBarButtonItems];
}

- (id)entries
{
  if (!self->_cachedEntries)
  {
    v3 = [(HangsDataControllerViewController *)self specifier];
    id v4 = [v3 objectForKeyedSubscript:@"HangsDataControllerHangData"];

    if (v4)
    {
      objc_super v5 = [(HangsDataControllerViewController *)self specifier];
      v6 = [v5 objectForKeyedSubscript:@"HangsDataControllerHangData"];
      id v7 = +[HTHangsDataEntry sortedEntriesByFileType:v6];
    }
    else
    {
      id v7 = &__NSArray0__struct;
    }
    [(HangsDataControllerViewController *)self setCachedEntries:v7];
  }

  return [(HangsDataControllerViewController *)self cachedEntries];
}

- (id)getHangEventProcessName
{
  v2 = [(HangsDataControllerViewController *)self entries];
  v3 = [v2 firstObject];
  id v4 = [v3 displayName];

  return v4;
}

- (id)getHangEventDuration
{
  id v3 = objc_alloc((Class)NSMeasurement);
  id v4 = [(HangsDataControllerViewController *)self entries];
  objc_super v5 = [v4 firstObject];
  [v5 duration];
  double v7 = v6;
  v8 = +[NSUnitDuration milliseconds];
  id v9 = [v3 initWithDoubleValue:v8 unit:v7];

  v10 = [(HangsDataControllerViewController *)self durationFormatter];
  v11 = [v10 stringFromMeasurement:v9];

  return v11;
}

- (id)getHangEventProcessCreationDate
{
  id v3 = [(HangsDataControllerViewController *)self entries];
  id v4 = [v3 firstObject];
  objc_super v5 = [v4 creationDate];

  if (v5)
  {
    double v6 = [(HangsDataControllerViewController *)self dateFormatter];
    double v7 = [v6 stringFromDate:v5];
  }
  else
  {
    double v7 = &stru_35910;
  }

  return v7;
}

- (id)specifiers
{
  id v3 = [(HangsDataControllerViewController *)self cachedSpecifiers];

  if (!v3)
  {
    id v4 = +[NSMutableArray array];
    objc_super v5 = [(HangsDataControllerViewController *)self entries];
    double v6 = [v5 firstObject];
    if (v6)
    {
      double v7 = HTUIDurationLabel();
      v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"getHangEventDuration" detail:0 cell:4 edit:0];

      uint64_t v9 = PSUseModernLayoutKey;
      [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSUseModernLayoutKey];
      [v6 duration];
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setObject:v10 forKeyedSubscript:@"HangsDataControllerDuration"];

      v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 durationLevel]);
      [v8 setObject:v11 forKeyedSubscript:@"HangsDataControllerDurationLevel"];

      [v8 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
      [v4 addObject:v8];
      v12 = HTUITimestampLabel();
      v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"getHangEventProcessCreationDate" detail:0 cell:4 edit:0];

      [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
      [v4 addObject:v13];
    }
    v14 = HTUILogsSectionTitle();
    v15 = +[PSSpecifier groupSpecifierWithName:v14];

    [v4 addObject:v15];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v5;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(HangsDataControllerViewController *)self makeSpecifierForHangsDataEntry:*(void *)(*((void *)&v27 + 1) + 8 * (void)v20)];
          [v4 addObject:v21];

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    [(HangsDataControllerViewController *)self setCachedSpecifiers:v4];
  }
  uint64_t v22 = OBJC_IVAR___PSListController__specifiers;
  v23 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v23)
  {
    uint64_t v24 = [(HangsDataControllerViewController *)self cachedSpecifiers];
    v25 = *(void **)&self->PSListController_opaque[v22];
    *(void *)&self->PSListController_opaque[v22] = v24;

    v23 = *(void **)&self->PSListController_opaque[v22];
  }

  return v23;
}

- (id)makeSpecifierForHangsDataEntry:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HangsDataControllerViewController *)self specifierNameForEntry:v4];
  uint64_t v6 = objc_opt_class();
  [v4 isLogFile];
  double v7 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:v6 cell:2 edit:objc_opt_class()];

  v8 = [v4 path];
  [v7 setObject:v8 forKeyedSubscript:@"file-path"];

  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 fileSize]);
  [v7 setObject:v9 forKeyedSubscript:@"HangsDataControllerFileSize"];

  v10 = [v4 hangID];
  [v7 setObject:v10 forKeyedSubscript:@"HangsDataControllerHangEvent"];

  [v7 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];

  return v7;
}

- (id)specifierNameForEntry:(id)a3
{
  if ([a3 isLogFile]) {
    HTUIFileFormatSpindump();
  }
  else {
  id v3 = HTUIFileFormatTailspin();
  }

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HangsDataControllerViewController;
  [(HangsDataControllerViewController *)&v3 viewDidLoad];
  [(HangsDataControllerViewController *)self updateRightBarButtonItems];
}

- (void)updateRightBarButtonItems
{
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareAllEntries:"];
  objc_super v3 = [(HangsDataControllerViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)shareAllEntries:(id)a3
{
  id v14 = a3;
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v5 = [(HangsDataControllerViewController *)self entries];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) path];
        v11 = +[NSURL fileURLWithPath:v10];

        [v4 addObject:v11];
        +[HTHangsAnalytics sendLogSharedEvent];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v12 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v4 applicationActivities:0];
  v13 = [v12 popoverPresentationController];
  [v13 setBarButtonItem:v14];

  [(HangsDataControllerViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)shareEntry:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[HTHangsAnalytics sendLogSharedEvent];
  id v23 = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:&v23 count:1];
  id v9 = objc_alloc((Class)UIActivityViewController);

  id v10 = [v9 initWithActivityItems:v8 applicationActivities:0];
  v11 = [(HangsDataControllerViewController *)self table];
  id v12 = [v10 popoverPresentationController];
  [v12 setSourceView:v11];

  v13 = [(HangsDataControllerViewController *)self table];
  [v13 rectForRowAtIndexPath:v6];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = [v10 popoverPresentationController];
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  [(HangsDataControllerViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HangsDataControllerViewController *)self specifierAtIndexPath:v8];
  id v10 = [v9 objectForKeyedSubscript:@"file-path"];
  if (v10)
  {
    v11 = +[NSURL fileURLWithPath:v10];
    if (v11)
    {
      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F054;
      v14[3] = &unk_34FE8;
      objc_copyWeak(&v17, &location);
      id v15 = v11;
      id v16 = v8;
      id v12 = +[UIContextMenuConfiguration configurationWithIdentifier:v10 previewProvider:&stru_34F98 actionProvider:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSArray)cachedEntries
{
  return self->_cachedEntries;
}

- (void)setCachedEntries:(id)a3
{
}

- (NSArray)cachedSpecifiers
{
  return self->_cachedSpecifiers;
}

- (void)setCachedSpecifiers:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSMeasurementFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_cachedSpecifiers, 0);

  objc_storeStrong((id *)&self->_cachedEntries, 0);
}

@end