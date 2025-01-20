@interface IMDAvailabilityAutoReplier
- (BOOL)_audience:(unint64_t)a3 allowsRepliesToChat:(id)a4;
- (BOOL)_chatEligibleForAvailabilityInformation:(id)a3;
- (BOOL)_contactsContainsParticipants:(id)a3;
- (BOOL)_deviceIsPhone;
- (BOOL)_deviceSupportsSMSAutoReplyForChat:(id)a3;
- (BOOL)_deviceSupportsiMessageAutoReply;
- (BOOL)_favoritesContainsParticipants:(id)a3;
- (BOOL)_hasRecentOutgoingMessagesInChat:(id)a3;
- (BOOL)_haveRecentUrgentMessageInGracePeriodForChat:(id)a3;
- (BOOL)_haveRecentlySentUnavailabilityAutoReplyMessageToChat:(id)a3;
- (BOOL)_isInDrivingFocus;
- (BOOL)_isSMSChat:(id)a3;
- (BOOL)_localDeviceHasSIMMatchingChat:(id)a3;
- (BOOL)_messageIsSOS:(id)a3;
- (BOOL)_messageItemSupportsBreakthroughNotification:(id)a3;
- (BOOL)_messageSenderEligibleToReceiveAvailabilityInformation:(id)a3;
- (BOOL)_shouldIgnoreDoNotDisturbForMessages:(id)a3 inChat:(id)a4;
- (BOOL)_shouldSendTextAutoReplyForChat:(id)a3;
- (BOOL)_sosTransportValidForMessage:(id)a3;
- (BOOL)_sosURLMatchInText:(id)a3;
- (BOOL)_userIsAvailableToHandle:(id)a3;
- (CARAutomaticDNDStatus)automaticDNDStatus;
- (IMDAutoReplyDelegate)replyDelegate;
- (IMDAvailabilityAutoReplier)init;
- (OS_dispatch_queue)privateWorkQueue;
- (id)_autoReplyMessageTextWithUrgentBreakthroughInstructions:(BOOL)a3;
- (id)_customizedAutoReplyMessage;
- (id)_dndHandleForIMDHandle:(id)a3;
- (id)_messageGuidsForMessages:(id)a3;
- (id)_messageItemsSupportingAvailabilityReplyFromItems:(id)a3;
- (id)_messageItemsSupportingBreakthroughNotifications:(id)a3;
- (id)_stringForAutoReplyAudience:(unint64_t)a3;
- (unint64_t)_autoReplyAudience;
- (void)_processMessagesForAvailabilityAutoReply:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5;
- (void)_sendDeliveredQuietelyForMessages:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5;
- (void)_sendTextAutoReplyIfNecessaryForMessages:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4 inChat:(id)a5;
- (void)_sendTextAutoReplyToChat:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4;
- (void)iterateRecentMessagesInChat:(id)a3 withBlock:(id)a4;
- (void)processMessages:(id)a3 inChat:(id)a4 fromIDSID:(id)a5;
- (void)setAutomaticDNDStatus:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setReplyDelegate:(id)a3;
@end

@implementation IMDAvailabilityAutoReplier

- (IMDAvailabilityAutoReplier)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMDAvailabilityAutoReplier;
  v2 = [(IMDAvailabilityAutoReplier *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.IMDAvailabilityAutoReplier", 0);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v3;

    v5 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)MEMORY[0x1E0169C30](@"CARAutomaticDNDStatus", @"CarKit"));
    automaticDNDStatus = v2->_automaticDNDStatus;
    v2->_automaticDNDStatus = v5;
  }
  return v2;
}

- (void)processMessages:(id)a3 inChat:(id)a4 fromIDSID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  privateWorkQueue = self->_privateWorkQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9744AA8;
  v15[3] = &unk_1E6B75928;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(privateWorkQueue, v15);
}

- (void)_processMessagesForAvailabilityAutoReply:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IMDAvailabilityAutoReplier *)self _chatEligibleForAvailabilityInformation:v10])
  {
    v11 = [v10 participants];
    id v12 = [v11 firstObject];

    if ([(IMDAvailabilityAutoReplier *)self _messageSenderEligibleToReceiveAvailabilityInformation:v12])
    {
      id v13 = [(IMDAvailabilityAutoReplier *)self _messageItemsSupportingBreakthroughNotifications:v8];
      BOOL v14 = [(IMDAvailabilityAutoReplier *)self _shouldIgnoreDoNotDisturbForMessages:v13 inChat:v10];
      int v15 = IMOSLoggingEnabled();
      if (v14)
      {
        if (v15)
        {
          id v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Message items should break through do not disturb, sending did notify recipient receipt, and triggering urgent notifications", buf, 2u);
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
        [WeakRetained autoReplier:self sendNotifyRecipientCommandForMessages:v13 inChat:v10];

        id v18 = [(IMDAvailabilityAutoReplier *)self _messageGuidsForMessages:v13];
        id v19 = objc_loadWeakRetained((id *)&self->_replyDelegate);
        [v19 autoReplier:self receivedUrgentRequestForMessages:v18];
      }
      else
      {
        if (v15)
        {
          v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Message items did not break through do not disturb, attempting to send unavailability receipt or SMS message", v23, 2u);
          }
        }
        id v18 = [(IMDAvailabilityAutoReplier *)self _messageItemsSupportingAvailabilityReplyFromItems:v8];
        if ([v18 count])
        {
          [(IMDAvailabilityAutoReplier *)self _sendDeliveredQuietelyForMessages:v18 forIncomingMessageFromIDSID:v9 inChat:v10];
        }
        else if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "No message items support availability reply, ending processing", v22, 2u);
          }
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_27:

        goto LABEL_28;
      }
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Message sender not eligible for availability reply or dnd breakthrough", v25, 2u);
      }
    }

    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Chat is not eligible for availability auto replies or dnd breakthrough", v26, 2u);
    }
    goto LABEL_27;
  }
LABEL_28:
}

- (BOOL)_userIsAvailableToHandle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E0169C30](@"DNDModeConfigurationService", @"DoNotDisturb");
  if ([v5 instancesRespondToSelector:sel_isLocalUserAvailableForContactInActiveMode_error_])
  {
    v6 = [v5 serviceForClientIdentifier:@"com.apple.messages"];
    v7 = [(IMDAvailabilityAutoReplier *)self _dndHandleForIMDHandle:v4];
    id v11 = 0;
    LOBYTE(v8) = [v6 isLocalUserAvailableForContactInActiveMode:v7 error:&v11];
    id v9 = v11;
    if (v9)
    {
      id v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1D9901380();
      }

      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LODWORD(v8) = IMGetDomainBoolForKeyWithDefaultValue() ^ 1;
  }

  return (char)v8;
}

- (id)_dndHandleForIMDHandle:(id)a3
{
  dispatch_queue_t v3 = [a3 ID];
  if (IMStringIsEmail()) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = objc_alloc_init((Class)MEMORY[0x1E0169C30](@"DNDMutableContactHandle", @"DoNotDisturb"));
  [v5 setType:v4];
  [v5 setValue:v3];
  v6 = (void *)[v5 copy];

  return v6;
}

- (BOOL)_chatEligibleForAvailabilityInformation:(id)a3
{
  id v3 = a3;
  if ([v3 style] == 45)
  {
    if ([v3 isBusinessChat])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          __int16 v13 = 0;
          id v5 = "Not processing possible availability reply for business chat";
          v6 = (uint8_t *)&v13;
LABEL_9:
          _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      if ([v3 isStewieChat])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_11;
        }
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        __int16 v12 = 0;
        id v5 = "Not processing possible availability reply for stewie chat";
        v6 = (uint8_t *)&v12;
        goto LABEL_9;
      }
      id v9 = [v3 participants];
      uint64_t v10 = [v9 count];

      if (v10 == 1)
      {
        BOOL v7 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v4 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        __int16 v11 = 0;
        id v5 = "Not processing possible availability reply for chat with more than one participant";
        v6 = (uint8_t *)&v11;
        goto LABEL_9;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "Not processing possible availability reply for non 1-1 chat";
      v6 = buf;
      goto LABEL_9;
    }
LABEL_10:
  }
LABEL_11:
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)_messageSenderEligibleToReceiveAvailabilityInformation:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 ID];
  if (![v5 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not processing possible availability reply for sender with zero length handle", v13, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_18;
  }
  v14[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  int v7 = IMDAreAllAliasesUnknown();

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not processing possible availability reply for sender who is not a contact", v13, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v10 = [(IMDAvailabilityAutoReplier *)self _userIsAvailableToHandle:v4];
  if (v10 && IMOSLoggingEnabled())
  {
    __int16 v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not processing possible availability reply, DND framework says we should appear available to this user", v13, 2u);
    }
  }
  BOOL v9 = !v10;
LABEL_18:

  return v9;
}

- (id)_messageItemsSupportingAvailabilityReplyFromItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v9, "isAvailabilityReplySupported", (void)v17))
        {
          [v4 addObject:v9];
        }
        else if (IMOSLoggingEnabled())
        {
          BOOL v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Message item does not support availability reply", buf, 2u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [v5 count];
  if (v11 != [v4 count] && IMOSLoggingEnabled())
  {
    __int16 v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v5 count];
      uint64_t v14 = [v4 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v22 = v13;
      __int16 v23 = 2048;
      uint64_t v24 = v14;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Reducing messages to process for availability reply from %ld messages to %ld messages.", buf, 0x16u);
    }
  }
  int v15 = objc_msgSend(v4, "copy", (void)v17);

  return v15;
}

- (void)_sendDeliveredQuietelyForMessages:(id)a3 forIncomingMessageFromIDSID:(id)a4 inChat:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IMDAvailabilityAutoReplier *)self _isSMSChat:v10])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not sending delivered quietely receipts in SMS chat", buf, 2u);
      }
    }
    [(IMDAvailabilityAutoReplier *)self _sendTextAutoReplyIfNecessaryForMessages:v8 withUrgentBreakthroughInstructions:1 inChat:v10];
  }
  else
  {
    __int16 v12 = [(IMDAvailabilityAutoReplier *)self _messageGuidsForMessages:v8];
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Requesting delivered quietely receipt be sent to message guids: %@", buf, 0xCu);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D9745900;
    v15[3] = &unk_1E6B75950;
    objc_copyWeak(&v18, (id *)buf);
    id v16 = v8;
    id v17 = v10;
    [WeakRetained autoReplier:self sendDeliveredQuietlyReceiptForMessages:v16 forIncomingMessageFromIDSID:v9 inChat:v17 withWillSendToDestinationsHandler:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_sendTextAutoReplyIfNecessaryForMessages:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4 inChat:(id)a5
{
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(IMDAvailabilityAutoReplier *)self _shouldSendTextAutoReplyForChat:v9];
  int v11 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v11)
    {
      __int16 v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v9 guid];
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Sending text auto reply to chat: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    [(IMDAvailabilityAutoReplier *)self _sendTextAutoReplyToChat:v9 withUrgentBreakthroughInstructions:v6];
  }
  else if (v11)
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v9 guid];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Not sending text auto reply to chat: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)_deviceIsPhone
{
  v2 = [MEMORY[0x1E4F61740] sharedInstance];
  BOOL v3 = [v2 deviceType] == 2;

  return v3;
}

- (BOOL)_deviceSupportsiMessageAutoReply
{
  BOOL v2 = [(IMDAvailabilityAutoReplier *)self _deviceIsPhone];
  if (!v2 && IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Device does not support iMessage auto reply becuase it is not an iPhone", v5, 2u);
    }
  }
  return v2;
}

- (BOOL)_localDeviceHasSIMMatchingChat:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E668] sharedInstance];
  int v5 = [v4 deviceSupportsMultipleSubscriptions];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F6E668] sharedInstance];
    uint64_t v7 = [v6 ctServiceSubscriptions];

    id v8 = [v3 lastAddressedSIMID];
    if ([v8 length])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) labelID];
            if ([v13 length] && objc_msgSend(v8, "isEqualToString:", v13))
            {

              LOBYTE(v10) = 1;
              goto LABEL_24;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1D99013E8(v9);
      }
      LOBYTE(v10) = 0;
    }
LABEL_24:
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F61740] sharedInstance];
    int v15 = [v14 supportsSMS];

    if (v15)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Device does not support SMS auto reply becuase it does not support SMS", v18, 2u);
        }
      }
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (BOOL)_deviceSupportsSMSAutoReplyForChat:(id)a3
{
  id v4 = a3;
  if (![(IMDAvailabilityAutoReplier *)self _deviceIsPhone])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        uint64_t v7 = "SMS auto reply not supported becuase device is not an iPhone";
        id v8 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
      }
LABEL_11:
    }
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  if (![(IMDAvailabilityAutoReplier *)self _localDeviceHasSIMMatchingChat:v4])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        uint64_t v7 = "SMS auto reply not supported becuase local device does not have a SIM matching the last addressed SIM ID";
        id v8 = (uint8_t *)&v10;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v5 = 1;
LABEL_13:

  return v5;
}

- (BOOL)_isInDrivingFocus
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v2 = objc_msgSend((id)MEMORY[0x1E0169C30](@"DNDStateService", @"DoNotDisturb"), "serviceForClientIdentifier:", @"com.apple.messages");
  id v17 = 0;
  id v3 = [v2 queryCurrentStateWithError:&v17];
  id v4 = v17;
  if (!v4)
  {
    if (!v3)
    {
      BOOL v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1D990142C(v5);
      }
      goto LABEL_4;
    }
    id v8 = [v3 activeModeConfiguration];
    BOOL v5 = v8;
    if (!v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "DND active mode configuraiton is nil", buf, 2u);
        }
      }
      goto LABEL_4;
    }
    id v9 = [v8 mode];
    __int16 v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 semanticType];
      int v12 = IMOSLoggingEnabled();
      if (v11 == 2)
      {
        if (v12)
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Driving focus is active", buf, 2u);
          }
        }
        BOOL v6 = 1;
        goto LABEL_30;
      }
      if (v12)
      {
        int v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Driving focus is not active, current focus semantic type is %ld", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "DND mode is nil", buf, 2u);
      }
    }
    BOOL v6 = 0;
LABEL_30:

    goto LABEL_5;
  }
  BOOL v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1D9901470();
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_5:

  return v6;
}

- (BOOL)_haveRecentlySentUnavailabilityAutoReplyMessageToChat:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [v5 dateByAddingTimeInterval:-3600.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D97463C8;
  v9[3] = &unk_1E6B75978;
  id v7 = v6;
  id v10 = v7;
  uint64_t v11 = &v13;
  uint64_t v12 = 500;
  [(IMDAvailabilityAutoReplier *)self iterateRecentMessagesInChat:v4 withBlock:v9];
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (id)_messageItemsSupportingBreakthroughNotifications:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (-[IMDAvailabilityAutoReplier _messageItemSupportsBreakthroughNotification:](self, "_messageItemSupportsBreakthroughNotification:", v10, (void)v18))
        {
          [v5 addObject:v10];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Message item does not support breakthrough notification", buf, 2u);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v6 count];
  if (v12 != [v5 count] && IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v6 count];
      uint64_t v15 = [v5 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Reducing messages to process for breakthrough notifications from %ld messages to %ld messages.", buf, 0x16u);
    }
  }
  char v16 = objc_msgSend(v5, "copy", (void)v18);

  return v16;
}

- (BOOL)_messageItemSupportsBreakthroughNotification:(id)a3
{
  id v3 = a3;
  if ([v3 isFromMe])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        id v5 = "Not processing possible dnd breakthrough for message from me";
        id v6 = (uint8_t *)&v15;
LABEL_29:
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else if ([v3 isEmpty])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = 0;
        id v5 = "Not processing possible dnd breakthrough for empty message";
        id v6 = (uint8_t *)&v14;
        goto LABEL_29;
      }
LABEL_30:
    }
  }
  else if ([v3 isTypingMessage])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = 0;
        id v5 = "Not processing possible dnd breakthrough for typing message";
        id v6 = (uint8_t *)&v13;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if ([v3 isLocatingMessage])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = 0;
        id v5 = "Not processing possible dnd breakthrough for locating message";
        id v6 = (uint8_t *)&v12;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if ([v3 isAutoReply])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        id v5 = "Not processing possible dnd breakthrough for auto reply message";
        id v6 = (uint8_t *)&v11;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if ([v3 isUnfinished])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v5 = "Not processing possible dnd breakthrough for unfinished message";
        id v6 = (uint8_t *)&v10;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else
  {
    if (![v3 isSystemMessage])
    {
      BOOL v7 = 1;
      goto LABEL_32;
    }
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = 0;
        id v5 = "Not processing possible dnd breakthrough for system message";
        id v6 = (uint8_t *)&v9;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  BOOL v7 = 0;
LABEL_32:

  return v7;
}

- (id)_messageGuidsForMessages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "guid", (void)v13);
        if ([v10 length]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  __int16 v11 = (void *)[v4 copy];

  return v11;
}

- (BOOL)_shouldIgnoreDoNotDisturbForMessages:(id)a3 inChat:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  if (![v6 count])
  {
LABEL_27:
    BOOL v18 = 0;
    goto LABEL_38;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v7);
      }
      __int16 v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (([v11 isFromMe] & 1) == 0 && objc_msgSend(v11, "didNotifyRecipient"))
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_36;
        }
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Message is flagged to notify recipient, should ignore do not disturb", buf, 2u);
        }
        goto LABEL_35;
      }
      if ([v11 hasLegacyUrgentTriggerMatchInText])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_36;
        }
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Message has a legacy urgent trigger text, should ignore do not disturb", buf, 2u);
        }
LABEL_35:

        goto LABEL_36;
      }
      __int16 v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      char v13 = [v12 isSOSAlertingEnabled];

      if ((v13 & 1) == 0 && [(IMDAvailabilityAutoReplier *)self _messageIsSOS:v11])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_36;
        }
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Message is SOS, should ignore do not disturb", buf, 2u);
        }
        goto LABEL_35;
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_14:

  BOOL v14 = [(IMDAvailabilityAutoReplier *)self _haveRecentUrgentMessageInGracePeriodForChat:v20];
  int v15 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (v15)
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Messages are not urgent, will not break though do not disturb", buf, 2u);
      }
    }
    goto LABEL_27;
  }
  if (v15)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Message received in chat that is in an urgent message grace period, should ignore do not disturb", buf, 2u);
    }
LABEL_36:
  }
  BOOL v18 = 1;
LABEL_38:

  return v18;
}

- (BOOL)_haveRecentUrgentMessageInGracePeriodForChat:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1D9747404;
  v10[4] = sub_1D9747414;
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [v5 dateByAddingTimeInterval:-480.0];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = 8;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Determining if we should alert for this message by checking if we are in an urgent message grace period. Looking for received urgent messages in the last %ld minutes.", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D974741C;
  v9[3] = &unk_1E6B759A0;
  void v9[4] = v10;
  v9[5] = &v12;
  v9[6] = 0x407E000000000000;
  [(IMDAvailabilityAutoReplier *)self iterateRecentMessagesInChat:v4 withBlock:v9];
  BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)iterateRecentMessagesInChat:(id)a3 withBlock:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 style] == 45)
  {
    uint64_t v18 = [v5 chatIdentifier];
    uint64_t v17 = [v5 serviceName];
    if (v18 && v17)
    {
      v62[0] = v18;
      BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
      v61 = v17;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v57 = 0x3032000000;
      v58 = sub_1D9747404;
      v59 = sub_1D9747414;
      id v60 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D9747EDC;
      aBlock[3] = &unk_1E6B759C8;
      p_long long buf = &buf;
      id v19 = v7;
      id v52 = v19;
      id v20 = v8;
      id v53 = v20;
      uint64_t v55 = 5;
      block = (void (**)(void))_Block_copy(aBlock);
      if ([MEMORY[0x1E4F29060] isMainThread]) {
        block[2]();
      }
      else {
        dispatch_sync(MEMORY[0x1E4F14428], block);
      }
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x3032000000;
      v44 = sub_1D9747404;
      v45 = sub_1D9747414;
      id v46 = 0;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      do
      {
        uint64_t v12 = (void *)v42[5];
        v42[5] = 0;

        char v13 = *(void **)(*((void *)&buf + 1) + 40);
        v37[0] = v11;
        v37[1] = 3221225472;
        v37[2] = sub_1D9747F50;
        v37[3] = &unk_1E6B759F0;
        id v38 = v6;
        v39 = &v47;
        v40 = &v41;
        [v13 enumerateObjectsWithOptions:2 usingBlock:v37];
        if ([(id)v42[5] length])
        {
          if (!*((unsigned char *)v48 + 24))
          {
            uint64_t v31 = 0;
            v32 = &v31;
            uint64_t v33 = 0x2020000000;
            char v34 = 1;
            v29[0] = 0;
            v29[1] = v29;
            v29[2] = 0x2020000000;
            char v30 = 1;
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = sub_1D9748018;
            v21[3] = &unk_1E6B75A18;
            long long v24 = &buf;
            id v22 = v19;
            id v23 = v20;
            long long v25 = &v41;
            uint64_t v26 = &v31;
            uint64_t v27 = v29;
            uint64_t v28 = 10;
            uint64_t v14 = (void (**)(void))_Block_copy(v21);
            if ([MEMORY[0x1E4F29060] isMainThread]) {
              v14[2](v14);
            }
            else {
              dispatch_sync(MEMORY[0x1E4F14428], v14);
            }
            if (!*((unsigned char *)v32 + 24) || ![*(id *)(*((void *)&buf + 1) + 40) count]) {
              *((unsigned char *)v48 + 24) = 1;
            }

            _Block_object_dispose(v29, 8);
            _Block_object_dispose(&v31, 8);
          }
        }
        else
        {
          char v15 = IMLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1D99014D8(&v35, v36, v15);
          }

          *((unsigned char *)v48 + 24) = 1;
        }
      }
      while (!*((unsigned char *)v48 + 24));
      _Block_object_dispose(&v41, 8);

      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Chat is missing identifier or service: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Not checking grace period for non 1-1 chat", (uint8_t *)&buf, 2u);
    }
  }
}

- (BOOL)_isSMSChat:(id)a3
{
  id v3 = [a3 serviceName];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  return v4;
}

- (id)_autoReplyMessageTextWithUrgentBreakthroughInstructions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(IMDAvailabilityAutoReplier *)self _customizedAutoReplyMessage];
  BOOL v7 = [v6 stringByRemovingWhitespace];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:0];
    [v5 addObject:v9];
  }
  if (v3)
  {
    __int16 v10 = IMDaemonCoreBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"(I’m not receiving notifications. If this is urgent, reply “urgent” to send a notification through with your original message.)", &stru_1F3398578, @"DaemonCoreLocalizable" value table];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:0];
    [v5 addObject:v12];
  }
  char v13 = (void *)[v5 copy];

  return v13;
}

- (void)_sendTextAutoReplyToChat:(id)a3 withUrgentBreakthroughInstructions:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(IMDAvailabilityAutoReplier *)self _autoReplyMessageTextWithUrgentBreakthroughInstructions:v4];
  uint64_t v8 = [v7 count];
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      __int16 v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v7 count];
        uint64_t v12 = [v6 guid];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v26 = v11;
        __int16 v27 = 2112;
        uint64_t v28 = v12;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Sending %ld auto-reply messages to chat: %@", buf, 0x16u);
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);
          objc_msgSend(WeakRetained, "autoReplier:generatedAutoReplyText:forChat:", self, v17, v6, (void)v20);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else if (v9)
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "No sending auto-reply because no message text was available to send", buf, 2u);
    }
  }
}

- (BOOL)_shouldSendTextAutoReplyForChat:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IMDAvailabilityAutoReplier *)self _isInDrivingFocus])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Device is not in driving focus, not sending text auto reply", (uint8_t *)&v12, 2u);
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ([(IMDAvailabilityAutoReplier *)self _isSMSChat:v4])
  {
    if (![(IMDAvailabilityAutoReplier *)self _deviceSupportsSMSAutoReplyForChat:v4])goto LABEL_4; {
  }
    }
  else if (![(IMDAvailabilityAutoReplier *)self _deviceSupportsiMessageAutoReply])
  {
LABEL_4:
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "This device does not support text auto reply", (uint8_t *)&v12, 2u);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (![(IMDAvailabilityAutoReplier *)self _haveRecentlySentUnavailabilityAutoReplyMessageToChat:v4])
  {
    unint64_t v8 = [(IMDAvailabilityAutoReplier *)self _autoReplyAudience];
    int v9 = [(IMDAvailabilityAutoReplier *)self _stringForAutoReplyAudience:v8];
    BOOL v6 = [(IMDAvailabilityAutoReplier *)self _audience:v8 allowsRepliesToChat:v4];
    int v10 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v10)
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = 134218242;
          unint64_t v13 = v8;
          __int16 v14 = 2112;
          uint64_t v15 = v9;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Auto reply audience preference matches this chat. Audience %ld=%@", (uint8_t *)&v12, 0x16u);
        }
LABEL_28:
      }
    }
    else if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 134218242;
        unint64_t v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Not sending auto reply becuase the user auto reply audience preference does not match this chat. Audience %ld=%@", (uint8_t *)&v12, 0x16u);
      }
      goto LABEL_28;
    }

    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "We have already sent a recent text auto reply, not auto-replying again.", (uint8_t *)&v12, 2u);
    }
    goto LABEL_17;
  }
LABEL_18:
  BOOL v6 = 0;
LABEL_19:

  return v6;
}

- (id)_stringForAutoReplyAudience:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E6B75A88[a3];
  }
}

- (unint64_t)_autoReplyAudience
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v4 = [(IMDAvailabilityAutoReplier *)self automaticDNDStatus];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  unint64_t v13 = sub_1D97489B0;
  __int16 v14 = &unk_1E6B75A40;
  uint64_t v16 = &v17;
  id v5 = v3;
  uint64_t v15 = v5;
  [v4 allowedAutoReplyAudience:&v11];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v6 = -[IMDAvailabilityAutoReplier _stringForAutoReplyAudience:](self, "_stringForAutoReplyAudience:", v18[3], v11, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v18[3];
      *(_DWORD *)long long buf = 134218242;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      long long v24 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Auto-reply audience is %ld=%@", buf, 0x16u);
    }
  }
  unint64_t v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (id)_customizedAutoReplyMessage
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1D9747404;
  long long v21 = sub_1D9747414;
  id v22 = 0;
  id v4 = [(IMDAvailabilityAutoReplier *)self automaticDNDStatus];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  unint64_t v13 = sub_1D9748C70;
  __int16 v14 = &unk_1E6B75A68;
  uint64_t v16 = &v17;
  id v5 = v3;
  uint64_t v15 = v5;
  [v4 autoReplyMessageWithReply:&v11];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v6 = objc_msgSend((id)v18[5], "stringByRemovingWhitespace", v11, v12, v13, v14);
  [v6 length];

  uint64_t v7 = [(id)v18[5] length];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      BOOL v24 = v7 != 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Is using customized auto reply message: %ld", buf, 0xCu);
    }
  }
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v9;
}

- (BOOL)_audience:(unint64_t)a3 allowsRepliesToChat:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(v6, "participants", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) ID];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v9);
  }

  switch(a3)
  {
    case 2uLL:
      BOOL v13 = [(IMDAvailabilityAutoReplier *)self _contactsContainsParticipants:v7];
      goto LABEL_14;
    case 3uLL:
      BOOL v13 = [(IMDAvailabilityAutoReplier *)self _hasRecentOutgoingMessagesInChat:v6];
      goto LABEL_14;
    case 4uLL:
      BOOL v13 = [(IMDAvailabilityAutoReplier *)self _favoritesContainsParticipants:v7];
LABEL_14:
      BOOL v14 = v13;
      goto LABEL_16;
  }
  BOOL v14 = 0;
LABEL_16:
  uint64_t v15 = [(IMDAvailabilityAutoReplier *)self _stringForAutoReplyAudience:a3];
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218498;
      unint64_t v23 = a3;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      BOOL v27 = v14;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Audience %ld=%@ allows replies: %ld", buf, 0x20u);
    }
  }
  return v14;
}

- (BOOL)_contactsContainsParticipants:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v19 = v7;
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v19, 1, (void)v13);
        int v9 = IMDAreAllAliasesUnknown();

        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v18 = v7;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Participant %@ is not in contacts", buf, 0xCu);
            }
          }
          BOOL v10 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)_favoritesContainsParticipants:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F6BEF8];
    *(void *)&long long v5 = 138412546;
    long long v19 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v28 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = v28;
        BOOL v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1, v19, (void)v20);
        uint64_t v11 = IMDCNRecordIDForAliases();

        uint64_t v12 = [v11 objectForKey:v9];
        long long v13 = v12;
        if (!v12 || ([v12 isEqualToString:v7] & 1) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v25 = v9;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Participant %@ is not a contact, and cannot be a favorite", buf, 0xCu);
            }
          }
LABEL_21:

          BOOL v16 = 0;
          goto LABEL_23;
        }
        unsigned int v14 = IMDIsFavoritedContact();
        if (IMOSLoggingEnabled())
        {
          long long v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v19;
            uint64_t v25 = v9;
            __int16 v26 = 2048;
            uint64_t v27 = v14;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Participant %@ is a favorite?: %ld", buf, 0x16u);
          }

          if ((v14 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else if (!v14)
        {
          goto LABEL_21;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v29 count:16];
      BOOL v16 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_23:

  return v16;
}

- (BOOL)_hasRecentOutgoingMessagesInChat:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 lastSentMessageDate];
  if (v4)
  {
    long long v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    if ([v5 isDateInToday:v4]) {
      int v6 = 1;
    }
    else {
      int v6 = [v5 isDateInYesterday:v4];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v3 chatIdentifier];
        int v10 = 138412546;
        uint64_t v11 = v8;
        __int16 v12 = 1024;
        int v13 = v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "chatID %@ is recent?: %i", (uint8_t *)&v10, 0x12u);
      }
    }
  }
  else
  {
    long long v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D99015E8(v3, v5);
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_messageIsSOS:(id)a3
{
  id v4 = a3;
  if ([(IMDAvailabilityAutoReplier *)self _sosTransportValidForMessage:v4])
  {
    long long v5 = [v4 body];
    int v6 = [v5 string];

    LODWORD(self) = [(IMDAvailabilityAutoReplier *)self _sosURLMatchInText:v6];
    if (self)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Message is SOS", v9, 2u);
        }
      }
      self = [MEMORY[0x1E4F6E890] sharedInstance];
      [(IMDAvailabilityAutoReplier *)self trackEvent:*MEMORY[0x1E4F6DAE0]];

      LOBYTE(self) = 1;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_sosTransportValidForMessage:(id)a3
{
  id v3 = [a3 service];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  if (v4) {
    return 1;
  }

  return IMGetCachedDomainBoolForKeyWithDefaultValue();
}

- (BOOL)_sosURLMatchInText:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "im_matchesSOSMapURL");
  if (v4 && IMOSLoggingEnabled())
  {
    long long v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Message has an SOS URL match", v7, 2u);
    }
  }
  return v4;
}

- (IMDAutoReplyDelegate)replyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replyDelegate);

  return (IMDAutoReplyDelegate *)WeakRetained;
}

- (void)setReplyDelegate:(id)a3
{
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (CARAutomaticDNDStatus)automaticDNDStatus
{
  return self->_automaticDNDStatus;
}

- (void)setAutomaticDNDStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);

  objc_destroyWeak((id *)&self->_replyDelegate);
}

@end