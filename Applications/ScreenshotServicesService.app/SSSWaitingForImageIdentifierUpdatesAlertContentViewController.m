@interface SSSWaitingForImageIdentifierUpdatesAlertContentViewController
- (BOOL)_canShowWhileLocked;
- (double)progress;
- (void)loadView;
- (void)setProgress:(double)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SSSWaitingForImageIdentifierUpdatesAlertContentViewController

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(SSSWaitingForImageIdentifierUpdatesAlertContentViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SSSWaitingForImageIdentifierUpdatesAlertContentViewController;
  [(SSSWaitingForImageIdentifierUpdatesAlertContentViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(SSSWaitingForImageIdentifierUpdatesAlertContentViewController *)self view];
  [v3 intrinsicContentSize];
  -[SSSWaitingForImageIdentifierUpdatesAlertContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setProgress:(double)a3
{
  id v4 = [(SSSWaitingForImageIdentifierUpdatesAlertContentViewController *)self _contentView];
  [v4 setProgress:a3];
}

- (double)progress
{
  return self->_progress;
}

@end