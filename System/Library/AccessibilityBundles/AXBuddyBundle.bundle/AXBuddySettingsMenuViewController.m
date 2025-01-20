@interface AXBuddySettingsMenuViewController
- (AXBuddySettingsMenuViewController)init;
- (void)dealloc;
- (void)donePressed;
- (void)largeTextDidChange:(id)a3;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation AXBuddySettingsMenuViewController

- (AXBuddySettingsMenuViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXBuddySettingsMenuViewController;
  v2 = [(AXBuddySettingsMenuViewController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"largeTextDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AXBuddySettingsMenuViewController;
  [(AXBuddySettingsMenuViewController *)&v4 dealloc];
}

- (void)loadView
{
  id firstValue = (id)objc_opt_new();
  [(AXBuddySettingsMenuViewController *)self setView:firstValue];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"donePressed"];
  objc_super v4 = [(AXBuddySettingsMenuViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  objc_super v5 = (AXBuddySettingsMenuTableViewController *)objc_opt_new();
  tableController = self->_tableController;
  self->_tableController = v5;

  v7 = [(AXBuddySettingsMenuTableViewController *)self->_tableController tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AXBuddySettingsMenuViewController *)self addChildViewController:self->_tableController];
  v8 = [(AXBuddySettingsMenuViewController *)self view];
  [v8 addSubview:v7];

  [(AXBuddySettingsMenuTableViewController *)self->_tableController didMoveToParentViewController:self];
  v9 = _NSDictionaryOfVariableBindings(@"realView, tv", firstValue, v7, 0);
  v10 = +[NSMutableArray array];
  v11 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tv]|" options:0 metrics:0 views:v9];
  [v10 addObjectsFromArray:v11];

  v12 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tv]|" options:0 metrics:0 views:v9];
  [v10 addObjectsFromArray:v12];

  +[NSLayoutConstraint activateConstraints:v10];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AXBuddySettingsMenuViewController;
  [(AXBuddySettingsMenuViewController *)&v3 viewDidLoad];
  [(AXBuddySettingsMenuViewController *)self setExtendedLayoutIncludesOpaqueBars:0];
  [(AXBuddySettingsMenuViewController *)self setEdgesForExtendedLayout:0];
}

- (void)largeTextDidChange:(id)a3
{
}

- (void)donePressed
{
  id v2 = [(AXBuddySettingsMenuViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonContainer, 0);

  objc_storeStrong((id *)&self->_tableController, 0);
}

@end