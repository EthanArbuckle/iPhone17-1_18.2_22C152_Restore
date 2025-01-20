@interface HangDetailViewController
- (void)shareLog;
- (void)viewDidLoad;
@end

@implementation HangDetailViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HangDetailViewController;
  [(HangDetailViewController *)&v11 viewDidLoad];
  v3 = [(HangDetailViewController *)self specifier];
  v4 = [v3 name];
  [(HangDetailViewController *)self setTitle:v4];

  id v5 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v5 configureWithOpaqueBackground];
  v6 = [(HangDetailViewController *)self navigationItem];
  [v6 setStandardAppearance:v5];

  v7 = [(HangDetailViewController *)self navigationItem];
  [v7 setCompactAppearance:v5];

  v8 = [(HangDetailViewController *)self navigationItem];
  [v8 setScrollEdgeAppearance:v5];

  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareLog"];
  v10 = [(HangDetailViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];
}

- (void)shareLog
{
  v3 = [(HangDetailViewController *)self specifier];
  v4 = [v3 objectForKeyedSubscript:@"file-path"];

  if (v4)
  {
    +[HTHangsAnalytics sendLogSharedEvent];
    id v5 = +[NSURL fileURLWithPath:v4];
    v6 = [v4 lastPathComponent];
    v12[0] = v6;
    v12[1] = v5;
    v7 = +[NSArray arrayWithObjects:v12 count:2];

    id v8 = [objc_alloc((Class)UIActivityViewController) initWithActivityItems:v7 applicationActivities:0];
    id v9 = [(HangDetailViewController *)self navigationItem];
    v10 = [v9 rightBarButtonItem];
    objc_super v11 = [v8 popoverPresentationController];
    [v11 setBarButtonItem:v10];

    [(HangDetailViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

@end