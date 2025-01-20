@interface IMDSoundUtilities
+ (BOOL)_isAcknowledgmentMessage:(id)a3;
+ (BOOL)_isAssociatedMessage:(id)a3;
+ (BOOL)_isAutoPlay:(id)a3;
+ (BOOL)_isSMSMessage:(id)a3;
+ (BOOL)_isSuppressedForGUID:(id)a3;
+ (BOOL)_isUserScheduledMessage:(id)a3;
+ (BOOL)_wasDowngraded:(id)a3;
+ (int64_t)_smsSoundsToPlay;
+ (int64_t)_soundTypeForMessage:(id)a3;
+ (unsigned)_installSystemSound:(id)a3;
+ (void)_playAcknowledgmentSentSound;
+ (void)_playSMSSound;
+ (void)_playSentScheduledMessageSound;
+ (void)_playSoundType:(int64_t)a3;
+ (void)_stopSuppressingForGUID:(id)a3;
+ (void)playMessageSentSoundIfNeeded:(id)a3;
@end

@implementation IMDSoundUtilities

+ (void)playMessageSentSoundIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(id)objc_opt_class() _soundTypeForMessage:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [a3 guid];
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = @"Acknowledgment";
        if (v5 == 1) {
          v8 = @"SMS";
        }
        int v9 = 138412546;
        v10 = v8;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Play message sent sound type: %@, for message: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    [(id)objc_opt_class() _playSoundType:v5];
  }
}

+ (int64_t)_soundTypeForMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 guid];
  int64_t result = [(id)objc_opt_class() _smsSoundsToPlay];
  if (result)
  {
    int64_t v6 = result;
    if ([(id)objc_opt_class() _isUserScheduledMessage:a3])
    {
      uint64_t v7 = [a3 dateEdited];
      int v8 = IMOSLoggingEnabled();
      if (v7)
      {
        if (!v8) {
          return 0;
        }
        int v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        int v13 = 138412290;
        uint64_t v14 = v4;
        v10 = "Suppressing play sound for edited scheduled message[%@]";
        goto LABEL_28;
      }
      if (v8)
      {
        __int16 v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          uint64_t v14 = v4;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Using IMDSoundTypeSentScheduledMessage for message[%@]", (uint8_t *)&v13, 0xCu);
        }
      }
      int64_t v6 = 3;
    }
    if ([(id)objc_opt_class() _isSMSMessage:a3]
      && [(id)objc_opt_class() _wasDowngraded:a3])
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      int v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      int v13 = 138412290;
      uint64_t v14 = v4;
      v10 = "Suppressing play sound for downgraded message[%@]";
      goto LABEL_28;
    }
    if ([(id)objc_opt_class() _isSuppressedForGUID:v4])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          uint64_t v14 = v4;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Suppressing play sound because it was already played [%@]", (uint8_t *)&v13, 0xCu);
        }
      }
      [(id)objc_opt_class() _stopSuppressingForGUID:v4];
      return 0;
    }
    if ([(id)objc_opt_class() _isAssociatedMessage:a3])
    {
      if (![(id)objc_opt_class() _isAcknowledgmentMessage:a3]) {
        return 0;
      }
      int64_t v6 = 2;
    }
    if ([(id)objc_opt_class() _isAutoPlay:a3])
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      int v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      int v13 = 138412290;
      uint64_t v14 = v4;
      v10 = "Suppressing play sound for auto-reply message [%@]";
LABEL_28:
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
      return 0;
    }
    if ([a3 isBeingRetried]) {
      return 0;
    }
    else {
      return v6;
    }
  }
  return result;
}

+ (int64_t)_smsSoundsToPlay
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FAF5F0], "sharedToneManager"), "currentToneIdentifierForAlertType:", 2);
  return [v2 isEqualToString:*MEMORY[0x1E4FAF638]] ^ 1;
}

+ (void)_playSoundType:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v4 = objc_opt_class();
      MEMORY[0x1F4181798](v4, sel__playSentScheduledMessageSound);
      break;
    case 2:
      uint64_t v5 = objc_opt_class();
      MEMORY[0x1F4181798](v5, sel__playAcknowledgmentSentSound);
      break;
    case 1:
      uint64_t v3 = objc_opt_class();
      MEMORY[0x1F4181798](v3, sel__playSMSSound);
      break;
  }
}

+ (unsigned)_installSystemSound:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = (const __CFURL *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", a3, 0);
  SystemSoundID outSystemSoundID = 0;
  OSStatus v5 = AudioServicesCreateSystemSoundID(v4, &outSystemSoundID);
  if (v5)
  {
    unsigned int result = IMOSLoggingEnabled();
    if (result)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      unsigned int result = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
      if (result)
      {
        *(_DWORD *)buf = 138412546;
        id v13 = a3;
        __int16 v14 = 1024;
        OSStatus v15 = v5;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Unable to find a sound action ID for %@  errorResult: %d", buf, 0x12u);
        return 0;
      }
    }
  }
  else
  {
    int inPropertyData = 0;
    OSStatus v8 = AudioServicesSetProperty(0x69737569u, 4u, &outSystemSoundID, 4u, &inPropertyData);
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        int v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v8;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Unable to set property on sound ID   errorResult: %d", buf, 8u);
        }
      }
      unsigned int result = outSystemSoundID;
      if (outSystemSoundID)
      {
        AudioServicesDisposeSystemSoundID(outSystemSoundID);
        return 0;
      }
    }
    else
    {
      return outSystemSoundID;
    }
  }
  return result;
}

+ (void)_playAcknowledgmentSentSound
{
}

+ (void)_playSMSSound
{
}

+ (void)_playSentScheduledMessageSound
{
  if (qword_1EA8CA3E0 != -1) {
    dispatch_once(&qword_1EA8CA3E0, &unk_1F3390700);
  }
  SystemSoundID v2 = dword_1EA8CA3E8;
  if (dword_1EA8CA3E8)
  {
    AudioServicesPlaySystemSound(v2);
  }
}

+ (BOOL)_isSMSMessage:(id)a3
{
  uint64_t v3 = (void *)[a3 service];
  uint64_t v4 = *MEMORY[0x1E4F6E1A0];

  return [v3 isEqualToString:v4];
}

+ (BOOL)_isUserScheduledMessage:(id)a3
{
  return [a3 scheduleType] == 2;
}

+ (BOOL)_wasDowngraded:(id)a3
{
  return ((unint64_t)[a3 flags] >> 19) & 1;
}

+ (BOOL)_isSuppressedForGUID:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (void *)IMGetCachedDomainValueForKey();
  if (!v4) {
    return 0;
  }

  return [v4 containsObject:a3];
}

+ (void)_stopSuppressingForGUID:(id)a3
{
}

+ (BOOL)_isAssociatedMessage:(id)a3
{
  return [a3 associatedMessageGUID] != 0;
}

+ (BOOL)_isAcknowledgmentMessage:(id)a3
{
  return ([a3 associatedMessageType] & 0xFFFFFFFFFFFFFFF8) == 2000;
}

+ (BOOL)_isAutoPlay:(id)a3
{
  return ((unint64_t)[a3 flags] >> 6) & 1;
}

@end