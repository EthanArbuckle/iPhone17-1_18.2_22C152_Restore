@interface MessageDeliveryController
- (BOOL)_hasRecentlyMessaged:(id)a3;
- (BOOL)_shouldSendAuxXML:(id)a3;
- (BOOL)_transferIsUserGeneratedOrEmojiSticker:(id)a3;
- (BOOL)forceBackwardsCompatibleMessageForBundleID:(id)a3;
- (BOOL)handleScheduledMessageSend:(id)a3 sentSuccessfully:(BOOL)a4 idsMessage:(id)a5 messageDictionary:(id)a6 canInlineAttachments:(BOOL)a7 msgPayloadUploadDictionary:(id)a8 fromID:(id)a9 fromAccount:(id)a10 originalIDSIdentifier:(id)a11;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4;
- (BOOL)shouldSendBackwardsCompatibleMessageForBundleID:(id)a3;
- (MessageDeliveryController)initWithSession:(id)a3;
- (MessageDeliveryControllerDelegate)delegate;
- (MessageServiceSession)session;
- (id)_appendFilePathsWithGUIDs:(id)a3;
- (id)_associatedMessageFallbackHashForMessageItem:(id)a3;
- (id)_chatForChatIdentifier:(id)a3;
- (id)_compressedAttributionInfoForMessage:(id)a3;
- (id)_computeRegPropertiesForNewFeatures:(id)a3 currentRegProperties:(id)a4 currentInterestingProp:(id)a5;
- (id)_copyGenmojiHEICFileToTemporaryDirectory:(id)a3;
- (id)_fallbackHashForMessageItemWithGUID:(id)a3;
- (id)_fallbackMessageItemFromLinkMetadata:(id)a3 originalMessageItem:(id)a4;
- (id)_fallbackMesssageItemByConvertingGenmojiToUnknownEmojiCharacterInOriginalMessageItem:(id)a3;
- (id)_fileTransferGUIDsInMessageBody:(id)a3;
- (id)_getQueueIdentifierFromGUID:(id)a3;
- (id)_keyTransparencyEnforcementDictionaryForChatIdentifier:(id)a3;
- (id)_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:(id)a3;
- (id)_propertyForExpressiveSendStyle:(id)a3;
- (id)_receivingDevicesForHandle:(id)a3 skippedDestinations:(id)a4;
- (id)_receivingDevicesForParticipants:(id)a3 skippedDestinations:(id)a4;
- (id)_replicationSourceIDForSending;
- (id)_threadOriginatorFallbackHashForMessageItem:(id)a3;
- (id)_updateSuccessfulEditsForScheduledMessage:(id)a3;
- (id)_updateSuccessfulRetractionsForScheduledMessage:(id)a3;
- (id)activeDeviceForHandle:(id)a3;
- (id)attachmentController;
- (id)groupController;
- (id)idsDeviceForFromID:(id)a3;
- (id)idsDeviceFromPushToken:(id)a3;
- (id)idsOptionsWithMessageItem:(id)a3 toID:(id)a4 fromID:(id)a5 sendGUIDData:(id)a6 alternateCallbackID:(id)a7 isBusinessMessage:(BOOL)a8 chatIdentifier:(id)a9 requiredRegProperties:(id)value interestingRegProperties:(id)a11 requiresLackOfRegProperties:(id)a12 deliveryContext:(id)a13 isGroupChat:(BOOL)a14 canInlineAttachments:(BOOL)a15 msgPayloadUploadDictionary:(id)a16 messageDictionary:(id)a17;
- (id)localDevice;
- (id)messageDictionaryWithMessageItem:(id)a3 isBusiness:(BOOL)a4 chatIdentifier:(id)a5 toParticipants:(id)a6 originallyToParticipants:(id)a7 additionalContext:(id)a8 msgPayloadUploadDictionary:(id)a9 originalPayload:(id)a10;
- (id)messageStore;
- (id)pairedDevice;
- (void)_addIdentifierToPendingTimestampUpdateMap:(id)a3 alternateCallbackId:(id)a4;
- (void)_appendMyNicknameToMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5;
- (void)_appendOffGridAvailabilityPropertiesToMessageDictionary:(id)a3 participantHandleID:(id)a4;
- (void)_appendRecipientAvailabilityVerificationInfoToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_appendRecipientNicknameTruncatedRecordIDToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_appendSeenOffGridStatusToMessageDictionary:(id)a3 forChat:(id)a4;
- (void)_checkStickerRepositioningMetadata:(id)a3;
- (void)_enqueueSendMessageWorkBlock:(id)a3 forURIs:(id)a4;
- (void)_enqueueUpdateBlock:(id)a3 willSendBlock:(id)a4 identifier:(id)a5 callbackID:(id)a6 messageCommandOption:(id)a7;
- (void)_sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 fromID:(id)a7 recipients:(id)a8 uploadStartTime:(id)a9 fromAccount:(id)a10 completionBlock:(id)a11;
- (void)_sendBackwardCompatibilityMessageForEditedMessage:(id)a3 usingMessageGUID:(id)a4 toBackwardCompatabilityDestinations:(id)a5 withOriginalDestinations:(id)a6 chatIdentifier:(id)a7 fromAccount:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 completionBlock:(id)a11;
- (void)_sendIDSMessageWithTransferGUID:(id)a3 andTransfer:(id)a4 fromAccount:(id)a5 fromID:(id)a6 toRecipient:(id)a7 withCompletion:(id)a8;
- (void)_sendMessage:(id)a3 context:(id)a4 deliveryContext:(id)a5 fromID:(id)a6 fromAccount:(id)a7 toID:(id)a8 chatIdentifier:(id)a9 toSessionToken:(id)a10 toGroup:(id)a11 toParticipants:(id)a12 originallyToParticipants:(id)a13 requiredRegProperties:(id)a14 interestingRegProperties:(id)a15 requiresLackOfRegProperties:(id)a16 canInlineAttachments:(BOOL)a17 type:(int64_t)a18 msgPayloadUploadDictionary:(id)a19 originalPayload:(id)a20 replyToMessageGUID:(id)a21 willSendBlock:(id)a22 completionBlock:(id)a23;
- (void)_sendNicknameToRecipientsIfNeededForChat:(id)a3 forMessage:(id)a4;
- (void)_setReplyToGUIDForMessage:(id)a3 messageDictionary:(id)a4;
- (void)_updateIDSServiceForTesting:(id)a3;
- (void)_updateTimeStampForMessageIdentifierIfNeeded:(id)a3 pendingTimeStampUpdateIdentifier:(id)a4 alternateCallbackID:(id)a5 messageContext:(id)a6;
- (void)appendChatRelatedPropertiesToMessageDictionary:(id)a3 forMessage:(id)a4 chatIdentifier:(id)a5;
- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6;
- (void)dealloc;
- (void)failMessageSendWithMessageDictionary:(id)a3 URIs:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)handleScheduledMessageSendFailure:(id)a3;
- (void)noteRecentMessageForPeople:(id)a3;
- (void)sendBubblePayloadMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10;
- (void)sendCloseSessionMessageDictionary:(id)a3 toBusinessURI:(id)a4 fromURI:(id)a5 fromAccount:(id)a6 completionBlock:(id)a7;
- (void)sendEditedMessage:(id)a3 partIndex:(int64_t)a4 editType:(unint64_t)a5 destinations:(id)a6 chatIdentifier:(id)a7 account:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 unsupportedDestinationsHandler:(id)a11 completionBlock:(id)a12;
- (void)sendLogDumpMessageAtFilePath:(id)a3 fromAccount:(id)a4 fromID:(id)a5 toRecipient:(id)a6 shouldDeleteFile:(BOOL)a7 withCompletion:(id)a8;
- (void)sendMessage:(id)a3 context:(id)a4 groupContext:(id)a5 toGroup:(id)a6 toParticipants:(id)a7 originallyToParticipants:(id)a8 fromID:(id)a9 fromAccount:(id)a10 chatIdentifier:(id)a11 originalPayload:(id)a12 replyToMessageGUID:(id)a13 fakeSavedReceiptBlock:(id)a14 completionBlock:(id)a15;
- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 callCompletionOnSuccess:(BOOL)a12 completionBlock:(id)a13;
- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 completionBlock:(id)a12;
- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10;
- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 willSendBlock:(id)a10 completionBlock:(id)a11;
- (void)sendMessageError:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 completionBlock:(id)a10;
- (void)sendMessageErrorWithInfo:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 additionalInfo:(id)a10 fileSize:(id)value failureTimeSeconds:(double)a12 failReasonMessage:(id)a13 completionBlock:(id)a14;
- (void)sendRepositionedStickerMetadata:(id)a3 forEditedMessage:(id)a4 destinations:(id)a5 account:(id)a6 fromID:(id)a7 completionBlock:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 alternateCallbackID:(id)a6 willSendToDestinations:(id)a7 skippedDestinations:(id)a8 registrationPropertyToDestinations:(id)a9;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 messageIdentifier:(id)a5 alternateCallbackID:(id)a6 updatedWithResponseCode:(int64_t)a7 error:(id)a8 lastCall:(BOOL)a9 messageContext:(id)a10;
- (void)service:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6;
- (void)service:(id)a3 didFlushCacheForKTPeerURI:(id)a4;
- (void)service:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6;
- (void)setDelegate:(id)a3;
- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5;
@end

@implementation MessageDeliveryController

- (MessageDeliveryController)initWithSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MessageDeliveryController;
  v4 = [(MessageDeliveryController *)&v11 init];
  if (v4)
  {
    unsigned int v5 = objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "manuallyAckMessagesEnabled");
    id v6 = objc_alloc((Class)IDSService);
    if (v5) {
      v7 = (IDSService *)[v6 initWithService:IDSServiceNameiMessage manuallyAckMessages:1];
    }
    else {
      v7 = (IDSService *)[v6 initWithService:IDSServiceNameiMessage];
    }
    v4->_idsService = v7;
    [(IDSService *)v7 addDelegate:v4 queue:&_dispatch_main_q];
    id v8 = objc_alloc((Class)IDSService);
    v9 = (IDSService *)[v8 initWithService:IDSServiceNameiMessageForBusiness];
    v4->_idsBizService = v9;
    [(IDSService *)v9 addDelegate:v4 queue:&_dispatch_main_q];
    objc_storeWeak((id *)&v4->_session, a3);
  }
  return v4;
}

- (id)_keyTransparencyEnforcementDictionaryForChatIdentifier:(id)a3
{
  id v4 = [(IDSService *)self->_idsService serviceIdentifier];
  if (![v4 isEqualToString:IDSServiceNameiMessage]) {
    return 0;
  }
  id v5 = [+[IMDChatRegistry sharedInstance] existingSMSChatForID:a3];

  return _[v5 keyTransparencyURIToUUIDMapping];
}

- (void)dealloc
{
  [+[IMMobileNetworkManager sharedInstance] removeFastDormancyDisableToken:@"iMessageDeliveryManager"];
  [(IDSService *)self->_idsService removeDelegate:self];

  [(IDSService *)self->_idsBizService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)MessageDeliveryController;
  [(MessageDeliveryController *)&v3 dealloc];
}

- (id)attachmentController
{
  v2 = [(MessageDeliveryController *)self session];

  return [(MessageServiceSession *)v2 attachmentController];
}

- (id)groupController
{
  v2 = [(MessageDeliveryController *)self session];

  return [(MessageServiceSession *)v2 groupController];
}

- (id)messageStore
{
  return +[IMDMessageStore sharedInstance];
}

- (void)_updateTimeStampForMessageIdentifierIfNeeded:(id)a3 pendingTimeStampUpdateIdentifier:(id)a4 alternateCallbackID:(id)a5 messageContext:(id)a6
{
  if ([a6 serverReceivedTime]
    && [a4 length]
    && [a4 isEqualToString:a3])
  {
    id v11 = objc_msgSend(-[MessageDeliveryController messageStore](self, "messageStore"), "messageWithGUID:", a3);
    id v12 = [v11 messageSummaryInfo];
    uint64_t v13 = IMMessageSummaryInfoUpdatedDateWithServerTime;
    unsigned int v14 = objc_msgSend(objc_msgSend(v12, "objectForKey:", IMMessageSummaryInfoUpdatedDateWithServerTime), "BOOLValue");
    id v15 = [v11 messageSummaryInfo];
    unsigned int v16 = objc_msgSend(objc_msgSend(v15, "objectForKey:", IMMessageSummaryInfoHasBeenRetried), "BOOLValue");
    unsigned int v17 = v16;
    if (!v11 || (v14 & 1) != 0 || (v16 & 1) != 0 || [v11 scheduleType])
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [v11 scheduleType];
          CFStringRef v20 = @"NO";
          int v27 = 138413058;
          id v28 = a3;
          if (v17) {
            CFStringRef v21 = @"YES";
          }
          else {
            CFStringRef v21 = @"NO";
          }
          __int16 v29 = 2112;
          if (v14) {
            CFStringRef v20 = @"YES";
          }
          CFStringRef v30 = v20;
          __int16 v31 = 2112;
          id v32 = (id)v21;
          __int16 v33 = 2048;
          id v34 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "We already updated the time on message %@ with a server time (%@) or this message has been retried (%@) or this is a future scheduled message (%lu) -- skipping server time update", (uint8_t *)&v27, 0x2Au);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(objc_msgSend(v11, "time"), "timeIntervalSinceReferenceDate");
          v24 = v23;
          objc_msgSend(objc_msgSend(a6, "serverReceivedTime"), "timeIntervalSinceReferenceDate");
          int v27 = 134218498;
          id v28 = v24;
          __int16 v29 = 2048;
          CFStringRef v30 = v25;
          __int16 v31 = 2112;
          id v32 = a3;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Going to update message time from: %f to: %f for identifier: %@", (uint8_t *)&v27, 0x20u);
        }
      }
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)objc_msgSend(objc_msgSend(v11, "messageSummaryInfo"), "mutableCopy");
      if (!Mutable) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      [(__CFDictionary *)Mutable setObject:+[NSNumber numberWithBool:1] forKey:v13];
      objc_msgSend(v11, "setTime:", objc_msgSend(a6, "serverReceivedTime"));
      [v11 setMessageSummaryInfo:Mutable];

      objc_msgSend(-[MessageDeliveryController messageStore](self, "messageStore"), "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v11, 1, 0, 0, objc_msgSend(v11, "flags"));
      [(MessageDeliveryControllerDelegate *)[(MessageDeliveryController *)self delegate] messageDeliveryController:self serverUpdatedTimestampMessage:v11];
      [(NSMutableDictionary *)self->_pendingTimestampUpdate removeObjectForKey:a5];
    }
  }
}

- (void)service:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138413058;
      id v13 = a4;
      __int16 v14 = 2112;
      id v15 = a5;
      __int16 v16 = 2112;
      id v17 = a6;
      __int16 v18 = 2112;
      id v19 = [(MessageDeliveryController *)self delegate];
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Received flushed cached message from %@ to %@ guid %@ delegate %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  [(MessageDeliveryControllerDelegate *)[(MessageDeliveryController *)self delegate] messageDeliveryController:self service:a3 didFlushCacheForRemoteURI:a4 fromURI:a5 guid:a6];
}

- (void)service:(id)a3 didFlushCacheForKTPeerURI:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Received flushed cache for KT Peer URI %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(MessageDeliveryControllerDelegate *)[(MessageDeliveryController *)self delegate] messageDeliveryController:self service:a3 didFlushCacheForKTPeerURI:a4];
}

- (void)service:(id)a3 account:(id)a4 messageIdentifier:(id)a5 alternateCallbackID:(id)a6 updatedWithResponseCode:(int64_t)a7 error:(id)a8 lastCall:(BOOL)a9 messageContext:(id)a10
{
  if (a5)
  {
    if (objc_msgSend(a6, "length", a3, a4)) {
      id v15 = [(NSMutableDictionary *)self->_pendingTimestampUpdate objectForKey:a6];
    }
    else {
      id v15 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CFStringRef v17 = @"NO";
        if (a9) {
          CFStringRef v17 = @"YES";
        }
        objc_msgSend(objc_msgSend(a10, "serverReceivedTime", v17), "timeIntervalSinceReferenceDate");
        *(_DWORD *)buf = 134219522;
        int64_t v33 = a7;
        __int16 v34 = 2112;
        id v35 = a5;
        __int16 v36 = 2112;
        id v37 = a6;
        __int16 v38 = 2112;
        id v39 = a8;
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        __int16 v44 = 2112;
        id v45 = v15;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Received responseCode %ld for IDS identifier %@ callbackID %@ error %@ lastCall? %@  messageContext serverReceivedTime: %@ _pendingTimestampUpdate contains identifier: %@", buf, 0x48u);
      }
    }
    id v18 = [(NSMutableDictionary *)self->_pendingSends objectForKey:a5];
    if ([v18 count])
    {
      [(MessageDeliveryController *)self _updateTimeStampForMessageIdentifierIfNeeded:a5 pendingTimeStampUpdateIdentifier:v15 alternateCallbackID:a6 messageContext:a10];
      uint64_t v19 = sub_7EDEC(a7, a8);
      uint64_t v20 = v19;
      if (a6)
      {
        CFStringRef v21 = (void (**)(id, void))[v18 objectForKey:a6];
        if (v21) {
          v21[2](v21, v20);
        }
        if (a9)
        {
          [v18 removeObjectForKey:a6];
          if (![v18 count])
          {
            [(NSMutableDictionary *)self->_pendingSends removeObjectForKey:a5];
            if (![(NSMutableDictionary *)self->_pendingSends count])
            {

              self->_pendingSends = 0;
            }
          }
          id v22 = [(NSMutableDictionary *)self->_pendingWillSendBlocks objectForKey:a5];
          if ([v22 objectForKey:a6])
          {
            [v22 removeObjectForKey:a6];
            if (![v22 count])
            {
              [(NSMutableDictionary *)self->_pendingWillSendBlocks removeObjectForKey:a5];
              if (![(NSMutableDictionary *)self->_pendingWillSendBlocks count])
              {

                self->_pendingWillSendBlocks = 0;
              }
            }
            if (v20 && IMOSLoggingEnabled())
            {
              v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                int64_t v33 = (int64_t)a5;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Delivery got lastCall update for %@ without having gotten a willSend update.", buf, 0xCu);
              }
            }
          }
          [(NSMutableDictionary *)self->_pendingTimestampUpdate removeObjectForKey:a6];
          if (![(NSMutableDictionary *)self->_pendingTimestampUpdate count])
          {
            pendingTimestampUpdate = self->_pendingTimestampUpdate;
            p_pendingTimestampUpdate = &self->_pendingTimestampUpdate;

LABEL_39:
            *p_pendingTimestampUpdate = 0;
          }
        }
      }
      else
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_3A02C;
        v30[3] = &unk_DE360;
        int v31 = v19;
        [v18 enumerateKeysAndObjectsUsingBlock:v30];
        if (a9)
        {
          if (objc_msgSend(-[NSMutableDictionary objectForKey:](self->_pendingWillSendBlocks, "objectForKey:", a5), "count"))
          {
            if (v20)
            {
              if (IMOSLoggingEnabled())
              {
                int v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  int64_t v33 = (int64_t)a5;
                  _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Delivery got lastCall update for %@ without having gotten a willSend update.", buf, 0xCu);
                }
              }
            }
          }
          [(NSMutableDictionary *)self->_pendingWillSendBlocks removeObjectForKey:a5];
          if (![(NSMutableDictionary *)self->_pendingWillSendBlocks count])
          {
            pendingWillSendBlocks = self->_pendingWillSendBlocks;
            p_pendingTimestampUpdate = &self->_pendingWillSendBlocks;

            goto LABEL_39;
          }
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v33 = (int64_t)a5;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "No pending sends for identifier %@", buf, 0xCu);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 alternateCallbackID:(id)a6 willSendToDestinations:(id)a7 skippedDestinations:(id)a8 registrationPropertyToDestinations:(id)a9
{
  if (a5)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138413314;
        id v19 = a5;
        __int16 v20 = 2112;
        id v21 = a6;
        __int16 v22 = 2112;
        id v23 = a7;
        __int16 v24 = 2112;
        id v25 = a8;
        __int16 v26 = 2112;
        id v27 = a9;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Received %@ callbackID %@ willSendTo %@ skipped %@ propertyMap %@", (uint8_t *)&v18, 0x34u);
      }
    }
    id v15 = [(NSMutableDictionary *)self->_pendingWillSendBlocks objectForKey:a5];
    if ([v15 count])
    {
      if (a6)
      {
        __int16 v16 = (void (**)(id, id, id, id))[v15 objectForKey:a6];
        if (v16) {
          v16[2](v16, a7, a8, a9);
        }
        [v15 removeObjectForKey:a6];
        if (![v15 count])
        {
          [(NSMutableDictionary *)self->_pendingWillSendBlocks removeObjectForKey:a5];
          if (![(NSMutableDictionary *)self->_pendingWillSendBlocks count])
          {

            self->_pendingWillSendBlocks = 0;
          }
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      CFStringRef v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = a5;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "No pending will send blocks for identifier %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)_enqueueUpdateBlock:(id)a3 willSendBlock:(id)a4 identifier:(id)a5 callbackID:(id)a6 messageCommandOption:(id)a7
{
  if (a5 && a6)
  {
    if (a7 && [a7 integerValue] == &stru_20.flags)
    {
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412546;
          id v23 = a5;
          __int16 v24 = 2112;
          id v25 = a6;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "We have a command 100 we need to update the timestamp for identifier: %@ alternateCallbackID: %@", (uint8_t *)&v22, 0x16u);
        }
      }
      pendingTimestampUpdate = self->_pendingTimestampUpdate;
      if (!pendingTimestampUpdate)
      {
        pendingTimestampUpdate = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_pendingTimestampUpdate = pendingTimestampUpdate;
      }
      if ([(NSMutableDictionary *)pendingTimestampUpdate objectForKey:a6])
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v22 = 138412546;
            id v23 = a5;
            __int16 v24 = 2112;
            id v25 = a6;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "We already have identifier (%@) to update the timestamp for callbackID (%@)", (uint8_t *)&v22, 0x16u);
          }
        }
      }
      [(NSMutableDictionary *)self->_pendingTimestampUpdate setObject:a5 forKey:a6];
    }
    id v15 = _Block_copy(a3);
    __int16 v16 = _Block_copy(a4);
    if (v15)
    {
      pendingSends = self->_pendingSends;
      if (!pendingSends)
      {
        pendingSends = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_pendingSends = pendingSends;
      }
      id v18 = [(NSMutableDictionary *)pendingSends objectForKey:a5];
      if (!v18)
      {
        id v18 = objc_alloc_init((Class)NSMutableDictionary);
        if (v18)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_pendingSends, a5, v18);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_95FA8();
          }
          id v18 = 0;
        }
      }
      CFDictionarySetValue((CFMutableDictionaryRef)v18, a6, v15);
    }
    if (v16)
    {
      pendingWillSendBlocks = self->_pendingWillSendBlocks;
      if (!pendingWillSendBlocks)
      {
        pendingWillSendBlocks = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_pendingWillSendBlocks = pendingWillSendBlocks;
      }
      id v21 = [(NSMutableDictionary *)pendingWillSendBlocks objectForKey:a5];
      if (!v21)
      {
        id v21 = objc_alloc_init((Class)NSMutableDictionary);
        if (v21)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_pendingWillSendBlocks, a5, v21);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_95F2C();
          }
          id v21 = 0;
        }
      }
      CFDictionarySetValue((CFMutableDictionaryRef)v21, a6, v16);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      id v23 = a5;
      __int16 v24 = 2112;
      id v25 = a6;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Nil identifier %@ or callbackID %@ passed into _enqueueUpdateBlock -- we won't be able to process IDS send feedback!", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (id)messageDictionaryWithMessageItem:(id)a3 isBusiness:(BOOL)a4 chatIdentifier:(id)a5 toParticipants:(id)a6 originallyToParticipants:(id)a7 additionalContext:(id)a8 msgPayloadUploadDictionary:(id)a9 originalPayload:(id)a10
{
  BOOL value = a4;
  if (IMOSLoggingEnabled())
  {
    __int16 v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v106 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Creating message dictionary for message item: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    id v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if ((([a3 isAudioMessage] & 1) != 0
       || objc_msgSend(objc_msgSend(a3, "balloonBundleID"), "length"))
      && ([a3 isFinished] & 1) == 0)
    {
      CFDictionarySetValue(v15, @"u", &__kCFBooleanTrue);
    }
    if ([a3 isAudioMessage]) {
      CFDictionarySetValue(v15, @"a", &__kCFBooleanTrue);
    }
    if ([a3 isAutoReply]) {
      CFDictionarySetValue(v15, @"ar", &__kCFBooleanTrue);
    }
    if ([a3 isFromExternalSource]) {
      CFDictionarySetValue(v15, @"ms", &__kCFBooleanTrue);
    }
    if ([a3 isSOS]) {
      CFDictionarySetValue(v15, @"sos", &__kCFBooleanTrue);
    }
    if ([a3 isCritical]) {
      CFDictionarySetValue(v15, @"c", &__kCFBooleanTrue);
    }
    [(MessageDeliveryController *)self _setReplyToGUIDForMessage:a3 messageDictionary:v15];
    id v16 = [a3 threadIdentifier];
    if (v16)
    {
      CFDictionarySetValue(v15, @"tg", v16);
      if ([(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])
      {
        id v17 = [(MessageDeliveryController *)self _threadOriginatorFallbackHashForMessageItem:a3];
        if (v17) {
          CFDictionarySetValue(v15, @"tgf", v17);
        }
        if (IMOSLoggingEnabled())
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = [v17 length];
            *(_DWORD *)buf = 134217984;
            id v106 = v19;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "setThreadOriginatorFallbackHash: len %llu", buf, 0xCu);
          }
        }
      }
    }
    if (objc_msgSend(a3, "associatedMessageGUID", v16))
    {
      id v20 = [a3 associatedMessageGUID];
      if (v20) {
        CFDictionarySetValue(v15, @"amk", v20);
      }
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [a3 associatedMessageGUID];
          *(_DWORD *)buf = 138412290;
          id v106 = v22;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "setAssociatedMessageGUID: %@", buf, 0xCu);
        }
      }
      if ([(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])
      {
        id v23 = [(MessageDeliveryController *)self _associatedMessageFallbackHashForMessageItem:a3];
        if (v23) {
          CFDictionarySetValue(v15, @"amf", v23);
        }
        if (IMOSLoggingEnabled())
        {
          __int16 v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v25 = [v23 length];
            *(_DWORD *)buf = 134217984;
            id v106 = v25;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "setAssociatedMessageFallbackHash: len %llu", buf, 0xCu);
          }
        }
      }
    }
    if ([a3 associatedMessageType])
    {
      __int16 v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 associatedMessageType]);
      if (v26) {
        CFDictionarySetValue(v15, @"amt", v26);
      }
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          id v28 = [a3 associatedMessageType];
          *(_DWORD *)buf = 134217984;
          id v106 = v28;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "setAssociatedMessageType: %lld", buf, 0xCu);
        }
      }
    }
    id v29 = [a3 associatedMessageRange];
    NSUInteger v31 = v30;
    if (v30 && !value)
    {
      NSUInteger v32 = (NSUInteger)v29;
      int64_t v33 = +[NSNumber numberWithUnsignedInteger:v29];
      if (v33) {
        CFDictionarySetValue(v15, @"amrlc", v33);
      }
      __int16 v34 = +[NSNumber numberWithUnsignedInteger:v31];
      if (v34) {
        CFDictionarySetValue(v15, @"amrln", v34);
      }
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v109.location = v32;
          v109.length = v31;
          __int16 v36 = NSStringFromRange(v109);
          *(_DWORD *)buf = 138412290;
          id v106 = v36;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "setAssociatedMessageRange: %@", buf, 0xCu);
        }
      }
    }
    if ([a3 associatedMessageEmoji])
    {
      id v37 = [a3 associatedMessageEmoji];
      if (v37) {
        CFDictionarySetValue(v15, @"ame", v37);
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "setAssociatedMessageEmoji", buf, 2u);
        }
      }
    }
    id v39 = [a3 messageSummaryInfoForSending];
    if ([v39 count])
    {
      __int16 v40 = +[NSData dataWithMessageSummaryInfoDictionary:v39];
      if (v40) {
        CFDictionarySetValue(v15, @"msi", v40);
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "balloonBundleID", v40), "length"))
    {
      id v41 = [a3 balloonBundleID];
      if (v41) {
        CFDictionarySetValue(v15, @"bid", v41);
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = [a3 balloonBundleID];
          *(_DWORD *)buf = 138412290;
          id v106 = v43;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Set balloonBundleID: %@", buf, 0xCu);
        }
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "length"))
    {
      id v44 = [a3 expressiveSendStyleID];
      if (v44) {
        CFDictionarySetValue(v15, @"iid", v44);
      }
      if (IMOSLoggingEnabled())
      {
        id v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          id v46 = [a3 expressiveSendStyleID];
          *(_DWORD *)buf = 138412290;
          id v106 = v46;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Set expressiveSendStyleID: %@", buf, 0xCu);
        }
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "typingIndicatorIcon"), "length"))
    {
      id v47 = objc_msgSend(objc_msgSend(a3, "typingIndicatorIcon"), "_FTCopyGzippedData");
      if (v47) {
        CFDictionarySetValue(v15, @"tic", v47);
      }

      if (IMOSLoggingEnabled())
      {
        v48 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          id v49 = [a3 guid];
          *(_DWORD *)buf = 138412290;
          id v106 = v49;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Set typing indicator data for guid %@", buf, 0xCu);
        }
      }
    }
    id v50 = [(MessageDeliveryController *)self _compressedAttributionInfoForMessage:a3];
    if (v50)
    {
      CFDictionarySetValue(v15, @"ati", v50);
      if (IMOSLoggingEnabled())
      {
        v51 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          id v52 = [v50 length];
          id v53 = [a3 guid];
          *(_DWORD *)buf = 134218242;
          id v106 = v52;
          __int16 v107 = 2112;
          id v108 = v53;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "set attribution info data (%tu bytes) for guid %@", buf, 0x16u);
        }
      }
    }
    if (!a7) {
      a7 = a6;
    }
    if (IMOSLoggingEnabled())
    {
      v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v106 = a7;
        _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "participants: %@", buf, 0xCu);
      }
    }
    unsigned int v55 = [(MessageDeliveryController *)self _shouldSendAuxXML:a3];
    if (([a3 isTypingMessage] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          CFStringRef v57 = @"NO";
          if (v55) {
            CFStringRef v57 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          id v106 = (id)v57;
          _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "sendAuxXMLVersion: %@", buf, 0xCu);
        }
      }
    }
    if ([a3 isFinished])
    {
      v58 = -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:isAudioMessage:]([SuperToMessageParserContext alloc], "initWithAttributedString:includeMessageParts:isAudioMessage:", [a3 body], objc_msgSend(a3, "shouldSendPartIndexesInMessageBody"), objc_msgSend(a3, "isAudioMessage"));
      [+[IMAttributedStringParser sharedInstance] parseContext:v58];
      id v59 = objc_msgSend(objc_msgSend(a3, "body"), "string");
      if ([(SuperToMessageParserContext *)v58 isSimpleString])
      {
        int v60 = 0;
      }
      else
      {
        if (objc_msgSend(objc_msgSend(a3, "body"), "length")) {
          BOOL v61 = v59 == 0;
        }
        else {
          BOOL v61 = 1;
        }
        int v60 = !v61;
      }
      v62 = [(SuperToMessageParserContext *)v58 outHTML];
      v63 = [(SuperToMessageParserContext *)v58 AuxHTML];
      if (@"1") {
        CFDictionarySetValue(v15, @"v", @"1");
      }
      id v64 = [(MessageDeliveryController *)self _replicationSourceIDForSending];
      if (v64) {
        CFDictionarySetValue(v15, @"rp", v64);
      }
      if (v62) {
        int v65 = v60;
      }
      else {
        int v65 = 0;
      }
      if (v65 == 1) {
        CFDictionarySetValue(v15, @"x", v62);
      }
      if (v63) {
        unsigned int v66 = v55;
      }
      else {
        unsigned int v66 = 0;
      }
      if (v66 == 1) {
        CFDictionarySetValue(v15, @"ix", v63);
      }
      if (v59) {
        CFDictionarySetValue(v15, @"t", v59);
      }
      id v67 = [a3 subject];
      if (v67) {
        CFDictionarySetValue(v15, @"s", v67);
      }
      if (a7) {
        CFDictionarySetValue(v15, @"p", a7);
      }
      if (objc_msgSend(a3, "isExpirable", v67)) {
        CFDictionarySetValue(v15, @"e", &__kCFBooleanTrue);
      }
    }
    if ((([a3 isTypingMessage] | value) & 1) == 0)
    {
      id v68 = [a3 contactsAvatarRecipeData];
      if (v68)
      {
        CFDictionarySetValue(v15, @"sld", v68);
        if (IMOSLoggingEnabled())
        {
          v69 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v69, OS_LOG_TYPE_INFO, "set avatar likeness", buf, 2u);
          }
        }
      }
      [(MessageDeliveryController *)self _sendNicknameToRecipientsIfNeededForChat:[(MessageDeliveryController *)self _chatForChatIdentifier:a5] forMessage:a3];
      [(MessageDeliveryController *)self appendChatRelatedPropertiesToMessageDictionary:v15 forMessage:a3 chatIdentifier:a5];
    }
    id v70 = [a3 bizIntent];
    v71 = v70;
    if (v70)
    {
      id v72 = [v70 objectForKey:@"biz-intent-id"];
      id v73 = [v71 objectForKey:@"biz-group-id"];
      if (v72) {
        CFDictionarySetValue(v15, @"bint", v72);
      }
      if (v73) {
        CFDictionarySetValue(v15, @"bgrp", v73);
      }
    }
    if ([a3 locale])
    {
      id v74 = [a3 locale];
      if (v74) {
        CFDictionarySetValue(v15, @"bloc", v74);
      }
    }
    if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags", v74), "isBIAEnabled"))
    {
      id v75 = [(MessageDeliveryController *)self _chatForChatIdentifier:a5];
      if ([v75 containsActiveBIASession])
      {
        id v76 = [v75 lastUsedBIAUserID];
        if ([v76 length])
        {
          if (v76) {
            CFDictionarySetValue(v15, @"buid", v76);
          }
          id v77 = [v75 lastUsedBIAReferenceID];
          id v78 = [v77 length];
          if (v77 && v78) {
            CFDictionarySetValue(v15, @"brid", v77);
          }
        }
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "payloadData"), "length"))
    {
      if (a9)
      {
        if (IMOSLoggingEnabled())
        {
          v79 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "Set balloon payload attachment dictionary", buf, 2u);
          }
        }
        CFDictionarySetValue(v15, @"bpdi", a9);
      }
      else
      {
        id v80 = a10;
        if (!a10) {
          id v80 = [a3 payloadData];
        }
        id valuea = [v80 _FTCopyGzippedData];
        id v81 = [a3 balloonBundleID];
        if ([v81 isEqualToString:IMBalloonPluginIdentifierRichLinks]
          && objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count"))
        {
          if (IMOSLoggingEnabled())
          {
            v82 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              id v83 = [a3 guid];
              *(_DWORD *)buf = 138412290;
              id v106 = v83;
              _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, "Trying to recombine rich link payload from attachments for msg guid %@", buf, 0xCu);
            }
          }
          v84 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
          long long v102 = 0u;
          long long v103 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v85 = [a3 fileTransferGUIDs];
          id v86 = [v85 countByEnumeratingWithState:&v100 objects:v104 count:16];
          if (v86)
          {
            uint64_t v87 = *(void *)v101;
            do
            {
              for (i = 0; i != v86; i = (char *)i + 1)
              {
                if (*(void *)v101 != v87) {
                  objc_enumerationMutation(v85);
                }
                id v89 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:*(void *)(*((void *)&v100 + 1) + 8 * i)];
                if (v84)
                {
                  v90 = v89;
                  if ([v89 localURL]) {
                    CFArrayAppendValue(v84, [v90 localURL]);
                  }
                }
              }
              id v86 = [v85 countByEnumeratingWithState:&v100 objects:v104 count:16];
            }
            while (v86);
          }

          [a3 payloadData];
          id valuea = [(id)IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs() _FTCopyGzippedData];
        }
        if (valuea) {
          CFDictionarySetValue(v15, @"bp", valuea);
        }
        if (IMOSLoggingEnabled())
        {
          v91 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            id v92 = [a3 guid];
            *(_DWORD *)buf = 138412290;
            id v106 = v92;
            _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "set balloon payload for msg guid %@", buf, 0xCu);
          }
        }
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "replicatedFallbackGUIDs"), "count")) {
      -[__CFDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", [a3 replicatedFallbackGUIDs], @"rf");
    }
    if ([(__CFDictionary *)v15 count])
    {
      if ([a8 count])
      {
        [(__CFDictionary *)v15 addEntriesFromDictionary:a8];
        if (IMOSLoggingEnabled())
        {
          v93 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v106 = a8;
            _os_log_impl(&dword_0, v93, OS_LOG_TYPE_INFO, " => Adding context: %@", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    v94 = IMLogHandleForCategory();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_96024();
    }
    return 0;
  }
  return v15;
}

- (id)idsOptionsWithMessageItem:(id)a3 toID:(id)a4 fromID:(id)a5 sendGUIDData:(id)a6 alternateCallbackID:(id)a7 isBusinessMessage:(BOOL)a8 chatIdentifier:(id)a9 requiredRegProperties:(id)value interestingRegProperties:(id)a11 requiresLackOfRegProperties:(id)a12 deliveryContext:(id)a13 isGroupChat:(BOOL)a14 canInlineAttachments:(BOOL)a15 msgPayloadUploadDictionary:(id)a16 messageDictionary:(id)a17
{
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)BOOL v61 = a3;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Setting IDS options with messageItem: %@", buf, 0xCu);
    }
  }
  unsigned int v24 = [a4 isEqualToString:a5];
  id v25 = +[NSNumber numberWithInteger:100];
  if (v24) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = [a3 isTypingMessage] ^ 1;
  }
  id v27 = +[NSNumber numberWithBool:v26];
  id v28 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v25, IDSSendMessageOptionCommandKey, v27, IDSSendMessageOptionWantsResponseKey, a5, IDSSendMessageOptionFromIDKey, a6, IDSSendMessageOptionUUIDKey, a7, IDSSendMessageOptionAlternateCallbackIdentifierKey, 0);
  if (!a8)
  {
    id v29 = [(MessageDeliveryController *)self _keyTransparencyEnforcementDictionaryForChatIdentifier:a9];
    if (v29) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, @"IDSSendMessageOptionKTVerificationUUIDKey", v29);
    }
  }
  if (value) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, value);
  }
  if (a11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionInterestingRegistrationPropertiesKey, a11);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  if (a13)
  {
    if (IMOSLoggingEnabled())
    {
      NSUInteger v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = [a3 guid];
        *(_DWORD *)buf = 138412802;
        *(void *)BOOL v61 = v31;
        *(_WORD *)&v61[8] = 2112;
        id v62 = a13;
        __int16 v63 = 1024;
        BOOL v64 = a14;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Requsting delivery status for message GUID %@ due to delivery context %@ isGroupChat %{BOOL}d", buf, 0x1Cu);
      }
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionDeliveryStatusContextKey, a13);
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanTrue);
  }
  if (((a14 | v24) & 1) == 0 && ([a3 isTypingMessage] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      NSUInteger v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        id v33 = [a3 guid];
        *(_DWORD *)buf = 138412290;
        *(void *)BOOL v61 = v33;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Requsting delivery status for message GUID %@ because !isGroupChat", buf, 0xCu);
      }
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanTrue);
  }
  if ([a3 isTypingMessage]) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionFireAndForgetKey, &__kCFBooleanTrue);
  }
  if (a12) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionRequireLackOfRegistrationPropertiesKey, a12);
  }
  if (([a3 isTypingMessage] & 1) == 0
    && objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "certifiedDeliveryEnabled")&& !a8)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionWantsCertifiedDeliveryKey, &__kCFBooleanTrue);
  }
  if ([a17 count])
  {
    id v34 = [a17 valueForKey:@"oe"];
    if (v34) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, @"IDSSendMessageOptionOriginalTimestampKey", v34);
    }
    id v35 = (void *)JWEncodeDictionary();
    if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count") && !a15
      || (id v36 = objc_msgSend(objc_msgSend(a3, "payloadData"), "length"), a16) && v36)
    {
      if (IMOSLoggingEnabled())
      {
        id v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          id v38 = [a3 fileTransferGUIDs];
          CFStringRef v39 = @"NO";
          if (a15) {
            CFStringRef v39 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)BOOL v61 = v38;
          *(_WORD *)&v61[8] = 2112;
          id v62 = (id)v39;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Not compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
        }
      }
      id v40 = v35;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          id v42 = [a3 fileTransferGUIDs];
          CFStringRef v43 = @"NO";
          if (a15) {
            CFStringRef v43 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)BOOL v61 = v42;
          *(_WORD *)&v61[8] = 2112;
          id v62 = (id)v43;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
        }
      }
      id v40 = [v35 _FTCopyGzippedData];
    }
    id v44 = v40;
    if (IMOSLoggingEnabled())
    {
      id v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        unsigned int v46 = [v35 length];
        unsigned int v47 = [v44 length];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)BOOL v61 = v46;
        *(_WORD *)&v61[4] = 1024;
        *(_DWORD *)&v61[6] = v47;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Compressed message data from: %u  to: %u", buf, 0xEu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        unsigned int v49 = [v44 length];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)BOOL v61 = v49;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %u", buf, 8u);
      }
    }
    [(NSMutableDictionary *)v28 setObject:v44 forKey:IDSSendMessageOptionDataToEncryptKey];
  }
  id v50 = (const void **)&IDSSendMessageOptionTimeoutKey;
  if (![a3 scheduleType])
  {
    v56 = (NSSet *)&off_E3990;
    goto LABEL_77;
  }
  v51 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  if (v51) {
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionTimeoutKey, v51);
  }
  objc_msgSend(objc_msgSend(a3, "time", v51), "timeIntervalSinceNow");
  double v53 = v52;
  if ([a3 scheduleType] == (char *)&dword_0 + 1)
  {
    if (v53 > 0.0)
    {
      v54 = +[NSNumber numberWithDouble:v53];
      if (v54) {
        CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionDeliveryMinimumTimeDelayKey, v54);
      }
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionAlwaysIncludeSelfKey, &__kCFBooleanTrue);
    id v55 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:", [a3 guid]);
    if (v55) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSSendMessageOptionQueueOneIdentifierKey, v55);
    }
    v56 = +[NSSet setWithObject:IDSRegistrationPropertySupportsEmojiStickers];
    if (v56)
    {
      id v50 = (const void **)&IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
LABEL_77:
      CFDictionarySetValue((CFMutableDictionaryRef)v28, *v50, v56);
    }
  }
  else if ([a3 scheduleType] == (char *)&dword_0 + 2)
  {
    if (v53 > 0.0)
    {
      objc_msgSend(objc_msgSend(a3, "time"), "timeIntervalSince1970");
      CFStringRef v57 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      if (v57) {
        CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionDeliveryMinimumTimeKey, v57);
      }
    }
    CFDictionarySetValue((CFMutableDictionaryRef)v28, IMIDSSendMessageOptionAlwaysIncludeSelfKey, &__kCFBooleanTrue);
    v56 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:", [a3 guid]);
    if (v56)
    {
      id v50 = (const void **)&IDSSendMessageOptionQueueOneIdentifierKey;
      goto LABEL_77;
    }
  }
  return v28;
}

- (id)_getQueueIdentifierFromGUID:(id)a3
{
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = [objc_alloc((Class)NSMutableData) initWithLength:32];
  CC_SHA256([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), (unsigned __int8 *)objc_msgSend(v4, "mutableBytes"));
  id v5 = [v4 base64EncodedStringWithOptions:0];

  return v5;
}

- (BOOL)_shouldSendAuxXML:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [a3 fileTransferGUIDs];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v9 = (__CFString *)[+[IMDFileTransferCenter sharedInstance] transferForGUID:v8];
        if ([(__CFString *)v9 isAuxImage])
        {
          if ([+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance") transferForGUID:+[IMFileTransfer AuxGUIDFromFileTransferGUID:v8]])
          {
            BOOL v11 = 1;
            goto LABEL_15;
          }
          if (IMOSLoggingEnabled())
          {
            v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v15;
              CFStringRef v21 = v9;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "shouldSendAuxXML we expected to find an Aux video for transfer %@", buf, 0xCu);
            }
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_15:
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (v11) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "shouldSendAuxXML %@", buf, 0xCu);
    }
  }
  return v11;
}

- (id)_compressedAttributionInfoForMessage:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [a3 fileTransferGUIDs];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (!v6) {
    return 0;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v21;
  *(void *)&long long v7 = 138412290;
  long long v18 = v7;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      id v12 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v11];
      if ([v12 attributionInfo])
      {
        CFStringRef v13 = (NSNull *)[v12 attributionInfo];
        char v8 = 1;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            uint64_t v25 = v11;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "attributionInfo is nil for transferGUID %@", buf, 0xCu);
          }
        }
        CFStringRef v13 = +[NSNull null];
      }
      [v4 addObject:v13];
    }
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  }
  while (v6);
  if ((v8 & 1) == 0) {
    return 0;
  }
  uint64_t v19 = 0;
  id v15 = [(NSData *)+[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:0 error:&v19] _FTCopyGzippedData];
  if (v19)
  {
    if (IMOSLoggingEnabled())
    {
      long long v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v18;
        uint64_t v25 = v19;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Failed to unarchive attributionInfo. Error: %@", buf, 0xCu);
      }
    }
  }
  return v15;
}

- (BOOL)forceBackwardsCompatibleMessageForBundleID:(id)a3
{
  v15[0] = IMBalloonExtensionIDWithSuffix();
  v15[1] = IMBalloonExtensionIDWithSuffix();
  id v4 = +[NSArray arrayWithObjects:v15 count:2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      char v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) isEqualToString:a3])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        char v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (BOOL)shouldSendBackwardsCompatibleMessageForBundleID:(id)a3
{
  if (![a3 hasPrefix:@"com.apple.messages.MSMessageExtensionBalloonPlugin"]) {
    return 1;
  }

  return [(MessageDeliveryController *)self forceBackwardsCompatibleMessageForBundleID:a3];
}

- (id)_chatForChatIdentifier:(id)a3
{
  id result = [(MessageServiceSession *)[(MessageDeliveryController *)self session] chatForChatIdentifier:a3 style:45];
  if (!result)
  {
    id v6 = [(MessageDeliveryController *)self session];
    return [(MessageServiceSession *)v6 chatForChatIdentifier:a3 style:43];
  }
  return result;
}

- (void)_sendNicknameToRecipientsIfNeededForChat:(id)a3 forMessage:(id)a4
{
  if ([a4 shouldSendMeCard])
  {
    if (0xCCCCCCCCCCCCCCCDLL * (unint64_t)[a3 numMessagesSent] <= 0x3333333333333333)
    {
      [a3 meCardUpdated];
    }
    else
    {
      id v5 = (char *)[a3 numMessagesSent];
      unsigned int v6 = [a3 meCardUpdated];
      if (v5 != (unsigned char *)&dword_0 + 1 && !v6)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            __int16 v14 = 0;
            char v8 = "Not appending me card to message dictionary";
LABEL_11:
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v14, 2u);
            return;
          }
        }
        return;
      }
    }
    id v9 = +[NSMutableSet set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [a3 participants];
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "ID"));
        }
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    [+[IMDNicknameController sharedInstance] markHandlesAsAllowed:v9];
    -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:onlySendToThoseLoggedOutOfIMessage:](+[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"), "sendPersonalNicknameToRecipients:chatGUID:fromHandle:onlySendToThoseLoggedOutOfIMessage:", [a3 participants], objc_msgSend(a3, "guid"), objc_msgSend(a3, "lastAddressedLocalHandle"), 1);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = 0;
      char v8 = "Not appending me card, message.shouldSendMeCard is false, indicating recipient is not in the allowed audience"
           " for nickname sharing";
      goto LABEL_11;
    }
  }
}

- (void)_appendMyNicknameToMessageDictionary:(id)a3 forMessage:(id)a4 chat:(id)a5
{
  if ([a4 shouldSendMeCard])
  {
    if (0xCCCCCCCCCCCCCCCDLL * (unint64_t)[a5 numMessagesSent] <= 0x3333333333333333)
    {
      unsigned int v10 = [a5 meCardUpdated];
    }
    else
    {
      char v8 = (char *)[a5 numMessagesSent];
      unsigned int v9 = [a5 meCardUpdated];
      unsigned int v10 = v9;
      if (v8 != (unsigned char *)&dword_0 + 1 && !v9)
      {
        if (IMOSLoggingEnabled())
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            LOWORD(v27) = 0;
            uint64_t v12 = "Not appending me card to message dictionary";
LABEL_11:
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v27, 2u);
            return;
          }
        }
        return;
      }
    }
    id v13 = [+[IMDNicknameController sharedInstance] newNicknameInfoToSend];
    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        long long v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412290;
          id v28 = [a4 guid];
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Including me card in this message %@", (uint8_t *)&v27, 0xCu);
        }
      }
      if (objc_msgSend(objc_msgSend(+[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 0), "objectForKey:", @"enable-snap-v2-back-compat"), "BOOLValue"))
      {
        id v16 = +[NSMutableSet set];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v17 = objc_msgSend(a5, "participants", 0);
        id v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v23;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v23 != v19) {
                objc_enumerationMutation(v17);
              }
              objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "ID"));
            }
            id v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v18);
        }
        [+[IMDNicknameController sharedInstance] markHandlesAsAllowed:v16];
        [a3 addEntriesFromDictionary:v13];
      }
    }
    else if (v14)
    {
      long long v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        id v28 = [a4 guid];
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Me card data not available, not including in message %@", (uint8_t *)&v27, 0xCu);
      }
    }
    if (v10) {
      [a5 setMeCardUpdated:0];
    }
    return;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      uint64_t v12 = "Not appending me card, message.shouldSendMeCard is false, indicating recipient is not in the allowed audienc"
            "e for nickname sharing";
      goto LABEL_11;
    }
  }
}

- (void)_appendRecipientAvailabilityVerificationInfoToMessageDictionary:(id)a3 forChat:(id)a4
{
  if ([a4 style] != 45)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    unsigned int v9 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v28) = 0;
    unsigned int v10 = "Not appending availability verification info for non 1-1 chat";
    goto LABEL_11;
  }
  id v7 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
  if (v7)
  {
    id v8 = objc_msgSend(objc_msgSend(v7, "ID"), "_stripFZIDPrefix");
    if ([v8 length])
    {
      if (+[IMDAvailabilityVerificationManager deviceSupportsSubscriptionValidationTokens])
      {
        if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isCarrierPigeonEnabled"))
        {
          if (0xAAAAAAAAAAAAAAABLL * (unint64_t)[a4 numMessagesSent] + 0x5555555555555555 >= 0x5555555555555555)
          {
            if (IMOSLoggingEnabled())
            {
              id v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                int v28 = 134217984;
                uint64_t v29 = 3;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Not appending off grid availability verification info to this message. Info is only included in one of every %ld messages.", (uint8_t *)&v28, 0xCu);
              }
            }
            [+[IMDOffGridAvailabilityVerificationManager sharedInstance] populateCacheForHandleID:v8];
          }
          else
          {
            [(MessageDeliveryController *)self _appendOffGridAvailabilityPropertiesToMessageDictionary:a3 participantHandleID:v8];
          }
        }
        if (0xAAAAAAAAAAAAAAABLL * (unint64_t)[a4 numMessagesSent] < 0x5555555555555556)
        {
          id v15 = [+[IMDAvailabilityVerificationManager sharedInstance] cachedAvailabilityVerificationTokensForHandleID:v8];
          id v16 = v15;
          if (v15)
          {
            id v17 = [v15 subscriptionValidationToken];
            if (IMOSLoggingEnabled())
            {
              id v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                int v28 = 138412546;
                uint64_t v29 = (uint64_t)v17;
                __int16 v30 = 2112;
                id v31 = v8;
                _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Appending subscriptionValidationToken \"%@\" to message for handleID \"%@\"", (uint8_t *)&v28, 0x16u);
              }
            }
            [a3 setObject:v17 forKey:@"arc"];
            id v19 = [v16 encryptionValidationToken];
            if (v19)
            {
              if (IMOSLoggingEnabled())
              {
                long long v20 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  int v28 = 138412546;
                  uint64_t v29 = (uint64_t)v19;
                  __int16 v30 = 2112;
                  id v31 = v8;
                  _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Appending encryptionValidationToken \"%@\" to message for handleID \"%@\"", (uint8_t *)&v28, 0x16u);
                }
              }
              [a3 setObject:v19 forKey:@"are"];
            }
          }
          else
          {
            long long v21 = IMLogHandleForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_960C0((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            int v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              int v28 = 134217984;
              uint64_t v29 = 3;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Not appending availability verification info to this message. Info is only included in one of every %ld messages.", (uint8_t *)&v28, 0xCu);
            }
          }
          [+[IMDAvailabilityVerificationManager sharedInstance] populateCacheWithAvailabilityVerificationTokensForHandleID:v8];
        }
        return;
      }
      if (!IMOSLoggingEnabled()) {
        return;
      }
      unsigned int v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v28) = 0;
      unsigned int v10 = "Not appending availability verification info to this message. Device does not support validation tokens.";
LABEL_11:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v28, 2u);
      return;
    }
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_9608C();
    }
  }
  else
  {
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_96058();
    }
  }
}

- (void)_appendOffGridAvailabilityPropertiesToMessageDictionary:(id)a3 participantHandleID:(id)a4
{
  if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isCarrierPigeonEnabled"))
  {
    id v6 = [+[IMDOffGridAvailabilityVerificationManager sharedInstance] cachedAvailabilityTokensForHandleID:a4];
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 subscriptionValidationToken];
      id v9 = [v7 encryptionValidationToken];
      if (IMOSLoggingEnabled())
      {
        unsigned int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v19 = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          id v22 = a4;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Appending offGridRecipientSubscriptionValidationTokenKey %@ to message for handleID %@", (uint8_t *)&v19, 0x16u);
        }
      }
      [a3 setObject:v8 forKeyedSubscript:@"aogrs"];
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int v19 = 138412546;
            id v20 = v9;
            __int16 v21 = 2112;
            id v22 = a4;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Appending offGridRecipientEncryptionValidationTokenKey %@ to message for handleID %@", (uint8_t *)&v19, 0x16u);
          }
        }
        [a3 setObject:v9 forKeyedSubscript:@"aogre"];
      }
    }
    else
    {
      uint64_t v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_9612C((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (void)appendChatRelatedPropertiesToMessageDictionary:(id)a3 forMessage:(id)a4 chatIdentifier:(id)a5
{
  id v9 = [(MessageDeliveryController *)self _chatForChatIdentifier:a5];
  if (v9)
  {
    unsigned int v10 = v9;
    if ([(MessageDeliveryController *)self _nicknameFeatureEnabled])
    {
      [(MessageDeliveryController *)self _appendMyNicknameToMessageDictionary:a3 forMessage:a4 chat:v10];
      [(MessageDeliveryController *)self _appendRecipientNicknameTruncatedRecordIDToMessageDictionary:a3 forChat:v10];
    }
    [(MessageDeliveryController *)self _appendRecipientAvailabilityVerificationInfoToMessageDictionary:a3 forChat:v10];
    [(MessageDeliveryController *)self _appendSeenOffGridStatusToMessageDictionary:a3 forChat:v10];
    id v11 = (char *)[v10 numMessagesSent] + 1;
    _[v10 setNumMessagesSent:v11];
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_96198((uint64_t)a5, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)_appendRecipientNicknameTruncatedRecordIDToMessageDictionary:(id)a3 forChat:(id)a4
{
  if ([a4 style] == 45)
  {
    id v6 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
    if (v6)
    {
      id v7 = v6;
      id v8 = -[IMDNicknameController nicknameForHandleURI:](+[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"), "nicknameForHandleURI:", [v6 ID]);
      int v9 = IMOSLoggingEnabled();
      if (v8)
      {
        if (v9)
        {
          unsigned int v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412546;
            id v15 = [v7 ID];
            __int16 v16 = 2112;
            id v17 = v8;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "We have a nickname for handle id %@ nickname %@", (uint8_t *)&v14, 0x16u);
          }
        }
        id v11 = [+[IMDNicknameController sharedInstance] substringRecordIDForNickname:v8];
        if ([v11 length])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412290;
              id v15 = v11;
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Setting truncated record ID %@", (uint8_t *)&v14, 0xCu);
            }
          }
          [a3 setObject:v11 forKey:MessageDictionaryNicknameParticipantTruncatedRIDKey];
        }
      }
      else if (v9)
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412546;
          id v15 = [v7 ID];
          __int16 v16 = 2112;
          id v17 = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "No nickname or record id did not  exist for handle ID %@ nickname %@", (uint8_t *)&v14, 0x16u);
        }
      }
    }
  }
}

- (void)_appendSeenOffGridStatusToMessageDictionary:(id)a3 forChat:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Attempting to append off grid status to message dictionary", buf, 2u);
    }
  }
  if ([a4 style] == 45)
  {
    id v7 = objc_msgSend(objc_msgSend(a4, "participants"), "lastObject");
    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_3DB84;
      v10[3] = &unk_DE388;
      v10[4] = v7;
      v10[5] = a3;
      [v7 cachedOffGridModeAndLastPublisherWithCompletion:v10];
      return;
    }
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        int v9 = "No participant found, not appending off grid status";
        goto LABEL_13;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      int v9 = "Not appending off grid status, not a 1:1 chat";
LABEL_13:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }
}

- (id)_computeRegPropertiesForNewFeatures:(id)a3 currentRegProperties:(id)a4 currentInterestingProp:(id)a5
{
  if (a4) {
    id v7 = +[NSMutableSet setWithSet:a4];
  }
  else {
    id v7 = (NSMutableSet *)+[NSMutableSet set];
  }
  id v8 = v7;
  if (a5) {
    int v9 = +[NSMutableSet setWithSet:a5];
  }
  else {
    int v9 = (NSMutableSet *)+[NSMutableSet set];
  }
  unsigned int v10 = v9;
  id v38 = a3;
  CFStringRef v39 = v9;
  if ([a3 isTypingMessage])
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = [a3 guid];
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Not adding required reg properties for typing message msg %@", buf, 0xCu);
      }
    }
    LOBYTE(v12) = 0;
    goto LABEL_67;
  }
  if ([a3 associatedMessageType] && (uint64_t)objc_msgSend(a3, "associatedMessageType") >= 1001)
  {
    [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsAcknowledgementsV1];
    id v13 = objc_msgSend(objc_msgSend(a3, "messageSummaryInfo"), "__im_associatedMessagePluginBundleID");
    if ([v13 isEqualToString:IMBalloonPluginIdentifierPhotosExtension]) {
      [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsPhotosExtensionV2];
    }
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  int v14 = (char *)[a3 associatedMessageType];
  if (v14 == (unsigned char *)&stru_790.reserved1 + 2
    || v14 == &stru_BA0.segname[14]
    || (id v15 = (char *)[a3 associatedMessageType], v15 == &stru_BA0.segname[15])
    || v15 == (unsigned char *)&stru_790.reserved1 + 3)
  {
    [(NSMutableSet *)v8 addObject:@"supports-stick-moji-backs"];
    int v12 = 1;
  }
  if (objc_msgSend(objc_msgSend(a3, "balloonBundleID"), "length"))
  {
    id v16 = [a3 balloonBundleID];
    if (([v16 isEqualToString:IMBalloonPluginIdentifierRichLinks] & 1) == 0)
    {
      [a3 handle];
      int IsBusinessID = IMStringIsBusinessID();
      id v18 = [a3 balloonBundleID];
      if (IsBusinessID)
      {
        if ([(MessageDeliveryController *)self shouldSendBackwardsCompatibleMessageForBundleID:v18])
        {
          CFStringRef v19 = @"supports-biz-forward-compat-apps-v1";
LABEL_32:
          [(NSMutableSet *)v8 addObject:v19];
        }
      }
      else if ([v18 isEqualToString:IMBalloonExtensionIDWithSuffix()])
      {
        [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsActivitySharing];
      }
      else if (objc_msgSend(objc_msgSend(a3, "balloonBundleID"), "isEqualToString:", IMBalloonExtensionIDWithSuffix()))
      {
        CFStringRef v19 = (const __CFString *)IDSRegistrationPropertySupportsPhotosExtensionV1;
        goto LABEL_32;
      }
      [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsChatAppsV1];
      int v12 = 1;
    }
  }
  [a3 payloadData];
  id v20 = (void *)IMBalloonPluginRequiredCapabilitiesWithMessageData();
  if ([v20 count])
  {
    [(NSMutableSet *)v8 addObjectsFromArray:v20];
    int v12 = 1;
  }
  if ([a3 isAudioMessage]
    && ([a3 backwardsCompatibleVersion] & 1) == 0)
  {
    [(NSMutableSet *)v8 addObject:@"supports-audio-messaging-v2"];
    int v12 = 1;
  }
  id v21 = [a3 expressiveSendStyleID];
  uint64_t v22 = IMImpactEffectID_InvisibleInk;
  if ([v21 isEqualToString:IMImpactEffectID_InvisibleInk])
  {
    [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsInvisibleInkV1];
    int v12 = 1;
  }
  if (objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "length"))
  {
    if ((objc_msgSend(objc_msgSend(a3, "expressiveSendStyleID"), "isEqualToString:", v22) & 1) == 0)
    {
      id v23 = -[MessageDeliveryController _propertyForExpressiveSendStyle:](self, "_propertyForExpressiveSendStyle:", [a3 expressiveSendStyleID]);
      if (v23)
      {
        id v24 = v23;
        if (v12) {
          uint64_t v25 = v10;
        }
        else {
          uint64_t v25 = v8;
        }
        [(NSMutableSet *)v25 addObject:v24];
        LOBYTE(v12) = 1;
      }
    }
  }
  if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count"))
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = [a3 fileTransferGUIDs];
    id v27 = [v26 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v44;
      uint64_t v41 = IDSRegistrationPropertySupportsAnimojiV2;
      uint64_t v29 = IDSRegistrationPropertySupportsAutoloopVideoV1;
      uint64_t v40 = IDSRegistrationPropertySupportsEmojiStickers;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v26);
          }
          id v31 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          unsigned __int8 v32 = [v31 isAutoloopVideo];
          uint64_t v33 = v29;
          if ((v32 & 1) != 0
            || objc_msgSend(v31, "isAnimojiV2", v29)
            && (v34 = [v31 wantsAlphaRemoved], uint64_t v33 = v41, (v34 & 1) == 0))
          {
            [(NSMutableSet *)v8 addObject:v33];
            LOBYTE(v12) = 1;
          }
          if (objc_msgSend(v31, "isAdaptiveImageGlyph", v33))
          {
            [(NSMutableSet *)v8 addObject:@"supports-emoji-images"];
            LOBYTE(v12) = 1;
          }
          if ((objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isClingBackwardsCompatibilityEnabled") & 1) == 0&& -[MessageDeliveryController _transferIsUserGeneratedOrEmojiSticker:](self, "_transferIsUserGeneratedOrEmojiSticker:", v31))
          {
            [(NSMutableSet *)v8 addObject:v40];
            LOBYTE(v12) = 1;
          }
        }
        id v27 = [v26 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v27);
    }
  }
  if ([v38 isBeingRetried]) {
    [(NSMutableSet *)v8 addObject:IDSRegistrationPropertySupportsOriginalTimestampOrderingV1];
  }
LABEL_67:
  if ([(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])
  {
    unsigned int v35 = [v38 isSOS];
    id v36 = &IDSRegistrationPropertySupportsSOSAlerting;
    if (!v35) {
      id v36 = &IDSRegistrationPropertySupportsHybridGroupsV1;
    }
    [(NSMutableSet *)v8 addObject:*v36];
  }
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, @"req", v39, @"int", +[NSNumber numberWithBool:v12 & 1], @"newFeature", 0);
}

- (BOOL)_transferIsUserGeneratedOrEmojiSticker:(id)a3
{
  LODWORD(v4) = [a3 isSticker];
  if (v4)
  {
    id v5 = [a3 attributionInfo];
    id v6 = [v5 objectForKeyedSubscript:IMFileTransferAttributionInfoBundleIDKey];
    id v4 = [v6 length];
    if (v4)
    {
      unsigned __int8 v7 = [v6 isEqualToString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:%@", IMBalloonBundleIdentifierCling)];
      LOBYTE(v4) = v7 | objc_msgSend(v6, "isEqualToString:", +[IMEmojiSticker defaultEmojiStickerPackID](IMEmojiSticker, "defaultEmojiStickerPackID"));
    }
  }
  return (char)v4;
}

- (id)_propertyForExpressiveSendStyle:(id)a3
{
  if (![a3 length]
    || ([a3 isEqualToString:IMImpactEffectID_InvisibleInk] & 1) != 0)
  {
    return 0;
  }
  id v4 = (void *)IDSRegistrationPropertySupportsImpactEffectsV1;
  if (![a3 containsString:IMFullScreenMomentID]) {
    return v4;
  }
  if (([a3 hasSuffix:@"CKSparklesEffect"] & 1) != 0
    || [a3 hasSuffix:@"CKHeartEffect"])
  {
    id v6 = (id *)&IDSRegistrationPropertySupportsFullScreenMomentsV2;
    return *v6;
  }
  if (([a3 hasSuffix:@"CKEchoEffect"] & 1) != 0
    || [a3 hasSuffix:@"CKSpotlightEffect"])
  {
    id v6 = (id *)&IDSRegistrationPropertySupportsFullScreenMomentsV3;
    return *v6;
  }
  return v4;
}

- (void)_setReplyToGUIDForMessage:(id)a3 messageDictionary:(id)a4
{
  if (([a3 isTypingMessage] & 1) == 0
    && objc_msgSend(objc_msgSend(a3, "replyToGUID"), "length"))
  {
    id v6 = [a3 replyToGUID];
    if (v6) {
      CFDictionarySetValue((CFMutableDictionaryRef)a4, @"r", v6);
    }
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412546;
        id v9 = [a3 replyToGUID];
        __int16 v10 = 2112;
        id v11 = [a3 guid];
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "setReplyToMessageGUID: %@ for message: %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)_sendMessage:(id)a3 context:(id)a4 deliveryContext:(id)a5 fromID:(id)a6 fromAccount:(id)a7 toID:(id)a8 chatIdentifier:(id)a9 toSessionToken:(id)a10 toGroup:(id)a11 toParticipants:(id)a12 originallyToParticipants:(id)a13 requiredRegProperties:(id)a14 interestingRegProperties:(id)a15 requiresLackOfRegProperties:(id)a16 canInlineAttachments:(BOOL)a17 type:(int64_t)a18 msgPayloadUploadDictionary:(id)a19 originalPayload:(id)a20 replyToMessageGUID:(id)a21 willSendBlock:(id)a22 completionBlock:(id)a23
{
  long long v101 = (void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23;
  v97 = a22;
  id v27 = a13;
  if (![a13 count] && objc_msgSend(a12, "count")) {
    id v27 = a12;
  }
  uint64_t v28 = +[NSDate date];
  if ([a12 count])
  {
    id v29 = [a7 serviceName];
    unsigned int v95 = [v29 isEqualToString:IDSServiceNameiMessageForBusiness];
    id v100 = a3;
    switch(a18)
    {
      case 0:
        id v92 = a4;
        if (IMOSLoggingEnabled())
        {
          __int16 v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = [a3 guid];
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = a12;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Send message action guid %@ (URIs: %@)", buf, 0x16u);
          }
        }
        id v93 = a6;
        id v31 = self;
        id v91 = [(MessageDeliveryController *)self messageDictionaryWithMessageItem:a3 isBusiness:v95 chatIdentifier:a9 toParticipants:a12 originallyToParticipants:v27 additionalContext:v92 msgPayloadUploadDictionary:a19 originalPayload:a20];
        if (a7)
        {
          v90 = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:a12];
          id v86 = [v27 count];
          unsigned int v32 = [a8 isEqualToString:a6];
          if (IMOSLoggingEnabled())
          {
            uint64_t v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              unsigned int v34 = [a3 isTypingMessage];
              CFStringRef v35 = @"NO";
              *(_DWORD *)buf = 138413570;
              *(void *)&uint8_t buf[4] = v90;
              if ((unint64_t)v86 <= 2) {
                CFStringRef v36 = @"NO";
              }
              else {
                CFStringRef v36 = @"YES";
              }
              if (v34) {
                CFStringRef v37 = @"YES";
              }
              else {
                CFStringRef v37 = @"NO";
              }
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a6;
              *(_WORD *)&buf[22] = 2112;
              if (v32) {
                CFStringRef v35 = @"YES";
              }
              id v140 = a8;
              __int16 v141 = 2112;
              id v142 = (id)v36;
              __int16 v143 = 2112;
              CFStringRef v144 = v37;
              __int16 v145 = 2112;
              CFStringRef v146 = v35;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Sending to destinations %@   from: %@   to: %@   isGroup: %@  isTyping: %@  toMe: %@", buf, 0x3Eu);
            }
          }
          id v38 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v39 = [a3 guid];
          uint64_t v85 = IDSGetUUIDData();
          id v88 = +[NSString stringGUID];
          uint64_t v87 = v38;
          if (IMOSLoggingEnabled())
          {
            uint64_t v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v39;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v85;
              *(_WORD *)&buf[22] = 2112;
              id v140 = v88;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Setting send guid to %@  %@ (with alternate callback guid %@)", buf, 0x20u);
            }
          }
          if ([a3 isTapToRetry])
          {
            CFDictionarySetValue(v38, @"tr", &__kCFBooleanTrue);
            [a3 setIsTapToRetry:0];
          }
          id v41 = [(MessageDeliveryController *)v31 _computeRegPropertiesForNewFeatures:a3 currentRegProperties:a14 currentInterestingProp:a15];
          id v42 = [v41 objectForKey:@"req"];
          id v43 = [v41 objectForKey:@"int"];
          unsigned int v44 = objc_msgSend(objc_msgSend(v41, "objectForKey:", @"newFeature"), "BOOLValue");
          long long v45 = v31;
          if (IMOSLoggingEnabled())
          {
            long long v46 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              id v47 = [a3 guid];
              CFStringRef v48 = @"NO";
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              if (v44) {
                CFStringRef v48 = @"YES";
              }
              *(void *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2112;
              id v140 = v43;
              __int16 v141 = 2112;
              id v142 = (id)v48;
              _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "msg guid %@ Required reg properties %@ interesting properties %@ newFeature %@", buf, 0x2Au);
            }
          }
          if (v44)
          {
            [a3 payloadData];
            uint64_t v49 = IMBalloonPluginFallbackLinkMetadata();
            v115[0] = _NSConcreteStackBlock;
            v115[1] = 3221225472;
            v97 = v115;
            v115[2] = sub_3FCBC;
            v115[3] = &unk_DE478;
            v115[4] = a3;
            long long v45 = v31;
            v115[5] = v31;
            v115[6] = a6;
            v115[7] = v92;
            v115[8] = a5;
            v115[9] = a7;
            v115[10] = a9;
            v115[11] = v27;
            v115[12] = a20;
            v115[13] = a21;
            v115[15] = a23;
            v115[14] = v49;
          }
          BYTE1(v84) = a17;
          LOBYTE(v84) = (unint64_t)v86 > 2;
          id v50 = -[MessageDeliveryController idsOptionsWithMessageItem:toID:fromID:sendGUIDData:alternateCallbackID:isBusinessMessage:chatIdentifier:requiredRegProperties:interestingRegProperties:requiresLackOfRegProperties:deliveryContext:isGroupChat:canInlineAttachments:msgPayloadUploadDictionary:messageDictionary:](v45, "idsOptionsWithMessageItem:toID:fromID:sendGUIDData:alternateCallbackID:isBusinessMessage:chatIdentifier:requiredRegProperties:interestingRegProperties:requiresLackOfRegProperties:deliveryContext:isGroupChat:canInlineAttachments:msgPayloadUploadDictionary:messageDictionary:", a3, a8, a6, v85, v88, v95, a9, v42, v43, a16, a5, v84, a19, v91);
          v51 = v87;
          id v52 = v50;
          if (IMOSLoggingEnabled())
          {
            double v53 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v87;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a7;
              *(_WORD *)&buf[22] = 2112;
              id v140 = v52;
              __int16 v141 = 2112;
              id v142 = a11;
              _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "Sending IDS message: %@  from account: %@   options: %@  group: %@", buf, 0x2Au);
            }
          }
          if (a11)
          {
            if (IMOSLoggingEnabled())
            {
              v54 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = a11;
                _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "Setting toDestinations to be group: %@", buf, 0xCu);
              }
            }
          }
          if (![a7 accountType]) {
            IMGreenTeaPhoneNumberTransmitLog();
          }
          uint64_t v114 = 0;
          uint64_t v113 = 0;
          uint64_t v55 = 40;
          if (v95) {
            uint64_t v55 = 48;
          }
          uint64_t v56 = *(uint64_t *)((char *)&v31->super.isa + v55);
          CFStringRef v57 = v90;
          if (a11) {
            CFStringRef v57 = +[NSSet setWithObject:](NSSet, "setWithObject:");
          }
          if ((+[IMIDSService service:v56 sendMessage:v87 fromAccount:a7 toDestinations:v57 priority:300 options:v52 identifier:&v113 error:&v114] & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              v58 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v114;
                _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "IDS sendMessage did not succeed, error %@", buf, 0xCu);
              }
            }
            if ([a3 scheduleType] == (char *)&dword_0 + 2) {
              [(MessageDeliveryController *)v31 handleScheduledMessageSendFailure:a3];
            }
            (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23 + 2))(a23, v31, v27, 0, 4, [a3 backwardsCompatibleVersion]);
          }
          if (v113)
          {
            long long v101 = (void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))[a23 copy];
            if (IMOSLoggingEnabled())
            {
              id v59 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                uint64_t v60 = v113;
                unsigned int v61 = +[NSThread isMainThread];
                CFStringRef v62 = @"NO";
                if (v61) {
                  CFStringRef v62 = @"YES";
                }
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v60;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v62;
                _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "Enqueuing completion block for IDS identifier %@ is main thread? %@", buf, 0x16u);
              }
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000;
            LOBYTE(v140) = 0;
            v111[0] = _NSConcreteStackBlock;
            v111[1] = 3221225472;
            v111[2] = sub_414D0;
            v111[3] = &unk_DE4A0;
            v111[14] = buf;
            v111[4] = v113;
            v111[5] = v31;
            v111[6] = v100;
            v51 = v87;
            v111[7] = v87;
            BOOL v112 = a17;
            v111[8] = v91;
            v111[9] = a19;
            v111[10] = v93;
            v111[11] = a7;
            v111[13] = v101;
            v111[12] = v27;
            if ([v91 count]) {
              __int16 v63 = +[NSNumber numberWithInteger:100];
            }
            else {
              __int16 v63 = 0;
            }
            [(MessageDeliveryController *)v31 _enqueueUpdateBlock:v111 willSendBlock:v97 identifier:v113 callbackID:v88 messageCommandOption:v63];
            _Block_object_dispose(buf, 8);
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v82 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = a6;
              _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, "We found no account for fromID %@", buf, 0xCu);
            }
          }
          (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a23 + 2))(a23, self, v27, 0, 31, [a3 backwardsCompatibleVersion]);
        }

        self = v31;
        BOOL v81 = a7 == 0;
        goto LABEL_111;
      case 1:
        if (([a3 isTypingMessage] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            unsigned int v66 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = [a3 guid];
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a12;
              _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Send attachments action  guid %@ (URIs: %@)", buf, 0x16u);
            }
          }
        }
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v117 = sub_3F9E4;
        v118 = &unk_DE3B0;
        id v119 = a3;
        v120 = self;
        id v121 = a5;
        id v122 = a6;
        id v123 = a7;
        id v124 = a8;
        id v125 = a9;
        id v126 = a11;
        id v127 = a12;
        id v128 = v27;
        id v129 = a14;
        id v130 = a15;
        BOOL v137 = a17;
        id v131 = a16;
        id v132 = a19;
        id v133 = a20;
        id v134 = a21;
        id v135 = a22;
        id v136 = a23;
        if (objc_msgSend(objc_msgSend(a3, "fileTransferGUIDs"), "count")) {
          [(MessageDeliveryController *)self _sendAttachmentsForMessage:a3 canSendInline:a17 displayIDs:v27 additionalContext:a4 fromID:a6 recipients:a12 uploadStartTime:v28 fromAccount:a7 completionBlock:v116];
        }
        else {
          v117((uint64_t)v116, a3, (uint64_t)v27, (uint64_t)a4, 1, 0);
        }
        break;
      case 2:
        if (([a3 isTypingMessage] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            id v67 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = [a3 guid];
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = a12;
              _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "Send payload action  guid %@ (URIs: %@)", buf, 0x16u);
            }
          }
        }
        id v94 = a6;
        id v89 = self;
        id v68 = a20;
        if (!a20) {
          id v68 = [a3 payloadData];
        }
        id v96 = [v68 _FTCopyGzippedData];
        id v69 = [a3 balloonBundleID];
        if ([v69 isEqualToString:IMBalloonPluginIdentifierRichLinks])
        {
          id v70 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v71 = [a3 fileTransferGUIDs];
          id v72 = [v71 countByEnumeratingWithState:&v107 objects:v138 count:16];
          if (v72)
          {
            uint64_t v73 = *(void *)v108;
            do
            {
              for (i = 0; i != v72; i = (char *)i + 1)
              {
                if (*(void *)v108 != v73) {
                  objc_enumerationMutation(v71);
                }
                id v75 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:*(void *)(*((void *)&v107 + 1) + 8 * i)];
                if (!([v75 isFromMomentShare] & 1 | (v70 == 0))
                  && [v75 localURL])
                {
                  CFArrayAppendValue(v70, [v75 localURL]);
                }
              }
              id v72 = [v71 countByEnumeratingWithState:&v107 objects:v138 count:16];
            }
            while (v72);
          }
          if ([(__CFArray *)v70 count])
          {

            [a3 payloadData];
            id v96 = [(id)IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs() _FTCopyGzippedData];
            if (IMOSLoggingEnabled())
            {
              id v77 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                unsigned int v78 = [a20 isEqual:v96];
                CFStringRef v79 = @"NO";
                if (v78) {
                  CFStringRef v79 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v79;
                _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "Updated payload to send %@", buf, 0xCu);
              }
            }
          }
        }
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472;
        v105[2] = sub_417E4;
        v105[3] = &unk_DE4C8;
        v105[4] = a3;
        v105[5] = v89;
        v105[6] = a4;
        v105[7] = a5;
        v105[8] = v94;
        v105[9] = a7;
        v105[10] = a8;
        v105[11] = a9;
        v105[12] = a11;
        v105[13] = a12;
        v105[14] = v27;
        v105[15] = a14;
        v105[16] = a15;
        v105[17] = a16;
        BOOL v106 = a17;
        v105[18] = a20;
        v105[19] = a21;
        v105[20] = a22;
        v105[21] = a23;
        objc_msgSend(-[MessageDeliveryController attachmentController](v89, "attachmentController"), "sendPayloadData:messageGUID:fromID:recipients:completionBlock:", v96, objc_msgSend(a3, "guid"), v94, a12, v105);

        break;
      case 3:
        if (IMOSLoggingEnabled())
        {
          id v80 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = a12;
            _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "Send fallback action (Peers: %@)", buf, 0xCu);
          }
        }
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_41A50;
        v103[3] = &unk_DE4F0;
        v103[4] = self;
        v103[5] = a5;
        v103[6] = a6;
        v103[7] = a7;
        v103[8] = a8;
        v103[9] = a9;
        v103[10] = a11;
        v103[11] = a12;
        v103[12] = v27;
        v103[13] = a14;
        v103[14] = a15;
        v103[15] = a16;
        BOOL v104 = a17;
        v103[16] = a19;
        v103[17] = a20;
        v103[20] = a22;
        v103[21] = a23;
        v103[18] = a21;
        v103[19] = a3;
        objc_msgSend(-[MessageDeliveryController attachmentController](self, "attachmentController"), "sendFallbackAttachmentsForMessage:displayIDs:additionalContext:completionBlock:", a3, v27, a4, v103);
        break;
      default:
        BOOL v81 = 1;
LABEL_111:
        if (v81 && v101)
        {
          if (IMOSLoggingEnabled())
          {
            id v83 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v83, OS_LOG_TYPE_INFO, "Did not send anything. Failing message", buf, 2u);
            }
          }
          v101[2](v101, self, v27, 0, 22, [v100 backwardsCompatibleVersion]);
        }
        break;
    }
  }
  else if (a23)
  {
    id v64 = [a3 backwardsCompatibleVersion];
    int v65 = (void (*)(id, MessageDeliveryController *, id, void, uint64_t, id))*((void *)a23 + 2);
    v65(a23, self, v27, 0, 4, v64);
  }
}

- (void)handleScheduledMessageSendFailure:(id)a3
{
  id v5 = -[IMDMessageStore messageWithGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "messageWithGUID:", [a3 guid]);
  if ([v5 scheduleType] == (char *)&dword_0 + 2
    && [v5 scheduleState] == (char *)&dword_0 + 2)
  {
    id v6 = [a3 editedPartIndexes];
    id v7 = [a3 retractedPartIndexes];
    if ([v6 count])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_41F94;
      v14[3] = &unk_DE518;
      v14[4] = a3;
      [v6 enumerateIndexesUsingBlock:v14];
      if (IMOSLoggingEnabled())
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Failed to update the scheduled message. Keeping edit history as is and adding failed part indexes", buf, 2u);
        }
      }
    }
    if ([v7 count])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_41FA0;
      v12[3] = &unk_DE518;
      v12[4] = a3;
      [v7 enumerateIndexesUsingBlock:v12];
      objc_msgSend(a3, "setFileTransferGUIDs:", objc_msgSend(a3, "scheduledMessageOriginalTransferGUIDs"));
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Failed to update the scheduled message. Keeping retract history as is and adding failed part indexes", buf, 2u);
        }
      }
    }
    objc_msgSend(-[MessageDeliveryController messageStore](self, "messageStore"), "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", a3, 1, 1, 0, objc_msgSend(a3, "flags"));
    if (IMOSLoggingEnabled())
    {
      __int16 v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Failed to Send Scheduled Message, not updating peer devices with scheduled message.", buf, 2u);
      }
    }
  }
  else
  {
    objc_msgSend(a3, "setScheduleType:", objc_msgSend(v5, "scheduleType"));
    objc_msgSend(a3, "setScheduleState:", objc_msgSend(v5, "scheduleState"));
    objc_msgSend(a3, "setMessageSummaryInfo:", objc_msgSend(v5, "messageSummaryInfo"));
    objc_msgSend(a3, "setBody:", objc_msgSend(v5, "body"));
    id v11 = [v5 errorCode];
    [a3 setErrorCode:v11];
  }
}

- (BOOL)handleScheduledMessageSend:(id)a3 sentSuccessfully:(BOOL)a4 idsMessage:(id)a5 messageDictionary:(id)a6 canInlineAttachments:(BOOL)a7 msgPayloadUploadDictionary:(id)a8 fromID:(id)a9 fromAccount:(id)a10 originalIDSIdentifier:(id)a11
{
  BOOL v12 = a7;
  id v16 = a3;
  id v18 = [a3 editedPartIndexes];
  id v19 = [v16 retractedPartIndexes];
  if (!a4)
  {
    [(MessageDeliveryController *)self handleScheduledMessageSendFailure:v16];
LABEL_55:
    LOBYTE(v45) = 0;
    return v45;
  }
  id v20 = v19;
  if ([v18 count] || objc_msgSend(v20, "count"))
  {
    id v16 = [(MessageDeliveryController *)self _updateSuccessfulRetractionsForScheduledMessage:[(MessageDeliveryController *)self _updateSuccessfulEditsForScheduledMessage:v16]];
    objc_msgSend(-[MessageDeliveryController messageStore](self, "messageStore"), "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v16, 1, 0, 0, objc_msgSend(v16, "flags"));
  }
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Preparing to send scheduled message to peer devices.", buf, 2u);
    }
  }
  uint64_t v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 scheduleType]);
  if (v22) {
    CFDictionarySetValue((CFMutableDictionaryRef)a6, @"st", v22);
  }
  id v23 = objc_msgSend(v16, "time", v22);
  if (v23) {
    CFDictionarySetValue((CFMutableDictionaryRef)a6, @"sd", v23);
  }
  id v24 = (void *)JWEncodeDictionary();
  if (objc_msgSend(objc_msgSend(v16, "fileTransferGUIDs"), "count") && !v12
    || (id v25 = objc_msgSend(objc_msgSend(v16, "payloadData"), "length"), a8) && v25)
  {
    if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = [v16 fileTransferGUIDs];
        CFStringRef v28 = @"NO";
        if (v12) {
          CFStringRef v28 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v55 = 2112;
        CFStringRef v56 = v28;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Not compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
      }
    }
    id v29 = v24;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = [v16 fileTransferGUIDs];
        CFStringRef v32 = @"NO";
        if (v12) {
          CFStringRef v32 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v31;
        __int16 v55 = 2112;
        CFStringRef v56 = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Compressing data, %@, canInlineAttachments: %@", buf, 0x16u);
      }
    }
    id v29 = [v24 _FTCopyGzippedData];
  }
  uint64_t v33 = v29;
  unsigned int v34 = +[NSNumber numberWithInteger:100];
  [v16 guid];
  uint64_t v35 = IDSGetUUIDData();
  CFStringRef v36 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  CFStringRef v37 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v34, IDSSendMessageOptionCommandKey, &__kCFBooleanTrue, IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsResponseKey, v35, IDSSendMessageOptionUUIDKey, v33, IDSSendMessageOptionDataToEncryptKey, v36, IDSSendMessageOptionTimeoutKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, 0);
  uint64_t v61 = IDSRegistrationPropertySupportsSendLaterMessages;
  id v38 = +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:&v61 count:1]);
  if (v38) {
    CFDictionarySetValue((CFMutableDictionaryRef)v37, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, v38);
  }
  id v39 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v40 = (void *)IDSCopyBestGuessIDForID();
  if (v40) {
    [v39 addObject:v40];
  }
  else {
    [+[IMMetricsCollector sharedInstance] forceAutoBugCaptureWithSubType:@"Null IDS Identifier" errorPayload:0 type:@"SendLater" context:@"IDSCopyBestGuessIDForID returned a null token while trying to send scheduled message to peer devices"];
  }
  if (a9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v37, IDSSendMessageOptionFromIDKey, a9);
  }
  id v41 = [v39 count];
  id v42 = objc_msgSend(objc_msgSend(objc_msgSend(a10, "devices"), "__imArrayByFilteringWithBlock:", &stru_DE558), "count");
  uint64_t v43 = (uint64_t)v42;
  if (a10) {
    BOOL v44 = v41 != 0;
  }
  else {
    BOOL v44 = 0;
  }
  if ((uint64_t)v42 < 1 || !v44 || ![a10 devices])
  {
    if (IMOSLoggingEnabled())
    {
      id v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = [a10 devices];
        CFStringRef v49 = @"NO";
        *(_DWORD *)buf = 138413058;
        if (v43 <= 0) {
          CFStringRef v50 = @"NO";
        }
        else {
          CFStringRef v50 = @"YES";
        }
        if (v41) {
          CFStringRef v49 = @"YES";
        }
        *(void *)&uint8_t buf[4] = v49;
        __int16 v55 = 2112;
        CFStringRef v56 = v50;
        __int16 v57 = 2112;
        id v58 = a10;
        __int16 v59 = 2112;
        id v60 = v48;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "We did not have ids accounts to send scheduled messages out -- bailing {haveTokenURISToSendTo %@ hasPeerDevicesSupportingSendLater %@ idsAccount %@ devices %@}", buf, 0x2Au);
      }
    }

    goto LABEL_55;
  }
  *(void *)buf = 0;
  unsigned int v45 = +[IMIDSService service:self->_idsService sendMessage:a5 fromAccount:a10 toDestinations:v39 priority:300 options:v37 identifier:0 error:buf];
  if (v45)
  {
    if (IMOSLoggingEnabled())
    {
      long long v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v53 = 0;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "IDS successfully sent scheduled message to peer devices", v53, 2u);
      }
    }
  }
  else
  {
    id v52 = IMLogHandleForCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_96204();
    }
  }

  return v45;
}

- (id)_updateSuccessfulRetractionsForScheduledMessage:(id)a3
{
  id v5 = [a3 retractedPartIndexes];
  id v6 = +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_428F8;
  v9[3] = &unk_DE580;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = v6;
  [v5 enumerateIndexesUsingBlock:v9];
  if ([v6 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Deleting retracted transfer GUIDs for scheduled message: %@", buf, 0xCu);
      }
    }
    [+[IMDAttachmentStore sharedInstance] deleteAttachmentsWithGUIDs:v6];
  }
  objc_msgSend(a3, "setRetractedPartIndexes:", +[NSIndexSet indexSet](NSIndexSet, "indexSet"));
  return a3;
}

- (id)_updateSuccessfulEditsForScheduledMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_42A24;
  v5[3] = &unk_DE518;
  v5[4] = a3;
  objc_msgSend(objc_msgSend(a3, "editedPartIndexes"), "enumerateIndexesUsingBlock:", v5);
  objc_msgSend(a3, "setEditedPartIndexes:", +[NSIndexSet indexSet](NSIndexSet, "indexSet"));
  return a3;
}

- (id)_fileTransferGUIDsInMessageBody:(id)a3
{
  id v4 = [a3 length];
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_42AF4;
  v7[3] = &unk_DE5A8;
  v7[4] = v5;
  objc_msgSend(a3, "enumerateAttribute:inRange:options:usingBlock:", IMFileTransferGUIDAttributeName, 0, v4, 0, v7);
  return [v5 array];
}

- (id)_associatedMessageFallbackHashForMessageItem:(id)a3
{
  [a3 associatedMessageGUID];
  uint64_t v4 = IMAssociatedMessageDecodeGUID();

  return [(MessageDeliveryController *)self _fallbackHashForMessageItemWithGUID:v4];
}

- (id)_threadOriginatorFallbackHashForMessageItem:(id)a3
{
  [a3 threadIdentifier];
  uint64_t OriginatorGUID = IMMessageThreadIdentifierGetOriginatorGUID();

  return [(MessageDeliveryController *)self _fallbackHashForMessageItemWithGUID:OriginatorGUID];
}

- (id)_fallbackHashForMessageItemWithGUID:(id)a3
{
  id v4 = objc_msgSend(-[IMDMessageStore messageWithGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "messageWithGUID:", a3), "fallbackHash");
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218242;
      id v8 = [v4 length];
      __int16 v9 = 2112;
      id v10 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Using fallback hash with length %llu for message GUID %@", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4;
}

- (BOOL)_hasRecentlyMessaged:(id)a3
{
  id v4 = +[IMDRecentsController sharedInstance];

  return [(IMDRecentsController *)v4 hasRecentlyMessaged:a3];
}

- (void)noteRecentMessageForPeople:(id)a3
{
  id v4 = +[IMDRecentsController sharedInstance];

  [(IMDRecentsController *)v4 noteRecentMessageForPeople:a3];
}

- (void)updateLatestActiveDestination:(id)a3 ForHandle:(id)a4 incomingType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = +[IMDRecentsController sharedInstance];

  [(IMDRecentsController *)v8 updateLatestActiveDestination:a3 ForHandle:a4 incomingType:v5];
}

- (id)activeDeviceForHandle:(id)a3
{
  id v4 = +[IMDRecentsController sharedInstance];

  return [(IMDRecentsController *)v4 activeDeviceForHandle:a3];
}

- (id)_receivingDevicesForHandle:(id)a3 skippedDestinations:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [(MessageDeliveryController *)self activeDeviceForHandle:a3];
  if (v8)
  {
    __int16 v9 = v8;
    id v10 = [v8 idsDestination];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = [a4 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v28;
      *(void *)&long long v12 = 138412290;
      long long v22 = v12;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(a4);
          }
          if (objc_msgSend(v10, "isEqualToString:", *(void *)(*((void *)&v27 + 1) + 8 * i), v22))
          {
            if (IMOSLoggingEnabled())
            {
              id v15 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v22;
                uint64_t v33 = v9;
                _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Found skipped active device %@", buf, 0xCu);
              }
            }
            if ([v9 shouldSendTypingIndicator])
            {
              if (IMOSLoggingEnabled())
              {
                id v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v22;
                  uint64_t v33 = v9;
                  _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Sending typing indicator to device %@", buf, 0xCu);
                }
              }
              [v7 addObject:v10];
            }
          }
        }
        id v11 = [a4 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(a4);
          }
          id v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          if ([v20 containsString:a3]) {
            [v7 addObject:v20];
          }
        }
        id v17 = [a4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }
  }
  return [v7 copy];
}

- (id)_receivingDevicesForParticipants:(id)a3 skippedDestinations:(id)a4
{
  id v7 = objc_alloc_init((Class)NSMutableSet);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_43180;
  v9[3] = &unk_DE5D0;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = v7;
  [a3 enumerateObjectsUsingBlock:v9];
  return [v7 copy];
}

- (void)_enqueueSendMessageWorkBlock:(id)a3 forURIs:(id)a4
{
  if (a3)
  {
    if ([a4 count])
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          id v11 = a4;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Enqueueing block for set: %@", (uint8_t *)&v10, 0xCu);
        }
      }
      deliveryQueues = self->_deliveryQueues;
      if (!deliveryQueues)
      {
        deliveryQueues = (IMMultiQueue *)objc_alloc_init((Class)IMMultiQueue);
        self->_deliveryQueues = deliveryQueues;
      }
      [(IMMultiQueue *)deliveryQueues addBlock:a3 withTimeout:a4 forKey:@"enqueued message" description:300.0];
    }
    else
    {
      __int16 v9 = (void (*)(id, void))*((void *)a3 + 2);
      v9(a3, 0);
    }
  }
}

- (void)sendMessage:(id)a3 context:(id)a4 groupContext:(id)a5 toGroup:(id)a6 toParticipants:(id)a7 originallyToParticipants:(id)a8 fromID:(id)a9 fromAccount:(id)a10 chatIdentifier:(id)a11 originalPayload:(id)a12 replyToMessageGUID:(id)a13 fakeSavedReceiptBlock:(id)a14 completionBlock:(id)a15
{
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      id v38 = [a3 guid];
      __int16 v39 = 2112;
      id v40 = a7;
      __int16 v41 = 2112;
      id v42 = a9;
      __int16 v43 = 2112;
      id v44 = a10;
      __int16 v45 = 2112;
      id v46 = a4;
      __int16 v47 = 2112;
      id v48 = a11;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Send Message: %@  to people: %@  fromPeer: %@ fromAccount %@ context: %@, chat identifier %@", buf, 0x3Eu);
    }
  }
  if (([a3 isTypingMessage] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        unsigned int v22 = [+[NetworkChangeNotifier sharedInstance] linkQualityValueForInterfaceType:3];
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v22;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", buf, 8u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        unsigned int v24 = [+[NetworkChangeNotifier sharedInstance] linkQualityValueForInterfaceType:2];
        *(_DWORD *)buf = 67109120;
        LODWORD(v38) = v24;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", buf, 8u);
      }
    }
  }
  if ([a7 count])
  {
    if (a9 && a10)
    {
      if ([(MessageDeliveryController *)self _hasRecentlyMessaged:a7]) {
        goto LABEL_31;
      }
      if (IMOSLoggingEnabled())
      {
        long long v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = a7;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "We have no session to %@", buf, 0xCu);
        }
      }
      if (![a3 isTypingMessage])
      {
LABEL_31:
        unsigned __int8 v29 = [a3 isTypingMessage];
        id v30 = PeopleSetByAddingMyID(a9, a8);
        id v31 = a7;
        if ((v29 & 1) == 0) {
          id v31 = PeopleSetByAddingMyID(a9, a7);
        }
        id v32 = [a3 balloonBundleID];
        if ([v32 isEqualToString:IMBalloonPluginIdentifierRichLinks])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Refreshing rich link message", buf, 2u);
            }
          }
          a3 = -[IMDMessageStore messageWithGUID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "messageWithGUID:", [a3 guid]);
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_43944;
        v36[3] = &unk_DE648;
        v36[4] = a3;
        v36[5] = a9;
        v36[6] = a5;
        v36[7] = self;
        v36[8] = a4;
        v36[9] = a10;
        v36[10] = a11;
        v36[11] = a6;
        v36[12] = v30;
        v36[13] = a12;
        v36[14] = a13;
        v36[16] = a14;
        v36[17] = a15;
        v36[15] = v31;
        [(MessageDeliveryController *)self _enqueueSendMessageWorkBlock:v36 forURIs:v30];
        [(MessageDeliveryController *)self noteRecentMessageForPeople:a7];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          long long v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            id v27 = [a3 guid];
            *(_DWORD *)buf = 138412290;
            id v38 = v27;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%@ is a typing indicator, marking as delivery success", buf, 0xCu);
          }
        }
        if (a15) {
          (*((void (**)(id, MessageDeliveryController *, id, uint64_t, void, id))a15 + 2))(a15, self, a7, 1, 0, [a3 backwardsCompatibleVersion]);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v38 = a3;
          __int16 v39 = 2112;
          id v40 = a9;
          __int16 v41 = 2112;
          id v42 = a10;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "*********** Failing message: %@    empty source ID or idsAccount supplied (%@:%@)", buf, 0x20u);
        }
      }
      if (a15) {
        (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a15 + 2))(a15, self, a7, 0, 33, [a3 backwardsCompatibleVersion]);
      }
    }
  }
  else if (a15)
  {
    (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, id))a15 + 2))(a15, self, a7, 0, 21, [a3 backwardsCompatibleVersion]);
  }
}

- (void)sendMessageError:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 completionBlock:(id)a10
{
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219010;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = a9;
      __int16 v28 = 2112;
      id v29 = a4;
      __int16 v30 = 2112;
      id v31 = a5;
      __int16 v32 = 2112;
      id v33 = a7;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Sending MessageError: %ld  forMessageID: %@  to token: %@  toPeer: %@  fromPeer: %@", buf, 0x34u);
    }
  }
  uint64_t v18 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v19 = (const void *)IDSGetUUIDData();
  if (v19) {
    CFDictionarySetValue(v18, IDSFailedUUIDKey, v19);
  }
  if (a9) {
    CFDictionarySetValue(v18, IDSFailedMessageIDKey, a9);
  }
  id v20 = +[NSNumber numberWithInteger:a3];
  if (v20) {
    CFDictionarySetValue(v18, IDSFailureReasonKey, v20);
  }
  id v21 = +[NSNumber numberWithInteger:120];
  unsigned int v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsResponseKey, v21, IDSSendMessageOptionCommandKey, 0);
  if (a4) {
    a5 = (id)IDSCopyIDForTokenWithID();
  }
  else {
    id v23 = a5;
  }
  [(MessageDeliveryController *)self sendMessageDictionary:v18 fromID:a7 fromAccount:a8 toURIs:+[NSSet setWithObject:a5] toGroup:a6 priority:300 options:v22 completionBlock:a10];
}

- (void)sendMessageErrorWithInfo:(int64_t)a3 toToken:(id)a4 toID:(id)a5 toGroup:(id)a6 fromID:(id)a7 fromAccount:(id)a8 forMessageID:(id)a9 additionalInfo:(id)a10 fileSize:(id)value failureTimeSeconds:(double)a12 failReasonMessage:(id)a13 completionBlock:(id)a14
{
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219266;
      int64_t v31 = a3;
      __int16 v32 = 2112;
      id v33 = a9;
      __int16 v34 = 2112;
      id v35 = a4;
      __int16 v36 = 2112;
      id v37 = a5;
      __int16 v38 = 2112;
      id v39 = a7;
      __int16 v40 = 2112;
      id v41 = a10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Sending MessageError: %ld  forMessageID: %@  to token: %@  toPeer: %@  fromPeer: %@ additionalInfo: %@", buf, 0x3Eu);
    }
  }
  unsigned int v22 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v23 = (const void *)IDSGetUUIDData();
  if (v23) {
    CFDictionarySetValue(v22, IDSFailedUUIDKey, v23);
  }
  if (a9) {
    CFDictionarySetValue(v22, IDSFailedMessageIDKey, a9);
  }
  unsigned int v24 = +[NSNumber numberWithInteger:a3];
  if (v24) {
    CFDictionarySetValue(v22, IDSFailureReasonKey, v24);
  }
  if (a10) {
    CFDictionarySetValue(v22, @"aDI", a10);
  }
  if (value) {
    CFDictionarySetValue(v22, @"fFS", value);
  }
  if (IMSendAdditionalMMCSErrorInfoToMadrid())
  {
    if (a13) {
      CFDictionarySetValue(v22, @"fRM", a13);
    }
    int64_t v25 = +[NSNumber numberWithInteger:llround(a12 * 1000.0)];
    if (v25) {
      CFDictionarySetValue(v22, @"fTE", v25);
    }
  }
  __int16 v26 = +[NSNumber numberWithInteger:120];
  id v27 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsResponseKey, v26, IDSSendMessageOptionCommandKey, 0);
  if (a4) {
    a5 = (id)IDSCopyIDForTokenWithID();
  }
  else {
    id v28 = a5;
  }
  [(MessageDeliveryController *)self sendMessageDictionary:v22 fromID:a7 fromAccount:a8 toURIs:+[NSSet setWithObject:a5] toGroup:a6 priority:300 options:v27 completionBlock:a14];
}

- (void)sendBubblePayloadMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10
{
  id v17 = PeopleSetByAddingMyID(a4, [a6 allObjects]);
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v17;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Enqueing message payload block for people %@", buf, 0xCu);
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_452A0;
  v19[3] = &unk_DE670;
  v19[4] = v17;
  v19[5] = self;
  v19[6] = a3;
  v19[7] = a4;
  v19[8] = a5;
  v19[9] = a6;
  v19[10] = a7;
  v19[11] = a9;
  v19[12] = a10;
  v19[13] = a8;
  [(MessageDeliveryController *)self _enqueueSendMessageWorkBlock:v19 forURIs:v17];
}

- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 willSendBlock:(id)a10 completionBlock:(id)a11
{
}

- (void)sendMessageDictionary:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toGroup:(id)a7 priority:(int64_t)a8 options:(id)a9 completionBlock:(id)a10
{
}

- (void)failMessageSendWithMessageDictionary:(id)a3 URIs:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      __int16 v16 = 2112;
      id v17 = a5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "IDS sendMessage for message %@ to URIs %@ did not succeed, error %@", (uint8_t *)&v12, 0x20u);
    }
  }
  if (a6) {
    (*((void (**)(id, MessageDeliveryController *, id, void, uint64_t, void))a6 + 2))(a6, self, [a4 allObjects], 0, 4, 0);
  }
}

- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 callCompletionOnSuccess:(BOOL)a12 completionBlock:(id)a13
{
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  if (a6)
  {
    BOOL v18 = a4;
    [a10 objectForKeyedSubscript:IDSSendMessageOptionCommandKey];
    id v19 = (__CFDictionary *)[a10 mutableCopy];
    if (!v19) {
      id v19 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    id v20 = +[NSString stringGUID];
    if (v20)
    {
      CFDictionarySetValue(v19, IDSSendMessageOptionAlternateCallbackIdentifierKey, v20);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_96408();
    }
    if (a5) {
      CFDictionarySetValue(v19, IDSSendMessageOptionFromIDKey, a5);
    }
    CFDictionarySetValue(v19, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
    CFDictionarySetValue(v19, IDSSendMessageOptionTimeoutKey, &off_E3990);
    if (v18 && [a3 count])
    {
      id v21 = (void *)JWEncodeDictionary();
      id v22 = [v21 _FTCopyGzippedData];
      if (IMOSLoggingEnabled())
      {
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)CFStringRef v50 = [v21 length];
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = [v22 length];
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Compressed message data from: %u to: %u in sendMessageDictionary", buf, 0xEu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        unsigned int v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          unsigned int v25 = [v22 length];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)CFStringRef v50 = v25;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size %u", buf, 8u);
        }
      }
      [(__CFDictionary *)v19 setObject:v22 forKey:IDSSendMessageOptionDataToEncryptKey];
    }
    id v26 = [a6 serviceName];
    unsigned int v27 = [v26 isEqualToString:IDSServiceNameiMessageForBusiness];
    uint64_t v28 = 40;
    if (v27) {
      uint64_t v28 = 48;
    }
    uint64_t v29 = *(uint64_t *)((char *)&self->super.isa + v28);
    if (IMOSLoggingEnabled())
    {
      __int16 v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        CFStringRef v31 = @"NO";
        *(_DWORD *)buf = 138413058;
        *(void *)CFStringRef v50 = a6;
        *(_WORD *)&v50[8] = 2112;
        if (v27) {
          CFStringRef v31 = @"YES";
        }
        id v51 = a8;
        __int16 v52 = 2112;
        uint64_t v53 = v29;
        __int16 v54 = 2112;
        CFStringRef v55 = v31;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "sendMessageDictionary - got account %@ to engroup: %@ using IDSService: %@ isBusinessMessage: %@", buf, 0x2Au);
      }
    }
    id v32 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
    v48[0] = MessageDictionaryMeCardSharingAudienceKey;
    v48[1] = MessageDictionaryMeCardSharingEnabledKey;
    v48[2] = MessageDictionaryMeCardSharingNameForkedKey;
    v48[3] = MessageDictionaryMeCardSharingImageForkedKey;
    v48[4] = MessageDictionaryPendingNicknameUpdatesHandlesKey;
    v48[5] = MessageDictionaryPendingNicknameUpdatesRecordIDsKey;
    v48[6] = MessageDictionaryCurrentNicknameUpdatesRecordIDsKey;
    v48[7] = MessageDictionaryArchivedNicknameUpdatesRecordIDsKey;
    v48[8] = MessageDictionaryPersonalNicknameRecordIDKey;
    v48[9] = MessageDictionaryPersonalNicknameDecryptKeyKey;
    v48[10] = MessageDictionaryNicknameDenyAllowListVersionKey;
    v48[11] = MessageDictionaryNicknameDenyListKey;
    v48[12] = MessageDictionaryNicknameAllowListKey;
    v48[13] = MessageDictionaryNicknameTransitionedListKey;
    v48[14] = MessageDictionaryNicknameActiveListKey;
    v48[15] = MessageDictionaryNicknameIgnoredListKey;
    v48[16] = MessageDictionaryNicknameRequestPersonalNicknameInfoKey;
    v48[17] = MessageDictionaryNicknameParticipantTruncatedRIDKey;
    v48[18] = MessageDictionaryNicknameTransitionedListVersionKey;
    v48[19] = MessageDictionaryNicknameActiveListVersionKey;
    v48[20] = MessageDictionaryNicknameIgnoredListVersionKey;
    v48[21] = MessageDictionaryNicknameWallpaperTagKey;
    v48[22] = MessageDictionaryNicknameLowResWallpaperTagKey;
    v48[23] = MessageDictionaryNicknameWallpaperMetadataTagKey;
    v48[24] = MessageDictionaryNicknameCloudKitRecordKey;
    v48[25] = MessageDictionaryNicknameCloudKitDecryptionRecordKey;
    v48[26] = MessageDictionaryNicknameUpdateInfoIncluded;
    v48[27] = MessageDictionaryWallpaperUpdateKey;
    v48[28] = @"cID";
    id v33 = +[NSArray arrayWithObjects:v48 count:29];
    [v32 removeObjectsForKeys:v33];
    if ([v32 objectForKey:@"pID"])
    {
      id v34 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(v32, "objectForKey:", @"pID"));
      [v34 removeObjectsForKeys:v33];
      [v32 setObject:v34 forKey:@"pID"];
    }
    id v35 = (NSSet *)a7;
    if (a8) {
      id v35 = +[NSSet setWithObject:a8];
    }
    unsigned int v36 = +[IMIDSService service:v29 sendMessage:v32 fromAccount:a6 toDestinations:v35 priority:a9 options:v19 identifier:&v46 error:&v47];

    if (a13 && ((v36 ^ 1) & 1) == 0 && v46)
    {
      id v37 = [a7 allObjects];
      if (IMOSLoggingEnabled())
      {
        __int16 v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          id v39 = [v37 count];
          *(_DWORD *)buf = 134217984;
          *(void *)CFStringRef v50 = v39;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Result URIs Size: %lu", buf, 0xCu);
        }
      }
      id v40 = [a13 copy];
      if (IMOSLoggingEnabled())
      {
        id v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)CFStringRef v50 = v46;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Enqueuing completion block for IDS identifier %@", buf, 0xCu);
        }
      }
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_45E20;
      v44[3] = &unk_DE698;
      BOOL v45 = a12;
      v44[4] = v46;
      v44[5] = self;
      v44[6] = v37;
      v44[7] = v40;
      -[MessageDeliveryController _enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:](self, "_enqueueUpdateBlock:willSendBlock:identifier:callbackID:messageCommandOption:", v44, a11);
      if (IMOSLoggingEnabled())
      {
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)CFStringRef v50 = v46;
          *(_WORD *)&v50[8] = 2112;
          id v51 = a3;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Received IDS identifier %@ for message %@", buf, 0x16u);
        }
      }
    }
    else
    {
      [(MessageDeliveryController *)self failMessageSendWithMessageDictionary:a3 URIs:a7 error:v47 completionHandler:a13];
    }
  }
  else
  {
    [(MessageDeliveryController *)self failMessageSendWithMessageDictionary:a3 URIs:a7 error:0 completionHandler:a13];
  }
}

- (void)sendMessageDictionary:(id)a3 encryptDictionary:(BOOL)a4 fromID:(id)a5 fromAccount:(id)a6 toURIs:(id)a7 toGroup:(id)a8 priority:(int64_t)a9 options:(id)a10 willSendBlock:(id)a11 completionBlock:(id)a12
{
  LOBYTE(v12) = 0;
  [(MessageDeliveryController *)self sendMessageDictionary:a3 encryptDictionary:a4 fromID:a5 fromAccount:a6 toURIs:a7 toGroup:a8 priority:a9 options:a10 willSendBlock:a11 callCompletionOnSuccess:v12 completionBlock:a12];
}

- (void)sendCloseSessionMessageDictionary:(id)a3 toBusinessURI:(id)a4 fromURI:(id)a5 fromAccount:(id)a6 completionBlock:(id)a7
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = a4;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "sendCloseSessionMessageDictionary for biz URI: %@", buf, 0xCu);
    }
  }
  if (IMStringIsBusinessID())
  {
    id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", a4, a5, 0);
    +[NSString stringGUID];
    __int16 v14 = +[NSNumber numberWithInteger:170];
    uint64_t v15 = IDSGetUUIDData();
    __int16 v16 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v17 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v14, IDSSendMessageOptionCommandKey, v15, IDSSendMessageOptionUUIDKey, v16, IDSSendMessageOptionTimeoutKey, a5, IDSSendMessageOptionFromIDKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsResponseKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, 0);
    BOOL v18 = +[NSMutableDictionary dictionaryWithDictionary:a3];
    if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isBIAEnabled"))
    {
      id v19 = [(MessageDeliveryController *)self _chatForChatIdentifier:a4];
      if ([v19 containsActiveBIASession])
      {
        id v20 = [v19 BIAContext];
        if ([v20 count])
        {
          if ([v20 count]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v18, @"bcon", v20);
          }
        }
      }
    }
    [(MessageDeliveryController *)self sendMessageDictionary:[(NSMutableDictionary *)v18 copy] encryptDictionary:1 fromID:a5 fromAccount:a6 toURIs:v13 toGroup:0 priority:300 options:v17 willSendBlock:0 completionBlock:0];
    if (a7) {
      (*((void (**)(id, MessageDeliveryController *, NSArray *, void, uint64_t, void))a7 + 2))(a7, self, [(NSSet *)v13 allObjects], 0, 4, 0);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = a4;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "sendCloseSessionMessageDictionary called for non biz URI: %@", buf, 0xCu);
    }
  }
}

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Sending message to local device", buf, 2u);
    }
  }
  if ([(MessageDeliveryController *)self localDevice])
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    id v8 = objc_alloc((Class)NSSet);
    id v9 = objc_msgSend(v8, "initWithObjects:", IDSDefaultPairedDevice, 0);
    uint64_t v29 = IDSSendMessageOptionLocalDeliveryKey;
    __int16 v30 = &__kCFBooleanTrue;
    int v10 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    if (a3)
    {
      id v11 = [a4 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryDictKey];
      v27[0] = IMDRelayLocalMessageDictionaryGUIDKey;
      v28[0] = objc_msgSend(v11, "objectForKeyedSubscript:");
      v27[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
      v28[1] = objc_msgSend(v11, "objectForKeyedSubscript:");
      v27[2] = IMDRelayLocalMessageDictionaryTypeKey;
      v28[2] = IMDRelayLocalMessageTypeRemoteFileResponse;
      unsigned int v12 = [(IDSService *)self->_idsService sendResourceAtURL:a3 metadata:+[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3] toDestinations:v9 priority:300 options:v10 identifier:&v20 error:&v19];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_21;
      }
      id v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      CFStringRef v14 = @"NO";
      if (v12) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      CFStringRef v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      uint64_t v15 = "Sending message to local device using file transfer (error %@) success: %@ with Identifier %@";
    }
    else
    {
      unsigned int v12 = +[IMIDSService service:self->_idsService sendMessage:a4 fromAccount:0 toDestinations:v9 priority:300 options:v10 identifier:&v20 error:&v19];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_21;
      }
      id v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      CFStringRef v17 = @"NO";
      if (v12) {
        CFStringRef v17 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      CFStringRef v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      uint64_t v15 = "Sending message to local device as data payload (error %@) success: %@ with Identifier %@";
    }
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v15, buf, 0x20u);
LABEL_21:

    return v12;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "No Local Device Found, unable to send message", buf, 2u);
    }
  }
  LOBYTE(v12) = 0;
  return v12;
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return [(MessageDeliveryController *)self sendToLocalPeersFile:0 dictionary:a3];
}

- (id)localDevice
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v11 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
      if ([v6 isDefaultPairedDevice])
      {
        if ([v6 isConnected]) {
          break;
        }
      }
      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Found default paired device which is connected: %@", buf, 0xCu);
      }
    }
    if (v6) {
      return v6;
    }
  }
LABEL_15:
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Not connected to companion", buf, 2u);
    }
  }
  return 0;
}

- (id)pairedDevice
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v11 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
      if ([v6 isActive]) {
        break;
      }
      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Found paired device: %@", buf, 0xCu);
      }
    }
    if (v6) {
      return v6;
    }
  }
LABEL_14:
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "No paired device found", buf, 2u);
    }
  }
  return 0;
}

- (id)idsDeviceFromPushToken:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(IDSService *)self->_idsService devices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "pushToken"), "isEqualToData:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)idsDeviceForFromID:(id)a3
{
  return [(IDSService *)self->_idsService deviceForFromID:a3];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (IMOSLoggingEnabled())
  {
    long long v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      int v13 = 138413058;
      id v14 = a3;
      __int16 v15 = 2112;
      if (v8) {
        CFStringRef v12 = @"YES";
      }
      id v16 = a5;
      __int16 v17 = 2112;
      CFStringRef v18 = v12;
      __int16 v19 = 2112;
      id v20 = a7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Service %@ sent Message with ID %@ and sucess %@ with Error %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)service:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6
{
  BOOL v8 = a4;
  if (IMOSLoggingEnabled())
  {
    long long v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      *(_DWORD *)__int16 v19 = 138413058;
      *(void *)&v19[4] = a3;
      *(_WORD *)&v19[12] = 2112;
      if (v8) {
        CFStringRef v12 = @"YES";
      }
      *(void *)&void v19[14] = a6;
      __int16 v20 = 2112;
      CFStringRef v21 = v12;
      __int16 v22 = 2112;
      id v23 = a5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Service %@ tried to cancel Message with ID %@ and sucess %@ with Error %@", v19, 0x2Au);
    }
  }
  if (-[NSMutableDictionary objectForKey:](self->_pendingCancelScheduledMessageGUIDs, "objectForKey:", a6, *(_OWORD *)v19))
  {
    id v13 = [(NSMutableDictionary *)self->_pendingCancelScheduledMessageGUIDs objectForKey:a6];
    id v14 = [v13 objectAtIndexedSubscript:0];
    id v15 = objc_msgSend(objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "integerValue");
    id v16 = [+[IMDMessageStore sharedInstance] messageWithGUID:v14];
    if (v16)
    {
      __int16 v17 = (char *)[v16 scheduleType];
      if (v17 == (unsigned char *)&dword_0 + 2)
      {
        objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_session), "scheduledMessageCoordinator"), "informOfCancelledMessageWithMessageGUID:success:cancelType:error:", v14, v8, v15, a5);
      }
      else if (v17 == (unsigned char *)&dword_0 + 1)
      {
        objc_msgSend(+[IMSafetyMonitorCoordinator sharedCoordinator](IMSafetyMonitorCoordinator, "sharedCoordinator"), "informOfCancelledScheduledMessageSendWithMessageGUID:sentSuccessfully:error:", v14, v8, a5);
      }
    }
    [(NSMutableDictionary *)self->_pendingCancelScheduledMessageGUIDs removeObjectForKey:a6];
    if (![(NSMutableDictionary *)self->_pendingCancelScheduledMessageGUIDs count])
    {

      self->_pendingCancelScheduledMessageGUIDs = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    CFStringRef v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v19 = 138412290;
      *(void *)&v19[4] = a6;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Failed to find a messageGUID for idsIdentifier: %@", v19, 0xCu);
    }
  }
}

- (void)_sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 fromID:(id)a7 recipients:(id)a8 uploadStartTime:(id)a9 fromAccount:(id)a10 completionBlock:(id)a11
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_46FD4;
  v11[3] = &unk_DE6C0;
  v11[4] = a9;
  v11[5] = self;
  v11[6] = a10;
  objc_msgSend(-[MessageDeliveryController attachmentController](self, "attachmentController"), "sendAttachmentsForMessage:canSendInline:displayIDs:additionalContext:mode:fromID:recipients:completionBlock:uploadFailureBlock:", a3, a4, a5, a6, 0, a7, a8, a11, v11);
}

- (void)sendEditedMessage:(id)a3 partIndex:(int64_t)a4 editType:(unint64_t)a5 destinations:(id)a6 chatIdentifier:(id)a7 account:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 unsupportedDestinationsHandler:(id)a11 completionBlock:(id)a12
{
  id v17 = +[NSString stringGUID];
  id v18 = [a3 guid];
  if (![v18 length]) {
    [+[IMMetricsCollector sharedInstance] forceAutoBugCaptureWithSubType:@"Sending Edited Message with no GUID" errorPayload:0];
  }
  if ([a10 length]) {
    id v43 = +[NSString stringGUID];
  }
  else {
    id v43 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Sending edit command with guid %@ for edit of message with guid %@", buf, 0x16u);
    }
  }
  id v20 = [a3 body];
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  if (@"1") {
    CFDictionarySetValue(theDict, @"v", @"1");
  }
  id v21 = [(MessageDeliveryController *)self _replicationSourceIDForSending];
  if (v21) {
    CFDictionarySetValue(theDict, @"rp", v21);
  }
  if (v18) {
    CFDictionarySetValue(theDict, @"emg", v18);
  }
  __int16 v22 = +[NSNumber numberWithInteger:a4];
  if (v22) {
    CFDictionarySetValue(theDict, @"epi", v22);
  }
  id v23 = +[NSNumber numberWithUnsignedInteger:a5];
  if (v23) {
    CFDictionarySetValue(theDict, @"et", v23);
  }
  if (a5 == 2)
  {
    uint64_t v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(objc_msgSend(a3, "subject", v23), "length") == 0);
    if (v26) {
      CFDictionarySetValue(theDict, @"rs", v26);
    }
  }
  else if (a5 == 1)
  {
    CFStringRef v24 = -[SuperToMessageParserContext initWithAttributedString:includeMessageParts:]([SuperToMessageParserContext alloc], "initWithAttributedString:includeMessageParts:", objc_msgSend(objc_msgSend(v20, "__im_messagePartMatchingPartIndex:", a4), "messagePartBody"), 1);
    [+[IMAttributedStringParser sharedInstance] parseContext:v24];
    __int16 v25 = [(SuperToMessageParserContext *)v24 outHTML];
    if (v25) {
      CFDictionarySetValue(theDict, @"epb", v25);
    }
  }
  unsigned int v27 = +[NSSet setWithObject:IDSRegistrationPropertySupportsRetractAndEditMessages];
  if ([(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])
  {
    unsigned int v28 = [a3 isSOS];
    uint64_t v29 = &IDSRegistrationPropertySupportsSOSAlerting;
    if (!v28) {
      uint64_t v29 = &IDSRegistrationPropertySupportsHybridGroupsV1;
    }
    unsigned int v27 = [(NSSet *)v27 setByAddingObject:*v29];
  }
  uint64_t v30 = IDSGetUUIDData();
  id v42 = objc_alloc_init((Class)NSMutableDictionary);
  CFStringRef v31 = +[NSNumber numberWithInteger:118];
  id v32 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanTrue, IDSSendMessageOptionTopLevelDictionaryKey, v31, IDSSendMessageOptionCommandKey, v27, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, v30, IDSSendMessageOptionUUIDKey, 0);
  if ([(__CFDictionary *)theDict count])
  {
    id v33 = (void *)JWEncodeDictionary();
    id v34 = [v33 _FTCopyGzippedData];
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = [v33 length];
        id v37 = [v34 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v37;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Compressed edited message data from: %lu  to: %lu", buf, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = [v34 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v39;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %lu", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)v32 setObject:v34 forKey:IDSSendMessageOptionDataToEncryptKey];
  }
  id v40 = [objc_alloc((Class)NSSet) initWithArray:a6];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v54 = 1;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  int v52 = 0;
  id v41 = dispatch_group_create();
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_478D8;
  v50[3] = &unk_DE6E8;
  v50[5] = buf;
  v50[6] = v51;
  v50[4] = v41;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_47A34;
  v49[3] = &unk_DE710;
  v49[4] = a9;
  v49[5] = v43;
  v49[6] = a10;
  v49[7] = v41;
  v49[8] = self;
  v49[9] = a3;
  v49[10] = a6;
  v49[11] = a7;
  v49[12] = a8;
  v49[13] = a11;
  v49[14] = v50;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_47C5C;
  v48[3] = &unk_DE738;
  v48[6] = buf;
  v48[7] = v51;
  v48[4] = v17;
  v48[5] = v41;
  dispatch_group_enter(v41);
  [(MessageDeliveryController *)self sendMessageDictionary:v42 encryptDictionary:1 fromID:a9 fromAccount:a8 toURIs:v40 toGroup:0 priority:300 options:v32 willSendBlock:v49 completionBlock:v48];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_47D84;
  block[3] = &unk_DE760;
  block[6] = buf;
  block[7] = v51;
  block[4] = self;
  block[5] = a12;
  dispatch_group_notify(v41, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_sendBackwardCompatibilityMessageForEditedMessage:(id)a3 usingMessageGUID:(id)a4 toBackwardCompatabilityDestinations:(id)a5 withOriginalDestinations:(id)a6 chatIdentifier:(id)a7 fromAccount:(id)a8 fromID:(id)a9 backwardCompatabilityText:(id)a10 completionBlock:(id)a11
{
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = a5;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Sending backwards compatible edit message text to %@", buf, 0xCu);
    }
  }
  id v18 = objc_msgSend(objc_alloc((Class)IMMessageItem), "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", objc_msgSend(a3, "sender"), objc_msgSend(a3, "dateEdited"), a10, 0, 0, objc_msgSend(a3, "flags"), 0, a4, objc_msgSend(a3, "threadIdentifier"));
  objc_msgSend(v18, "setDestinationCallerID:", objc_msgSend(a9, "_stripFZIDPrefix"));
  id v19 = [(MessageDeliveryController *)self _chatForChatIdentifier:a7];
  id v20 = [(MessageDeliveryController *)self session];
  id v21 = [(MessageDeliveryController *)self groupController];
  idsService = self->_idsService;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_48094;
  v24[3] = &unk_DE7B0;
  v24[4] = self;
  v24[5] = a7;
  v24[6] = a5;
  v24[7] = a6;
  v24[9] = v18;
  v24[10] = a11;
  v24[8] = a3;
  [v21 sendMessage:v18 toChat:v19 fromID:a9 fromAccount:a8 session:v20 service:idsService completionBlock:v24];
}

- (void)sendRepositionedStickerMetadata:(id)a3 forEditedMessage:(id)a4 destinations:(id)a5 account:(id)a6 fromID:(id)a7 completionBlock:(id)a8
{
  -[MessageDeliveryController _checkStickerRepositioningMetadata:](self, "_checkStickerRepositioningMetadata:");
  id v12 = +[NSString stringGUID];
  id v13 = [a4 guid];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Sending sticker reposition command with guid %@ for sticker chat item with guid %@", buf, 0x16u);
    }
  }
  id v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v16 = v15;
  if (@"1") {
    CFDictionarySetValue(v15, @"v", @"1");
  }
  id v17 = [(MessageDeliveryController *)self _replicationSourceIDForSending];
  if (v17) {
    CFDictionarySetValue(v16, @"rp", v17);
  }
  if (v13) {
    CFDictionarySetValue(v16, @"scig", v13);
  }
  if (a3) {
    CFDictionarySetValue(v16, @"srpi", a3);
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Sticker repositioning is supported and relevant keys were added to messageDictionary.", buf, 2u);
    }
  }
  id v19 = +[NSSet setWithObject:IDSRegistrationPropertySupportsRetractAndEditMessages];
  if ([(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])id v19 = [(NSSet *)v19 setByAddingObject:IDSRegistrationPropertySupportsHybridGroupsV1]; {
  uint64_t v20 = IDSGetUUIDData();
  }
  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v22 = +[NSNumber numberWithInteger:122];
  id v23 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanTrue, IDSSendMessageOptionTopLevelDictionaryKey, v22, IDSSendMessageOptionCommandKey, v19, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, v20, IDSSendMessageOptionUUIDKey, 0);
  if ([(__CFDictionary *)v16 count])
  {
    CFStringRef v24 = (void *)JWEncodeDictionary();
    id v25 = [v24 _FTCopyGzippedData];
    if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = [v24 length];
        id v28 = [v25 length];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Compressed edited message data from: %lu  to: %lu", buf, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = [v25 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Adding data to be encrypted of size: %lu", buf, 0xCu);
      }
    }
    [(NSMutableDictionary *)v23 setObject:v25 forKey:IDSSendMessageOptionDataToEncryptKey];
  }
  id v31 = [objc_alloc((Class)NSSet) initWithArray:a5];
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v43 = 1;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  int v39 = 0;
  id v32 = dispatch_group_create();
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_48934;
  v37[3] = &unk_DE7D8;
  v37[6] = buf;
  v37[7] = v40;
  v37[8] = v38;
  v37[4] = v12;
  v37[5] = v32;
  dispatch_group_enter(v32);
  [(MessageDeliveryController *)self sendMessageDictionary:v21 encryptDictionary:1 fromID:a7 fromAccount:a6 toURIs:v31 toGroup:0 priority:300 options:v23 willSendBlock:0 completionBlock:v37];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_48A78;
  block[3] = &unk_DE800;
  block[6] = buf;
  block[7] = v38;
  block[4] = self;
  block[5] = a8;
  void block[8] = v40;
  dispatch_group_notify(v32, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_checkStickerRepositioningMetadata:(id)a3
{
  if (a3)
  {
    if (![(id)IMSharedHelperMissingKeysInStickerUserInfo() count]) {
      return;
    }
    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_9664C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    CFStringRef v11 = @"[MessageDeliveryController] Attempting sticker repositioning with missing reposition metadata.";
    CFStringRef v12 = @"MissingStickerMetadata";
  }
  else
  {
    id v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_965D4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    CFStringRef v11 = @"[MessageDeliveryController] Attempting sticker repositioning with nil reposition metadata.";
    CFStringRef v12 = @"NilStickerMetadata";
  }
  NSErrorUserInfoKey v21 = NSDebugDescriptionErrorKey;
  CFStringRef v22 = v11;
  [+[IMMetricsCollector sharedInstance](IMMetricsCollector, "sharedInstance") forceAutoBugCaptureWithSubType:@"AttemptedInvalidStickerReposition" errorPayload:+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IMChatErrorDomain, 0, +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1]) type:v12 context:0];
}

- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4
{
  id v17 = 0;
  uint64_t v18 = 0;
  id v7 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:");
  idsService = self->_idsService;
  v28[0] = IDSSendMessageOptionQueueOneIdentifierKey;
  v28[1] = IDSSendMessageOptionFromIDKey;
  v29[0] = v7;
  v29[1] = a4;
  unsigned int v9 = [(IDSService *)idsService cancelMessageWithOptions:+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2] identifier:&v17 error:&v18];
  if ([v17 length])
  {
    pendingCancelScheduledMessageGUIDs = self->_pendingCancelScheduledMessageGUIDs;
    if (!pendingCancelScheduledMessageGUIDs)
    {
      pendingCancelScheduledMessageGUIDs = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      self->_pendingCancelScheduledMessageGUIDs = pendingCancelScheduledMessageGUIDs;
    }
    if ([(NSMutableDictionary *)pendingCancelScheduledMessageGUIDs objectForKey:v17])
    {
      if (IMOSLoggingEnabled())
      {
        CFStringRef v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v17;
          __int16 v21 = 2112;
          id v22 = a3;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "We already have identifier (%@) for messageGUID (%@)", buf, 0x16u);
        }
      }
    }
    CFStringRef v12 = self->_pendingCancelScheduledMessageGUIDs;
    v27[0] = a3;
    v27[1] = &off_E3798;
    id v13 = +[NSArray arrayWithObjects:v27 count:2];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v17];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Failed to get identifier from IDS for cancel scheduled message with GUID: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v9) {
        CFStringRef v16 = @"YES";
      }
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      __int16 v23 = 2112;
      CFStringRef v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Cancelling scheduled message with GUID: %@ handleID: %@, cancelSuccess: %@ idsIdentifier: %@", buf, 0x2Au);
    }
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3 fromID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6
{
  id v34 = 0;
  uint64_t v35 = 0;
  id v11 = -[MessageDeliveryController _getQueueIdentifierFromGUID:](self, "_getQueueIdentifierFromGUID:");
  v52[0] = IDSSendMessageOptionQueueOneIdentifierKey;
  v52[1] = IDSSendMessageOptionFromIDKey;
  v53[0] = v11;
  v53[1] = a4;
  id v12 = [+[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2] mutableCopy];
  id v13 = v12;
  if (a6 != 2) {
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionAlwaysIncludeSelfKey];
  }
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(a5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = (char *)[a5 countByEnumeratingWithState:&v30 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(a5);
        }
        [v14 addObject:IMChatCanonicalIDSIDsForAddress()];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = (char *)[a5 countByEnumeratingWithState:&v30 objects:v51 count:16];
    }
    while (v15);
  }
  char v18 = objc_opt_respondsToSelector();
  idsService = self->_idsService;
  if (v18) {
    unsigned int v20 = [(IDSService *)idsService cancelMessageWithOptions:v13 destinations:v14 identifier:&v34 error:&v35];
  }
  else {
    unsigned int v20 = [(IDSService *)idsService cancelMessageWithOptions:v13 identifier:&v34 error:&v35];
  }
  unsigned int v21 = v20;

  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = +[NSNumber numberWithUnsignedInteger:a6];
      CFStringRef v24 = @"NO";
      *(_DWORD *)buf = 138413826;
      if (v21) {
        CFStringRef v24 = @"YES";
      }
      id v38 = a3;
      __int16 v39 = 2112;
      id v40 = a4;
      __int16 v41 = 2112;
      id v42 = a5;
      __int16 v43 = 2112;
      id v44 = v23;
      __int16 v45 = 2112;
      CFStringRef v46 = v24;
      __int16 v47 = 2112;
      id v48 = v34;
      __int16 v49 = 2112;
      uint64_t v50 = v35;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Cancelling scheduled message with GUID: %@, fromID:%@, destination: %@, cancelType: %@ cancelSuccess: %@ idsIdentifier: %@ error: %@", buf, 0x48u);
    }
  }
  if ([v34 length])
  {
    pendingCancelScheduledMessageGUIDs = self->_pendingCancelScheduledMessageGUIDs;
    if (!pendingCancelScheduledMessageGUIDs)
    {
      pendingCancelScheduledMessageGUIDs = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      self->_pendingCancelScheduledMessageGUIDs = pendingCancelScheduledMessageGUIDs;
    }
    if ([(NSMutableDictionary *)pendingCancelScheduledMessageGUIDs objectForKey:v34]
      && IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v34;
        __int16 v39 = 2112;
        id v40 = a3;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "We already have identifier (%@) for messageGUID (%@)", buf, 0x16u);
      }
    }
    id v27 = self->_pendingCancelScheduledMessageGUIDs;
    v36[0] = a3;
    v36[1] = +[NSNumber numberWithUnsignedInteger:a6];
    id v28 = +[NSArray arrayWithObjects:v36 count:2];
    [(NSMutableDictionary *)v27 setObject:v28 forKey:v34];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = a3;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Failed to get identifier from IDS for cancel scheduled message with GUID: %@", buf, 0xCu);
    }
  }
}

- (id)_appendFilePathsWithGUIDs:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableAttributedString);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if ([a3 count])
  {
    unint64_t v6 = 0;
    int v7 = 0;
    uint64_t v8 = IMMessagePartAttributeName;
    uint64_t v9 = IMFileTransferGUIDAttributeName;
    do
    {
      id v10 = [a3 objectAtIndex:v6];
      if (v10)
      {
        id v11 = v10;
        objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7), v8);
        [v5 setObject:v11 forKey:v9];
        ++v7;
        __int16 v15 = -4;
        id v12 = [objc_alloc((Class)NSString) initWithCharacters:&v15 length:1];
        id v13 = [objc_alloc((Class)NSAttributedString) initWithString:v12 attributes:v5];
        [v4 appendAttributedString:v13];
      }
      ++v6;
    }
    while ((unint64_t)[a3 count] > v6);
  }

  return v4;
}

- (void)sendLogDumpMessageAtFilePath:(id)a3 fromAccount:(id)a4 fromID:(id)a5 toRecipient:(id)a6 shouldDeleteFile:(BOOL)a7 withCompletion:(id)a8
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  unsigned int v21 = sub_499CC;
  id v22 = &unk_DE828;
  BOOL v24 = a7;
  id v23 = a3;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      id v28 = a5;
      __int16 v29 = 2112;
      id v30 = a6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "SendLogDump: Request to send log dump file at path %@ from idsaccount %@ from %@ to recipient %@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v15 = -[IMDFileTransferCenter guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "guidForNewOutgoingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", [a3 lastPathComponent], 0, 100, 10, 11, 13);
    objc_msgSend(-[IMDFileTransferCenter transferForGUID:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "transferForGUID:", v15), "_setLocalPath:", a3);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v28) = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int16 v25 = 138412290;
        id v26 = v15;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "SendLogDump: Uploading file directly for file transfer guid %@", v25, 0xCu);
      }
    }
    id v17 = +[IMTransferServicesController sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_49B40;
    v19[3] = &unk_DE850;
    v19[4] = v15;
    v19[5] = self;
    v19[6] = a4;
    v19[7] = a5;
    v19[8] = a6;
    v19[9] = a8;
    v19[10] = v20;
    v19[11] = buf;
    [(IMTransferServicesController *)v17 sendFilePath:a3 topic:IDSServiceNameiMessage userInfo:&off_E39E0 transferID:v15 encryptFile:1 progressBlock:0 completionBlock:v19];
    im_dispatch_after();
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      char v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "SendLogDump:Account is nil, returning early", buf, 2u);
      }
    }
    v21((uint64_t)v20);
    if (a8) {
      (*((void (**)(id, void))a8 + 2))(a8, 0);
    }
  }
}

- (void)_sendIDSMessageWithTransferGUID:(id)a3 andTransfer:(id)a4 fromAccount:(id)a5 fromID:(id)a6 toRecipient:(id)a7 withCompletion:(id)a8
{
  id v55 = a3;
  id v11 = [(MessageDeliveryController *)self _appendFilePathsWithGUIDs:+[NSArray arrayWithObjects:&v55 count:1]];
  id v12 = [[SuperToMessageParserContext alloc] initWithAttributedString:v11 includeMessageParts:1];
  [+[IMAttributedStringParser sharedInstance] parseContext:v12];
  id v13 = [v11 string];
  BOOL value = [(SuperToMessageParserContext *)v12 outHTML];
  if ([(SuperToMessageParserContext *)v12 isSimpleString])
  {
    int v14 = 0;
  }
  else
  {
    if ([v11 length]) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    int v14 = !v15;
  }
  uint64_t v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      CFStringRef v18 = @"NO";
      if (v14) {
        CFStringRef v18 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)int v52 = v18;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "SendLogDump: sendXMLVersion %@ ", buf, 0xCu);
    }
  }
  if ([a7 _appearsToBeEmail]) {
    uint64_t v19 = IDSCopyIDForEmailAddress();
  }
  else {
    uint64_t v19 = IDSCopyIDForPhoneNumber();
  }
  unsigned int v20 = (void *)v19;
  if ([a6 _appearsToBeEmail]) {
    __int16 v47 = (void *)IDSCopyIDForEmailAddress();
  }
  else {
    __int16 v47 = (void *)IDSCopyIDForPhoneNumber();
  }
  v54[0] = v20;
  v54[1] = v47;
  unsigned int v21 = +[NSArray arrayWithObjects:v54 count:2];
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v52 = v21;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "SendLogDump: participants: %@", buf, 0xCu);
    }
  }
  if (@"1") {
    CFDictionarySetValue(v16, @"v", @"1");
  }
  id v23 = [(MessageDeliveryController *)self _replicationSourceIDForSending];
  if (v23) {
    CFDictionarySetValue(v16, @"rp", v23);
  }
  if (value) {
    int v24 = v14;
  }
  else {
    int v24 = 0;
  }
  if (v24 == 1) {
    CFDictionarySetValue(v16, @"x", value);
  }
  if (v13) {
    CFDictionarySetValue(v16, @"t", v13);
  }
  CFDictionarySetValue(v16, @"s", &stru_E0738);
  if (v21) {
    CFDictionarySetValue(v16, @"p", v21);
  }
  id v25 = +[NSString stringGUID];
  uint64_t v26 = IDSGetUUIDData();
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  id v28 = +[NSNumber numberWithInteger:100];
  __int16 v29 = +[NSNumber numberWithBool:0];
  id v30 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v28, IDSSendMessageOptionCommandKey, v29, IDSSendMessageOptionWantsResponseKey, v26, IDSSendMessageOptionUUIDKey, v25, IDSSendMessageOptionAlternateCallbackIdentifierKey, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)v30, IDSSendMessageOptionWantsDeliveryStatusKey, &__kCFBooleanFalse);
  CFDictionarySetValue((CFMutableDictionaryRef)v30, IDSSendMessageOptionFireAndForgetKey, &__kCFBooleanTrue);
  CFDictionarySetValue((CFMutableDictionaryRef)v30, IDSSendMessageOptionTimeoutKey, &off_E3990);
  if ([(__CFDictionary *)v16 count])
  {
    long long v31 = (void *)JWEncodeDictionary();
    id v32 = [v31 _FTCopyGzippedData];
    if (IMOSLoggingEnabled())
    {
      long long v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        unsigned int v34 = [v31 length];
        unsigned int v35 = [v32 length];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v52 = v34;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v35;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "SendLogDump: Compressed message data from: %u  to: %u", buf, 0xEu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        unsigned int v37 = [v32 length];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v52 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "SendLogDump: Adding data to be encrypted of size: %u", buf, 8u);
      }
    }
    [(NSMutableDictionary *)v30 setObject:v32 forKey:IDSSendMessageOptionDataToEncryptKey];
  }
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  id v38 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v20, 0);
  if (IMOSLoggingEnabled())
  {
    __int16 v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)int v52 = v25;
      *(_WORD *)&v52[8] = 2112;
      id v53 = v38;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "SendLogDump: Sending IDS message with guid: %@ to destinations: %@", buf, 0x16u);
    }
  }
  id v40 = +[IMIDSService service:self->_idsService sendMessage:v27 fromAccount:a5 toDestinations:v38 priority:300 options:v30 identifier:&v49 error:&v50];
  int v41 = IMOSLoggingEnabled();
  if (v40)
  {
    id v42 = (void (**)(id, id))a8;
    if (v41)
    {
      __int16 v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "SendLogDump: IDS sendMessage succeeded!", buf, 2u);
        if (!a8) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
  }
  else
  {
    id v42 = (void (**)(id, id))a8;
    if (v41)
    {
      id v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v52 = v50;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "SendLogDump: IDS sendMessage did not succeed, error %@", buf, 0xCu);
      }
    }
  }
  if (v42) {
LABEL_56:
  }
    v42[2](v42, v40);
LABEL_57:
}

- (id)_fallbackMessageItemFromLinkMetadata:(id)a3 originalMessageItem:(id)a4
{
  id v6 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", objc_msgSend(objc_msgSend(a3, "URL"), "absoluteString"));
  id v7 = objc_msgSend(v6, "__im_attributedStringByAssigningMessagePartNumbers");
  id v8 = objc_alloc_init((Class)LPMessagesPayload);
  [v8 setMetadata:a3];
  uint64_t v12 = 0;
  [v8 dataRepresentationWithOutOfLineAttachments:&v12];
  uint64_t v9 = IMSharedHelperCombinedPluginPayloadDictionaryData();
  id v10 = objc_msgSend(objc_alloc((Class)IMMessageItem), "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", objc_msgSend(a4, "sender"), objc_msgSend(a4, "time"), v7, 0, 0, objc_msgSend(a4, "flags"), 0, objc_msgSend(a4, "guid"), 0);
  [v10 setBalloonBundleID:IMBalloonPluginIdentifierRichLinks];
  [v10 setPayloadData:v9];

  return v10;
}

- (id)_fallbackMesssageItemByConvertingGenmojiToUnknownEmojiCharacterInOriginalMessageItem:(id)a3
{
  id v3 = a3;
  id v5 = [a3 body];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v3, "copyWithFlags:", objc_msgSend(v3, "flags"));
    objc_msgSend(v7, "_setMessageID:", objc_msgSend(v3, "messageID"));
    id v8 = +[IMDFileTransferCenter sharedInstance];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_4AC90;
    v31[3] = &unk_DE8A0;
    v31[4] = v8;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3052000000;
    id v28 = sub_4ACA8;
    __int16 v29 = sub_4ACB8;
    id v30 = 0;
    id v30 = objc_alloc_init((Class)NSAttributedString);
    id v9 = objc_alloc_init((Class)NSMutableOrderedSet);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_4ACC4;
    v24[3] = &unk_DE908;
    v24[6] = &stru_DE8E0;
    v24[7] = &v25;
    v24[4] = v9;
    v24[5] = v31;
    objc_msgSend(v6, "__im_visitMessageParts:", v24);
    id v10 = objc_msgSend(objc_msgSend(v3, "fileTransferGUIDs"), "mutableCopy");
    if ([v9 count])
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v21;
        do
        {
          int v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = objc_msgSend(-[MessageDeliveryController _nonAdaptiveFileTransferForAdaptiveImageFileTransfer:](self, "_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:", -[IMDFileTransferCenter transferForGUID:](v8, "transferForGUID:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v14))), "guid");
            if (v15) {
              [v11 addObject:v15];
            }
            int v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v12);
      }
      id v16 = [v11 copy];

      objc_msgSend(v10, "removeObjectsInArray:", objc_msgSend(v9, "array"));
      [v10 addObjectsFromArray:v16];
      id v17 = objc_msgSend((id)v26[5], "__im_attributedStringByAppendingFileTransfers:", v16);
      v26[5] = (uint64_t)v17;
    }
    id v18 = [v10 copy];

    [v7 setBody:v26[5]];
    [v7 setFileTransferGUIDs:v18];
    [v7 setBackwardsCompatibleVersion:1];

    id v3 = v7;
    _Block_object_dispose(&v25, 8);
  }
  return v3;
}

- (id)_nonAdaptiveFileTransferForAdaptiveImageFileTransfer:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = -[MessageDeliveryController _copyGenmojiHEICFileToTemporaryDirectory:](self, "_copyGenmojiHEICFileToTemporaryDirectory:", [a3 localPath]);
    if (v4)
    {
      id v5 = v4;
      id v6 = [v4 lastPathComponent];
      id v7 = [v3 totalBytes];
      id v8 = [v3 hfsType];
      id v9 = [v3 hfsCreator];
      id v10 = [v3 hfsFlags];
      id v11 = +[IMDFileTransferCenter sharedInstance];
      id v3 = [(IMDFileTransferCenter *)v11 transferForGUID:[(IMDFileTransferCenter *)v11 guidForNewOutgoingTransferWithFilename:v6 isDirectory:0 totalBytes:v7 hfsType:v8 hfsCreator:v9 hfsFlags:v10]];
      [v3 _setLocalPath:v5];
      [v3 setIsTemporaryBackwardCompatibilityAsset:1];
      [v3 setIsGenmojiFallback:1];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_966C4();
      }
      return 0;
    }
  }
  return v3;
}

- (id)_copyGenmojiHEICFileToTemporaryDirectory:(id)a3
{
  id v4 = [a3 lastPathComponent];
  if (!v4)
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_966F8();
    }
    return 0;
  }
  id v15 = v4;
  id v5 = objc_msgSend(objc_msgSend((id)IMSafeTemporaryDirectory(), "im_URLByAppendingPathComponents:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1)), "path");
  id v6 = +[NSFileManager defaultManager];
  if ([(NSFileManager *)v6 fileExistsAtPath:v5])
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Copying genmoji to temporary path, but file already exists at that path, deleting old item.", buf, 2u);
    }
    *(void *)buf = 0;
    if (![(NSFileManager *)v6 removeItemAtPath:v5 error:buf])
    {
      id v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_96798();
      }
    }
  }
  *(void *)buf = 0;
  if (![(NSFileManager *)v6 copyItemAtPath:a3 toPath:v5 error:buf])
  {
    if (objc_msgSend(objc_msgSend(*(id *)buf, "domain"), "isEqual:", NSCocoaErrorDomain)
      && [*(id *)buf code] == &stru_1F8.sectname[12])
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Copying genmoji to temporary path failed, because file is already there.", v13, 2u);
      }
      return v5;
    }
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_9672C();
    }
    return 0;
  }
  return v5;
}

- (id)_replicationSourceIDForSending
{
  if (![(MessageServiceSession *)[(MessageDeliveryController *)self session] isReplicating])return 0; {
  id v3 = objc_msgSend(-[MessageServiceSession service](-[MessageDeliveryController session](self, "session"), "service"), "replicationSourceIDForSending");
  }

  return +[NSNumber numberWithInteger:v3];
}

- (void)_updateIDSServiceForTesting:(id)a3
{
  self->_idsService = 0;
  self->_idsService = (IDSService *)a3;
}

- (void)_addIdentifierToPendingTimestampUpdateMap:(id)a3 alternateCallbackId:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self->_pendingTimestampUpdate setObject:a3 forKey:a4];
  }
}

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (MessageDeliveryControllerDelegate)delegate
{
  return (MessageDeliveryControllerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_session);
}

@end