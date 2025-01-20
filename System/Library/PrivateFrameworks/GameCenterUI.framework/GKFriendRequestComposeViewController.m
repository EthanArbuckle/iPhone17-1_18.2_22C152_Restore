@interface GKFriendRequestComposeViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (NSUInteger)maxNumberOfRecipients;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldAutomaticallyForwardRotationMethods;
- (GKFriendRequestComposeViewController)init;
- (NSString)message;
- (UIAlertController)alertController;
- (id)composeViewDelegate;
- (unint64_t)recipientCount;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)rid;
- (void)_setupChildViewController;
- (void)prepareForNewRecipients:(id)a3;
- (void)sendFinishedMessageToDelegateCancelled:(BOOL)a3;
- (void)setAlertController:(id)a3;
- (void)setComposeViewDelegate:(id)composeViewDelegate;
- (void)setMessage:(NSString *)message;
- (void)setRecipientCount:(unint64_t)a3;
- (void)setRid:(unsigned int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKFriendRequestComposeViewController

- (GKFriendRequestComposeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKFriendRequestComposeViewController;
  v2 = [(GKFriendRequestComposeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKFriendRequestComposeViewController *)v2 _setupChildViewController];
  }
  return v3;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKFriendRequestComposeViewController;
  [(GKFriendRequestComposeViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKFriendRequestComposeViewController;
  [(GKFriendRequestComposeViewController *)&v6 viewDidAppear:a3];
  v4 = [(GKFriendRequestComposeViewController *)self alertController];

  if (v4)
  {
    objc_super v5 = [(GKFriendRequestComposeViewController *)self alertController];
    [(GKFriendRequestComposeViewController *)self presentViewController:v5 animated:1 completion:&__block_literal_global_14];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKFriendRequestComposeViewController;
  [(GKFriendRequestComposeViewController *)&v4 viewDidDisappear:a3];
  [(GKFriendRequestComposeViewController *)self setViewControllers:MEMORY[0x1E4F1CBF0]];
}

- (void)_setupChildViewController
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__GKFriendRequestComposeViewController__setupChildViewController__block_invoke;
  v4[3] = &unk_1E5F62EB0;
  v4[4] = self;
  objc_super v3 = [(GKFriendRequestComposeViewController *)self _gkInGameUIUnavailableAlertWithRestrictionMode:1 dismissHandler:v4];
  [(GKFriendRequestComposeViewController *)self setAlertController:v3];
}

uint64_t __65__GKFriendRequestComposeViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  [*(id *)(a1 + 32) sendFinishedMessageToDelegateCancelled:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F1CBF0];

  return [v2 setViewControllers:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1 && (!*MEMORY[0x1E4F63830] || *MEMORY[0x1E4F63A38] != 0)) {
    return 30;
  }
  objc_super v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;

    BOOL v13 = v10 < 414.0 || v12 < 736.0;
    if (!v13 || v10 >= 736.0 && v12 >= 414.0) {
      return 30;
    }
  }
  if ([MEMORY[0x1E4F636F0] isGameCenter]) {
    return 2;
  }
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

+ (NSUInteger)maxNumberOfRecipients
{
  return 3;
}

- (unsigned)rid
{
  return self->_rid;
}

- (void)setRid:(unsigned int)a3
{
  self->_rid = a3;
}

- (void)setMessage:(NSString *)message
{
  uint64_t v6 = message;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[(NSString *)v6 copy];
    objc_super v5 = self->_message;
    self->_message = v4;
  }
}

- (void)prepareForNewRecipients:(id)a3
{
  id v9 = a3;
  if (self->_recipientCount + [v9 count] >= 4)
  {
    objc_super v4 = NSString;
    objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"can't add more than %d recipients", 3);
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKFriendRequestComposeViewController.m"];
    id v7 = [v6 lastPathComponent];
    v8 = [v4 stringWithFormat:@"%@ ([additionalRecipients count] + _recipientCount <= MAX_RECIPIENTS)\n[%s (%s:%d)]", v5, "-[GKFriendRequestComposeViewController prepareForNewRecipients:]", objc_msgSend(v7, "UTF8String"), 154];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v8 format];
  }
  self->_recipientCount += [v9 count];
}

- (void)sendFinishedMessageToDelegateCancelled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(GKFriendRequestComposeViewController *)self composeViewDelegate];
  if (!*MEMORY[0x1E4F63860]) {
    id v6 = (id)GKOSLoggers();
  }
  id v7 = *MEMORY[0x1E4F63868];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63868], OS_LOG_TYPE_DEBUG))
  {
    -[GKFriendRequestComposeViewController sendFinishedMessageToDelegateCancelled:](v3, v7);
    if (!v3) {
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    [v5 friendRequestComposeViewControllerWasCancelled:self];
    goto LABEL_10;
  }
LABEL_8:
  if (objc_opt_respondsToSelector()) {
    [v5 friendRequestComposeViewControllerDidFinish:self];
  }
LABEL_10:
}

- (id)composeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeViewDelegate);

  return WeakRetained;
}

- (void)setComposeViewDelegate:(id)composeViewDelegate
{
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)recipientCount
{
  return self->_recipientCount;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->_recipientCount = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak((id *)&self->_composeViewDelegate);
}

- (void)sendFinishedMessageToDelegateCancelled:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"NO";
  if (a1) {
    v2 = @"YES";
  }
  int v3 = 138412290;
  objc_super v4 = v2;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "SEND FINISHED MESSAGE TO DELEGATE (canceled:%@)", (uint8_t *)&v3, 0xCu);
}

@end