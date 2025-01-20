@interface AnimojiMessagesViewController
- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4;
- (LaunchViewController)launchViewController;
- (UIView)launchViewContainer;
- (UIView)messagesViewContainer;
- (id)landscapeOverlayMessage;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setLaunchViewContainer:(id)a3;
- (void)setLaunchViewController:(id)a3;
- (void)setMessagesViewContainer:(id)a3;
@end

@implementation AnimojiMessagesViewController

- (id)landscapeOverlayMessage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"sJFLandscapeTrapMessage" value:&stru_100035088 table:@"JFStrings"];

  return v3;
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AnimojiMessagesViewController;
  id v7 = a4;
  [(AnimojiMessagesViewController *)&v16 prepareForSegue:v6 sender:v7];
  v8 = [v6 identifier];
  unsigned int v9 = [v8 isEqualToString:@"MessagesViewController"];

  if (v9)
  {
    v10 = [v6 destinationViewController];
    [(BaseMessagesViewController *)self setBaseMessagesViewController:v10];

    byte_10003EB80 = 1;
  }
  else
  {
    v11 = [v6 identifier];
    unsigned int v12 = [v11 isEqualToString:@"LaunchViewController"];

    if (v12)
    {
      v13 = [v6 destinationViewController];
      launchViewController = self->_launchViewController;
      self->_launchViewController = v13;
    }
  }
  v15 = [(BaseMessagesViewController *)self baseMessagesViewController];
  [v15 prepareForSegue:v6 sender:v7];
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AnimojiMessagesViewController;
  if ([(AnimojiMessagesViewController *)&v11 shouldPerformSegueWithIdentifier:v6 sender:v7])
  {
    if ([v6 isEqualToString:@"MessagesViewController"])
    {
      unsigned __int8 v8 = byte_10003EB80 ^ 1;
    }
    else
    {
      unsigned int v9 = [(BaseMessagesViewController *)self baseMessagesViewController];
      unsigned __int8 v8 = [v9 shouldPerformSegueWithIdentifier:v6 sender:v7];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8 & 1;
}

- (UIView)messagesViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setMessagesViewContainer:(id)a3
{
}

- (UIView)launchViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_launchViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setLaunchViewContainer:(id)a3
{
}

- (LaunchViewController)launchViewController
{
  return self->_launchViewController;
}

- (void)setLaunchViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchViewController, 0);
  objc_destroyWeak((id *)&self->_launchViewContainer);

  objc_destroyWeak((id *)&self->_messagesViewContainer);
}

@end