@interface FBAOSLogViewController
+ (BOOL)canDisplayURL:(id)a3;
- (BOOL)isLoading;
- (BOOL)previousToolbarHidden;
- (FBAOSLogViewerDataSource)logSource;
- (NSURL)logURL;
- (UIActivityIndicatorView)spinner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)nextPage;
- (void)scrollViewDidScroll:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLogSource:(id)a3;
- (void)setLogURL:(id)a3;
- (void)setOSLogURL:(id)a3;
- (void)setPreviousToolbarHidden:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)shareArchive:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FBAOSLogViewController

+ (BOOL)canDisplayURL:(id)a3
{
  v3 = [a3 pathExtension];
  v4 = [v3 lowercaseString];
  unsigned __int8 v5 = [v4 isEqualToString:@"logarchive"];

  return v5;
}

- (void)setOSLogURL:(id)a3
{
  id v4 = a3;
  [(FBAOSLogViewController *)self setLogURL:v4];
  unsigned __int8 v5 = [(FBAOSLogViewController *)self logURL];
  v6 = [v5 lastPathComponent];
  v7 = [(FBAOSLogViewController *)self navigationItem];
  [v7 setTitle:v6];

  objc_initWeak(&location, self);
  v8 = [FBAOSLogViewerDataSource alloc];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003F028;
  v12[3] = &unk_1000F3B18;
  objc_copyWeak(&v13, &location);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003F09C;
  v10[3] = &unk_1000F3B40;
  objc_copyWeak(&v11, &location);
  v9 = [(FBAOSLogViewerDataSource *)v8 initWithArchive:v4 pageSize:200 pageCompletion:v12 error:v10];
  [(FBAOSLogViewController *)self setLogSource:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)FBAOSLogViewController;
  [(FBAOSLogViewController *)&v11 viewDidLoad];
  v3 = [(FBAOSLogViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [v4 sizeToFit];
  [v4 setAutoresizingMask:45];
  [(FBAOSLogViewController *)self setSpinner:v4];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v4];
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareArchive:"];
  v12[0] = v7;
  v12[1] = v6;
  v12[2] = v5;
  v8 = +[NSArray arrayWithObjects:v12 count:3];
  [(FBAOSLogViewController *)self setToolbarItems:v8 animated:0];

  [(FBAOSLogViewController *)self setLoading:0];
  v9 = [(FBAOSLogViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  v10 = [(FBAOSLogViewController *)self tableView];
  [v10 setEstimatedRowHeight:80.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBAOSLogViewController;
  [(FBAOSLogViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(FBAOSLogViewController *)self navigationController];
  [v4 setToolbarHidden:[self previousToolbarHidden]];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(FBAOSLogViewController *)self navigationController];
  -[FBAOSLogViewController setPreviousToolbarHidden:](self, "setPreviousToolbarHidden:", [v5 isToolbarHidden]);

  v7.receiver = self;
  v7.super_class = (Class)FBAOSLogViewController;
  [(FBAOSLogViewController *)&v7 viewWillAppear:v3];
  id v6 = [(FBAOSLogViewController *)self navigationController];
  [v6 setToolbarHidden:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBAOSLogViewController;
  [(FBAOSLogViewController *)&v6 viewDidAppear:a3];
  id v4 = [(FBAOSLogViewController *)self logSource];
  unsigned __int8 v5 = [v4 foundCorruptDate];

  if ((v5 & 1) == 0) {
    [(FBAOSLogViewController *)self nextPage];
  }
}

- (void)shareArchive:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(FBAOSLogViewController *)self logURL];

  if (v5)
  {
    id v6 = objc_alloc((Class)UIActivityViewController);
    objc_super v7 = [(FBAOSLogViewController *)self logURL];
    v15 = v7;
    v8 = +[NSArray arrayWithObjects:&v15 count:1];
    id v9 = [v6 initWithActivityItems:v8 applicationActivities:0];

    v10 = [v9 popoverPresentationController];
    [v10 setBarButtonItem:v4];

    objc_super v11 = [v9 popoverPresentationController];
    [v11 setPermittedArrowDirections:2];

    v14[0] = UIActivityTypePostToFacebook;
    v14[1] = UIActivityTypePostToTwitter;
    v14[2] = UIActivityTypePostToWeibo;
    v14[3] = UIActivityTypePrint;
    v14[4] = UIActivityTypeCopyToPasteboard;
    v14[5] = UIActivityTypeAssignToContact;
    v14[6] = UIActivityTypeSaveToCameraRoll;
    v14[7] = UIActivityTypeAddToReadingList;
    v14[8] = UIActivityTypePostToFlickr;
    v14[9] = UIActivityTypePostToVimeo;
    v14[10] = UIActivityTypePostToTencentWeibo;
    v12 = +[NSArray arrayWithObjects:v14 count:11];
    [v9 setExcludedActivityTypes:v12];

    id v13 = [(FBAOSLogViewController *)self navigationController];
    [v13 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)nextPage
{
  [(FBAOSLogViewController *)self setLoading:1];
  id v3 = [(FBAOSLogViewController *)self logSource];
  [v3 nextPage];
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  self->_loading = a3;
  id v4 = [(FBAOSLogViewController *)self spinner];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(FBAOSLogViewController *)self logSource];
  unsigned __int8 v6 = [v5 foundCorruptDate];

  if (v6) {
    return 1;
  }
  v8 = [(FBAOSLogViewController *)self logSource];
  id v9 = [v8 numberOfLogs];

  return (int64_t)v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"FBAOSLogCell"];
  if (!v7) {
    objc_super v7 = [[FBAOSLogTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"FBAOSLogCell"];
  }
  v8 = [(FBAOSLogViewController *)self logSource];
  unsigned int v9 = [v8 foundCorruptDate];

  if (v9)
  {
    v10 = +[NSBundle mainBundle];
    objc_super v11 = [(__CFString *)v10 localizedStringForKey:@"CORRUPT_FILE" value:&stru_1000F6658 table:0];
    v12 = [(FBAOSLogTableViewCell *)v7 logLabel];
    [v12 setText:v11];
  }
  else
  {
    id v13 = [(FBAOSLogViewController *)self logSource];
    [v13 logAtIndex:[v6 row]];
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      CFStringRef v14 = v10;
    }
    else {
      CFStringRef v14 = @"-";
    }
    objc_super v11 = [(FBAOSLogTableViewCell *)v7 logLabel];
    [v11 setText:v14];
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 bounds];
  double v8 = v6 + v7;
  [v4 contentSize];
  uint64_t v10 = (uint64_t)(v9 - (double)(uint64_t)v8);
  [v4 bounds];
  double v12 = v11;

  if (v10 <= (uint64_t)(v12 * 20.0))
  {
    id v13 = [(FBAOSLogViewController *)self logSource];
    unsigned __int8 v14 = [v13 foundCorruptDate];

    if ((v14 & 1) == 0 && ![(FBAOSLogViewController *)self isLoading])
    {
      v15 = [(FBAOSLogViewController *)self logSource];
      unsigned int v16 = [v15 hasMoreLogs];

      if (v16)
      {
        [(FBAOSLogViewController *)self nextPage];
      }
    }
  }
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogURL:(id)a3
{
}

- (FBAOSLogViewerDataSource)logSource
{
  return (FBAOSLogViewerDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogSource:(id)a3
{
}

- (BOOL)previousToolbarHidden
{
  return self->_previousToolbarHidden;
}

- (void)setPreviousToolbarHidden:(BOOL)a3
{
  self->_previousToolbarHidden = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)spinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinner);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinner);
  objc_storeStrong((id *)&self->_logSource, 0);

  objc_storeStrong((id *)&self->_logURL, 0);
}

@end