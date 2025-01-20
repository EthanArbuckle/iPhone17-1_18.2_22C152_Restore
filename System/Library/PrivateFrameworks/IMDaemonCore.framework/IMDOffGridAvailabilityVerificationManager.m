@interface IMDOffGridAvailabilityVerificationManager
+ (id)sharedInstance;
- (IMDOffGridAvailabilityVerificationManager)init;
- (NSCache)subscriptionValidationTokenByHandleIDCache;
- (OS_dispatch_queue)privateWorkQueue;
- (SKStatusSubscriptionService)offGridAvailabilitySubscriptionService;
- (id)cachedAvailabilityTokensForHandleID:(id)a3;
- (void)populateCacheForHandleID:(id)a3;
- (void)setOffGridAvailabilitySubscriptionService:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3;
- (void)subscriptionInvitationReceived:(id)a3;
- (void)subscriptionServiceDaemonDisconnected:(id)a3;
- (void)subscriptionStateChanged:(id)a3;
- (void)verifyOffGridSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7;
@end

@implementation IMDOffGridAvailabilityVerificationManager

+ (id)sharedInstance
{
  if (qword_1EBE2BA90 != -1) {
    dispatch_once(&qword_1EBE2BA90, &unk_1F3390EA0);
  }
  v2 = (void *)qword_1EBE2BCE0;

  return v2;
}

- (IMDOffGridAvailabilityVerificationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDOffGridAvailabilityVerificationManager;
  v2 = [(IMDOffGridAvailabilityVerificationManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Messages.IMDOffGridAvailabilityVerificationManager", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKStatusSubscriptionService", @"StatusKit")), "initWithStatusTypeIdentifier:", @"com.apple.offgrid.status");
    offGridAvailabilitySubscriptionService = v2->_offGridAvailabilitySubscriptionService;
    v2->_offGridAvailabilitySubscriptionService = (SKStatusSubscriptionService *)v6;

    [(SKStatusSubscriptionService *)v2->_offGridAvailabilitySubscriptionService addDelegate:v2 queue:v2->_privateWorkQueue];
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    subscriptionValidationTokenByHandleIDCache = v2->_subscriptionValidationTokenByHandleIDCache;
    v2->_subscriptionValidationTokenByHandleIDCache = v8;
  }
  return v2;
}

- (void)populateCacheForHandleID:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKHandle", @"StatusKit")), "initWithString:", v4);
  offGridAvailabilitySubscriptionService = self->_offGridAvailabilitySubscriptionService;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D9723A40;
  v8[3] = &unk_1E6B73DE8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [(SKStatusSubscriptionService *)offGridAvailabilitySubscriptionService subscriptionValidationTokensForHandle:v5 completion:v8];
}

- (id)cachedAvailabilityTokensForHandleID:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_subscriptionValidationTokenByHandleIDCache objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9900428((uint64_t)v4, v6);
    }

    [(IMDOffGridAvailabilityVerificationManager *)self populateCacheForHandleID:v4];
  }

  return v5;
}

- (void)verifyOffGridSubscriptionMatchesSubscriptionValidationToken:(id)a3 encryptionValidationToken:(id)a4 receivedByHandleID:(id)a5 fromHandleID:(id)a6 messageDate:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKHandle", @"StatusKit")), "initWithString:", v12);
  v16 = objc_msgSend(objc_alloc((Class)MEMORY[0x1E0169C30](@"SKSubscriptionValidationTokens", @"StatusKit")), "initWithSubscriptionValidationToken:encryptionValidationToken:", v14, v13);

  offGridAvailabilitySubscriptionService = self->_offGridAvailabilitySubscriptionService;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D9723D1C;
  v20[3] = &unk_1E6B75110;
  id v21 = v12;
  id v22 = v11;
  id v18 = v11;
  id v19 = v12;
  [(SKStatusSubscriptionService *)offGridAvailabilitySubscriptionService validatePersonalStatusSubscriptionMatchesSubscriptionValidationTokens:v16 fromSender:v15 completion:v20];
}

- (void)subscriptionInvitationReceived:(id)a3
{
}

- (void)subscriptionStateChanged:(id)a3
{
}

- (void)subscriptionServiceDaemonDisconnected:(id)a3
{
}

- (SKStatusSubscriptionService)offGridAvailabilitySubscriptionService
{
  return self->_offGridAvailabilitySubscriptionService;
}

- (void)setOffGridAvailabilitySubscriptionService:(id)a3
{
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (NSCache)subscriptionValidationTokenByHandleIDCache
{
  return self->_subscriptionValidationTokenByHandleIDCache;
}

- (void)setSubscriptionValidationTokenByHandleIDCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionValidationTokenByHandleIDCache, 0);
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);

  objc_storeStrong((id *)&self->_offGridAvailabilitySubscriptionService, 0);
}

@end