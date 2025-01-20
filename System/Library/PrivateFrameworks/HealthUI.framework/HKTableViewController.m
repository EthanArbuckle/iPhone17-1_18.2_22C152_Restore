@interface HKTableViewController
- (HKTableViewController)init;
- (HKTableViewController)initWithUsingInsetStyling:(BOOL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
@end

@implementation HKTableViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (HKTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKTableViewController;
  result = [(HKTableViewController *)&v3 initWithStyle:2];
  if (result) {
    result->_useInsetStyling = 1;
  }
  return result;
}

- (HKTableViewController)initWithUsingInsetStyling:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)HKTableViewController;
  result = [(HKTableViewController *)&v6 initWithStyle:v4];
  if (result) {
    result->_useInsetStyling = a3;
  }
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKTableViewController;
  [(HKTableViewController *)&v7 viewDidLoad];
  BOOL useInsetStyling = self->_useInsetStyling;
  uint64_t v4 = [(HKTableViewController *)self tableView];
  [v4 _setSectionContentInsetFollowsLayoutMargins:useInsetStyling];

  if (self->_useInsetStyling)
  {
    v5 = [(HKTableViewController *)self tableView];
    [v5 _setSectionCornerRadius:10.0];

    objc_super v6 = [(HKTableViewController *)self tableView];
    objc_msgSend(v6, "_setSectionContentInset:", 0.0, 16.0, 20.0, 16.0);
  }
}

@end