@interface IMTipKitEventReporter
+ (id)sharedInstance;
- (void)sendBiomeSignal:(id)a3;
- (void)sendCoreAnalyticsSilverEvent:(id)a3;
- (void)sendFilterUnknownSenderStateChangedEvent;
- (void)sendINSendMessageIntentEvent;
- (void)sendJunkInboxOpenedEvent;
- (void)sendReceivedJunkEventIfNeeded;
- (void)sendReceivedPhotoEvent;
- (void)sendSavePhotoEvent;
- (void)sendSentMessageEvent;
- (void)sendTapbackSendEvent;
@end

@implementation IMTipKitEventReporter

+ (id)sharedInstance
{
  if (qword_1EB4A6190 != -1) {
    dispatch_once(&qword_1EB4A6190, &unk_1EF2BF760);
  }
  v2 = (void *)qword_1EB4A5E08;

  return v2;
}

- (void)sendFilterUnknownSenderStateChangedEvent
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Filter Unknown Senders state changed", v4, 2u);
    }
  }
  [(IMTipKitEventReporter *)self sendBiomeSignal:@"com.apple.MobileSMS.filter-unknown-sender-state-changed"];
}

- (void)sendJunkInboxOpenedEvent
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Junk inbox opened", v4, 2u);
    }
  }
  [(IMTipKitEventReporter *)self sendBiomeSignal:@"com.apple.MobileSMS.junk-inbox-opened"];
}

- (void)sendReceivedJunkEventIfNeeded
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"com.apple.MobileSMS.user-previously-received-junk-message"];

  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"com.apple.MobileSMS.user-previously-received-junk-message-fus"];

  int v7 = IMGetDomainBoolForKey();
  if (v4 & 1) != 0 || (v7)
  {
    if ((v6 | v7 ^ 1)) {
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Received junk message. Filter unknown senders ON", v12, 2u);
      }
    }
    v9 = @"com.apple.MobileSMS.user-previously-received-junk-message-fus";
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Received junk message. Filter unknown senders OFF", buf, 2u);
      }
    }
    v9 = @"com.apple.MobileSMS.user-previously-received-junk-message";
  }
  [(IMTipKitEventReporter *)self sendBiomeSignal:v9];
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v11 setBool:1 forKey:v9];
}

- (void)sendTapbackSendEvent
{
  [(IMTipKitEventReporter *)self sendBiomeSignal:@"com.apple.MobileSMS.send-tapback"];

  MEMORY[0x1F4181798](self, sel_sendCoreAnalyticsSilverEvent_);
}

- (void)sendSavePhotoEvent
{
}

- (void)sendReceivedPhotoEvent
{
}

- (void)sendSentMessageEvent
{
  id v2 = +[TipsNextEventReporter shared];
  [v2 donateSentMessageEvent];
}

- (void)sendBiomeSignal:(id)a3
{
  v3 = (void *)[a3 copy];
  char v4 = IMBiomeQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A081F7E4;
  block[3] = &unk_1E5A11D40;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)sendCoreAnalyticsSilverEvent:(id)a3
{
}

- (void)sendINSendMessageIntentEvent
{
  id v2 = +[TipsNextEventReporter shared];
  [v2 donateSentINSendMessageIntentEvent];
}

@end