@interface EKUIReadonlyEventViewController
- (BOOL)wantsManagement;
- (EKUIReadonlyEventViewController)initWithEvent:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)willCommitPreview;
@end

@implementation EKUIReadonlyEventViewController

- (EKUIReadonlyEventViewController)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKUIReadonlyEventViewController;
  v5 = [(EKUIReadonlyEventViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(EKEventViewController *)v5 setNoninteractivePlatterMode:1];
    [(EKEventViewController *)v6 setEvent:v4];
  }

  return v6;
}

- (void)willCommitPreview
{
  [(EKEventViewController *)self setNoninteractivePlatterMode:0];
  [(EKEventViewController *)self setAllowsEditing:1];

  [(EKUIReadonlyEventViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)wantsManagement
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(EKEventViewController *)self noninteractivePlatterMode])
  {
    v3 = [(EKUIReadonlyEventViewController *)self view];
    id v4 = [v3 window];
    v5 = [v4 windowScene];
    char v6 = [v5 interfaceOrientation];

    return 1 << v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKUIReadonlyEventViewController;
    return [(EKEventViewController *)&v8 supportedInterfaceOrientations];
  }
}

@end