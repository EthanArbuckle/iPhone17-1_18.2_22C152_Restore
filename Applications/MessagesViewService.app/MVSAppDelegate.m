@interface MVSAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
@end

@implementation MVSAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v4 = +[IMDaemonController sharedInstance];
  [v4 _setBlocksConnectionAtResume:1];

  v5 = +[IMDaemonController sharedInstance];
  [v5 addListenerID:@"MessagesViewService" capabilities:CKMVCListenerCapabilities()];

  v6 = +[IMDaemonController sharedInstance];
  [v6 blockUntilConnected];

  +[IMServiceImpl iMessageEnabled];
  dispatch_time_t v7 = dispatch_time(0, 0);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_1000040B8);
  return 1;
}

@end