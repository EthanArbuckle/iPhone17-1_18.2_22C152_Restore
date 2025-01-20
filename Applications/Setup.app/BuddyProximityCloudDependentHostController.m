@interface BuddyProximityCloudDependentHostController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)shouldAllowStartOver;
- (UIViewController)viewController;
- (void)setDelegate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation BuddyProximityCloudDependentHostController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end