@interface IMDExposureNotificationManager
+ (id)sharedInstance;
- (BOOL)_bagDisabled;
- (BOOL)_isMessageItemEligibleForEN:(id)a3;
- (id)_allowedDomains;
- (id)_enManager;
- (id)_enTextMessageForMessageBody:(id)a3;
- (id)_enURLsForMessageBody:(id)a3;
- (void)processMessageItemForENURL:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation IMDExposureNotificationManager

+ (id)sharedInstance
{
  if (qword_1EBE2B7F0 != -1) {
    dispatch_once(&qword_1EBE2B7F0, &unk_1F3390DE0);
  }
  if (qword_1EBE2B840 != -1) {
    dispatch_once(&qword_1EBE2B840, &unk_1F3390E00);
  }
  if (qword_1EBE2B910 != -1) {
    dispatch_once(&qword_1EBE2B910, &unk_1F3390E20);
  }
  v2 = (void *)qword_1EBE2B970;

  return v2;
}

- (id)_enManager
{
  if (qword_1EBE2BB38 != -1) {
    dispatch_once(&qword_1EBE2BB38, &unk_1F3390E40);
  }
  v2 = (void *)qword_1EBE2BB30;

  return v2;
}

- (id)_allowedDomains
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"en-push-allow-domains"];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &unk_1F33C5FD0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_bagDisabled
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"en-push-disabled"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_isMessageItemEligibleForEN:(id)a3
{
  id v4 = a3;
  if (-[IMDExposureNotificationManager _bagDisabled](self, "_bagDisabled") || ([v4 isFromMe] & 1) != 0)
  {
    char v5 = 0;
  }
  else
  {
    v6 = [v4 service];
    char v5 = [v6 isEqualToString:*MEMORY[0x1E4F6E1A0]];
  }
  return v5;
}

- (id)_enURLsForMessageBody:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = *MEMORY[0x1E4F6C1D0];
  uint64_t v8 = [v5 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D97231E4;
  v13[3] = &unk_1E6B750C8;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v13);

  v10 = v14;
  id v11 = v9;

  return v11;
}

- (id)_enTextMessageForMessageBody:(id)a3
{
  id v4 = a3;
  if (qword_1EA8CA480 != -1) {
    dispatch_once(&qword_1EA8CA480, &unk_1F3390E80);
  }
  if (qword_1EA8CA478)
  {
    id v5 = [(IMDExposureNotificationManager *)self _enURLsForMessageBody:v4];
    if ([v5 count])
    {
      id v6 = (void *)qword_1EA8CA478;
      uint64_t v7 = [v4 string];
      uint64_t v8 = [v6 textMessageWithMessage:v7 embeddedURLs:v5];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)processMessageItemForENURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = [v6 body];
  if ([(IMDExposureNotificationManager *)self _isMessageItemEligibleForEN:v6] && v8)
  {
    id v9 = [(IMDExposureNotificationManager *)self _enManager];
    if (![v9 exposureNotificationEnabled])
    {
      v7[2](v7, 0);
LABEL_15:

      goto LABEL_16;
    }
    v10 = [(IMDExposureNotificationManager *)self _enTextMessageForMessageBody:v8];
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = sub_1D97235F0;
        v13[3] = &unk_1E6B74730;
        id v14 = v7;
        [v9 verifyTextMessage:v10 completionHandler:v13];

LABEL_14:
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          __int16 v12 = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Running on an old build - unable to run through ENManager", (uint8_t *)&v12, 2u);
        }
      }
    }
    v7[2](v7, 0);
    goto LABEL_14;
  }
  v7[2](v7, 0);
LABEL_16:
}

@end