@interface ReplayerAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)_applicationDidFinishLaunching;
@end

@implementation ReplayerAppDelegate

- (void).cxx_destruct
{
  v2 = self;
  objc_storeStrong((id *)&self->_replayFacility, 0);
  objc_storeStrong((id *)&v2->_window, 0);
  objc_storeStrong((id *)&v2->_replayerViewController, 0);
  v2 = (ReplayerAppDelegate *)((char *)v2 + 8);

  displayDelegate = v2->_context.displayDelegate;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)_applicationDidFinishLaunching
{
  v3 = off_100012238;
  if (os_signpost_enabled((os_log_t)off_100012238))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "MTLReplayer application finished launching!", v13, 2u);
  }
  v4 = objc_alloc_init(ReplayerViewController);
  replayerViewController = self->_replayerViewController;
  self->_replayerViewController = v4;

  id v6 = objc_alloc((Class)UIWindow);
  v7 = +[UIScreen mainScreen];
  [v7 bounds];
  v8 = [v6 initWithFrame:];
  window = self->_window;
  self->_window = v8;

  [(UIWindow *)self->_window setRootViewController:self->_replayerViewController];
  [(UIWindow *)self->_window makeKeyAndVisible];
  if (getenv("GT_HOST_URL_MTL"))
  {
    GTMTLReplayClient_createOldTransport();
  }
  else
  {
    GTMTLReplayClient_createNewTransport();
    v10 = (GTMTLReplayService *)objc_claimAutoreleasedReturnValue();
    replayFacility = self->_replayFacility;
    self->_replayFacility = v10;
  }
  GTMTLReplayClient_setDisplayDelegate();
  v12 = +[UIApplication sharedApplication];
  [v12 setIdleTimerDisabled:1];
}

@end