@interface TSDeviceInfoViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (NSLayoutConstraint)heightAnchor;
- (TSDeviceInfoViewController)initWithOptions:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped;
- (void)setHeightAnchor:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TSDeviceInfoViewController

- (TSDeviceInfoViewController)initWithOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v24 = TSUserInfoEidKey;
  uint64_t v25 = TSUserInfoImeiKey;
  v34[0] = TSUserInfoEidKey;
  v34[1] = TSUserInfoImeiKey;
  uint64_t v26 = TSUserInfoImei2Key;
  v34[2] = TSUserInfoImei2Key;
  v34[3] = TSUserInfoMeidKey;
  v5 = +[NSArray arrayWithObjects:v34 count:4];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v11 = [v3 valueForKey:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length])
        {
          v33[0] = v10;
          v33[1] = v11;
          v12 = +[NSArray arrayWithObjects:v33 count:2];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  if ([v4 count] == (id)1
    || (+[NSBundle mainBundle],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 localizedStringForKey:@"DEVICE_INFO_TITLE" value:&stru_100020AC8 table:@"Localizable"], v14 = (__CFString *)objc_claimAutoreleasedReturnValue(), v13, !v14))
  {
    v16 = [v3 valueForKey:v24];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v16 length]) {
        v14 = @"EID";
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    v17 = [v3 valueForKey:v25];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 length]) {
      v14 = @"IMEI";
    }
    v18 = [v3 valueForKey:v26];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length]) {
      v14 = @"IMEI2";
    }

    char v15 = 1;
  }
  else
  {
    char v15 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)TSDeviceInfoViewController;
  v19 = [(TSDeviceInfoViewController *)&v28 initWithTitle:v14 detailText:0 icon:0];
  v20 = v19;
  if (v19)
  {
    v19->_singleItemFlow = v15;
    uint64_t v21 = +[NSMutableArray arrayWithArray:v4];
    sortedInfo = v20->_sortedInfo;
    v20->_sortedInfo = (NSMutableArray *)v21;
  }
  return v20;
}

- (void)_doneButtonTapped
{
  id v2 = [(TSDeviceInfoViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)TSDeviceInfoViewController;
  [(TSDeviceInfoViewController *)&v38 viewDidLoad];
  id v3 = +[UIColor systemBackgroundColor];
  v4 = [(TSDeviceInfoViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  id v6 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(TSDeviceInfoViewController *)self setTableView:v6];

  id v7 = [(TSDeviceInfoViewController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v8 = [(TSDeviceInfoViewController *)self tableView];
  [v8 setRowHeight:UITableViewAutomaticDimension];

  v9 = [(TSDeviceInfoViewController *)self tableView];
  [v9 setEstimatedRowHeight:0.0];

  uint64_t v10 = [(TSDeviceInfoViewController *)self tableView];
  [v10 setAllowsMultipleSelection:0];

  v11 = [(TSDeviceInfoViewController *)self tableView];
  v12 = +[UIColor clearColor];
  [v11 setBackgroundColor:v12];

  v13 = [(TSDeviceInfoViewController *)self tableView];
  [v13 setDataSource:self];

  v14 = [(TSDeviceInfoViewController *)self tableView];
  [v14 setDelegate:self];

  char v15 = [(TSDeviceInfoViewController *)self tableView];
  [v15 setScrollEnabled:0];

  v16 = [(TSDeviceInfoViewController *)self tableView];
  [v16 setEditing:0];

  v17 = [(TSDeviceInfoViewController *)self tableView];
  [v17 setAllowsSelection:0];

  v18 = [(TSDeviceInfoViewController *)self tableView];
  [v18 setSeparatorStyle:0];

  if (self->_singleItemFlow)
  {
    v19 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped"];
    doneButton = self->_doneButton;
    self->_doneButton = v19;

    uint64_t v21 = [(TSDeviceInfoViewController *)self navigationItem];
    [v21 setLeftBarButtonItem:self->_doneButton animated:1];
  }
  v22 = [(TSDeviceInfoViewController *)self tableView];
  [v22 reloadData];

  v23 = [(TSDeviceInfoViewController *)self tableView];
  uint64_t v24 = [v23 heightAnchor];
  uint64_t v25 = [(TSDeviceInfoViewController *)self tableView];
  [v25 contentSize];
  v27 = [v24 constraintEqualToConstant:v26];
  [(TSDeviceInfoViewController *)self setHeightAnchor:v27];

  objc_super v28 = [(TSDeviceInfoViewController *)self heightAnchor];
  [v28 setActive:1];

  BOOL singleItemFlow = self->_singleItemFlow;
  long long v30 = [(TSDeviceInfoViewController *)self tableView];
  long long v31 = [v30 centerYAnchor];
  long long v32 = [(TSDeviceInfoViewController *)self view];
  v33 = [v32 centerYAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:singleItemFlow];

  v35 = [(TSDeviceInfoViewController *)self navigationController];
  v36 = [v35 navigationBar];
  v37 = +[UIColor systemBackgroundColor];
  [v36 setBackgroundColor:v37];
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(TSDeviceInfoViewController *)self tableView];
  [v3 reloadData];

  v4 = [(TSDeviceInfoViewController *)self view];
  [v4 layoutIfNeeded];

  v5 = [(TSDeviceInfoViewController *)self heightAnchor];
  id v6 = [(TSDeviceInfoViewController *)self tableView];
  [v6 contentSize];
  [v5 setConstant:v7];

  v8.receiver = self;
  v8.super_class = (Class)TSDeviceInfoViewController;
  [(TSDeviceInfoViewController *)&v8 viewDidLayoutSubviews];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v5 = [(NSMutableArray *)self->_sortedInfo objectAtIndex:a4];
  id v6 = [objc_alloc((Class)UITableViewCell) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  double v7 = [v6 textLabel];
  objc_super v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v7 setFont:v8];

  v9 = [v6 textLabel];
  [v9 setLineBreakMode:0];

  uint64_t v10 = [v6 textLabel];
  [v10 setNumberOfLines:0];

  v11 = [v6 textLabel];
  [v11 setTextAlignment:1];

  if (self->_singleItemFlow)
  {
    v12 = [v6 textLabel];
    v13 = [v5 objectAtIndexedSubscript:1];
    +[NSString stringWithFormat:@"%@", v13, v25];
  }
  else
  {
    v14 = [v5 objectAtIndexedSubscript:0];
    char v15 = (void *)TSUserInfoEidKey;

    if (v14 == v15)
    {
      CFStringRef v22 = @"EID";
    }
    else
    {
      v16 = [v5 objectAtIndexedSubscript:0];
      v17 = (void *)TSUserInfoImeiKey;

      if (v16 == v17)
      {
        CFStringRef v22 = @"IMEI";
      }
      else
      {
        v18 = [v5 objectAtIndexedSubscript:0];
        v19 = (void *)TSUserInfoImei2Key;

        if (v18 == v19)
        {
          CFStringRef v22 = @"IMEI2";
        }
        else
        {
          v20 = [v5 objectAtIndexedSubscript:0];
          uint64_t v21 = (void *)TSUserInfoMeidKey;

          if (v20 == v21) {
            CFStringRef v22 = @"MEID";
          }
          else {
            CFStringRef v22 = 0;
          }
        }
      }
    }
    v12 = [v6 textLabel];
    v13 = [v5 objectAtIndexedSubscript:1];
    +[NSString stringWithFormat:@"%@ %@", v22, v13];
  v23 = };
  [v12 setText:v23];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableArray *)self->_sortedInfo count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 100.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [[TSDeviceInfoCell alloc] initWithStyle:0 reuseIdentifier:@"deviceInfo"];
  sortedInfo = self->_sortedInfo;
  id v8 = [v5 section];

  v9 = [(NSMutableArray *)sortedInfo objectAtIndex:v8];
  uint64_t v10 = [v9 objectAtIndexedSubscript:1];
  v11 = [v10 dataUsingEncoding:4];

  v12 = +[CIFilter filterWithName:@"CICode128BarcodeGenerator"];
  [v12 setDefaults];
  [v12 setValue:v11 forKey:@"inputMessage"];
  v13 = [(TSDeviceInfoCell *)v6 contentView];
  [v13 bounds];
  double v15 = v14;
  v16 = [v12 outputImage];
  [v16 extent];
  uint64_t v18 = vcvtmd_s64_f64(v15 / v17);

  if (v18)
  {
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeScale(&v33, (double)v18, (double)v18);
    v19 = [v12 outputImage];
    CGAffineTransform v32 = v33;
    v20 = [v19 imageByApplyingTransform:&v32];

    uint64_t v21 = [(TSDeviceInfoCell *)v6 imageView];
    CFStringRef v22 = [v21 layer];
    [v22 setMagnificationFilter:kCAFilterNearest];

    v23 = [(TSDeviceInfoCell *)v6 imageView];
    uint64_t v24 = +[UIImage imageWithCIImage:v20];
    [v23 setImage:v24];

    uint64_t v25 = [(TSDeviceInfoCell *)v6 imageView];
    [v25 setContentMode:4];

    double v26 = [(TSDeviceInfoCell *)v6 imageView];
    v27 = [(TSDeviceInfoCell *)v6 contentView];
    [v27 bounds];
    double v29 = v28 * 0.5;
    long long v30 = [(TSDeviceInfoCell *)v6 imageView];
    [v30 center];
    [v26 setCenter:v29];
  }
  else
  {
    v20 = sub_100010734();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100013740(v20);
    }
  }

  return v6;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);

  objc_storeStrong((id *)&self->_sortedInfo, 0);
}

@end