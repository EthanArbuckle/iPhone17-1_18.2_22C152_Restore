@interface GAXOptionsViewController
+ (id)optionsViewController;
- (BOOL)_stateForForFeatureAtIndex:(int64_t)a3;
- (BOOL)timeRestrictionsEnabled;
- (CGSize)cachedTableSize;
- (CGSize)initialPreferredContentSize;
- (CGSize)tableTotalSizeConstrainedToWidth:(double)a3;
- (GAXOptionsViewControllerDataSource)dataSource;
- (GAXOptionsViewControllerDelegate)delegate;
- (GAXStyleProvider)styleProvider;
- (NSString)cachedSizeContentSizeCategory;
- (UIDatePicker)timeRestrictionsDatePicker;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_detailTextForFeatureAtIndex:(int64_t)a3;
- (id)_makeTableViewCellWithIdentifier:(id)a3;
- (id)_pickerIndexPath;
- (id)_textForFeatureAtIndex:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfFeatures;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configureTableViewCell:(id)a3 withIndex:(int64_t)a4;
- (void)_featureAtIndex:(unint64_t)a3 didChangeState:(BOOL)a4;
- (void)_handleDatePickerValuedidChange:(id)a3;
- (void)_handleSwitchWasToggled:(id)a3;
- (void)_timeRestrictionValueDidChange:(int64_t)a3 timeRestrictionsEnabled:(BOOL)a4;
- (void)setCachedSizeContentSizeCategory:(id)a3;
- (void)setCachedTableSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTimeRestrictionsDatePicker:(id)a3;
- (void)setTimeRestrictionsEnabled:(BOOL)a3;
- (void)setTimeRestrictionsEnabled:(BOOL)a3 currentDurationInMinutes:(int64_t)a4 animated:(BOOL)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation GAXOptionsViewController

- (id)_textForFeatureAtIndex:(int64_t)a3
{
  v5 = [(GAXOptionsViewController *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 optionsViewController:self textForFeatureAtIndex:a3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_detailTextForFeatureAtIndex:(int64_t)a3
{
  v5 = [(GAXOptionsViewController *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 optionsViewController:self detailTextForFeatureAtIndex:a3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_stateForForFeatureAtIndex:(int64_t)a3
{
  v5 = [(GAXOptionsViewController *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 optionsViewController:self stateForForFeatureAtIndex:a3];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (int64_t)_numberOfFeatures
{
  v3 = [(GAXOptionsViewController *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    id v4 = [v3 numberOfFeaturesInOptionsViewController:self];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)_featureAtIndex:(unint64_t)a3 didChangeState:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(GAXOptionsViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 optionsViewController:self featureAtIndex:a3 didChangeState:v4];
  }
}

- (void)_timeRestrictionValueDidChange:(int64_t)a3 timeRestrictionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(GAXOptionsViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 optionsViewController:self timeRestrictionValueDidChange:a3 timeRestrictionsEnabled:v4];
  }
}

- (id)_pickerIndexPath
{
  int64_t v2 = [(GAXOptionsViewController *)self _numberOfFeatures];

  return +[NSIndexPath indexPathForRow:v2 inSection:0];
}

- (void)setTimeRestrictionsEnabled:(BOOL)a3 currentDurationInMinutes:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  [(GAXOptionsViewController *)self loadViewIfNeeded];
  v9 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v9 updateSelectedDurationInMinutes:a4 animated:v5];

  if ([(GAXOptionsViewController *)self timeRestrictionsEnabled] != v7)
  {
    [(GAXOptionsViewController *)self setTimeRestrictionsEnabled:v7];
    v10 = [(GAXOptionsViewController *)self tableView];
    id v14 = v10;
    if (v5)
    {
      uint64_t v11 = [(GAXOptionsViewController *)self _pickerIndexPath];
      v12 = (void *)v11;
      if (v7)
      {
        uint64_t v16 = v11;
        v13 = +[NSArray arrayWithObjects:&v16 count:1];
        [v14 insertRowsAtIndexPaths:v13 withRowAnimation:4];
      }
      else
      {
        uint64_t v15 = v11;
        v13 = +[NSArray arrayWithObjects:&v15 count:1];
        [v14 deleteRowsAtIndexPaths:v13 withRowAnimation:4];
      }
    }
    else
    {
      [v10 reloadData];
    }
  }
}

+ (id)optionsViewController
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)GAXOptionsViewController;
  [(GAXOptionsViewController *)&v11 viewDidLayoutSubviews];
  v3 = [(GAXOptionsViewController *)self tableView];
  [v3 contentSize];
  double v5 = v4;
  [v3 frame];
  [v3 setScrollEnabled:v5 > v6];
  BOOL v7 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v7 countDownDuration];
  double v9 = v8;
  v10 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v10 setCountDownDuration:v9];
}

- (CGSize)tableTotalSizeConstrainedToWidth:(double)a3
{
  [(GAXOptionsViewController *)self cachedTableSize];
  if (v5 != a3) {
    goto LABEL_3;
  }
  double v6 = [(GAXOptionsViewController *)self cachedSizeContentSizeCategory];
  BOOL v7 = +[UIApplication sharedApplication];
  double v8 = [v7 preferredContentSizeCategory];
  unsigned __int8 v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
LABEL_3:
    v10 = [(GAXOptionsViewController *)self tableView];
    [v10 contentOffset];
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = [(GAXOptionsViewController *)self tableView];
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    +[CATransaction begin];
    v24 = [(GAXOptionsViewController *)self tableView];
    objc_msgSend(v24, "setFrame:", v17, v19, a3, 500.0);

    v25 = [(GAXOptionsViewController *)self tableView];
    uint64_t v26 = [(GAXOptionsViewController *)self tableView:v25 numberOfRowsInSection:0];

    if (v26 < 1)
    {
      double v28 = 0.0;
    }
    else
    {
      int64_t v27 = 0;
      double v28 = 0.0;
      do
      {
        v29 = +[NSIndexPath indexPathForRow:v27 inSection:0];
        v30 = [(GAXOptionsViewController *)self tableView];
        [v30 scrollToRowAtIndexPath:v29 atScrollPosition:1 animated:0];

        v31 = [(GAXOptionsViewController *)self tableView];
        v32 = [v31 cellForRowAtIndexPath:v29];
        [v32 frame];
        double v28 = v28 + v33;

        ++v27;
        v34 = [(GAXOptionsViewController *)self tableView];
        int64_t v35 = [(GAXOptionsViewController *)self tableView:v34 numberOfRowsInSection:0];
      }
      while (v27 < v35);
    }
    v36 = [(GAXOptionsViewController *)self tableView];
    objc_msgSend(v36, "setFrame:", v17, v19, v21, v23);

    v37 = [(GAXOptionsViewController *)self tableView];
    objc_msgSend(v37, "setContentOffset:", v12, v14);

    +[CATransaction commit];
    -[GAXOptionsViewController setCachedTableSize:](self, "setCachedTableSize:", a3, v28);
    v38 = +[UIApplication sharedApplication];
    v39 = [v38 preferredContentSizeCategory];
    [(GAXOptionsViewController *)self setCachedSizeContentSizeCategory:v39];
  }

  [(GAXOptionsViewController *)self cachedTableSize];
  result.height = v41;
  result.width = v40;
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)GAXOptionsViewController;
  [(GAXOptionsViewController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v3 setTag:12345];
  [(GAXOptionsViewController *)self setTimeRestrictionsDatePicker:v3];
  [v3 addTarget:self action:"_handleDatePickerValuedidChange:" forControlEvents:4096];
  [v3 setGaxDatePickerEnabled:1];
  [v3 setDatePickerMode:3];
  [v3 setPreferredDatePickerStyle:1];
}

- (CGSize)initialPreferredContentSize
{
  id v3 = [(GAXOptionsViewController *)self view];
  [v3 frame];
  [(GAXOptionsViewController *)self tableTotalSizeConstrainedToWidth:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_configureTableViewCell:(id)a3 withIndex:(int64_t)a4
{
  id v13 = a3;
  double v6 = [v13 reuseIdentifier];
  unsigned int v7 = [v6 isEqualToString:@"GAXCellIDToggle"];

  if (v7)
  {
    double v8 = [(GAXOptionsViewController *)self _textForFeatureAtIndex:a4];
    double v9 = [v13 textLabel];
    [v9 setText:v8];

    double v10 = [(GAXOptionsViewController *)self _detailTextForFeatureAtIndex:a4];
    double v11 = [v13 detailTextLabel];
    [v11 setText:v10];

    double v12 = [v13 accessoryView];
    objc_msgSend(v12, "setOn:", -[GAXOptionsViewController _stateForForFeatureAtIndex:](self, "_stateForForFeatureAtIndex:", a4));
    [v12 setTag:a4];
  }
}

- (id)_makeTableViewCellWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"GAXCellIDToggle"])
  {
    id v5 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:v4];
    [v5 setSelectionStyle:0];
    double v6 = [(GAXOptionsViewController *)self styleProvider];
    unsigned int v7 = [v6 featureViewControllerOptionsCellTextFont];
    double v8 = [v5 textLabel];
    [v8 setFont:v7];

    id v9 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v9 addTarget:self action:"_handleSwitchWasToggled:" forControlEvents:4096];
    [v5 setAccessoryView:v9];
LABEL_5:

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"GAXCellIDDatePicker"])
  {
    id v5 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:v4];
    [v5 setSelectionStyle:0];
    double v10 = [(GAXOptionsViewController *)self styleProvider];
    double v11 = [v10 featureViewControllerOptionsCellTextFont];
    double v12 = [v5 textLabel];
    [v12 setFont:v11];

    id v9 = [v5 contentView];
    id v13 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
    [v9 addSubview:v13];

    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)_handleSwitchWasToggled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tag];
  id v6 = [v4 isOn];

  [(GAXOptionsViewController *)self _featureAtIndex:v5 didChangeState:v6];
}

- (void)_handleDatePickerValuedidChange:(id)a3
{
  id v4 = [a3 selectedDurationInMinutes];
  BOOL v5 = [(GAXOptionsViewController *)self timeRestrictionsEnabled];

  [(GAXOptionsViewController *)self _timeRestrictionValueDidChange:v4 timeRestrictionsEnabled:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(GAXOptionsViewController *)self _numberOfFeatures];
  return v5 + [(GAXOptionsViewController *)self timeRestrictionsEnabled];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 row];
  if (v8 == (id)[(GAXOptionsViewController *)self _numberOfFeatures]) {
    CFStringRef v9 = @"GAXCellIDDatePicker";
  }
  else {
    CFStringRef v9 = @"GAXCellIDToggle";
  }
  double v10 = [v7 dequeueReusableCellWithIdentifier:v9];

  if (!v10)
  {
    double v10 = [(GAXOptionsViewController *)self _makeTableViewCellWithIdentifier:v9];
  }
  -[GAXOptionsViewController _configureTableViewCell:withIndex:](self, "_configureTableViewCell:withIndex:", v10, [v6 row]);

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(GAXOptionsViewController *)self _pickerIndexPath];
  unsigned int v7 = [v5 isEqual:v6];

  if (!v7) {
    return 44.0;
  }
  id v8 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v8 intrinsicContentSize];
  double v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(GAXOptionsViewController *)self _pickerIndexPath];
  unsigned int v7 = [v5 isEqual:v6];

  if (!v7) {
    return UITableViewAutomaticDimension;
  }
  id v8 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  double v9 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v9 intrinsicContentSize];
  uint64_t v15 = NSStringFromCGSize(v16);
  LOBYTE(v14) = 1;
  _AXLogWithFacility();

  double v10 = [(GAXOptionsViewController *)self timeRestrictionsDatePicker];
  [v10 intrinsicContentSize];
  double v12 = v11;

  return v12;
}

- (GAXOptionsViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (GAXOptionsViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (GAXOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GAXStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (UIDatePicker)timeRestrictionsDatePicker
{
  return self->_timeRestrictionsDatePicker;
}

- (void)setTimeRestrictionsDatePicker:(id)a3
{
}

- (BOOL)timeRestrictionsEnabled
{
  return self->_timeRestrictionsEnabled;
}

- (void)setTimeRestrictionsEnabled:(BOOL)a3
{
  self->_timeRestrictionsEnabled = a3;
}

- (CGSize)cachedTableSize
{
  double width = self->_cachedTableSize.width;
  double height = self->_cachedTableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedTableSize:(CGSize)a3
{
  self->_cachedTableSize = a3;
}

- (NSString)cachedSizeContentSizeCategory
{
  return self->_cachedSizeContentSizeCategory;
}

- (void)setCachedSizeContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSizeContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_timeRestrictionsDatePicker, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end