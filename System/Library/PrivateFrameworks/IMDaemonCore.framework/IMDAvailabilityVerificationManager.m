@interface IMDAvailabilityVerificationManager
+ (BOOL)deviceSupportsSubscriptionValidationTokens;
+ (id)availabilityStatusTypeIdentifier;
+ (id)sharedInstance;
- (IMDAvailabilityVerificationManager)init;
- (NSCache)subscriptionValidationTokenByHandleIDCache;
- (OS_dispatch_queue)privateWorkQueue;
- (SKStatusSubscriptionService)availabilitySubscriptionService;
- (id)cachedAvailabilityVerificationTokensForHandleID:(id)a3;
- (void)_inviteSenderHandleID:(id)a3 fromHandleID:(id)a4;
- (void)_validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 fromSender:(id)a5 completion:(id)a6;
- (void)populateCacheWithAvailabilityVerificationTokensForHandleID:(id)a3;
- (void)setAvailabilitySubscriptionService:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3;
- (void)subscriptionInvitationReceived:(id)a3;
- (void)subscriptionReceivedStatusUpdate:(id)a3;
- (void)subscriptionServiceDaemonDisconnected:(id)a3;
- (void)subscriptionStateChanged:(id)a3;
- (void)verifyPersonalSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7;
@end

@implementation IMDAvailabilityVerificationManager

+ (id)sharedInstance
{
  if (qword_1EBE2BA78 != -1) {
    dispatch_once(&qword_1EBE2BA78, &unk_1F3390940);
  }
  v2 = (void *)qword_1EBE2BCD8;

  return v2;
}

- (IMDAvailabilityVerificationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)IMDAvailabilityVerificationManager;
  v2 = [(IMDAvailabilityVerificationManager *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Messages.IMDAvailabilityVerificationManager", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    subscriptionValidationTokenByHandleIDCache = v2->_subscriptionValidationTokenByHandleIDCache;
    v2->_subscriptionValidationTokenByHandleIDCache = v6;

    v8 = [(id)objc_opt_class() availabilityStatusTypeIdentifier];
    uint64_t v9 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKStatusSubscriptionService", @"StatusKit")), "initWithStatusTypeIdentifier:", v8);
    availabilitySubscriptionService = v2->_availabilitySubscriptionService;
    v2->_availabilitySubscriptionService = (SKStatusSubscriptionService *)v9;

    [(SKStatusSubscriptionService *)v2->_availabilitySubscriptionService addDelegate:v2 queue:v2->_privateWorkQueue];
  }
  return v2;
}

+ (id)availabilityStatusTypeIdentifier
{
  id v2 = *(id *)MEMORY[0x1E0169C40]("AKAvailabilityStatusTypeIdentifier", @"AvailabilityKit");

  return v2;
}

- (id)cachedAvailabilityVerificationTokensForHandleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache objectForKey:v4];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        v10 = v5;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Using cached availability verification tokens %@ for message to handleID \"%@\"", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE790();
    }

    [(IMDAvailabilityVerificationManager *)self populateCacheWithAvailabilityVerificationTokensForHandleID:v4];
  }

  return v5;
}

- (void)populateCacheWithAvailabilityVerificationTokensForHandleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache objectForKey:v4];
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Subscription validation tokens %@ is already cached for handleID: \"%@\". Not fetching again", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v6)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Fetching subscription validation token for handle handleID: %@", buf, 0xCu);
      }
    }
    int v9 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKHandle", @"StatusKit")), "initWithString:", v4);
    if (objc_opt_respondsToSelector())
    {
      availabilitySubscriptionService = self->_availabilitySubscriptionService;
      __int16 v11 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1D96D9CD0;
      v15[3] = &unk_1E6B73DE8;
      v15[4] = v4;
      v15[5] = self;
      [(SKStatusSubscriptionService *)availabilitySubscriptionService subscriptionValidationTokensForHandle:v9 completion:v15];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1D98FE7C4();
      }

      uint64_t v13 = self->_availabilitySubscriptionService;
      __int16 v11 = v14;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1D96D9E74;
      v14[3] = &unk_1E6B73E10;
      v14[4] = v4;
      v14[5] = self;
      [(SKStatusSubscriptionService *)v13 subscriptionValidationTokenForHandle:v9 completion:v14];
    }
  }
}

+ (BOOL)deviceSupportsSubscriptionValidationTokens
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "This device will validate subscription validation tokens", v4, 2u);
    }
  }
  return 1;
}

- (void)verifyPersonalSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Received request to validate validation token \"%@\" from senderHandleID \"%@\"", buf, 0x16u);
    }
  }
  if ([(id)objc_opt_class() deviceSupportsSubscriptionValidationTokens])
  {
    [v16 timeIntervalSinceNow];
    if (fabs(v18) <= 300.0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v19 = IMLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1D98FE8D0();
        }
        goto LABEL_19;
      }
      uint64_t v20 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKHandle", @"StatusKit")), "initWithString:", v15);
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1D96DA428;
      v21[3] = &unk_1E6B73E38;
      objc_copyWeak(&v25, (id *)buf);
      id v22 = v12;
      id v23 = v15;
      id v24 = v14;
      [(IMDAvailabilityVerificationManager *)self _validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:v22 encryptionValidationToken:v13 fromSender:v20 completion:v21];

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v27 = 2112;
        id v28 = v15;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Not processing validation token \"%@\" for old message from %@ with date: %@", buf, 0x20u);
      }
LABEL_19:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Skipping validation, this device should not validate tokens", buf, 2u);
    }
    goto LABEL_19;
  }
}

- (void)_validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 fromSender:(id)a5 completion:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_respondsToSelector())
  {
    id v13 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKSubscriptionValidationTokens", @"StatusKit")), "initWithSubscriptionValidationToken:encryptionValidationToken:", v14, v10);
    [(SKStatusSubscriptionService *)self->_availabilitySubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:v13 fromSender:v11 completion:v12];
  }
  else
  {
    [(SKStatusSubscriptionService *)self->_availabilitySubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationToken:v14 fromSender:v11 completion:v12];
  }
}

- (void)_inviteSenderHandleID:(id)a3 fromHandleID:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F6E600];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  [v8 repairSharedFocusStatusFollowingFailedValidationWithHandleID:v7 fromHandleID:v6 completion:&unk_1F3390960];
}

- (void)subscriptionInvitationReceived:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Subscription invitation received, clearing cache. Subscription: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache removeAllObjects];
}

- (void)subscriptionReceivedStatusUpdate:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Subscription received status update, no verification manager action required. Subscription: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)subscriptionStateChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Subscription state changed, clearing cache. Subscription: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache removeAllObjects];
}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Subscription service daemon disconnected, clearing cache, but not reconnecting.", v6, 2u);
    }
  }
  [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache removeAllObjects];
}

- (SKStatusSubscriptionService)availabilitySubscriptionService
{
  return self->_availabilitySubscriptionService;
}

- (void)setAvailabilitySubscriptionService:(id)a3
{
}

- (NSCache)subscriptionValidationTokenByHandleIDCache
{
  return self->_subscriptionValidationTokenByHandleIDCache;
}

- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3
{
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, 0);

  objc_storeStrong((id *)&self->_availabilitySubscriptionService, 0);
}

@end