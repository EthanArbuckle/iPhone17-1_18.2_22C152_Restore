@interface IMSharedMessageSendingUtilities
+ (id)sharedInstance;
- (BOOL)_canSendText;
- (BOOL)_hasSMSCapability;
- (BOOL)_hasSubscriptionPassingTest:(id)a3;
- (BOOL)_isiMessageSupported;
- (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5;
- (BOOL)canSendText;
- (BOOL)isMMSEnabled;
- (BOOL)isMessagingEnabled;
- (BOOL)isRBMEnabled;
- (BOOL)isRBMSupported;
- (BOOL)isRCSEnabled;
- (BOOL)isRichMessagingEnabled;
- (BOOL)isSupportedAttachmentUTI:(id)a3;
- (BOOL)isiMessageEnabled;
- (IMServiceAvailabilityMonitoring)serviceAvailabilityMonitor;
- (IMSharedMessageSendingUtilities)init;
- (id)_allSubscriptions;
- (id)_managedConfigAppAllowlist;
- (int64_t)_maxMMSAttachmentCount;
- (int64_t)_maxMMSMessageByteCount;
- (int64_t)serviceAvailability;
- (void)_updateServiceAvailability;
- (void)dealloc;
- (void)setServiceAvailability:(int64_t)a3;
- (void)setServiceAvailabilityMonitor:(id)a3;
@end

@implementation IMSharedMessageSendingUtilities

- (BOOL)_hasSubscriptionPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(IMSharedMessageSendingUtilities *)self _allSubscriptions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          if ((*((uint64_t (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v13 + 1) + 8 * v9)))
          {
            LOBYTE(v6) = 1;
            return v6;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v7 = v6;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v10 = objc_msgSend(-[IMSharedMessageSendingUtilities _allSubscriptions](self, "_allSubscriptions"), "firstObject");
    v11 = (uint64_t (*)(id, uint64_t))*((void *)a3 + 2);
    LOBYTE(v6) = v11(a3, v10);
  }
  return v6;
}

- (id)_allSubscriptions
{
  v2 = +[IMCTSubscriptionUtilities sharedInstance];

  return (id)MEMORY[0x1F4181798](v2, sel_ctServiceSubscriptions);
}

- (BOOL)isRBMSupported
{
  return [(IMSharedMessageSendingUtilities *)self _hasSubscriptionPassingTest:&unk_1EF2C0200];
}

+ (id)sharedInstance
{
  if (qword_1EB4A66F8 != -1) {
    dispatch_once(&qword_1EB4A66F8, &unk_1EF2BF5E0);
  }
  return (id)qword_1EB4A6660;
}

- (IMSharedMessageSendingUtilities)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMSharedMessageSendingUtilities;
  v2 = [(IMSharedMessageSendingUtilities *)&v4 init];
  if (v2) {
    v2->_serviceAvailabilityMonitor = (IMServiceAvailabilityMonitoring *)objc_alloc_init(IMServiceAvailabilityMonitor);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedMessageSendingUtilities;
  [(IMSharedMessageSendingUtilities *)&v3 dealloc];
}

- (BOOL)_hasSMSCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)_canSendText
{
  if ([(IMSharedMessageSendingUtilities *)self _hasSMSCapability]
    || [(IMSharedMessageSendingUtilities *)self isiMessageEnabled])
  {
    return 1;
  }

  return [(IMSharedMessageSendingUtilities *)self isRCSEnabled];
}

- (void)_updateServiceAvailability
{
  int64_t v3 = [(IMSharedMessageSendingUtilities *)self serviceAvailability];
  unsigned int v4 = [(IMSharedMessageSendingUtilities *)self _canSendText];
  if ([(IMSharedMessageSendingUtilities *)self serviceAvailability] != v4)
  {
    [(IMSharedMessageSendingUtilities *)self setServiceAvailability:v4];
    if (v3 != -1)
    {
      id v6 = (id)[objc_alloc(NSNumber) initWithBool:v4];
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"__kMFMessageComposeViewControllerTextMessageAvailabilityKey", 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"__kMFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification", 0, v5);
    }
  }
}

- (id)_managedConfigAppAllowlist
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];

  return (id)MEMORY[0x1F4181798](v2, sel_effectiveWhitelistedAppBundleIDs);
}

- (BOOL)canSendText
{
  id v3 = [(IMSharedMessageSendingUtilities *)self _managedConfigAppAllowlist];
  if (!v3 || (int v4 = [v3 containsObject:@"com.apple.MobileSMS"]) != 0)
  {
    [(IMSharedMessageSendingUtilities *)self _updateServiceAvailability];
    LOBYTE(v4) = [(IMSharedMessageSendingUtilities *)self serviceAvailability] > 0;
  }
  return v4;
}

- (BOOL)isMMSEnabled
{
  uint64_t v2 = [(IMSharedMessageSendingUtilities *)self serviceAvailabilityMonitor];

  return [(IMServiceAvailabilityMonitoring *)v2 isMMSEnabled];
}

- (BOOL)isiMessageEnabled
{
  uint64_t v2 = [(IMSharedMessageSendingUtilities *)self serviceAvailabilityMonitor];

  return [(IMServiceAvailabilityMonitoring *)v2 isiMessageEnabled];
}

- (BOOL)isRCSEnabled
{
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v3 = [(IMSharedMessageSendingUtilities *)self serviceAvailabilityMonitor];
    return [(IMServiceAvailabilityMonitoring *)v3 isRCSEnabled];
  }
  else
  {
    return [(IMSharedMessageSendingUtilities *)self isMMSEnabled];
  }
}

- (BOOL)isRBMEnabled
{
  int v3 = [(IMSharedMessageSendingUtilities *)self isRBMSupported];
  if (v3)
  {
    int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "messagesAppDomain"), "objectForKey:", @"RCSForBusinessEnabled");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v3) = [v4 BOOLValue];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Reading isRBMEnabled from Carrier Bundle", v7, 2u);
        }
      }
      LOBYTE(v3) = [(IMSharedMessageSendingUtilities *)self _hasSubscriptionPassingTest:&unk_1EF2BE3B8];
    }
  }
  return v3;
}

- (BOOL)isMessagingEnabled
{
  if ([(IMSharedMessageSendingUtilities *)self isMMSEnabled]
    || [(IMSharedMessageSendingUtilities *)self isiMessageEnabled])
  {
    return 1;
  }

  return [(IMSharedMessageSendingUtilities *)self isRCSEnabled];
}

- (BOOL)isRichMessagingEnabled
{
  if ([(IMSharedMessageSendingUtilities *)self isiMessageEnabled]) {
    return 1;
  }

  return [(IMSharedMessageSendingUtilities *)self isRCSEnabled];
}

- (BOOL)isSupportedAttachmentUTI:(id)a3
{
  if ([(IMSharedMessageSendingUtilities *)self isiMessageEnabled]
    || [(IMSharedMessageSendingUtilities *)self isRCSEnabled])
  {
    return 1;
  }
  if ([(IMSharedMessageSendingUtilities *)self isMMSEnabled])
  {
    int v6 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22538]);
    int v7 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22548]) | v6;
    int v8 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22718]);
    BOOL v9 = (v7 | v8 | UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F225F8])) == 0;
  }
  else
  {
    BOOL v9 = UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F226F0]) == 0;
  }
  return !v9;
}

- (BOOL)_isiMessageSupported
{
  uint64_t v2 = [MEMORY[0x1E4F61778] sharedInstance];

  return MEMORY[0x1F4181798](v2, sel_iMessageSupported);
}

- (int64_t)_maxMMSAttachmentCount
{
  return +[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:0 simID:0];
}

- (int64_t)_maxMMSMessageByteCount
{
  return +[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:0 simID:0];
}

- (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  if (![(IMSharedMessageSendingUtilities *)self isMessagingEnabled]) {
    return 0;
  }
  BOOL v9 = [(IMSharedMessageSendingUtilities *)self _isiMessageSupported];
  BOOL v10 = [(IMSharedMessageSendingUtilities *)self isiMessageEnabled];
  BOOL v11 = [(IMSharedMessageSendingUtilities *)self isMMSEnabled];
  BOOL v12 = [(IMSharedMessageSendingUtilities *)self isRCSEnabled];
  BOOL v13 = v9 && v10;
  BOOL v14 = 1;
  if (!v13 && !v12 && v11)
  {
    int64_t v15 = [(IMSharedMessageSendingUtilities *)self _maxMMSAttachmentCount];
    BOOL v14 = v15 == 0;
    if (v15)
    {
      if (v15 >= a4 + a3 + a5 && (a4 < 1 || a5 <= 0))
      {
        float v16 = (double)[(IMSharedMessageSendingUtilities *)self _maxMMSMessageByteCount]
            * 0.95
            / 102400.0;
        float v17 = floorf(v16);
        if (v17 < 1.0) {
          float v17 = 1.0;
        }
        if ((int)v17 >= a3) {
          return 1;
        }
      }
    }
  }
  return v14;
}

- (int64_t)serviceAvailability
{
  return self->_serviceAvailability;
}

- (void)setServiceAvailability:(int64_t)a3
{
  self->_serviceAvailability = a3;
}

- (IMServiceAvailabilityMonitoring)serviceAvailabilityMonitor
{
  return self->_serviceAvailabilityMonitor;
}

- (void)setServiceAvailabilityMonitor:(id)a3
{
}

@end