@interface WebSheetAppDelegate
- (BOOL)canShowAlerts;
- (BOOL)openWiFiPreferencesOnExit;
- (NSString)interfaceName;
- (WSWebSheetViewController)webSheetCont;
- (WebSheetRemoteAlertPresentationViewController)remotePresentationController;
- (id)probeCompleteCompletionHandler;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4;
- (void)handleDismissal;
- (void)handleWebNavigationWithCompletionHandler:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4;
- (void)setInterfaceName:(id)a3;
- (void)setOpenWiFiPreferencesOnExit:(BOOL)a3;
- (void)setProbeCompleteCompletionHandler:(id)a3;
- (void)setRemotePresentationController:(id)a3;
- (void)setWebSheetCont:(id)a3;
@end

@implementation WebSheetAppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  NSLog(@"applicationDidFinishLaunching", a2, a3);
  v4 = (WSWebSheetViewController *)objc_alloc_init((Class)WSWebSheetViewController);
  webSheetCont = self->_webSheetCont;
  self->_webSheetCont = v4;

  objc_storeStrong((id *)&self->_showWebSheetContext.viewCont, self->_webSheetCont);
  objc_storeStrong((id *)&self->_showWebSheetContext.delegate, self);
  if (!CNIAmTheWebsheetApp2())
  {
    NSLog(@"An error occurred when the WebSheet tried to check in.");
    v6 = (void *)UIApp;
    [v6 terminateWithSuccess];
  }
}

- (BOOL)canShowAlerts
{
  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Alert deactivated - terminate", v4, 2u);
  }
  [(WSWebSheetViewController *)self->_webSheetCont dismissViewController:4];
}

- (void)applicationWillTerminate:(id)a3
{
  if (self->_openWiFiPreferencesOnExit)
  {
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    v5 = +[NSURL URLWithString:@"prefs:root=WIFI"];
    [v4 openSensitiveURL:v5 withOptions:0];
  }
  [(WSWebSheetViewController *)self->_webSheetCont dismissViewController:4];
  id v6 = [(WebSheetAppDelegate *)self remotePresentationController];
  [v6 dismissPresentationController:1];
}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  id v10 = a3;
  NSLog(@"handleWebNavigationWithCompletionHandler");
  v4 = [(WebSheetAppDelegate *)self probeCompleteCompletionHandler];

  if (!v4)
  {
    [(WebSheetAppDelegate *)self setProbeCompleteCompletionHandler:v10];
    NSLog(@"dispatching captive probe ...");
    v5 = self;
    id v6 = [(WebSheetAppDelegate *)v5 interfaceName];
    uint64_t v7 = CNProberCreate();

    if (v7)
    {
      RunLoopSource = (__CFRunLoopSource *)CNProberCreateRunLoopSource();
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
    }
    else
    {
      NSLog(@"CNProberCreate failed");
    }
  }
}

- (void)handleDismissal
{
  NSLog(@"handleDismissal", a2);
  id v3 = [(WebSheetAppDelegate *)self remotePresentationController];
  [v3 dismissPresentationController:1];
}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
  if (self->_isCompleteNotificationHandled)
  {
    NSLog(@"complete notification is already handled", a2, a3, a4);
  }
  else
  {
    NSLog(@"handleCompleteNotificationWithRedirectURLtype, result: %ld, redireURLtype: %ld", a2, a4, a3);
    if ((unint64_t)(a3 - 1) < 3) {
      int v7 = a3;
    }
    else {
      int v7 = 0;
    }
    int valuePtr = v7;
    keys = (void *)kCNWebSheetOptionsRedirectURLType;
    values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CNWebsheetNotifyCompleteWithOptions();
    if (a4 == 7)
    {
      v8 = +[UIApplication sharedApplication];
      [v8 setOpenWiFiPreferencesOnExit:1];
    }
    self->_isCompleteNotificationHandled = 1;
  }
}

- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  NSLog(@"scrapeCredentialsUsingPOSTMessage");
  CNScrapeCredentials();
}

- (WSWebSheetViewController)webSheetCont
{
  return self->_webSheetCont;
}

- (void)setWebSheetCont:(id)a3
{
}

- (BOOL)openWiFiPreferencesOnExit
{
  return self->_openWiFiPreferencesOnExit;
}

- (void)setOpenWiFiPreferencesOnExit:(BOOL)a3
{
  self->_openWiFiPreferencesOnExit = a3;
}

- (WebSheetRemoteAlertPresentationViewController)remotePresentationController
{
  return self->_remotePresentationController;
}

- (void)setRemotePresentationController:(id)a3
{
  self->_remotePresentationController = (WebSheetRemoteAlertPresentationViewController *)a3;
}

- (id)probeCompleteCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setProbeCompleteCompletionHandler:(id)a3
{
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_probeCompleteCompletionHandler, 0);
  objc_storeStrong((id *)&self->_webSheetCont, 0);

  sub_1000047B4((uint64_t)&self->_showWebSheetContext);
}

@end