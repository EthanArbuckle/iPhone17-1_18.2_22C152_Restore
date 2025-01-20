@interface SMSApplicationSoundHelper
- (BOOL)_isPlaySoundEnabled;
- (BOOL)_shouldPlayTextTone;
- (BOOL)allowedByScreenTimeToPlayReceiveSoundForChat:(id)a3;
- (BOOL)bulletinSuppressed;
- (BOOL)playTapbackReceivedSoundForMessageInCurrentTranscript:(id)a3;
- (TLAlert)alert;
- (void)_playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4;
- (void)playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4;
- (void)setAlert:(id)a3;
- (void)setBulletinSuppressed:(BOOL)a3;
- (void)stopPlayingAlert;
@end

@implementation SMSApplicationSoundHelper

- (void)stopPlayingAlert
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(SMSApplicationSoundHelper *)self alert];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Requesting stop-alert: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  v5 = [(SMSApplicationSoundHelper *)self alert];
  [v5 stop];

  [(SMSApplicationSoundHelper *)self setAlert:0];
}

- (BOOL)playTapbackReceivedSoundForMessageInCurrentTranscript:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 guid];
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Requesting play-tapback-receive-alert for messageGUID: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (![(SMSApplicationSoundHelper *)self _shouldPlayTextTone])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "User has disabled text tones, via sound preferences", (uint8_t *)&v10, 2u);
      }
      goto LABEL_15;
    }
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (![(SMSApplicationSoundHelper *)self _isPlaySoundEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "User has disabled text tones, via messages settings", (uint8_t *)&v10, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  [v4 associatedMessageType];
  char v7 = IMMessageSoundPlayReceivedAckSound();
LABEL_17:

  return v7;
}

- (BOOL)_shouldPlayTextTone
{
  v2 = objc_msgSend((id)MEMORY[0x192FBA860](@"TLToneManager", @"ToneLibrary"), "sharedToneManager");
  v3 = [v2 currentToneIdentifierForAlertType:2];
  if (v3)
  {
    id v4 = getTLToneIdentifierNone();
    int v5 = [v3 isEqualToString:v4];

    if (v5 && IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "User has selected text tone of None in sound settings, not playing sound", v9, 2u);
      }
    }
    char v7 = v5 ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)allowedByScreenTimeToPlayReceiveSoundForChat:(id)a3
{
  if (a3) {
    return [a3 allowedToShowConversationSync];
  }
  else {
    return 1;
  }
}

- (void)playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(SMSApplicationSoundHelper *)self _isPlaySoundEnabled])
  {
    [(SMSApplicationSoundHelper *)self _playIncomingMessageSoundAndHapticForMessage:v6 messageIsForCurrentTranscript:v4];
  }
  else if (IMOSLoggingEnabled())
  {
    char v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "User has disabled text tones, via messages settings", v8, 2u);
    }
  }
}

- (void)_playIncomingMessageSoundAndHapticForMessage:(id)a3 messageIsForCurrentTranscript:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26 = [v6 guid];
  if (IMOSLoggingEnabled())
  {
    char v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Requesting play-incoming-alert for message.guid: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  uint64_t v8 = (void *)getTLAlertClass_softClass;
  uint64_t v33 = getTLAlertClass_softClass;
  if (!getTLAlertClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v35 = __getTLAlertClass_block_invoke;
    v36 = &unk_1E5620B90;
    v37 = &v30;
    __getTLAlertClass_block_invoke((uint64_t)&buf);
    uint64_t v8 = (void *)v31[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v30, 8);
  if (v9)
  {
    int v10 = [CKEntity alloc];
    v11 = [v6 sender];
    uint64_t v12 = [(CKEntity *)v10 initWithIMHandle:v11];

    v13 = [(CKEntity *)v12 textToneIdentifier];
    v14 = [(CKEntity *)v12 textVibrationIdentifier];
    if (v4)
    {
      v15 = getTLToneIdentifierNone();
      if ([v13 isEqualToString:v15])
      {
        uint64_t v16 = getTLToneIdentifierNone();
      }
      else
      {
        uint64_t v16 = 0;
      }

      v19 = getTLVibrationIdentifierNone();
      if ([v14 isEqualToString:v19])
      {
        uint64_t v20 = getTLVibrationIdentifierNone();
      }
      else
      {
        uint64_t v20 = 0;
      }

      uint64_t v18 = 3;
      v13 = (void *)v16;
      v14 = (void *)v20;
    }
    else
    {
      uint64_t v18 = 2;
    }
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = @"text message";
        if (v4) {
          v22 = @"message in conversation";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "In app play tone and vibration of type: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    v23 = (void *)[objc_alloc(MEMORY[0x1E4FAF5E8]) initWithType:v18];
    [v23 setToneIdentifier:v13];
    [v23 setVibrationIdentifier:v14];
    v24 = [v9 alertWithConfiguration:v23];
    [(SMSApplicationSoundHelper *)self setAlert:v24];

    *(void *)&long long buf = 0;
    objc_initWeak((id *)&buf, self);
    v25 = [(SMSApplicationSoundHelper *)self alert];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke;
    v27[3] = &unk_1E5620B68;
    id v28 = v26;
    objc_copyWeak(&v29, (id *)&buf);
    [v25 playWithCompletionHandler:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)&buf);
  }
  else if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Could not get alert class. No alert played.", (uint8_t *)&buf, 2u);
    }
  }
}

void __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Completed play-alert for message.guid: %@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke_78;
  v9[3] = &unk_1E5620B40;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v12[1] = a2;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(v12);
}

void __104__SMSApplicationSoundHelper__playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript___block_invoke_78(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setAlert:0];

  if (*(void *)(a1 + 56) == 5 && IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      BOOL v4 = *(void **)(a1 + 40);
      if (v4)
      {
        id v6 = [v4 userInfo];
      }
      else
      {
        id v6 = &stru_1EDE4CA38;
      }
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error playing alert for guid [%@]: [%@]", (uint8_t *)&v7, 0x16u);
      if (v4) {
    }
      }
  }
}

- (BOOL)_isPlaySoundEnabled
{
  return *MEMORY[0x1E4F6CA08];
}

- (BOOL)bulletinSuppressed
{
  return self->_bulletinSuppressed;
}

- (void)setBulletinSuppressed:(BOOL)a3
{
  self->_bulletinSuppressed = a3;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (void).cxx_destruct
{
}

@end