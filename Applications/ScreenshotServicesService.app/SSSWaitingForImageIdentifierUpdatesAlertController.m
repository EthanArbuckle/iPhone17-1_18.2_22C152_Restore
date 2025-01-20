@interface SSSWaitingForImageIdentifierUpdatesAlertController
+ (id)newWaitingForImageIdentifierUpdatesAlertController;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (SSSWaitingForImageIdentifierUpdatesAlertControllerDelegate)delegate;
- (double)progress;
- (id)_waitingContentViewController;
- (void)setDelegate:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation SSSWaitingForImageIdentifierUpdatesAlertController

+ (id)newWaitingForImageIdentifierUpdatesAlertController
{
  v2 = [a1 alertControllerWithTitle:0 message:0 preferredStyle:1];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"PREPARING_TO_SHARE_ALERT_TITLE" value:@"Preparing..." table:0];
  [v2 setTitle:v4];

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"PREPARING_TO_SHARE_ALERT_CANCEL_BUTTON" value:@"Cancel" table:0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C154;
  v12[3] = &unk_10009A460;
  id v7 = v2;
  id v13 = v7;
  v8 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v12];
  [v7 addAction:v8];
  v9 = objc_alloc_init(SSSWaitingForImageIdentifierUpdatesAlertContentViewController);
  [v7 setContentViewController:v9];
  id v10 = v7;

  return v10;
}

- (id)_waitingContentViewController
{
  return [(SSSWaitingForImageIdentifierUpdatesAlertController *)self contentViewController];
}

- (void)setProgress:(double)a3
{
  id v4 = [(SSSWaitingForImageIdentifierUpdatesAlertController *)self _waitingContentViewController];
  [v4 setProgress:a3];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSSWaitingForImageIdentifierUpdatesAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSWaitingForImageIdentifierUpdatesAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
}

@end