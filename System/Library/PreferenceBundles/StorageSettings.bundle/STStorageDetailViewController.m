@interface STStorageDetailViewController
- (int64_t)cellType;
- (void)viewDidLoad;
@end

@implementation STStorageDetailViewController

- (int64_t)cellType
{
  return 0;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageDetailViewController;
  [(STStorageDetailViewController *)&v6 viewDidLoad];
  v3 = +[STStorageAnalytics sharedInstance];
  int64_t v4 = [(STStorageDetailViewController *)self cellType];
  v5 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:PSValueKey];
  [v3 sendAnalyticsEventActionWithType:v4 andActionSize:v5];
}

@end