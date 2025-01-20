@interface IMAssistantMessageSendHandler
- (BOOL)canSendLocationMessageWithLocationManager:(id)a3 withError:(int64_t *)a4;
- (BOOL)recipientHandleResolutionResultsAllowedByScreentime:(id)a3 error:(id *)a4;
- (BOOL)sendMessageWithDraft:(id)a3 expressiveSendStyleID:(id)a4 idsIdentifier:(id)a5 executionContext:(int64_t)a6 sourceApplicationID:(id)a7 toChat:(id)a8;
- (BOOL)shouldContinueToExamineRelevantChatsWithMatches:(id)a3 nextChat:(id)a4;
- (BOOL)updateSenderIdentityForNewlyCreatedChat:(id)a3;
- (IMAssistantMessageSendHandler)initWithDataSource:(id)a3 delegate:(id)a4 intentIdentifier:(id)a5;
- (IMAssistantMessageSendHandlerDelegate)messageSendHandlerDelegate;
- (id)contactResolutionResultForContacts:(id)a3 matchingRecipient:(id)a4;
- (id)contactsWithDuplicateNamesAmongContacts:(id)a3;
- (id)findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:(id)a3;
- (id)handleResolutionResultForHandles:(id)a3 resolvedContactForAlternatives:(id)a4 recipient:(id)a5;
- (id)makeIMMessageFromSharedLinkURL:(id)a3;
- (id)makeIMMessageFromText:(id)a3;
- (id)recipientDisambiguationResultsFromMultipleRelevantChats:(id)a3;
- (id)recipientsResolutionFailureResultWithResult:(id)a3 forRecipient:(id)a4 amongRecipients:(id)a5;
- (id)resolveMessageContentWithString:(id)a3;
- (id)resolveRecipientsByFindingExistingRelevantChatsForRecipients:(id)a3 withMatchingHandlesByRecipient:(id)a4 fromChats:(id)a5;
- (id)resolveRecipientsWithGroupNameOrConversationIdentifier:(id)a3 forIntent:(id)a4;
- (id)resolvedRecipientsFromChat:(id)a3;
- (void)confirmSendMessage:(id)a3 completion:(id)a4;
- (void)handleSendMessage:(id)a3 completion:(id)a4;
- (void)isSensitiveFileAttachmentURLs:(id)a3 chat:(id)a4 completion:(id)a5;
- (void)resolveContentForSendMessage:(id)a3 withCompletion:(id)a4;
- (void)resolveOutgoingMessageTypeForSendMessage:(id)a3 withCompletion:(id)a4;
- (void)resolveRecipientsForSendMessage:(id)a3 completion:(id)a4;
- (void)resolveRecipientsWithCRR:(id)a3 forIntent:(id)a4 completion:(id)a5;
- (void)resolveRecipientsWithoutCRR:(id)a3 forIntent:(id)a4 completion:(id)a5;
- (void)resolveSpeakableGroupNameForSendMessage:(id)a3 withCompletion:(id)a4;
- (void)sendFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10;
- (void)sendLocalFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10;
- (void)sendLocationMessageToChat:(id)a3 sourceApplicationID:(id)a4 sentMessages:(id)a5 completion:(id)a6;
- (void)sendMessagesWithText:(id)a3 currentLocation:(BOOL)a4 sharedLinkURL:(id)a5 audioMessageAttachment:(id)a6 photoLibraryAttachment:(id)a7 fileAttachments:(id)a8 expressiveSendStyleID:(id)a9 idsIdentifier:(id)a10 executionContext:(int64_t)a11 toChat:(id)a12 completion:(id)a13;
- (void)sendPhotoAssetMessageToChat:(id)a3 executionContext:(int64_t)a4 expressiveSendStyleID:(id)a5 idsIdentifier:(id)a6 phAsset:(id)a7 sentMessages:(id)a8 sourceApplicationID:(id)a9 completion:(id)a10;
- (void)setMessageSendHandlerDelegate:(id)a3;
@end

@implementation IMAssistantMessageSendHandler

- (IMAssistantMessageSendHandler)initWithDataSource:(id)a3 delegate:(id)a4 intentIdentifier:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantMessageSendHandler;
  v10 = [(IMAssistantMessageHandler *)&v13 initWithDataSource:a3 intentIdentifier:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_messageSendHandlerDelegate, a4);
  }

  return v11;
}

- (IMAssistantMessageSendHandlerDelegate)messageSendHandlerDelegate
{
  messageSendHandlerDelegate = self->_messageSendHandlerDelegate;
  if (!messageSendHandlerDelegate)
  {
    v4 = objc_alloc_init(IMAssistantMessageSendHandlerDefaultDelegate);
    v5 = self->_messageSendHandlerDelegate;
    self->_messageSendHandlerDelegate = (IMAssistantMessageSendHandlerDelegate *)v4;

    messageSendHandlerDelegate = self->_messageSendHandlerDelegate;
  }

  return messageSendHandlerDelegate;
}

- (void)confirmSendMessage:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  v6 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v6);

  v7 = _IMAssistantCoreSendMessageSignpostLogHandle();
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "confirmSendMessageIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_22C1AFD8C;
  v33 = sub_22C1AFD9C;
  id v34 = 0;
  id v34 = (id)[objc_alloc(MEMORY[0x263F0FEB0]) initWithCode:1 userActivity:0];
  id v9 = v5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = v9;
  v10 = [v9 attachments];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:buf count:16];
  if (v11)
  {
    char v12 = 0;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v15 currentLocation])
        {
          if (IMOSLoggingEnabled())
          {
            v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v39 = 138412290;
              v40 = v15;
              _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Intent contains an current location attachment: %@", v39, 0xCu);
            }
          }
          char v12 = 1;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:buf count:16];
    }
    while (v11);

    if (v12)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_22C1AFDA4;
      block[3] = &unk_2649123F0;
      block[4] = self;
      v27 = &v29;
      os_signpost_id_t v28 = spid;
      id v26 = v24;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_28;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v30[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v18;
      _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Completing confirmSendMessage with %@", buf, 0xCu);
    }
  }
  v19 = _IMAssistantCoreSendMessageSignpostLogHandle();
  v20 = v19;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_END, spid, "confirmSendMessageIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  (*((void (**)(id, uint64_t))v24 + 2))(v24, v30[5]);
LABEL_28:
  _Block_object_dispose(&v29, 8);
}

- (void)handleSendMessage:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handleSendMessageIntent", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    char v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Performing intent: %@", buf, 0xCu);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1B0154;
  v15[3] = &unk_264912440;
  id v18 = v7;
  os_signpost_id_t v19 = v9;
  id v16 = v6;
  v17 = self;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

- (BOOL)updateSenderIdentityForNewlyCreatedChat:(id)a3
{
  id v4 = a3;
  id v5 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v6 = [v5 coreTelephonySubscriptionsDataSource];
  int v7 = [v6 deviceHasMultipleSubscriptions];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Sending message to a new chat. Attempting to determine best sender identity.", buf, 2u);
      }
    }
    os_signpost_id_t v9 = [v4 participantsWithState:17];
    v10 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_26DF9B5F8);
    uint64_t v11 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    char v12 = [v11 coreTelephonySubscriptionsDataSource];
    id v13 = [v12 bestSenderIdentityForChatWithHandleIDs:v10];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      v15 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
      id v16 = [v15 coreTelephonySubscriptionsDataSource];
      v17 = [v16 handleIDForSenderIdentity:v13];

      id v18 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
      os_signpost_id_t v19 = [v18 coreTelephonySubscriptionsDataSource];
      v20 = [v19 simIDForSenderIdentity:v13];

      [v4 setLastAddressedHandleID:v17];
      [v4 setLastAddressedSIMID:v20];
    }
    else if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v23 = 0;
        _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Could not determine preferred sender identity for handleIDs. This may mean that the user has conflicting sim preferences for these recipients.", v23, 2u);
      }
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (void)resolveOutgoingMessageTypeForSendMessage:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [v5 outgoingMessageType];
  int v8 = IMOSLoggingEnabled();
  if (v7 == 2)
  {
    if (v8)
    {
      os_signpost_id_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        uint64_t v14 = [v5 outgoingMessageType];
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Resolving Outgoing Message Type with Audio (%ld)", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v10 = 2;
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        uint64_t v14 = [v5 outgoingMessageType];
        _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Resolving Outgoing Message Type with Text (%ld)", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v10 = 1;
  }
  char v12 = [MEMORY[0x263F0FCD8] successWithResolvedOutgoingMessageType:v10];
  v6[2](v6, v12);
}

- (void)resolveRecipientsForSendMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Will not use CRR to resolve recipients.", buf, 2u);
    }
  }
  uint64_t v11 = _IMAssistantCoreSendMessageSignpostLogHandle();
  char v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveRecipientsForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  int v13 = [v6 recipients];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1B28CC;
  v15[3] = &unk_264912488;
  id v16 = v7;
  os_signpost_id_t v17 = v9;
  id v14 = v7;
  [(IMAssistantMessageSendHandler *)self resolveRecipientsWithoutCRR:v13 forIntent:v6 completion:v15];
}

- (void)resolveContentForSendMessage:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  int v8 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveContentForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  char v12 = [v6 attachments];
  if ([v12 count])
  {
    int v13 = [v6 content];
    uint64_t v14 = [v13 length];

    if (!v14)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v23 = 0;
          _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Intent contains an attachment and no content. Returning notRequired for content.", v23, 2u);
        }
      }
      id v16 = [MEMORY[0x263F10020] notRequired];
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    os_signpost_id_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Resolving content slot with a string value", v22, 2u);
    }
  }
  id v18 = [v6 content];
  id v16 = [(IMAssistantMessageSendHandler *)self resolveMessageContentWithString:v18];

LABEL_17:
  os_signpost_id_t v19 = _IMAssistantCoreSendMessageSignpostLogHandle();
  v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)id v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_END, v9, "resolveContentForSendMessage", (const char *)&unk_22C1E071B, v21, 2u);
  }

  v7[2](v7, v16);
}

- (void)resolveSpeakableGroupNameForSendMessage:(id)a3 withCompletion:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v39 = a3;
  long long v35 = (void (**)(id, void *))a4;
  id v5 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  id v6 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v7 = v6;
  os_signpost_id_t v32 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v40 = [v39 speakableGroupName];
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v40 spokenPhrase];
      uint64_t v10 = [v40 vocabularyIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = (uint64_t)v9;
      __int16 v54 = 2112;
      v55 = v10;
      _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Resolving speakableGroupName: %@ vocabID: %@", buf, 0x16u);
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  char v12 = [v39 conversationIdentifier];
  BOOL v13 = [v12 length] == 0;

  if (!v13)
  {
    uint64_t v14 = [v39 conversationIdentifier];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v14;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Intent contains a conversationIdentifier, %@, using that to resolve group name", buf, 0xCu);
      }
    }
    objc_msgSend(v11, "addObject:", v14, v32);
  }
  long long v37 = objc_msgSend(v40, "vocabularyIdentifier", v32);
  if ([v37 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = (uint64_t)v37;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Intent contains a speakableGroupName.vocabularyIdentifier, %@, using that to resolve group name", buf, 0xCu);
      }
    }
    [v11 addObject:v37];
  }
  long long v38 = [v40 alternativeSpeakableMatches];
  if ([v38 count])
  {
    if (IMOSLoggingEnabled())
    {
      os_signpost_id_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v38 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v53 = v18;
        __int16 v54 = 2112;
        v55 = v38;
        _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "speakableGroupName contains %ld alternativeSpeakableMatches: %@", buf, 0x16u);
      }
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v19 = v38;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v24 = [v23 vocabularyIdentifier];
          if ([v24 length])
          {
            [v11 addObject:v24];
          }
          else if (IMOSLoggingEnabled())
          {
            v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v53 = (uint64_t)v23;
              _os_log_impl(&dword_22C1AD000, v25, OS_LOG_TYPE_INFO, "alternativeSpeakableMatch does not contain a vocabularyIdentifier, ignoring. alternativeSpeakableMatch: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v20);
    }
  }
  if (![v11 count]
    && ([v40 spokenPhrase],
        id v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = [v26 length] == 0,
        v26,
        v27))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "Intent contains neither a conversationID nor a spoken group name. Returning notRequired for resolveSpeakableGroupName.", buf, 2u);
      }
    }
    v30 = _IMAssistantCoreSendMessageSignpostLogHandle();
    uint64_t v31 = v30;
    if (v33 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v31, OS_SIGNPOST_INTERVAL_END, spid, "resolveSpeakableGroupNameForSendMessage", (const char *)&unk_22C1E071B, buf, 2u);
    }

    os_signpost_id_t v28 = [MEMORY[0x263F0FFA8] notRequired];
    v35[2](v35, v28);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22C1B33D8;
    block[3] = &unk_2649124B0;
    id v42 = v11;
    uint64_t v43 = self;
    os_signpost_id_t v46 = spid;
    v45 = v35;
    id v44 = v40;
    dispatch_async(MEMORY[0x263EF83A0], block);

    os_signpost_id_t v28 = v42;
  }
}

- (BOOL)canSendLocationMessageWithLocationManager:(id)a3 withError:(int64_t *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([v5 locationAuthorizationDetermined] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
        int v16 = 138412290;
        os_signpost_id_t v17 = v10;
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Have not determined authorization to send current location message for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);
      }
    }
    if (a4)
    {
      int v8 = (int64_t *)MEMORY[0x263F102B0];
      goto LABEL_15;
    }
LABEL_25:
    BOOL v12 = 0;
    goto LABEL_26;
  }
  if (![v5 locationAuthorizationDenied])
  {
    if ([v5 preciseLocationAuthorized])
    {
      BOOL v12 = 1;
      goto LABEL_26;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
        int v16 = 138412290;
        os_signpost_id_t v17 = v14;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Authorization to get precise location has been disabled for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);
      }
    }
    if (a4)
    {
      int64_t v11 = 1005;
      goto LABEL_16;
    }
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [MEMORY[0x263F086E0] mainBundle];
      int v16 = 138412290;
      os_signpost_id_t v17 = v7;
      _os_log_impl(&dword_22C1AD000, v6, OS_LOG_TYPE_INFO, "Authorization to send current location has been explicitly disabled for bundle %@. Returning failure, prompting user to determine authorization for the bundle.", (uint8_t *)&v16, 0xCu);
    }
  }
  if (!a4) {
    goto LABEL_25;
  }
  int v8 = (int64_t *)MEMORY[0x263F102B8];
LABEL_15:
  int64_t v11 = *v8;
LABEL_16:
  BOOL v12 = 0;
  *a4 = v11;
LABEL_26:

  return v12;
}

- (BOOL)sendMessageWithDraft:(id)a3 expressiveSendStyleID:(id)a4 idsIdentifier:(id)a5 executionContext:(int64_t)a6 sourceApplicationID:(id)a7 toChat:(id)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([v15 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v15;
        _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Setting expressiveSendStyleID on message: %@ ", (uint8_t *)&v34, 0xCu);
      }
    }
    [v14 setExpressiveSendStyleID:v15];
  }
  if ([v17 length])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v17;
        _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Setting source application ID on message: %@", (uint8_t *)&v34, 0xCu);
      }
    }
    [v14 setSourceApplicationID:v17];
  }
  if ([v16 length])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v16;
        _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Setting IDS identifier on IMMessage: %@ ", (uint8_t *)&v34, 0xCu);
      }
    }
    [v14 setNotificationIDSTokenURI:v16];
  }
  if (a6 == 1)
  {
    uint64_t v22 = [v14 guid];
    if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        id v35 = v22;
        _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Suppressing send sound for message GUID: %@ ", (uint8_t *)&v34, 0xCu);
      }
    }
    id v24 = v22;
    v25 = MEMORY[0x230F62500](@"com.apple.MobileSMS", @"SuppressingSendSoundMessageGUIDs");
    if (!v25)
    {
      v25 = [MEMORY[0x263EFF8C0] array];
    }
    id v26 = [v25 arrayByAddingObject:v24];

    IMSetDomainValueForKey();
  }
  [v18 refreshServiceForSending];
  if (IMOSLoggingEnabled())
  {
    BOOL v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "refreshServiceForSending completed", (uint8_t *)&v34, 2u);
    }
  }
  int v28 = [v18 canSendMessage:v14];
  int v29 = IMOSLoggingEnabled();
  if (v28)
  {
    if (v29)
    {
      v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "canSendMessage check succeeded", (uint8_t *)&v34, 2u);
      }
    }
    uint64_t v31 = [(IMAssistantMessageSendHandler *)self messageSendHandlerDelegate];
    [v31 sendMessage:v14 toChat:v18];

    if (IMOSLoggingEnabled())
    {
      os_signpost_id_t v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_22C1AD000, v32, OS_LOG_TYPE_INFO, "message send completed", (uint8_t *)&v34, 2u);
      }
LABEL_43:
    }
  }
  else if (v29)
  {
    os_signpost_id_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      int v34 = 138412290;
      id v35 = v18;
      _os_log_impl(&dword_22C1AD000, v32, OS_LOG_TYPE_INFO, "canSendMessage check failed for chat: %@", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_43;
  }

  return v28;
}

- (id)makeIMMessageFromSharedLinkURL:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = *MEMORY[0x263F4A4B0];
  id v3 = a3;
  id v4 = [v3 url];
  v11[1] = *MEMORY[0x263F4A4C0];
  v12[0] = v4;
  v12[1] = &unk_26DF9EDD0;
  id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v6 = [v3 url];

  id v7 = [v6 absoluteString];

  int v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v5];
  id v9 = [MEMORY[0x263F4A5B8] instantMessageWithText:v8 flags:65541 threadIdentifier:0];
  [v9 setBalloonBundleID:*MEMORY[0x263F4A9F8]];

  return v9;
}

- (void)isSensitiveFileAttachmentURLs:(id)a3 chat:(id)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v24 = a4;
  id v21 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  group = dispatch_group_create();
  id v23 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    uint64_t v10 = *MEMORY[0x263EFF608];
    uint64_t v11 = *MEMORY[0x263F1DB18];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
        id v34 = 0;
        int v14 = [v13 getResourceValue:&v34 forKey:v10 error:0];
        id v15 = v34;
        id v16 = v15;
        if (v14 && [v15 conformsToType:v11])
        {
          dispatch_group_enter(group);
          id v17 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
          id v18 = [v17 commSafetyDataSource];
          id v19 = [v24 chatIdentifier];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = sub_22C1B6530;
          v30[3] = &unk_2649124D8;
          id v31 = v23;
          unint64_t v33 = v39;
          os_signpost_id_t v32 = group;
          [v18 isSensitiveContent:v13 withChatID:v19 completionHandler:v30];
        }
        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22C1B66D4;
  block[3] = &unk_264912500;
  id v28 = v21;
  int v29 = v39;
  id v20 = v21;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);

  _Block_object_dispose(v39, 8);
}

- (void)sendLocalFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v42 = a4;
  id v39 = a6;
  id v38 = a7;
  id v40 = a8;
  id v37 = a9;
  unint64_t v33 = (void (**)(id, uint64_t, void))a10;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v14;
  uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v41)
  {
    uint64_t v35 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v43 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        id v17 = [v43 fileManagerDataSource];
        id v18 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        id v19 = [v18 fileTransferCenterDataSource];
        id v20 = v17;
        id v21 = v19;
        id v22 = v16;
        int v23 = IMOSLoggingEnabled();
        if (v22)
        {
          if (v23)
          {
            id v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v51 = v22;
              _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", buf, 0xCu);
            }
          }
          id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v26 = [v21 createNewOutgoingTransferWithLocalFileURL:v22];
          [v21 registerTransferWithDaemon:v26];
          [v25 addObject:v26];
          if (IMOSLoggingEnabled())
          {
            BOOL v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v51 = v25;
              _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", buf, 0xCu);
            }
          }
          id v28 = objc_msgSend(MEMORY[0x263F086A0], "__im_attributedStringWithFileTransfers:", v25);
          int v29 = objc_msgSend(v28, "__im_attributedStringByAssigningMessagePartNumbers");
          v30 = [MEMORY[0x263F4A5B8] instantMessageWithText:v29 messageSubject:0 fileTransferGUIDs:v25 flags:5 threadIdentifier:0];
        }
        else
        {
          if (v23)
          {
            id v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v31, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", buf, 2u);
            }
          }
          v30 = 0;
        }

        if (![(IMAssistantMessageSendHandler *)self sendMessageWithDraft:v30 expressiveSendStyleID:v39 idsIdentifier:v38 executionContext:a5 sourceApplicationID:v40 toChat:v42])
        {
          v33[2](v33, 4, 0);

          goto LABEL_26;
        }
        os_signpost_id_t v32 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:v30 toChat:v42 messageType:24 personProvider:self];
        [v37 addObject:v32];
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }

  ((void (**)(id, uint64_t, id))v33)[2](v33, 3, v37);
LABEL_26:
}

- (void)sendFileAttachmentURLs:(id)a3 chat:(id)a4 executionContext:(int64_t)a5 expressiveSendStyleID:(id)a6 idsIdentifier:(id)a7 sourceApplicationID:(id)a8 sentMessages:(id)a9 completion:(id)a10
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v34 = a4;
  id v35 = a6;
  id v36 = a7;
  id v37 = a8;
  id v38 = a9;
  id v39 = a10;
  uint64_t v41 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v20 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        id v21 = [v20 fileManagerDataSource];
        id v22 = v19;
        id v23 = v21;
        if ([v22 isFileURL])
        {
          uint64_t v24 = [v22 lastPathComponent];
          id v25 = objc_msgSend(v23, "im_randomTemporaryFileURLWithFileName:", v24);

          id v55 = 0;
          LOBYTE(v24) = objc_msgSend(v23, "im_copySecurityScopedResourceAtURL:toDestination:error:", v22, v25, &v55);
          id v26 = v55;
          if (v24)
          {
            id v27 = v25;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              int v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v58 = v22;
                __int16 v59 = 2112;
                id v60 = v26;
                _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "Failed to copy the file from %@ into the MessagesAssistantExtension Sandbox. Error: %@", buf, 0x16u);
              }
            }
            id v27 = 0;
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v58 = v22;
              _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Error, url is not a fileURL: %@", buf, 0xCu);
            }
          }
          id v27 = 0;
        }

        [v41 addObject:v27];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v16);
  }

  v30 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v31 = [v30 commSafetyDataSource];
  int v32 = [v31 checksForSensitivityOnSend];

  if (v32)
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_22C1B7088;
    v42[3] = &unk_264912528;
    id v49 = v39;
    v42[4] = self;
    id v43 = v41;
    id v44 = v34;
    int64_t v50 = a5;
    id v45 = v35;
    id v46 = v36;
    id v47 = v37;
    id v48 = v38;
    [(IMAssistantMessageSendHandler *)self isSensitiveFileAttachmentURLs:v43 chat:v44 completion:v42];
  }
  else
  {
    [(IMAssistantMessageSendHandler *)self sendLocalFileAttachmentURLs:v41 chat:v34 executionContext:a5 expressiveSendStyleID:v35 idsIdentifier:v36 sourceApplicationID:v37 sentMessages:v38 completion:v39];
  }
}

- (id)makeIMMessageFromText:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithString:v4];

  id v6 = objc_msgSend(v5, "__im_attributedStringByAssigningMessagePartNumbers");
  id v7 = [MEMORY[0x263F4A5B8] instantMessageWithText:v6 flags:5 threadIdentifier:0];

  return v7;
}

- (void)sendLocationMessageToChat:(id)a3 sourceApplicationID:(id)a4 sentMessages:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Determining location authorization status.", buf, 2u);
    }
  }
  id v15 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  uint64_t v16 = [v15 locationManagerDataSource];

  *(void *)buf = 0;
  LODWORD(v15) = [(IMAssistantMessageSendHandler *)self canSendLocationMessageWithLocationManager:v16 withError:buf];
  int v17 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v17)
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Authorized to send current location message. Sending.", v26, 2u);
      }
    }
    id v19 = [MEMORY[0x263F4A5A8] sharedInstance];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_22C1B7450;
    v21[3] = &unk_264912550;
    id v25 = v13;
    id v22 = v10;
    id v23 = self;
    id v24 = v12;
    [v19 sendCurrentLocationMessageWithChat:v22 withLocationManager:v16 withSourceApplicationIdentifier:v11 foregroundAssertionForBundleIdentifier:@"com.apple.MobileSMS.MessagesAssistantExtension" completion:v21];
  }
  else
  {
    if (v17)
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Not authorized to send current location message.", v26, 2u);
      }
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, *(void *)buf, 0);
  }
}

- (void)sendPhotoAssetMessageToChat:(id)a3 executionContext:(int64_t)a4 expressiveSendStyleID:(id)a5 idsIdentifier:(id)a6 phAsset:(id)a7 sentMessages:(id)a8 sourceApplicationID:(id)a9 completion:(id)a10
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v86 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v78 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v21 = [v78 fileManagerDataSource];
  v77 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v22 = [v77 fileTransferCenterDataSource];
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = sub_22C1B8200;
  v88[3] = &unk_264912578;
  id v74 = v20;
  id v94 = v74;
  v88[4] = self;
  id v70 = v16;
  id v89 = v70;
  id v71 = v17;
  id v90 = v71;
  int64_t v95 = a4;
  id v73 = v19;
  id v91 = v73;
  id v69 = v15;
  id v92 = v69;
  id v72 = v18;
  id v93 = v72;
  id v80 = v21;
  id v79 = v22;
  id v81 = v86;
  v76 = v88;
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = [v81 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v120 = (uint64_t)v24;
      _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Building a PHAsset transfer message based on the PHAsset with id: %@", buf, 0xCu);
    }
  }
  id v75 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v26 = [v81 hasAdjustments];
      id v27 = @"The requested PHAsset does not have adjustments, we will use the original resources.";
      if (v26) {
        id v27 = @"The requested PHAsset has adjustments, we will use the edited resources.";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v120 = (uint64_t)v27;
      _os_log_impl(&dword_22C1AD000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  if ([v81 hasAdjustments]) {
    uint64_t v28 = 5;
  }
  else {
    uint64_t v28 = 1;
  }
  if ([v81 hasAdjustments]) {
    uint64_t v29 = 6;
  }
  else {
    uint64_t v29 = 2;
  }
  int v30 = [v81 hasAdjustments];
  uint64_t v31 = 9;
  if (v30) {
    uint64_t v31 = 10;
  }
  uint64_t v82 = v31;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3032000000;
  v108[3] = sub_22C1AFD8C;
  v108[4] = sub_22C1AFD9C;
  id v109 = 0;
  int v32 = [MEMORY[0x263F14D70] assetResourcesForAsset:v81];
  if (IMOSLoggingEnabled())
  {
    unint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v32 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v120 = v34;
      _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "The requested PHAsset has %ld resources", buf, 0xCu);
    }
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = v32;
  uint64_t v35 = [obj countByEnumeratingWithState:&v104 objects:buf count:16];
  if (v35)
  {
    v83 = 0;
    id v36 = 0;
    v87 = 0;
    uint64_t v37 = *(void *)v105;
    while (1)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v105 != v37) {
          objc_enumerationMutation(obj);
        }
        id v39 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v41 = [v39 type];
            LODWORD(block) = 134217984;
            *(void *)((char *)&block + 4) = v41;
            _os_log_impl(&dword_22C1AD000, v40, OS_LOG_TYPE_INFO, "PHAsset has an asset resource of type: %ld", (uint8_t *)&block, 0xCu);
          }
        }
        if ([v39 type] == v28)
        {
          id v42 = v87;
          id v43 = v36;
          v87 = v39;
        }
        else if ([v39 type] == v29)
        {
          id v42 = v83;
          v83 = v39;
          id v43 = v36;
        }
        else
        {
          id v42 = v36;
          id v43 = v39;
          if ([v39 type] != v82) {
            continue;
          }
        }
        id v44 = v39;

        id v36 = v43;
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v104 objects:buf count:16];
      if (!v35) {
        goto LABEL_42;
      }
    }
  }
  v83 = 0;
  id v36 = 0;
  v87 = 0;
LABEL_42:

  id v45 = objc_alloc_init(MEMORY[0x263F14D88]);
  [v45 setNetworkAccessAllowed:0];
  if (v87 && v36)
  {
    if (IMOSLoggingEnabled())
    {
      id v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_22C1AD000, v46, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a live photo.", (uint8_t *)&block, 2u);
      }
    }
    id v47 = [v87 originalFilename];
    id v48 = objc_msgSend(v80, "im_randomTemporaryFileURLWithFileName:", v47);

    id v49 = [v36 originalFilename];
    int64_t v50 = objc_msgSend(v80, "im_randomTemporaryFileURLWithFileName:", v49);

    long long v51 = dispatch_group_create();
    dispatch_group_enter(v51);
    long long v52 = [MEMORY[0x263F14D80] defaultManager];
    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = sub_22C1C159C;
    v100[3] = &unk_264912770;
    id v53 = v87;
    id v101 = v53;
    v103 = v108;
    long long v54 = v51;
    v102 = v54;
    [v52 writeDataForAssetResource:v53 toFile:v48 options:v45 completionHandler:v100];

    dispatch_group_enter(v54);
    id v55 = [MEMORY[0x263F14D80] defaultManager];
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = sub_22C1C1728;
    v96[3] = &unk_264912770;
    id v56 = v36;
    id v97 = v56;
    v99 = v108;
    v57 = v54;
    v98 = v57;
    [v55 writeDataForAssetResource:v56 toFile:v50 options:v45 completionHandler:v96];

    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 3221225472;
    v111 = sub_22C1C18B4;
    v112 = &unk_264912798;
    v118 = v108;
    v117 = v76;
    id v113 = v48;
    id v114 = v50;
    id v115 = v79;
    v116 = v75;
    id v58 = v48;
    id v59 = v50;
    dispatch_group_notify(v57, MEMORY[0x263EF83A0], &block);

    goto LABEL_63;
  }
  if (v87 && !v36)
  {
    if (IMOSLoggingEnabled())
    {
      id v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_22C1AD000, v60, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a photo.", (uint8_t *)&block, 2u);
      }
    }
    uint64_t v61 = [v87 originalFilename];
    v62 = objc_msgSend(v80, "im_randomTemporaryFileURLWithFileName:", v61);

    v63 = [MEMORY[0x263F14D80] defaultManager];
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 3221225472;
    v111 = sub_22C1C1B78;
    v112 = &unk_2649127C0;
    id v64 = v87;
    id v113 = v64;
    v118 = v108;
    v117 = v76;
    id v114 = v80;
    id v115 = v79;
    v57 = v62;
    v116 = v57;
    [v63 writeDataForAssetResource:v64 toFile:v57 options:v45 completionHandler:&block];

LABEL_62:
    id v58 = v113;
LABEL_63:

    goto LABEL_64;
  }
  if (v83)
  {
    if (IMOSLoggingEnabled())
    {
      v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_22C1AD000, v65, OS_LOG_TYPE_INFO, "The requested PHAsset attachment is a video.", (uint8_t *)&block, 2u);
      }
    }
    v66 = [v83 originalFilename];
    v67 = objc_msgSend(v80, "im_randomTemporaryFileURLWithFileName:", v66);

    v68 = [MEMORY[0x263F14D80] defaultManager];
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 3221225472;
    v111 = sub_22C1C1F4C;
    v112 = &unk_2649127C0;
    id v113 = v87;
    v118 = v108;
    v117 = v76;
    id v114 = v80;
    id v115 = v79;
    v57 = v67;
    v116 = v57;
    [v68 writeDataForAssetResource:v83 toFile:v57 options:v45 completionHandler:&block];

    goto LABEL_62;
  }
LABEL_64:

  _Block_object_dispose(v108, 8);
}

- (void)sendMessagesWithText:(id)a3 currentLocation:(BOOL)a4 sharedLinkURL:(id)a5 audioMessageAttachment:(id)a6 photoLibraryAttachment:(id)a7 fileAttachments:(id)a8 expressiveSendStyleID:(id)a9 idsIdentifier:(id)a10 executionContext:(int64_t)a11 toChat:(id)a12 completion:(id)a13
{
  BOOL v17 = a4;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v74 = a3;
  id v71 = a5;
  id v75 = a6;
  id v70 = a7;
  id v69 = a8;
  id v72 = a9;
  id v73 = a10;
  id v19 = a12;
  id v20 = a13;
  id v21 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  id v23 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "sendMessageWithText", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = sub_22C1B8FA0;
  v77[3] = &unk_2649125A0;
  os_signpost_id_t v79 = v22;
  id v25 = v20;
  id v78 = v25;
  int v26 = (void (**)(void, void, void))MEMORY[0x230F62A80](v77);
  id v27 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v76 = 0;
  char v28 = [v27 screentimeAllowedToShowChat:v19 error:&v76];
  id v29 = v76;

  if (v28)
  {
    if ([v19 isMemberOfChat])
    {
      if (!v74 && !v71 && !v75 && !v70 && !v17 && ![v69 count])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v41, OS_LOG_TYPE_INFO, "Send Messages Intent: Invoked with an empty message request.", buf, 2u);
          }
        }
        v26[2](v26, 4, 0);
        goto LABEL_92;
      }
      if (a11 == 1) {
        id v68 = (id)*MEMORY[0x263F4B0D8];
      }
      else {
        id v68 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        unint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v82 = v68;
          __int16 v83 = 2048;
          int64_t v84 = a11;
          _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Using sourceApplicationID %@ for executionContext %ld.", buf, 0x16u);
        }
      }
      id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v75)
      {
        uint64_t v34 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        uint64_t v35 = [v34 fileManagerDataSource];
        id v36 = v75;
        id v37 = v35;
        if ([v36 isFileURL])
        {
          uint64_t v38 = [v36 lastPathComponent];
          id v39 = objc_msgSend(v37, "im_randomTemporaryFileURLWithFileName:", v38);

          id v80 = 0;
          LOBYTE(v38) = objc_msgSend(v37, "im_copySecurityScopedResourceAtURL:toDestination:error:", v36, v39, &v80);
          id v65 = v80;
          if (v38)
          {
            id v40 = v39;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              id v48 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v82 = v36;
                __int16 v83 = 2112;
                int64_t v84 = (int64_t)v65;
                _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "Failed to copy the file from %@ into the MessagesAssistantExtension Sandbox. Error: %@", buf, 0x16u);
              }
            }
            id v40 = 0;
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v47 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v82 = v36;
              _os_log_impl(&dword_22C1AD000, v47, OS_LOG_TYPE_INFO, "Error, url is not a fileURL: %@", buf, 0xCu);
            }
          }
          id v40 = 0;
        }

        v63 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        id v49 = [v63 fileManagerDataSource];
        v62 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        int64_t v50 = [v62 fileTransferCenterDataSource];
        id v61 = v49;
        id v66 = v50;
        id v64 = v40;
        int v51 = IMOSLoggingEnabled();
        if (v64)
        {
          if (v51)
          {
            long long v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v82 = v64;
              _os_log_impl(&dword_22C1AD000, v52, OS_LOG_TYPE_INFO, "Building a file transfer message based on a file at %@", buf, 0xCu);
            }
          }
          id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v54 = [v66 createNewOutgoingTransferWithLocalFileURL:v64];
          [v66 registerTransferWithDaemon:v54];
          [v53 addObject:v54];
          if (IMOSLoggingEnabled())
          {
            id v55 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v82 = v53;
              _os_log_impl(&dword_22C1AD000, v55, OS_LOG_TYPE_INFO, "The message's file transfer guids are: %@", buf, 0xCu);
            }
          }
          id v56 = objc_msgSend(MEMORY[0x263F086A0], "__im_attributedStringWithFileTransfers:", v53);
          v57 = objc_msgSend(v56, "__im_attributedStringByAssigningMessagePartNumbers");
          id v58 = [MEMORY[0x263F4A5B8] instantMessageWithText:v57 messageSubject:0 fileTransferGUIDs:v53 flags:2097157 threadIdentifier:0];
        }
        else
        {
          if (v51)
          {
            id v59 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v59, OS_LOG_TYPE_INFO, "Provided localFileAttachmentURL is nil", buf, 2u);
            }
          }
          id v58 = 0;
        }

        if ([(IMAssistantMessageSendHandler *)self sendMessageWithDraft:v58 expressiveSendStyleID:v72 idsIdentifier:v73 executionContext:a11 sourceApplicationID:v68 toChat:v19])
        {
          id v60 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:v58 toChat:v19 messageType:2 personProvider:self];
          [v67 addObject:v60];

          ((void (**)(void, uint64_t, id))v26)[2](v26, 3, v67);
        }
        else
        {
          v26[2](v26, 4, 0);
        }

        goto LABEL_84;
      }
      if (v74)
      {
        id v42 = [(IMAssistantMessageSendHandler *)self makeIMMessageFromText:v74];
        if (![(IMAssistantMessageSendHandler *)self sendMessageWithDraft:v42 expressiveSendStyleID:v72 idsIdentifier:v73 executionContext:a11 sourceApplicationID:v68 toChat:v19])
        {
          v26[2](v26, 4, 0);

LABEL_84:
          goto LABEL_92;
        }
        id v43 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:v42 toChat:v19 messageType:1 personProvider:self];
        [v67 addObject:v43];
      }
      if (v71)
      {
        if (IMOSLoggingEnabled())
        {
          id v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v44, OS_LOG_TYPE_INFO, "Attempting to send a link", buf, 2u);
          }
        }
        id v45 = [(IMAssistantMessageSendHandler *)self makeIMMessageFromSharedLinkURL:v71];
        if ([(IMAssistantMessageSendHandler *)self sendMessageWithDraft:v45 expressiveSendStyleID:v72 idsIdentifier:v73 executionContext:a11 sourceApplicationID:v68 toChat:v19])
        {
          id v46 = +[IMAssistantINMessageConverter INMessageForOutgoingIMMessage:v45 toChat:v19 messageType:25 personProvider:self];
          [v67 addObject:v46];

          ((void (**)(void, uint64_t, id))v26)[2](v26, 3, v67);
        }
        else
        {
          v26[2](v26, 4, 0);
        }
      }
      else if (v17)
      {
        [(IMAssistantMessageSendHandler *)self sendLocationMessageToChat:v19 sourceApplicationID:v68 sentMessages:v67 completion:v26];
      }
      else if ([v69 count])
      {
        [(IMAssistantMessageSendHandler *)self sendFileAttachmentURLs:v69 chat:v19 executionContext:a11 expressiveSendStyleID:v72 idsIdentifier:v73 sourceApplicationID:v68 sentMessages:v67 completion:v26];
      }
      else if (v70)
      {
        [(IMAssistantMessageSendHandler *)self sendPhotoAssetMessageToChat:v19 executionContext:a11 expressiveSendStyleID:v72 idsIdentifier:v73 phAsset:v70 sentMessages:v67 sourceApplicationID:v68 completion:v26];
      }
      else
      {
        ((void (**)(void, uint64_t, id))v26)[2](v26, 3, v67);
      }
      goto LABEL_84;
    }
    if (IMOSLoggingEnabled())
    {
      int v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v82 = v19;
        _os_log_impl(&dword_22C1AD000, v32, OS_LOG_TYPE_INFO, "Send Messages Intent: Failed. Will not send to chat in Un-Joined state: %@", buf, 0xCu);
      }
    }
    v26[2](v26, *MEMORY[0x263F102C0], 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v82 = v19;
        _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "Send Messages Intent: Failed. Downtime enabled, chat contained non-allowlisted handles: %@", buf, 0xCu);
      }
    }
    if (v29) {
      uint64_t v31 = [v29 code];
    }
    else {
      uint64_t v31 = *MEMORY[0x263F102D8];
    }
    v26[2](v26, v31, 0);
  }
LABEL_92:
}

- (id)resolveMessageContentWithString:(id)a3
{
  id v3 = [a3 trimmedString];
  if ([v3 length]) {
    [MEMORY[0x263F10020] successWithResolvedString:v3];
  }
  else {
  id v4 = [MEMORY[0x263F10020] needsValue];
  }

  return v4;
}

- (id)recipientDisambiguationResultsFromMultipleRelevantChats:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 resolvedPersons];
  uint64_t v6 = [v5 count];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v56;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v55 + 1) + 8 * i) resolvedPersons];
        BOOL v11 = v6 == [v10 count];

        if (!v11)
        {
          if (IMOSLoggingEnabled())
          {
            unint64_t v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Resolved persons from relevant chats contained an inconsistent number of recipients, ignoring relevant chats.", buf, 2u);
            }
          }
          id v39 = 0;
          int v32 = obj;
          goto LABEL_43;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  for (id j = objc_alloc_init(MEMORY[0x263EFF980]); v6; --v6)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    [j addObject:v13];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v38 = obj;
  uint64_t v14 = [v38 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v51;
    uint64_t v16 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v38);
        }
        id v18 = [*(id *)(*((void *)&v50 + 1) + 8 * k) resolvedPersons];
        v48[0] = v16;
        v48[1] = 3221225472;
        v48[2] = sub_22C1B96DC;
        v48[3] = &unk_2649125C8;
        id v49 = j;
        [v18 enumerateObjectsUsingBlock:v48];
      }
      uint64_t v14 = [v38 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v14);
  }

  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v36 = j;
  uint64_t v19 = [v36 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v19)
  {
    uint64_t v37 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v19; ++m)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(v36);
        }
        id v21 = *(void **)(*((void *)&v44 + 1) + 8 * m);
        id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v24 = v21;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v59 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v41;
          do
          {
            for (uint64_t n = 0; n != v25; ++n)
            {
              if (*(void *)v41 != v26) {
                objc_enumerationMutation(v24);
              }
              char v28 = *(void **)(*((void *)&v40 + 1) + 8 * n);
              id v29 = [v28 customIdentifier];
              if (([v23 containsObject:v29] & 1) == 0)
              {
                [v22 addObject:v28];
                [v23 addObject:v29];
              }
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v59 count:16];
          }
          while (v25);
        }

        if ([v22 count] == 1)
        {
          int v30 = [v22 firstObject];
          uint64_t v31 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v30];
          [v39 addObject:v31];
        }
        else
        {
          int v30 = [MEMORY[0x263F0FEB8] disambiguationWithPeopleToDisambiguate:v22];
          [v39 addObject:v30];
        }
      }
      uint64_t v19 = [v36 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v19);
  }

  int v32 = v36;
LABEL_43:

  return v39;
}

- (id)resolveRecipientsWithGroupNameOrConversationIdentifier:(id)a3 forIntent:(id)a4
{
  v101[1] = *MEMORY[0x263EF8340];
  id v88 = a3;
  id v6 = a4;
  uint64_t v7 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  uint64_t v8 = [v7 accountDataSource];
  char v9 = [v8 hasMessagingAccount];

  if (v9)
  {
    id v10 = [v6 speakableGroupName];
    v87 = [v10 vocabularyIdentifier];
    if (![v87 length]) {
      goto LABEL_53;
    }
    BOOL v11 = _IMAssistantCoreSendMessageSignpostLogHandle();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    id v13 = _IMAssistantCoreSendMessageSignpostLogHandle();
    uint64_t v14 = v13;
    unint64_t v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "resolveRecipientsFromGroup", (const char *)&unk_22C1E071B, buf, 2u);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v96 = v87;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Attempting to resolve by speakableGroupName.vocabularyIdentifier: %@", buf, 0xCu);
      }
    }
    BOOL v17 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    id v18 = [v17 chatDataSource];
    id v19 = v87;
    if ([v19 length])
    {
      id v20 = IMAssistantChatIdentifierFromConversationIdentifier(v19);
      id v21 = [v18 existingChatWithChatIdentifier:v20];
      if (v21)
      {

        goto LABEL_28;
      }
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v96 = v19;
          _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_27:
        id v21 = 0;
LABEL_28:

        int v25 = IMOSLoggingEnabled();
        if (v21)
        {
          if (v25)
          {
            uint64_t v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v26, OS_LOG_TYPE_INFO, "A speakableGroupName.vocabularyIdentifier matching a valid chat was provided, extracting recipients from chat and attaching to intent for use in Siri dialog.", buf, 2u);
            }
          }
          id v27 = [(IMAssistantMessageSendHandler *)self resolvedRecipientsFromChat:v21];
          if (v27)
          {
            char v28 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
            id v90 = 0;
            char v29 = [v28 screentimeAllowedToShowChat:v21 error:&v90];
            id v30 = v90;

            if (v29)
            {
              BOOL v31 = [v21 joinState] == 4;
              int v32 = IMOSLoggingEnabled();
              if (v31)
              {
                if (v32)
                {
                  unint64_t v33 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Returning unsupported for recipient because the resolved chat is read-only. Using INSendMessageRecipientUnsupportedReasonMessagingServiceNotEnabledForRecipient", buf, 2u);
                  }
                }
                uint64_t v34 = [MEMORY[0x263F0FEB8] unsupportedForReason:3];
                v99 = v34;
                id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
              }
              else
              {
                if (v32)
                {
                  v77 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v96 = v10;
                    __int16 v97 = 2112;
                    v98 = v27;
                    _os_log_impl(&dword_22C1AD000, v77, OS_LOG_TYPE_INFO, "Returning success with recipients resolved from speakableGroupName: %@ recipients: %@", buf, 0x16u);
                  }
                }
                id v78 = _IMAssistantCoreSendMessageSignpostLogHandle();
                os_signpost_id_t v79 = v78;
                if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v78))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_22C1AD000, v79, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
                }

                id v23 = v27;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                long long v47 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v96 = v10;
                  _os_log_impl(&dword_22C1AD000, v47, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group with speakableGroupName (%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
                }
              }
              id v48 = _IMAssistantCoreSendMessageSignpostLogHandle();
              id v49 = v48;
              if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v48))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_22C1AD000, v49, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
              }

              long long v50 = [v30 domain];
              char v51 = [v50 isEqual:@"__kIMAssistantMessageHandlerErrorDomain"];

              if ((v51 & 1) == 0 && IMOSLoggingEnabled())
              {
                long long v52 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v96 = v30;
                  _os_log_impl(&dword_22C1AD000, v52, OS_LOG_TYPE_INFO, "Will return unsupported with an unknown reason, error: %@", buf, 0xCu);
                }
              }
              if (v30) {
                uint64_t v53 = [v30 code];
              }
              else {
                uint64_t v53 = *MEMORY[0x263F102D8];
              }
              int64_t v84 = [MEMORY[0x263F0FEB8] unsupportedForReason:v53];
              v100 = v84;
              id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v100 count:1];
            }
            goto LABEL_158;
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_49;
          }
          uint64_t v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v96 = v19;
            _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "Recipients could not be resolved from speakableGroupName.vocabularyIdentifier: %@. Ignoring identifier and continuing with person resolution.", buf, 0xCu);
          }
        }
        else
        {
          if (!v25) {
            goto LABEL_49;
          }
          uint64_t v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v96 = v19;
            _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "No chat could be found matching speakableGroupName.vocabularyIdentifier: %@. Ignoring identifier and continuing with person resolution.", buf, 0xCu);
          }
        }

LABEL_49:
        id v36 = _IMAssistantCoreSendMessageSignpostLogHandle();
        uint64_t v37 = v36;
        if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v37, OS_SIGNPOST_INTERVAL_END, v12, "resolveRecipientsFromGroup", (const char *)&unk_22C1E071B, buf, 2u);
        }

LABEL_53:
        id v21 = [v6 conversationIdentifier];
        if (![v21 length])
        {
LABEL_113:
          id v68 = [v10 spokenPhrase];
          BOOL v69 = [v68 length] == 0;

          if (v69)
          {
            if ([v88 count])
            {
              id v23 = 0;
LABEL_159:

              goto LABEL_160;
            }
            if (IMOSLoggingEnabled())
            {
              id v76 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v76, OS_LOG_TYPE_INFO, "No recipients provided to resolve, returning needsValue.", buf, 2u);
              }
            }
            id v27 = [MEMORY[0x263F0FEB8] needsValue];
            id v91 = v27;
            uint64_t v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              id v70 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v70, OS_LOG_TYPE_INFO, "No recipients are required if a group name is present", buf, 2u);
              }
            }
            id v27 = [MEMORY[0x263F0FEB8] notRequired];
            id v92 = v27;
            uint64_t v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
          }
          id v23 = (id)v71;
LABEL_158:

          goto LABEL_159;
        }
        id v38 = _IMAssistantCoreSendMessageSignpostLogHandle();
        os_signpost_id_t spid = os_signpost_id_generate(v38);

        id v39 = _IMAssistantCoreSendMessageSignpostLogHandle();
        long long v40 = v39;
        unint64_t v41 = spid - 1;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v40, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
        }

        if (IMOSLoggingEnabled())
        {
          long long v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v96 = v21;
            _os_log_impl(&dword_22C1AD000, v42, OS_LOG_TYPE_INFO, "Attempting to resolve by conversationIdentifier: %@", buf, 0xCu);
          }
        }
        long long v43 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        id v44 = [v43 chatDataSource];
        id v45 = v21;
        if ([v45 length])
        {
          long long v46 = IMAssistantChatIdentifierFromConversationIdentifier(v45);
          id v27 = [v44 existingChatWithChatIdentifier:v46];
          if (v27)
          {

            goto LABEL_88;
          }
          if (IMOSLoggingEnabled())
          {
            long long v54 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v96 = v45;
              _os_log_impl(&dword_22C1AD000, v54, OS_LOG_TYPE_INFO, "Could not find a chat with the conversationIdentifier %@, ignoring.", buf, 0xCu);
            }
          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
          {
LABEL_87:
            id v27 = 0;
LABEL_88:

            int v55 = IMOSLoggingEnabled();
            if (v27)
            {
              if (v55)
              {
                long long v56 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22C1AD000, v56, OS_LOG_TYPE_INFO, "A conversationIdentifier matching a valid chat was provided, extracting recipients from chat and attaching to intent for use in Siri dialog.", buf, 2u);
                }
              }
              long long v57 = [(IMAssistantMessageSendHandler *)self resolvedRecipientsFromChat:v27];
              if (v57)
              {
                long long v58 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
                id v89 = 0;
                char v59 = [v58 screentimeAllowedToShowChat:v27 error:&v89];
                id v60 = v89;

                if (v59)
                {
                  BOOL v61 = [v27 joinState] == 4;
                  int v62 = IMOSLoggingEnabled();
                  if (v61)
                  {
                    if (v62)
                    {
                      uint64_t v63 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_22C1AD000, v63, OS_LOG_TYPE_INFO, "Returning unsupported for recipient because the resolved chat is read-only. Using INSendMessageRecipientUnsupportedReasonMessagingServiceNotEnabledForRecipient", buf, 2u);
                      }
                    }
                    id v64 = [MEMORY[0x263F0FEB8] unsupportedForReason:3];
                    id v93 = v64;
                    id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
                  }
                  else
                  {
                    if (v62)
                    {
                      id v80 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v96 = v57;
                        _os_log_impl(&dword_22C1AD000, v80, OS_LOG_TYPE_INFO, "Returning success with recipients resolved from chat: %@", buf, 0xCu);
                      }
                    }
                    id v81 = _IMAssistantCoreSendMessageSignpostLogHandle();
                    id v82 = v81;
                    if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v81))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v82, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
                    }

                    id v23 = v57;
                  }
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    id v72 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v96 = v45;
                      _os_log_impl(&dword_22C1AD000, v72, OS_LOG_TYPE_INFO, "Returning unsupported because the chat group w/ conversation identifier(%@) contains non-allowlisted participants and isn't allowed by downtime.", buf, 0xCu);
                    }
                  }
                  id v73 = _IMAssistantCoreSendMessageSignpostLogHandle();
                  id v74 = v73;
                  if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v73))
                  {
                    *(_WORD *)buf = 0;
                    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v74, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
                  }

                  if (v60) {
                    uint64_t v75 = [v60 code];
                  }
                  else {
                    uint64_t v75 = *MEMORY[0x263F102D8];
                  }
                  __int16 v83 = [MEMORY[0x263F0FEB8] unsupportedForReason:v75];
                  id v94 = v83;
                  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
                }
                goto LABEL_158;
              }
              if (!IMOSLoggingEnabled()) {
                goto LABEL_109;
              }
              id v65 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v96 = v45;
                _os_log_impl(&dword_22C1AD000, v65, OS_LOG_TYPE_INFO, "Recipients could not be resolved from conversationIdentifier: %@. Ignoring conversation identifier and continuing with person resolution.", buf, 0xCu);
              }
            }
            else
            {
              if (!v55) {
                goto LABEL_109;
              }
              id v65 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v96 = v45;
                _os_log_impl(&dword_22C1AD000, v65, OS_LOG_TYPE_INFO, "No chat could be found matching conversationIdentifier: %@. Ignoring conversation identifier and continuing with person resolution.", buf, 0xCu);
              }
            }

LABEL_109:
            id v66 = _IMAssistantCoreSendMessageSignpostLogHandle();
            id v67 = v66;
            if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v66))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22C1AD000, v67, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromConversationID", (const char *)&unk_22C1E071B, buf, 2u);
            }

            goto LABEL_113;
          }
          long long v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v46, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
          }
        }

        goto LABEL_87;
      }
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Could not find a chat with nil or empty conversationIdentifier, ignoring", buf, 2u);
      }
    }

    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Could not resolve recipients; no messaging account enabled",
        buf,
        2u);
    }
  }
  id v10 = [MEMORY[0x263F0FEB8] unsupportedForReason:1];
  v101[0] = v10;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:1];
LABEL_160:

  return v23;
}

- (void)resolveRecipientsWithCRR:(id)a3 forIntent:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    BOOL v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Resolving recipients with CRR: %@", buf, 0xCu);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1BAAE8;
  v15[3] = &unk_2649125F0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

- (void)resolveRecipientsWithoutCRR:(id)a3 forIntent:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    BOOL v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Resolving recipients without CRR: %@", buf, 0xCu);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1BB358;
  v15[3] = &unk_2649125F0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

- (BOOL)recipientHandleResolutionResultsAllowedByScreentime:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend(MEMORY[0x263F0FD28], "__imcore__containsNonSuccess:", v6))
  {
    char v7 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Validating resolved handles for screentime", buf, 2u);
      }
    }
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) resolvedValue];
          unint64_t v15 = [v14 customIdentifier];
          if ([v15 length]) {
            [v9 addObject:v15];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }

    id v16 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    id v22 = 0;
    char v7 = [v16 screentimeAllowedToShowConversationWithHandleIDs:v9 error:&v22];
    id v17 = v22;

    int v18 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v18)
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Handles are allowed by screentime", buf, 2u);
        }
      }
    }
    else
    {
      if (v18)
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v9;
          _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Handles are not allowed by screentime: %@.", buf, 0xCu);
        }
      }
      if (a4) {
        *a4 = v17;
      }
    }
  }
  return v7;
}

- (id)resolvedRecipientsFromChat:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v4 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v4);

  id v5 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v6 = v5;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolvedRecipientsFromChat", (const char *)&unk_22C1E071B, buf, 2u);
  }

  char v7 = [v30 participantsWithState:16];
  id v8 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    uint64_t v31 = *MEMORY[0x263EFDFE0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v13 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingHandle:v12];
        if ((unint64_t)[v13 count] >= 2)
        {
          uint64_t v45 = v31;
          id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
          unint64_t v15 = [v12 cnContactWithKeys:v14];
          id v16 = [v15 identifier];

          if (![v16 length]) {
            goto LABEL_40;
          }
          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Attempting to resolve ambiguous handle to contact using the Contacts Framework.", buf, 2u);
            }
          }
          int v18 = [(IMAssistantMessageHandler *)self contactWithIdentifier:v16];
          if (!v18)
          {
LABEL_40:
            if (IMOSLoggingEnabled())
            {
              id v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Could not resolve ambiguous handle to contact using the Contacts Framework.", buf, 2u);
              }
            }
            int v18 = 0;
          }
          if (IMOSLoggingEnabled())
          {
            id v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = [v13 count];
              *(_DWORD *)buf = 134218754;
              uint64_t v38 = v21;
              __int16 v39 = 2112;
              long long v40 = v12;
              __int16 v41 = 2112;
              long long v42 = v13;
              __int16 v43 = 2112;
              id v44 = v18;
              _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "%ld contacts matched chat participant %@. Matching identifiers: %@. Using contact: %@", buf, 0x2Au);
            }
          }
          if (v18) {
            goto LABEL_28;
          }
        }
        if ([v13 count]
          && ([v13 lastObject],
              id v22 = objc_claimAutoreleasedReturnValue(),
              [(IMAssistantMessageHandler *)self contactWithIdentifier:v22],
              int v18 = objc_claimAutoreleasedReturnValue(),
              v22,
              v18))
        {
LABEL_28:
          id v23 = objc_alloc(MEMORY[0x263F0FD18]);
          long long v24 = objc_msgSend(v23, "__im_assistant_initWithContact:imHandle:", v18, v12);
        }
        else
        {
          id v23 = objc_alloc(MEMORY[0x263F0FD18]);
          long long v24 = objc_msgSend(v23, "__im_assistant_initAnonymousRecipientWithIMHandle:", v12);
          int v18 = 0;
        }

        long long v25 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v24];
        [v8 addObject:v25];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v9);
  }

  long long v26 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v27 = v26;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v27, OS_SIGNPOST_INTERVAL_END, spid, "resolvedRecipientsFromChat", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v8;
}

- (id)contactsWithDuplicateNamesAmongContacts:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = _IMAssistantCoreSendMessageSignpostLogHandle();
  char v7 = v6;
  unint64_t v28 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "duplicateNameCheck", (const char *)&unk_22C1E071B, buf, 2u);
  }
  os_signpost_id_t spid = v5;

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v14 = [MEMORY[0x263F08A68] componentsForContact:v13];
        if (v14)
        {
          unint64_t v15 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v14 style:0 options:0];
        }
        else
        {
          unint64_t v15 = 0;
        }
        if (v15) {
          id v16 = v15;
        }
        else {
          id v16 = &stru_26DF9B8B8;
        }
        id v17 = v16;
        int v18 = [v8 objectForKeyedSubscript:v17];
        id v19 = v18;
        if (v18)
        {
          [v18 addObject:v13];
        }
        else
        {
          id v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
          [v8 setObject:v20 forKeyedSubscript:v17];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }

  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_22C1BDE58;
  v30[3] = &unk_264912688;
  id v22 = v21;
  id v31 = v22;
  [v8 enumerateKeysAndObjectsUsingBlock:v30];
  id v23 = (void *)[v22 copy];
  long long v24 = _IMAssistantCoreSendMessageSignpostLogHandle();
  long long v25 = v24;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v25, OS_SIGNPOST_INTERVAL_END, spid, "duplicateNameCheck", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v23;
}

- (id)resolveRecipientsByFindingExistingRelevantChatsForRecipients:(id)a3 withMatchingHandlesByRecipient:(id)a4 fromChats:(id)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v63 = a3;
  id v57 = a4;
  id v7 = a5;
  id v8 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v8);

  uint64_t v9 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "resolveRecipientsFromRelevantChat", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v92 = v12;
      _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Attempting to find a matching chat by examining %ld recent chats.", buf, 0xCu);
    }
  }
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v7;
  uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v60)
  {
    uint64_t v54 = *(void *)v88;
LABEL_10:
    uint64_t v64 = 0;
    while (1)
    {
      if (*(void *)v88 != v54) {
        objc_enumerationMutation(obj);
      }
      int v62 = *(void **)(*((void *)&v87 + 1) + 8 * v64);
      if (!-[IMAssistantMessageSendHandler shouldContinueToExamineRelevantChatsWithMatches:nextChat:](self, "shouldContinueToExamineRelevantChatsWithMatches:nextChat:", v61))goto LABEL_78; {
      id v67 = [v62 participantsWithState:16];
      }
      uint64_t v13 = [v67 count];
      if (v13 == [v63 count]) {
        break;
      }
LABEL_76:

      if (++v64 == v60)
      {
        uint64_t v60 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
        if (v60) {
          goto LABEL_10;
        }
        goto LABEL_78;
      }
    }
    id v14 = _IMAssistantCoreSendMessageSignpostLogHandle();
    os_signpost_id_t v50 = os_signpost_id_generate(v14);

    unint64_t v15 = _IMAssistantCoreSendMessageSignpostLogHandle();
    id v16 = v15;
    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v50, "examineRelevantChat", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v63, "count"));
    v85[0] = MEMORY[0x263EF8330];
    v85[1] = 3221225472;
    v85[2] = sub_22C1BEAE0;
    v85[3] = &unk_2649126B0;
    id v55 = v17;
    id v86 = v55;
    int v18 = (void (**)(void, void, void, void))MEMORY[0x230F62A80](v85);
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v92 = (uint64_t)v62;
        _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Beginning evaluation of participants in chat %@.", buf, 0xCu);
      }
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v53 = v63;
    uint64_t v56 = [v53 countByEnumeratingWithState:&v81 objects:v97 count:16];
    if (v56)
    {
      uint64_t v49 = *(void *)v82;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v82 != v49)
          {
            uint64_t v21 = v20;
            objc_enumerationMutation(v53);
            uint64_t v20 = v21;
          }
          uint64_t v51 = v20;
          id v22 = *(void **)(*((void *)&v81 + 1) + 8 * v20);
          id v23 = [v57 objectForKeyedSubscript:v22];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v65 = v23;
          uint64_t v68 = [v65 countByEnumeratingWithState:&v77 objects:v96 count:16];
          if (v68)
          {
            uint64_t v66 = *(void *)v78;
            do
            {
              uint64_t v24 = 0;
              do
              {
                if (*(void *)v78 != v66)
                {
                  uint64_t v25 = v24;
                  objc_enumerationMutation(v65);
                  uint64_t v24 = v25;
                }
                uint64_t v69 = v24;
                long long v26 = *(void **)(*((void *)&v77 + 1) + 8 * v24);
                long long v73 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                id v27 = v67;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v95 count:16];
                if (v28)
                {
                  uint64_t v29 = *(void *)v74;
                  do
                  {
                    for (uint64_t i = 0; i != v28; ++i)
                    {
                      if (*(void *)v74 != v29) {
                        objc_enumerationMutation(v27);
                      }
                      id v31 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                      if ([v26 matchesIMHandle:v31])
                      {
                        if (IMOSLoggingEnabled())
                        {
                          long long v32 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            uint64_t v92 = (uint64_t)v31;
                            __int16 v93 = 2112;
                            id v94 = v26;
                            _os_log_impl(&dword_22C1AD000, v32, OS_LOG_TYPE_INFO, "Found a chat participant handle: %@ matching requested handle: %@", buf, 0x16u);
                          }
                        }
                        ((void (**)(void, void *, void *, void *))v18)[2](v18, v22, v31, v26);
                      }
                    }
                    uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v95 count:16];
                  }
                  while (v28);
                }

                uint64_t v24 = v69 + 1;
              }
              while (v69 + 1 != v68);
              uint64_t v68 = [v65 countByEnumeratingWithState:&v77 objects:v96 count:16];
            }
            while (v68);
          }

          long long v33 = [v55 objectForKey:v22];
          BOOL v34 = [v33 count] == 0;

          if (v34)
          {
            if (IMOSLoggingEnabled())
            {
              long long v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v92 = (uint64_t)v22;
                _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "Did not find any matching chat participant for requested person %@", buf, 0xCu);
              }
            }
            goto LABEL_56;
          }

          uint64_t v20 = v51 + 1;
        }
        while (v51 + 1 != v56);
        uint64_t v56 = [v53 countByEnumeratingWithState:&v81 objects:v97 count:16];
        if (v56) {
          continue;
        }
        break;
      }
    }
LABEL_56:

    uint64_t v36 = [v55 count];
    if (v36 == [v53 count])
    {
      uint64_t v37 = [(IMAssistantMessageSendHandler *)self findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:v55];
      int v38 = IMOSLoggingEnabled();
      if (v37)
      {
        if (v38)
        {
          __int16 v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v92 = (uint64_t)v62;
            _os_log_impl(&dword_22C1AD000, v39, OS_LOG_TYPE_INFO, "Found a matching existing chat: %@", buf, 0xCu);
          }
        }
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = sub_22C1BEBCC;
        v70[3] = &unk_2649126D8;
        uint64_t v71 = v37;
        id v72 = self;
        long long v40 = objc_msgSend(v53, "__imArrayByApplyingBlock:", v70);
        __int16 v41 = [[IMAssistantRelevantChatMatchingRecipients alloc] initWithChat:v62 resolvedPersons:v40];
        [v61 addObject:v41];
      }
      else if (v38)
      {
        long long v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v92 = (uint64_t)v62;
          _os_log_impl(&dword_22C1AD000, v42, OS_LOG_TYPE_INFO, "Could not find a valid 1-1 relationship between chat participants and requested recipients. Ending evaluation of chat %@.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_72;
      }
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v92 = (uint64_t)v62;
        _os_log_impl(&dword_22C1AD000, v37, OS_LOG_TYPE_INFO, "Matching chat participant not found for all recipients. Ending evaluation of chat %@.", buf, 0xCu);
      }
    }

LABEL_72:
    __int16 v43 = _IMAssistantCoreSendMessageSignpostLogHandle();
    id v44 = v43;
    if (v50 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v44, OS_SIGNPOST_INTERVAL_END, v50, "examineRelevantChat", (const char *)&unk_22C1E071B, buf, 2u);
    }

    goto LABEL_76;
  }
LABEL_78:

  if (![v61 count] && IMOSLoggingEnabled())
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v45, OS_LOG_TYPE_INFO, "Did not find a matching existing chat.", buf, 2u);
    }
  }
  long long v46 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v47 = v46;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v47, OS_SIGNPOST_INTERVAL_END, spid, "resolveRecipientsFromRelevantChat", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v61;
}

- (BOOL)shouldContinueToExamineRelevantChatsWithMatches:(id)a3 nextChat:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    id v8 = [v7 chat];

    uint64_t v9 = [v8 lastFinishedMessageDate];
    [v9 timeIntervalSinceNow];
    double v11 = fabs(v10);

    if (v11 * 4.0 >= 3600.0) {
      double v12 = v11 * 4.0;
    }
    else {
      double v12 = 3600.0;
    }
    uint64_t v13 = [v6 lastFinishedMessageDate];
    [v13 timeIntervalSinceNow];
    double v15 = fabs(v14);

    BOOL v16 = v12 > v15;
    if (v12 <= v15 && IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v19 = 134218496;
        uint64_t v20 = (uint64_t)v11;
        __int16 v21 = 2048;
        uint64_t v22 = (uint64_t)v15;
        __int16 v23 = 2048;
        uint64_t v24 = (uint64_t)v12;
        _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Next chat is beyond maximum relevant time interval. Ending evaluation of relevant chats. TimeSinceLastMessageInMatchingChat: %ld s, TimeSinceLastMessageInNextChat: %ld s, MaximumRelevantTimeInterval: %ld s", (uint8_t *)&v19, 0x20u);
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (id)findValidMappingOfRequestedRecipientToChatParticipantAmongMatches:(id)a3
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v7 = v6;
  unint64_t v82 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "mapRecipientsToParticipants", (const char *)&unk_22C1E071B, buf, 2u);
  }
  os_signpost_id_t spid = v5;

  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v3, "count"));
  long long v90 = objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v3, "count"));
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  uint64_t v9 = [v3 keyEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v134 objects:v147 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v135 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v134 + 1) + 8 * i);
        double v15 = [v3 objectForKey:v14];
        BOOL v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v15 copyItems:0];
        [v90 setObject:v16 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v134 objects:v147 count:16];
    }
    while (v11);
  }

  long long v88 = v3;
  long long v89 = v8;
  while (1)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v17 = [v3 keyEnumerator];
    uint64_t v95 = [v17 countByEnumeratingWithState:&v130 objects:v146 count:16];
    if (!v95) {
      break;
    }
    char v18 = 0;
    uint64_t v19 = *(void *)v131;
    id v91 = v17;
    uint64_t v86 = *(void *)v131;
    while (2)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v131 != v19) {
          objc_enumerationMutation(v17);
        }
        __int16 v97 = v20;
        uint64_t v21 = *(void *)(*((void *)&v130 + 1) + 8 * (void)v20);
        uint64_t v22 = [v8 objectForKey:v21];

        if (!v22)
        {
          __int16 v23 = [v90 objectForKey:v21];
          if (![v23 count])
          {
            long long v33 = _IMAssistantCoreSendMessageSignpostLogHandle();
            BOOL v34 = v33;
            if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22C1AD000, v34, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_22C1E071B, buf, 2u);
            }

            id v35 = 0;
            goto LABEL_37;
          }
          if ([v23 count] == 1)
          {
            __int16 v93 = v23;
            uint64_t v24 = [v23 firstObject];
            [v8 setObject:v24 forKey:v21];
            [v90 removeObjectForKey:v21];
            long long v128 = 0u;
            long long v129 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            uint64_t v25 = [v90 objectEnumerator];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v126 objects:v145 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v127;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v127 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  id v30 = *(void **)(*((void *)&v126 + 1) + 8 * j);
                  id v31 = (void *)MEMORY[0x263F08A98];
                  v124[0] = MEMORY[0x263EF8330];
                  v124[1] = 3221225472;
                  v124[2] = sub_22C1BFB08;
                  v124[3] = &unk_264912700;
                  id v125 = v24;
                  long long v32 = [v31 predicateWithBlock:v124];
                  [v30 filterUsingPredicate:v32];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v126 objects:v145 count:16];
              }
              while (v27);
            }

            char v18 = 1;
            id v3 = v88;
            id v8 = v89;
            id v17 = v91;
            __int16 v23 = v93;
            uint64_t v19 = v86;
          }
        }
        uint64_t v20 = v97 + 1;
      }
      while (v97 + 1 != (char *)v95);
      uint64_t v95 = [v17 countByEnumeratingWithState:&v130 objects:v146 count:16];
      if (v95) {
        continue;
      }
      break;
    }

    if ((v18 & 1) == 0) {
      goto LABEL_41;
    }
  }

LABEL_41:
  if ([v90 count])
  {
    id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v80 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    objc_msgSend(v37, "addObject:");
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id obj = [v3 keyEnumerator];
    uint64_t v38 = [obj countByEnumeratingWithState:&v120 objects:v144 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v121;
      uint64_t v83 = *(void *)v121;
      do
      {
        uint64_t v41 = 0;
        uint64_t v84 = v39;
        do
        {
          if (*(void *)v121 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v42 = *(void *)(*((void *)&v120 + 1) + 8 * v41);
          __int16 v43 = [v8 objectForKey:v42];
          if (v43)
          {
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            id v37 = v37;
            uint64_t v44 = [v37 countByEnumeratingWithState:&v116 objects:v143 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v117;
              do
              {
                for (uint64_t k = 0; k != v45; ++k)
                {
                  if (*(void *)v117 != v46) {
                    objc_enumerationMutation(v37);
                  }
                  [*(id *)(*((void *)&v116 + 1) + 8 * k) setObject:v43 forKey:v42];
                }
                uint64_t v45 = [v37 countByEnumeratingWithState:&v116 objects:v143 count:16];
              }
              while (v45);
            }
            id v48 = v37;
          }
          else
          {
            uint64_t v87 = v41;
            id v48 = [v90 objectForKey:v42];
            id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v92 = v37;
            id v98 = (id)[v92 countByEnumeratingWithState:&v112 objects:v142 count:16];
            if (v98)
            {
              uint64_t v94 = *(void *)v113;
              id v96 = v48;
              do
              {
                for (uint64_t m = 0; m != v98; uint64_t m = (char *)m + 1)
                {
                  if (*(void *)v113 != v94) {
                    objc_enumerationMutation(v92);
                  }
                  uint64_t v51 = *(void **)(*((void *)&v112 + 1) + 8 * (void)m);
                  long long v108 = 0u;
                  long long v109 = 0u;
                  long long v110 = 0u;
                  long long v111 = 0u;
                  id v52 = v48;
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v108 objects:v141 count:16];
                  if (v53)
                  {
                    uint64_t v54 = v53;
                    uint64_t v55 = *(void *)v109;
                    do
                    {
                      for (uint64_t n = 0; n != v54; ++n)
                      {
                        if (*(void *)v109 != v55) {
                          objc_enumerationMutation(v52);
                        }
                        uint64_t v57 = *(void *)(*((void *)&v108 + 1) + 8 * n);
                        long long v58 = (void *)[v51 copy];
                        [v58 setObject:v57 forKey:v42];
                        [v49 addObject:v58];
                      }
                      uint64_t v54 = [v52 countByEnumeratingWithState:&v108 objects:v141 count:16];
                    }
                    while (v54);
                  }

                  id v48 = v96;
                }
                id v98 = (id)[v92 countByEnumeratingWithState:&v112 objects:v142 count:16];
              }
              while (v98);
            }

            id v37 = v49;
            id v8 = v89;
            uint64_t v40 = v83;
            uint64_t v39 = v84;
            __int16 v43 = 0;
            uint64_t v41 = v87;
          }

          ++v41;
        }
        while (v41 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v120 objects:v144 count:16];
      }
      while (v39);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v99 = v37;
    uint64_t v59 = [v99 countByEnumeratingWithState:&v104 objects:v140 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v105;
      while (2)
      {
        for (iuint64_t i = 0; ii != v60; ++ii)
        {
          if (*(void *)v105 != v61) {
            objc_enumerationMutation(v99);
          }
          id v63 = *(void **)(*((void *)&v104 + 1) + 8 * ii);
          id v64 = objc_alloc_init(MEMORY[0x263EFF9B0]);
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v65 = [v63 objectEnumerator];
          uint64_t v66 = [v65 countByEnumeratingWithState:&v100 objects:v139 count:16];
          if (v66)
          {
            uint64_t v67 = v66;
            uint64_t v68 = *(void *)v101;
            do
            {
              for (juint64_t j = 0; jj != v67; ++jj)
              {
                if (*(void *)v101 != v68) {
                  objc_enumerationMutation(v65);
                }
                id v70 = [*(id *)(*((void *)&v100 + 1) + 8 * jj) imHandle];
                [v64 addObject:v70];
              }
              uint64_t v67 = [v65 countByEnumeratingWithState:&v100 objects:v139 count:16];
            }
            while (v67);
          }

          uint64_t v71 = [v64 count];
          if (v71 == [v88 count])
          {
            long long v76 = _IMAssistantCoreSendMessageSignpostLogHandle();
            long long v77 = v76;
            if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22C1AD000, v77, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_22C1E071B, buf, 2u);
            }

            id v35 = v63;
            id v72 = v99;
            long long v74 = v99;
            id v3 = v88;
            id v8 = v89;
            goto LABEL_101;
          }
        }
        uint64_t v60 = [v99 countByEnumeratingWithState:&v104 objects:v140 count:16];
        id v8 = v89;
        if (v60) {
          continue;
        }
        break;
      }
    }
    id v72 = v99;

    long long v73 = _IMAssistantCoreSendMessageSignpostLogHandle();
    long long v74 = v73;
    if (v82 > 0xFFFFFFFFFFFFFFFDLL)
    {
      id v35 = 0;
      id v3 = v88;
LABEL_101:
      long long v75 = (void *)v80;
    }
    else
    {
      id v3 = v88;
      long long v75 = (void *)v80;
      if (os_signpost_enabled(v73))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22C1AD000, v74, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_22C1E071B, buf, 2u);
      }
      id v35 = 0;
    }
  }
  else
  {
    long long v78 = _IMAssistantCoreSendMessageSignpostLogHandle();
    long long v79 = v78;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v79, OS_SIGNPOST_INTERVAL_END, spid, "mapRecipientsToParticipants", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v35 = v8;
  }
LABEL_37:

  return v35;
}

- (id)contactResolutionResultForContacts:(id)a3 matchingRecipient:(id)a4
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v76 = a4;
  os_signpost_id_t v5 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v5);

  id v6 = _IMAssistantCoreSendMessageSignpostLogHandle();
  id v7 = v6;
  unint64_t v72 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
  }

  id v8 = [v76 personHandle];
  uint64_t v80 = [v8 type];

  uint64_t v9 = [v76 personHandle];
  long long v81 = [v9 label];

  uint64_t v10 = [v76 personHandle];
  uint64_t v11 = objc_msgSend(v10, "__im_assistant_handleType");

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v100 = (uint64_t)v76;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Manually specified handle. Ready to proceed to handle resolution with person: %@", buf, 0xCu);
      }
    }
    uint64_t v13 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v76];
    uint64_t v14 = _IMAssistantCoreSendMessageSignpostLogHandle();
    if (v72 >= 0xFFFFFFFFFFFFFFFELL)
    {
      double v15 = v14;
    }
    else
    {
      double v15 = v14;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22C1AD000, v15, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
      }
    }
    goto LABEL_105;
  }
  if ((unint64_t)[v75 count] >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v100 = (uint64_t)v75;
        _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Multiple contacts match recipient. Contacts: %@", buf, 0xCu);
      }
    }
    long long v79 = -[IMAssistantMessageSendHandler contactsWithDuplicateNamesAmongContacts:](self, "contactsWithDuplicateNamesAmongContacts:", v75, v72);
    id v84 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v75;
    uint64_t v82 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v82)
    {
      uint64_t v78 = *(void *)v95;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v95 != v78)
          {
            uint64_t v18 = v17;
            objc_enumerationMutation(obj);
            uint64_t v17 = v18;
          }
          uint64_t v83 = v17;
          uint64_t v19 = *(void **)(*((void *)&v94 + 1) + 8 * v17);
          if ([v79 containsObject:v19])
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v100 = (uint64_t)v19;
                _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Contact has the same name as another possible disambiguation option, including handles in disambiguation for contact: %@", buf, 0xCu);
              }
            }
            uint64_t v21 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
            uint64_t v22 = [v21 accountDataSource];
            __int16 v23 = [v22 countryCode];
            objc_msgSend(v19, "__im_assistant_matchingNormalizedHandlesForType:andLabel:forCountryCode:", v80, v81, v23);
            id v24 = (id)objc_claimAutoreleasedReturnValue();

            if ([v24 count])
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v24 = v24;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v103 count:16];
              if (v25)
              {
                uint64_t v26 = *(void *)v91;
                do
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if (*(void *)v91 != v26) {
                      objc_enumerationMutation(v24);
                    }
                    uint64_t v28 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                    id v29 = objc_alloc(MEMORY[0x263F0FD18]);
                    id v30 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
                    id v31 = [v30 accountDataSource];
                    long long v32 = objc_msgSend(v29, "__im_assistant_initWithContact:unformattedPersonHandle:accountDataSource:", v19, v28, v31);

                    if (v32)
                    {
                      [v84 addObject:v32];
                    }
                    else if (IMOSLoggingEnabled())
                    {
                      long long v33 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v100 = (uint64_t)v19;
                        __int16 v101 = 2112;
                        id v102 = v28;
                        _os_log_impl(&dword_22C1AD000, v33, OS_LOG_TYPE_INFO, "Could not create INPerson from contant %@ and handle %@", buf, 0x16u);
                      }
                    }
                  }
                  uint64_t v25 = [v24 countByEnumeratingWithState:&v90 objects:v103 count:16];
                }
                while (v25);
              }
            }
            else if (IMOSLoggingEnabled())
            {
              id v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v100 = (uint64_t)v19;
                _os_log_impl(&dword_22C1AD000, v35, OS_LOG_TYPE_INFO, "Contacts matching the requested recipient have identical names, but one of the contacts has no valid phone numbers or email addreses for this request. Ignoring that contact, as including it in the list of disambiguation options would make it indistinguishable from the other valid options with the exact same name. Contact: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            id v34 = objc_alloc(MEMORY[0x263F0FD18]);
            objc_msgSend(v34, "__im_assistant_initForContactResolutionResultWithContact:type:label:", v19, v80, v81);
            id v24 = (id)objc_claimAutoreleasedReturnValue();

            [v84 addObject:v24];
          }

          uint64_t v17 = v83 + 1;
        }
        while (v83 + 1 != v82);
        uint64_t v36 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
        uint64_t v82 = v36;
      }
      while (v36);
    }

    if ([v84 count])
    {
      BOOL v37 = [v84 count] == 1;
      int v38 = IMOSLoggingEnabled();
      if (v37)
      {
        if (v38)
        {
          uint64_t v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v39, OS_LOG_TYPE_INFO, "There was more than one contact matching the requested recipient AND those contacts had the exact same name, but only one of those contacts had a valid handle matching the request. Using that handle.", buf, 2u);
          }
        }
        uint64_t v40 = [v84 firstObject];
        uint64_t v13 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v40];
        uint64_t v41 = _IMAssistantCoreSendMessageSignpostLogHandle();
        uint64_t v42 = v41;
        if (v73 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v42, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
        }
      }
      else
      {
        if (v38)
        {
          id v64 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            uint64_t v65 = [v84 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v100 = v65;
            __int16 v101 = 2112;
            id v102 = v84;
            _os_log_impl(&dword_22C1AD000, v64, OS_LOG_TYPE_INFO, "Requesting disambiguation of %ld options: %@", buf, 0x16u);
          }
        }
        uint64_t v66 = (void *)MEMORY[0x263F0FEB8];
        uint64_t v67 = (void *)[v84 copy];
        uint64_t v13 = [v66 disambiguationWithPeopleToDisambiguate:v67];

        uint64_t v68 = _IMAssistantCoreSendMessageSignpostLogHandle();
        uint64_t v40 = v68;
        if (v73 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v68))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22C1AD000, v40, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
        }
      }
      goto LABEL_104;
    }
    if (IMOSLoggingEnabled())
    {
      id v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "There was more than one contact matching the requested recipient but those contacts had the exact same name, and none of those contacts had a valid handle matching the requested type. We won't offer disambiguation of the contacts, because none of the choices would lead to a successful resolution and the options would be indistinguishable and confusing.", buf, 2u);
      }
    }
    uint64_t v40 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v49 = obj;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v98 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v87 != v51) {
            objc_enumerationMutation(v49);
          }
          uint64_t v53 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          uint64_t v54 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
          uint64_t v55 = [v54 accountDataSource];
          uint64_t v56 = objc_msgSend(v53, "__im_assistant_allValidPersonOptionsWithAccountDataSource:", v55);

          [v40 addObjectsFromArray:v56];
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v86 objects:v98 count:16];
      }
      while (v50);
    }

    BOOL v57 = [v40 count] == 0;
    int v58 = IMOSLoggingEnabled();
    if (v57)
    {
      if (v58)
      {
        uint64_t v69 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v69, OS_LOG_TYPE_INFO, "None of the ambiguous contacts had any valid handles. Returning unsupportedReasouint64_t n = NoValidHandle.", buf, 2u);
        }
      }
      uint64_t v13 = [MEMORY[0x263F0FEB8] unsupportedWithReason:4];
      id v70 = _IMAssistantCoreSendMessageSignpostLogHandle();
      id v63 = v70;
      if (v73 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v70)) {
        goto LABEL_103;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (v58)
      {
        uint64_t v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v59, OS_LOG_TYPE_INFO, "If the user had specified a different label/handle-type, valid options would have been available, returning unsupportedReasouint64_t n = NoHandleForLabel.", buf, 2u);
        }
      }
      uint64_t v60 = (void *)MEMORY[0x263F0FEB8];
      uint64_t v61 = [v40 array];
      uint64_t v13 = [v60 resolutionResultUnsupportedWithReason:6 alternativeItems:v61];

      int v62 = _IMAssistantCoreSendMessageSignpostLogHandle();
      id v63 = v62;
      if (v73 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v62)) {
        goto LABEL_103;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v63, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
LABEL_103:

LABEL_104:
    double v15 = v79;
    goto LABEL_105;
  }
  double v15 = [v75 firstObject];
  if (IMOSLoggingEnabled())
  {
    __int16 v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v100 = (uint64_t)v15;
      _os_log_impl(&dword_22C1AD000, v43, OS_LOG_TYPE_INFO, "Only one contact matches recipient. Ready to proceed to handle resolution for contact: %@", buf, 0xCu);
    }
  }
  id v44 = objc_alloc(MEMORY[0x263F0FD18]);
  uint64_t v45 = objc_msgSend(v44, "__im_assistant_initForContactResolutionResultWithContact:type:label:", v15, v80, v81);

  uint64_t v13 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v45];
  uint64_t v46 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v47 = v46;
  if (v72 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v47, OS_SIGNPOST_INTERVAL_END, spid, "contactResolutionResultForContacts", (const char *)&unk_22C1E071B, buf, 2u);
  }

LABEL_105:

  return v13;
}

- (id)handleResolutionResultForHandles:(id)a3 resolvedContactForAlternatives:(id)a4 recipient:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v62 = a5;
  uint64_t v10 = _IMAssistantCoreSendMessageSignpostLogHandle();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = _IMAssistantCoreSendMessageSignpostLogHandle();
  uint64_t v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "handleResolutionResultForContact", (const char *)&unk_22C1E071B, buf, 2u);
  }

  double v15 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  BOOL v16 = [v15 accountDataSource];

  if (![v8 count])
  {
    id v24 = objc_msgSend(v9, "__im_assistant_allValidPersonOptionsWithAccountDataSource:", v16);
    BOOL v25 = [v24 count] == 0;
    int v26 = IMOSLoggingEnabled();
    if (v25)
    {
      if (v26)
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v39, OS_LOG_TYPE_INFO, "Could not find any matching handles, and contact has no phone numbers or email addresses, returning unsupported.", buf, 2u);
        }
      }
      uint64_t v21 = [MEMORY[0x263F0FEB8] unsupportedWithReason:4];
      uint64_t v40 = _IMAssistantCoreSendMessageSignpostLogHandle();
      id v29 = v40;
      if (v14 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v40)) {
        goto LABEL_40;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      if (v26)
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "Could not find any handles matching the requested label/handle-type, returning unsupported with suggested alternatives.", buf, 2u);
        }
      }
      uint64_t v21 = [MEMORY[0x263F0FEB8] resolutionResultUnsupportedWithReason:6 alternativeItems:v24];
      uint64_t v28 = _IMAssistantCoreSendMessageSignpostLogHandle();
      id v29 = v28;
      if (v14 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v28)) {
        goto LABEL_40;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v29, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_22C1E071B, buf, 2u);
LABEL_40:

    goto LABEL_41;
  }
  BOOL v17 = (unint64_t)[v8 count] > 1;
  int v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Asking user to disambiguate among the matching handles.", buf, 2u);
      }
    }
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_22C1C1320;
    v63[3] = &unk_264912728;
    id v64 = v16;
    uint64_t v20 = objc_msgSend(v8, "__imArrayByApplyingBlock:", v63);
    uint64_t v21 = [MEMORY[0x263F0FEB8] disambiguationWithPeopleToDisambiguate:v20];
    uint64_t v22 = _IMAssistantCoreSendMessageSignpostLogHandle();
    __int16 v23 = v22;
    if (v14 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v23, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v24 = v64;
    goto LABEL_41;
  }
  if (v18)
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "Only found one handle matching request, returning success for person.", buf, 2u);
    }
  }
  id v24 = [v8 firstObject];
  id v31 = [v24 contact];
  BOOL v32 = v31 == 0;

  if (!v32) {
    goto LABEL_27;
  }
  uint64_t v42 = [v62 personHandle];
  uint64_t v43 = objc_msgSend(v42, "__im_assistant_handleType");

  if (!v43) {
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    id v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v44, OS_LOG_TYPE_INFO, "The user explicitly requested a handle, e.g. 'Send a message to 555-555-5555', look up the contact to include in dialog.", buf, 2u);
    }
  }
  uint64_t v61 = [v24 handleID];
  uint64_t v60 = [v16 imHandleWithID:v61];
  if (!v60)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v57 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v66 = (uint64_t)v61;
        _os_log_impl(&dword_22C1AD000, v57, OS_LOG_TYPE_INFO, "Could not create an IMHandle for handleID: %@", buf, 0xCu);
      }
    }
    goto LABEL_27;
  }
  uint64_t v45 = [v62 personHandle];
  uint64_t v59 = -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v61, [v45 type]);

  BOOL v46 = [v59 count] == 0;
  int v47 = IMOSLoggingEnabled();
  if (v46)
  {
    if (v47)
    {
      int v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v66 = (uint64_t)v61;
        _os_log_impl(&dword_22C1AD000, v58, OS_LOG_TYPE_INFO, "Did not find any contacts matching manually requested handle: %@", buf, 0xCu);
      }
    }
    uint64_t v55 = 0;
  }
  else
  {
    if (v47)
    {
      id v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = [v59 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v66 = v49;
        __int16 v67 = 2112;
        uint64_t v68 = v61;
        _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "Found %ld contacts matching manually requested person handle: %@.", buf, 0x16u);
      }
    }
    uint64_t v50 = [v59 lastObject];
    if (IMOSLoggingEnabled())
    {
      uint64_t v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v66 = (uint64_t)v50;
        _os_log_impl(&dword_22C1AD000, v51, OS_LOG_TYPE_INFO, "Using contact identifier %@", buf, 0xCu);
      }
    }
    id v52 = [(IMAssistantMessageHandler *)self contactWithIdentifier:v50];
    if (IMOSLoggingEnabled())
    {
      uint64_t v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v66 = (uint64_t)v52;
        _os_log_impl(&dword_22C1AD000, v53, OS_LOG_TYPE_INFO, "Found contact %@", buf, 0xCu);
      }
    }
    id v54 = objc_alloc(MEMORY[0x263F0FD18]);
    uint64_t v55 = objc_msgSend(v54, "__im_assistant_initWithContact:imHandle:", v52, v60);

    if (IMOSLoggingEnabled())
    {
      uint64_t v56 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v66 = (uint64_t)v55;
        _os_log_impl(&dword_22C1AD000, v56, OS_LOG_TYPE_INFO, "Resolved manually dictated recipient: %@", buf, 0xCu);
      }
    }
  }

  if (!v55)
  {
LABEL_27:
    id v33 = objc_alloc(MEMORY[0x263F0FD18]);
    id v34 = objc_msgSend(v33, "__im_assistant_initWithHandleFromContact:accountDataSource:", v24, v16);

    id v35 = 0;
    goto LABEL_28;
  }
  id v35 = v55;
  id v34 = v35;
LABEL_28:
  BOOL v36 = v14 < 0xFFFFFFFFFFFFFFFELL;
  uint64_t v21 = [MEMORY[0x263F0FEB8] successWithResolvedPerson:v34];
  BOOL v37 = _IMAssistantCoreSendMessageSignpostLogHandle();
  int v38 = v37;
  if (v36 && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v38, OS_SIGNPOST_INTERVAL_END, v11, "handleResolutionResultForContact", (const char *)&unk_22C1E071B, buf, 2u);
  }

LABEL_41:

  return v21;
}

- (id)recipientsResolutionFailureResultWithResult:(id)a3 forRecipient:(id)a4 amongRecipients:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22C1C1470;
  v13[3] = &unk_2649126D8;
  id v14 = v8;
  id v15 = v7;
  id v9 = v7;
  id v10 = v8;
  os_signpost_id_t v11 = objc_msgSend(a5, "__imArrayByApplyingBlock:", v13);

  return v11;
}

- (void)setMessageSendHandlerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendHandlerDelegate, 0);

  objc_storeStrong((id *)&self->_conversationIdentifierResolvedDuringRecipientResolution, 0);
}

@end