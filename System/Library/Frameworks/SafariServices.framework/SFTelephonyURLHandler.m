@interface SFTelephonyURLHandler
+ (id)sharedInstance;
- (BOOL)openURLForDialRequest:(id)a3 withScene:(id)a4 completionHandler:(id)a5;
- (NSMutableSet)pendingRequests;
- (SFTelephonyURLHandler)init;
- (void)addObserverForRequest:(id)a3;
- (void)removeObserverForRequest:(id)a3;
- (void)setPendingRequests:(id)a3;
@end

@implementation SFTelephonyURLHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)sharedInstance_handler;

  return v2;
}

void __39__SFTelephonyURLHandler_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SFTelephonyURLHandler);
  v1 = (void *)sharedInstance_handler;
  sharedInstance_handler = (uint64_t)v0;
}

- (SFTelephonyURLHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFTelephonyURLHandler;
  v2 = [(SFTelephonyURLHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v3;
  }
  return v2;
}

- (BOOL)openURLForDialRequest:(id)a3 withScene:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (v10)
    {
      v11 = [[SFTelephonyURLRequest alloc] initWithCompletionHandler:v10];
      v12 = [(SFTelephonyURLRequest *)v11 successNotificationName];
      [v8 setSuccessNotification:v12];

      v13 = [(SFTelephonyURLRequest *)v11 failureNotificationName];
      [v8 setFailureNotification:v13];

      [(SFTelephonyURLHandler *)self addObserverForRequest:v11];
    }
    v14 = [v8 URL];
    [v9 openURL:v14 options:0 completionHandler:0];

    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)addObserverForRequest:(id)a3
{
  id v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_super v6 = [v4 failureNotificationName];
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)dialRequestNotificationHandler, v6, 0, (CFNotificationSuspensionBehavior)1028);

  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  id v8 = [v4 successNotificationName];
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)dialRequestNotificationHandler, v8, 0, (CFNotificationSuspensionBehavior)1028);

  id v9 = [(SFTelephonyURLHandler *)self pendingRequests];
  [v9 addObject:v4];
}

- (void)removeObserverForRequest:(id)a3
{
  id v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_super v6 = [v4 successNotificationName];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, 0);

  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  id v8 = [v4 failureNotificationName];
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);

  id v9 = [(SFTelephonyURLHandler *)self pendingRequests];
  [v9 removeObject:v4];
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end