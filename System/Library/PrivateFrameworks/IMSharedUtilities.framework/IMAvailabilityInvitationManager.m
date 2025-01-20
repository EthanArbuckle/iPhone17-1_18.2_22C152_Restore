@interface IMAvailabilityInvitationManager
+ (id)sharedInstance;
- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3;
- (DNDGlobalConfigurationService)cachedDNDGlobalConfigurationService;
- (IMAvailabilityInvitationManager)init;
- (NSCache)dateAttemptedInvitationByHandleCache;
- (OS_dispatch_queue)dndBackgroundQueue;
- (SKStatusPublishingService)publishingService;
- (id)_dndHandleForHandleID:(id)a3;
- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4;
- (id)_newDNDModeConfigurationService;
- (id)_skHandleForString:(id)a3;
- (id)dndGlobalConfigurationService;
- (void)_invitablityForHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)_invitationPayloadForHandleID:(id)a3 completion:(id)a4;
- (void)_isFocusStatusSharedWithHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)_republishCurrentAvailabilityStatus;
- (void)_sharePersonalAvailabilityWithSKHandle:(id)a3 fromSKHandle:(id)a4 allowingInvitationOfRemovedUsers:(BOOL)a5 completion:(id)a6;
- (void)attemptIfNeccessaryToAutomaticallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:(id)a3;
- (void)isFocusStatusSharedWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)manuallyRemoveSharingOfFocusStatusWithHandleID:(id)a3 completion:(id)a4;
- (void)manuallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)repairSharedFocusStatusFollowingFailedValidationWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5;
- (void)setCachedDNDGlobalConfigurationService:(id)a3;
- (void)setDateAttemptedInvitationByHandleCache:(id)a3;
- (void)setDndBackgroundQueue:(id)a3;
- (void)setPublishingService:(id)a3;
@end

@implementation IMAvailabilityInvitationManager

+ (id)sharedInstance
{
  if (qword_1EB4A6568 != -1) {
    dispatch_once(&qword_1EB4A6568, &unk_1EF2BF040);
  }
  v2 = (void *)qword_1EB4A6000;

  return v2;
}

- (IMAvailabilityInvitationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMAvailabilityInvitationManager;
  v2 = [(IMAvailabilityInvitationManager *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dateAttemptedInvitationByHandleCache = v2->_dateAttemptedInvitationByHandleCache;
    v2->_dateAttemptedInvitationByHandleCache = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.messages.IMAvailabilityInvitationManager.DoNotDisturb", 0);
    dndBackgroundQueue = v2->_dndBackgroundQueue;
    v2->_dndBackgroundQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)attemptIfNeccessaryToAutomaticallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A07993EC;
  v14[3] = &unk_1E5A0FE50;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(IMAvailabilityInvitationManager *)self fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:v14];
}

- (void)repairSharedFocusStatusFollowingFailedValidationWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A0799D78;
  v14[3] = &unk_1E5A0FE50;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(IMAvailabilityInvitationManager *)self fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:v14];
}

- (void)manuallyShareFocusStatusWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Received request to manually share focus status with handleID: %@ fromHandleID: %@.", buf, 0x16u);
    }
  }
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode])
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Not manually sharing focus status while in Apple Store Demo mode.", buf, 2u);
      }
    }
    if (v10) {
      (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A079A838;
    v13[3] = &unk_1E5A0FE50;
    id v16 = v10;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    [(IMAvailabilityInvitationManager *)self fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:v13];
  }
}

- (void)fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:(id)a3
{
  dispatch_queue_t v5 = (void (**)(id, uint64_t))a3;
  v4 = [(IMAvailabilityInvitationManager *)self dndGlobalConfigurationService];
  if (objc_opt_respondsToSelector()) {
    [v4 isCloudSyncActiveWithCompletionHandler:v5];
  }
  else {
    v5[2](v5, [v4 isCloudSyncActive]);
  }
}

- (id)dndGlobalConfigurationService
{
  p_cachedDNDGlobalConfigurationService = &self->_cachedDNDGlobalConfigurationService;
  cachedDNDGlobalConfigurationService = self->_cachedDNDGlobalConfigurationService;
  if (cachedDNDGlobalConfigurationService)
  {
    v4 = cachedDNDGlobalConfigurationService;
  }
  else
  {
    dispatch_queue_t v5 = (void *)MEMORY[0x1A6227910](@"DNDGlobalConfigurationService", @"DoNotDisturb");
    if (v5)
    {
      v4 = [v5 serviceForClientIdentifier:@"com.apple.messages"];
      if (v4)
      {
        objc_storeStrong((id *)p_cachedDNDGlobalConfigurationService, v4);
        v6 = v4;
      }
      else
      {
        id v8 = IMLogHandleForCategory("IMAvailabilityInvitationManager");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1A09EE618();
        }
      }
    }
    else
    {
      v7 = IMLogHandleForCategory("IMAvailabilityInvitationManager");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1A09EE5E4();
      }

      v4 = 0;
    }
  }

  return v4;
}

- (void)manuallyRemoveSharingOfFocusStatusWithHandleID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Received request to manually remove sharing of focus status with handleID: %@", buf, 0xCu);
    }
  }
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Not manually removing sharing focus status while in Apple Store Demo mode.", buf, 2u);
      }
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A079AEA4;
    v10[3] = &unk_1E5A0FEF0;
    id v12 = v7;
    v10[4] = self;
    id v11 = v6;
    [(IMAvailabilityInvitationManager *)self fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion:v10];
  }
}

- (void)_sharePersonalAvailabilityWithSKHandle:(id)a3 fromSKHandle:(id)a4 allowingInvitationOfRemovedUsers:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(IMAvailabilityInvitationManager *)self publishingService];
  id location = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1A079B280;
  v18[3] = &unk_1E5A0FF68;
  id v14 = v10;
  id v19 = v14;
  id v15 = v12;
  BOOL v25 = a5;
  id v23 = v15;
  id v20 = self;
  id v16 = v11;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  objc_copyWeak(&v24, &location);
  [(IMAvailabilityInvitationManager *)self _invitablityForHandle:v14 fromHandle:v16 completion:v18];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

- (void)_invitablityForHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 handleString];
      id v13 = [v9 handleString];
      *(_DWORD *)buf = 138412546;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Checking invitability for handle: %@ fromHandle: %@", buf, 0x16u);
    }
  }
  id v14 = [(IMAvailabilityInvitationManager *)self publishingService];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1A079BAE8;
  v16[3] = &unk_1E5A0FF90;
  id v17 = v10;
  id v15 = v10;
  [v14 fetchHandleInvitability:v8 fromSenderHandle:v9 completion:v16];
}

- (void)isFocusStatusSharedWithHandleID:(id)a3 fromHandleID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(IMAvailabilityInvitationManager *)self _skHandleForString:a3];
  id v10 = [(IMAvailabilityInvitationManager *)self _skHandleForString:v9];

  [(IMAvailabilityInvitationManager *)self _isFocusStatusSharedWithHandle:v11 fromHandle:v10 completion:v8];
}

- (void)_isFocusStatusSharedWithHandle:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v8 handleString];
      id v13 = [v9 handleString];
      *(_DWORD *)buf = 138412546;
      id v23 = v12;
      __int16 v24 = 2112;
      BOOL v25 = v13;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Checking (async) if handle is already invited: %@ fromHandle: %@", buf, 0x16u);
    }
  }
  id v14 = [(IMAvailabilityInvitationManager *)self publishingService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1A079BF18;
  v18[3] = &unk_1E5A0FFB8;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 isHandleInvited:v17 fromSenderHandle:v16 completion:v18];
}

- (void)_invitationPayloadForHandleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1A6227910](@"SKInvitationPayload", @"StatusKit");
  uint64_t v9 = MEMORY[0x1A6227910](@"AKAvailabilityInvitation", @"AvailabilityKit");
  if (v8 && (id v10 = (void *)v9) != 0)
  {
    id location = 0;
    objc_initWeak(&location, self);
    dndBackgroundQueue = self->_dndBackgroundQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A079C340;
    block[3] = &unk_1E5A0FFE0;
    objc_copyWeak(v16, &location);
    id v14 = v6;
    id v15 = v7;
    v16[1] = v10;
    dispatch_async(dndBackgroundQueue, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = IMLogHandleForCategory("IMAvailabilityInvitationManager");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A09EE7F4();
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)_newDNDModeConfigurationService
{
  v2 = (void *)MEMORY[0x1A6227910](@"DNDModeConfigurationService", @"DoNotDisturb");
  if (v2)
  {
    v3 = [v2 serviceForClientIdentifier:@"com.apple.messages"];
    v4 = v3;
    if (v3)
    {
      v4 = v3;
      dispatch_queue_t v5 = v4;
    }
    else
    {
      id v6 = IMLogHandleForCategory("IMAvailabilityInvitationManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09EE92C();
      }

      dispatch_queue_t v5 = 0;
    }
  }
  else
  {
    v4 = IMLogHandleForCategory("IMAvailabilityInvitationManager");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1A09EE8F8();
    }
    dispatch_queue_t v5 = 0;
  }

  return v5;
}

- (void)_republishCurrentAvailabilityStatus
{
  id location = 0;
  objc_initWeak(&location, self);
  dndBackgroundQueue = self->_dndBackgroundQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A079C6D0;
  v4[3] = &unk_1E5A10008;
  objc_copyWeak(&v5, &location);
  dispatch_async(dndBackgroundQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_dndHandleForHandleID:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail()) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = objc_alloc_init((Class)MEMORY[0x1A6227910](@"DNDMutableContactHandle", @"DoNotDisturb"));
  [v5 setType:v4];
  [v5 setValue:v3];

  id v6 = (void *)[v5 copy];

  return v6;
}

- (id)_invitationCacheKeyForHandleID:(id)a3 fromHandleID:(id)a4
{
  uint64_t v4 = &stru_1EF2CAD28;
  if (a3) {
    id v5 = (__CFString *)a3;
  }
  else {
    id v5 = &stru_1EF2CAD28;
  }
  if (a4) {
    uint64_t v4 = (__CFString *)a4;
  }
  return (id)[NSString stringWithFormat:@"%@;%@", v5, v4];
}

- (SKStatusPublishingService)publishingService
{
  publishingService = self->_publishingService;
  if (!publishingService)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1A6227910](@"SKStatusPublishingService", @"StatusKit");
    id v5 = *(id *)MEMORY[0x1A6227920]("AKAvailabilityStatusTypeIdentifier", @"AvailabilityKit");
    id v6 = (SKStatusPublishingService *)[[v4 alloc] initWithStatusTypeIdentifier:v5];
    id v7 = self->_publishingService;
    self->_publishingService = v6;

    publishingService = self->_publishingService;
  }

  return publishingService;
}

- (id)_skHandleForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc((Class)MEMORY[0x1A6227910](@"SKHandle", @"StatusKit")), "initWithString:", v3);

  return v4;
}

- (BOOL)_isHandleIDEligibleToReceiveAutomaticInvitation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[IMAppleStoreHelper isInAppleStoreDemoMode])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Not automatically sharing focus status while in Apple Store Demo mode.", (uint8_t *)&v11, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (MEMORY[0x1A62278A0](v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a business ID, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (MEMORY[0x1A62278D0](v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Handle \"%@\" is a stewie ID, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v7 = +[IMContactStore validateAndCleanupID:v3];
  uint64_t v8 = +[IMContactStore sharedInstance];
  uint64_t v9 = [v8 fetchCNContactForHandleWithID:v7];

  BOOL v5 = +[IMContactStore isCNContactAKnownContact:v9];
  if (!v5 && IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Handle \"%@\" is not in the users contacts, not eligible to receive availability subscription invitation.", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_17:

  return v5;
}

- (void)setPublishingService:(id)a3
{
}

- (NSCache)dateAttemptedInvitationByHandleCache
{
  return self->_dateAttemptedInvitationByHandleCache;
}

- (void)setDateAttemptedInvitationByHandleCache:(id)a3
{
}

- (OS_dispatch_queue)dndBackgroundQueue
{
  return self->_dndBackgroundQueue;
}

- (void)setDndBackgroundQueue:(id)a3
{
}

- (DNDGlobalConfigurationService)cachedDNDGlobalConfigurationService
{
  return self->_cachedDNDGlobalConfigurationService;
}

- (void)setCachedDNDGlobalConfigurationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDNDGlobalConfigurationService, 0);
  objc_storeStrong((id *)&self->_dndBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_dateAttemptedInvitationByHandleCache, 0);

  objc_storeStrong((id *)&self->_publishingService, 0);
}

@end