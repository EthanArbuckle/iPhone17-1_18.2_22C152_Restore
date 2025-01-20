@interface IMMessageLegacyProcessingPipelineComponent
- (BOOL)_shouldUpgradeExistingMessage:(id)a3 input:(id)a4;
- (IMMessageLegacyProcessingPipelineComponent)initWithIDSTrustedData:(id)a3 messageContext:(id)a4 idsService:(id)a5;
- (id)runIndividuallyWithInput:(id)a3;
- (void)_updateChatForInput:(id)a3 hadChat:(BOOL)a4;
@end

@implementation IMMessageLegacyProcessingPipelineComponent

- (IMMessageLegacyProcessingPipelineComponent)initWithIDSTrustedData:(id)a3 messageContext:(id)a4 idsService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMMessageLegacyProcessingPipelineComponent;
  v12 = [(IMMessageLegacyProcessingPipelineComponent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsTrustedData, a3);
    objc_storeStrong(&v13->_messageContext, a4);
    objc_storeStrong((id *)&v13->_idsService, a5);
  }

  return v13;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = [v3 messageItems];
      v6 = [v5 firstObject];
      v7 = [v6 guid];
      *(_DWORD *)buf = 138412290;
      id v81 = v7;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Started processing for Message: %@", buf, 0xCu);
    }
  }
  v8 = [v3 messageItems];
  BOOL v9 = [v8 count] == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find any message items", buf, 2u);
      }
    }
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v10 = (void *)[v21 initWithDomain:*MEMORY[0x1E4F6BE88] code:10 userInfo:0];
    id v22 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v10];
  }
  else
  {
    id v10 = [v3 serviceSession];
    if (v10)
    {
      v73 = [v3 chat];
      if (!v73 && IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> No chat found, going to create one later", buf, 2u);
        }
      }
      v12 = +[IMDMessageStore sharedInstance];
      v13 = [v3 GUID];
      v14 = [v12 messageWithGUID:v13];

      if ([v14 isFinished]
        && ![(IMMessageLegacyProcessingPipelineComponent *)self _shouldUpgradeExistingMessage:v14 input:v3])
      {
        if (IMOSLoggingEnabled())
        {
          v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = [v3 GUID];
            *(_DWORD *)buf = 138412290;
            id v81 = v41;
            _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "*** Bailing, we already had a finished message for this in the database (%@). ***", buf, 0xCu);
          }
        }
        v42 = im_checkpointIDSService();
        v43 = [v3 GUID];
        [v3 wantsCheckpointing];
        im_sendMessageCheckpointIfNecessary();

        [v73 isBlackholed];
        if ([v3 wantsDeliveryReceipt])
        {
          v44 = [v3 GUID];
          [v3 wantsDeliveryReceipt];
          char v45 = im_sendCertifiedDeliveryReceiptIfPossible();

          if ((v45 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              v46 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v46, OS_LOG_TYPE_INFO, "Wanted to send a delivery receipt, but failed to send a certified delivery receipt. This should be ok because this was a message redelivery though.", buf, 2u);
              }
            }
          }
        }
        if ([v3 isLastFromStorage])
        {
          v47 = +[IMDMessageFromStorageController iMessageStorageController];
          [v47 noteLastItemProcessed];
        }
        id v22 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];
      }
      else
      {
        objc_super v15 = [v3 messageItems];
        v72 = [v15 lastObject];

        v16 = +[IMDAccountController sharedAccountController];
        v17 = [v72 accountID];
        v18 = [v16 accountForAccountID:v17];
        v19 = v18;
        if (v18)
        {
          id v67 = v18;
        }
        else
        {
          id v67 = [v3 account];
        }

        v71 = [v3 fromIdentifier];
        v70 = [v3 toIdentifier];
        char v56 = [v3 isFromMe];
        unsigned int v69 = [v3 isFromStorage];
        char v55 = [v3 isLastFromStorage];
        uint64_t v25 = [v3 wantsDeliveryReceipt];
        char v54 = [v3 wantsCheckpointing];
        v66 = [v3 participantIdentifiers];
        v65 = [v3 groupID];
        v64 = [v3 currentGroupName];
        v68 = [v3 groupPhotoCreationTime];
        v63 = [v3 availabilityVerificationRecipientChannelIDPrefix];
        v62 = [v3 availabilityVerificationRecipientEncryptionValidationToken];
        v61 = [v3 availabilityOffGridRecipientSubscriptionValidationToken];
        v60 = [v3 availabilityOffGridRecipientEncryptionValidationToken];
        if ([v3 conformsToProtocol:&unk_1F33EF158])
        {
          id v26 = v3;
          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = [v26 balloonPluginBundleID];
              v29 = [v26 balloonPluginPayload];
              uint64_t v30 = [v26 combinedPayloadAttachmentDictionary];
              v31 = (void *)v30;
              v32 = @"YES";
              if (v29) {
                v33 = @"YES";
              }
              else {
                v33 = @"NO";
              }
              *(_DWORD *)buf = 138412802;
              id v81 = v28;
              v83 = v33;
              __int16 v82 = 2112;
              if (!v30) {
                v32 = @"NO";
              }
              __int16 v84 = 2112;
              v85 = v32;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Processing a balloon plugin payload (identifier: %@, payload: %@, combinedPayloadAttachmentDictionary: %@)", buf, 0x20u);
            }
          }
          v59 = [v26 combinedPayloadAttachmentDictionary];
        }
        else
        {
          v59 = 0;
        }
        id v22 = objc_alloc_init(MEMORY[0x1E4F6BE98]);
        v34 = [v3 groupParticipantVersion];
        objc_msgSend(v10, "requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationTime:toIdentifier:fromIdentifier:messageIsFromStorage:", v73, objc_msgSend(v34, "integerValue"), v68, v71, v70, v69);

        v35 = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData fromToken];
        v57 = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData fromPushID];
        v36 = [NSNumber numberWithBool:v25];
        v37 = [v3 inlineAttachmentsDictionary];
        v38 = [v3 attributionInfoArray];
        v58 = [v3 nicknameDictionary];
        id messageContext = self->_messageContext;
        idsService = self->_idsService;
        BOOL v51 = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData isFromTrustedSender];
        BOOL v39 = [(IMDiMessageIDSTrustedData *)self->_idsTrustedData isFromSnapTrustedSender];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = sub_1D974D524;
        v76[3] = &unk_1E6B75AE0;
        v76[4] = self;
        id v77 = v3;
        BOOL v79 = v73 != 0;
        id v78 = v22;
        BYTE1(v50) = v39;
        LOBYTE(v50) = v51;
        BYTE4(v49) = v54;
        BYTE3(v49) = 0;
        BYTE2(v49) = v69;
        BYTE1(v49) = v55;
        LOBYTE(v49) = v56;
        objc_msgSend(v10, "_blastDoorProcessingWithIMMessageItem:chat:account:fromToken:fromIDSID:fromIdentifier:toIdentifier:participants:groupName:groupID:isFromMe:isLastFromStorage:isFromStorage:hideLockScreenNotification:wantsCheckpointing:needsDeliveryReceipt:messageBalloonPayloadAttachmentDictionary:inlineAttachments:attributionInfoArray:nicknameDictionary:availabilityVerificationRecipientChannelIDPrefix:availabilityVerificationRecipientEncryptionValidationToken:availabilityOffGridRecipientSubscriptionValidationToken:availabilityOffGridRecipientEncryptionValidationToken:idsService:messageContext:isFromTrustedSender:isFromSnapTrustedSender:completionBlock:", v72, v73, v67, v35, v57, v71, v70, v66, v64, v65, v49, v36,
          v59,
          v37,
          v38,
          v58,
          v63,
          v62,
          v61,
          v60,
          idsService,
          messageContext,
          v50,
          v76);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find service session", buf, 2u);
        }
      }
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      v74 = (void *)[v24 initWithDomain:*MEMORY[0x1E4F6BE88] code:1 userInfo:0];
      id v22 = (id)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v74];
    }
  }

  return v22;
}

- (void)_updateChatForInput:(id)a3 hadChat:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 setHadChat:v4];
  if (!v4)
  {
    v6 = +[IMDChatRegistry sharedInstance];
    v7 = [v5 participantIdentifiers];
    unint64_t v8 = [v7 count];

    if (v8 < 3)
    {
      v13 = [v5 fromDisplayID];
      v14 = [v5 account];
      v19 = [v6 existingChatForID:v13 account:v14];
    }
    else
    {
      uint64_t v9 = [v5 replicationSourceServiceName];
      id v10 = (void *)v9;
      id v11 = (void *)*MEMORY[0x1E4F6E1B0];
      if (v9) {
        id v11 = (void *)v9;
      }
      id v12 = v11;

      v13 = [v5 fromIdentifier];
      v14 = [v5 toIdentifier];
      objc_super v15 = [v5 currentGroupName];
      v16 = [v5 participantIdentifiers];
      v17 = [v16 _IDsFromURIs];
      v18 = [v5 groupID];
      v19 = +[IMFindChatProcessingPipelineComponent findGroupChatWithFromIdentifier:v13 toIdentifier:v14 groupName:v15 participants:v17 groupID:v18 serviceName:v12 chatRegistry:v6];
    }
    if (v19)
    {
      [v5 setChat:v19];
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Chat set: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v21 = IMLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1D9901680(v21);
      }
    }
  }
}

- (BOOL)_shouldUpgradeExistingMessage:(id)a3 input:(id)a4
{
  id v5 = a3;
  v6 = [a4 replicationSourceServiceName];
  v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isScheduledMessagesEnabled]
    && [v5 scheduleType] == 2
    && [v5 scheduleState] != 0;

  if ([v6 length])
  {
    uint64_t v9 = [v5 service];
    v8 |= [v9 isEqualToString:v6];
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong(&self->_messageContext, 0);

  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end