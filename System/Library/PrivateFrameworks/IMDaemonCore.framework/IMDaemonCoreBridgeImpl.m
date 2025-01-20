@interface IMDaemonCoreBridgeImpl
+ (BOOL)hasFinishedAssetDownloadSync;
+ (BOOL)isBackwardCompatibilityForItem:(id)a3 parentChatID:(id)a4;
+ (BOOL)isCompatibleWithMiCForItem:(id)a3;
+ (BOOL)isExpectedChatIDForItem:(id)a3 chatID:(id)a4;
+ (BOOL)registerGuid:(id)a3 forLocalURL:(id)a4;
+ (BOOL)shouldStoreMessageForItem:(id)a3;
+ (BOOL)storeAttachmentWithTransfer:(id)a3 withChatGUID:(id)a4;
+ (id)chatIdentitiesForMessageWithGUIDs:(id)a3;
+ (id)ckRecordWithT1Info:(id)a3;
+ (id)ckRecordWithT2Info:(id)a3;
+ (id)ckRecordWithT3Info:(id)a3;
+ (id)createMessageItemWithRecordRef:(_IMDMessageRecordStruct *)a3 handle:(id)a4;
+ (id)fileTransferForGUID:(id)a3;
+ (id)fileTransferWithGUID:(id)a3;
+ (id)primaryAccountCountryCode;
+ (void)addItem:(id)a3 toParentChatID:(id)a4 updatedLastMessageCount:(unint64_t)a5;
+ (void)addTransfer:(id)a3 forGUID:(id)a4;
+ (void)generatePreviewForTransfer:(id)a3;
+ (void)handleMessageUpdateWithCKRecord:(id)a3;
+ (void)moveMessagePartForGUID:(id)a3 deleteDate:(id)a4 partBody:(id)a5;
+ (void)reloadDatabase;
+ (void)removeTransferFromBackup:(id)a3;
+ (void)setSortIDForItem:(id)a3 parentChatID:(id)a4;
+ (void)storeAttachmentWithTransfer:(id)a3 withMessageGUID:(id)a4;
+ (void)storeAttachmentsForMessage:(id)a3;
+ (void)updateChatUsingSyncData:(id)a3;
+ (void)updateStamp;
+ (void)updateTemporaryTransferGUIDsIfNeeded:(id)a3;
+ (void)updateTransfer:(id)a3;
@end

@implementation IMDaemonCoreBridgeImpl

+ (void)updateChatUsingSyncData:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDChatRegistry sharedInstance];
  [v4 updateChatUsingSyncData:v3];
}

+ (BOOL)shouldStoreMessageForItem:(id)a3
{
  return [a3 shouldStoreMessage];
}

+ (BOOL)isCompatibleWithMiCForItem:(id)a3
{
  return [a3 isCompatibleWithMiC];
}

+ (BOOL)isBackwardCompatibilityForItem:(id)a3 parentChatID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9 = +[IMDChatRegistry sharedInstance];
  v7 = [v5 service];
  v8 = [v9 _lookupChatUsingParentChatID:v6 service:v7];

  objc_opt_class();
  LOBYTE(v9) = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    id v10 = v5;
    v11 = +[IMDBackwardCompatibilityMessageIdentifier sharedIdentifier];
    LODWORD(v9) = [v11 isIgnorableBackwardCompatibilityMessage:v10 inChat:v8];
    if (v9 && _IMWillLog())
    {
      v13 = [v10 guid];
      _IMAlwaysLog();
    }
  }

  return (char)v9;
}

+ (id)chatIdentitiesForMessageWithGUIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDChatStore sharedInstance];
  id v5 = [v4 chatIdentitiesForMessageWithGUIDs:v3];

  return v5;
}

+ (BOOL)isExpectedChatIDForItem:(id)a3 chatID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = +[IMDMessageStore sharedInstance];
    v8 = [v5 guid];
    v9 = [v7 chatsForMessageGUID:v8];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "cloudKitChatID", (void)v17);
          char v15 = [v6 isEqualToString:v14];

          if (v15)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

+ (void)setSortIDForItem:(id)a3 parentChatID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[IMDChatRegistry sharedInstance];
  v8 = [v6 service];
  id v10 = [v7 _lookupChatUsingParentChatID:v5 service:v8];

  v9 = +[IMDChatRegistry sharedInstance];
  [v9 _setSortIDOnIncomingMessage:v6 forChat:v10];
}

+ (void)addItem:(id)a3 toParentChatID:(id)a4 updatedLastMessageCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[IMDMessageStore sharedInstance];
  id v10 = [v7 guid];
  uint64_t v11 = [v9 chatForMessageGUID:v10];

  if (!v11)
  {
    uint64_t v12 = +[IMDChatRegistry sharedInstance];
    v13 = [v7 service];
    uint64_t v11 = [v12 _lookupChatUsingParentChatID:v8 service:v13];

    if (v11)
    {
      v14 = +[IMDChatRegistry sharedInstance];
      [v14 _addItemToParentChatIfNotLocationItem:v7 parentChat:v11 updatedLastMessageCount:a5];
    }
    else
    {
      char v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1D990499C((uint64_t)v8, v7, v15);
      }

      uint64_t v11 = 0;
    }
  }
}

+ (void)removeTransferFromBackup:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKAttachmentSyncController sharedInstance];
  [v4 _removeTransferFromiCloudBackupWithGuid:v3];
}

+ (void)updateTemporaryTransferGUIDsIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAttachmentStore sharedInstance];
  [v4 updateTemporaryTransferGUIDsOnMessageIfNeeded:v3];
}

+ (id)fileTransferWithGUID:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAttachmentStore sharedInstance];
  id v5 = [v4 attachmentWithGUID:v3];

  return v5;
}

+ (void)storeAttachmentWithTransfer:(id)a3 withMessageGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDAttachmentStore sharedInstance];
  [v7 storeAttachment:v6 associateWithMessageWithGUID:v5];
}

+ (BOOL)storeAttachmentWithTransfer:(id)a3 withChatGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDAttachmentStore sharedInstance];
  char v8 = [v7 storeAttachment:v6 associateWithMessageWithGUID:0 chatGUID:v5 storeAtExternalLocation:1];

  return v8;
}

+ (void)reloadDatabase
{
  id v2 = +[IMDChatRegistry sharedInstance];
  [v2 _forceReloadChats:1];
}

+ (void)storeAttachmentsForMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDMessageStore sharedInstance];
  [v4 _storeAttachmentsForMessage:v3];
}

+ (id)createMessageItemWithRecordRef:(_IMDMessageRecordStruct *)a3 handle:(id)a4
{
  id v4 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef((uint64_t)a3, a4);

  return v4;
}

+ (void)updateStamp
{
  id v2 = +[IMDMessageStore sharedInstance];
  [v2 updateStamp];
}

+ (id)fileTransferForGUID:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDFileTransferCenter sharedInstance];
  id v5 = [v4 transferForGUID:v3];

  return v5;
}

+ (void)addTransfer:(id)a3 forGUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDFileTransferCenter sharedInstance];
  [v7 addTransfer:v6 forGUID:v5];
}

+ (BOOL)registerGuid:(id)a3 forLocalURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDFileTransferCenter sharedInstance];
  char v8 = [v7 registerGUID:v6 forNewOutgoingTransferWithLocalURL:v5];

  return v8;
}

+ (void)updateTransfer:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDFileTransferCenter sharedInstance];
  [v4 updateTransfer:v3];
}

+ (void)moveMessagePartForGUID:(id)a3 deleteDate:(id)a4 partBody:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  [v10 _onRecoverableMessagePartRecordReadWithDeleteDate:v8 messageGUID:v9 partBody:v7];
}

+ (BOOL)hasFinishedAssetDownloadSync
{
  id v2 = +[IMDCKSyncController sharedInstance];
  id v3 = [v2 syncState];
  id v4 = [v3 getAnalyticSyncDatesObjectForKey:*MEMORY[0x1E4F6CEA8]];

  if ([v4 intValue])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue"));

    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)primaryAccountCountryCode
{
  id v2 = +[IMDCKUtilities sharedInstance];
  id v3 = [v2 _primaryAccountCountryCode];

  return v3;
}

+ (id)ckRecordWithT1Info:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E7F0];
  id v4 = a3;
  id v5 = +[IMDRecordZoneManager sharedInstance];
  BOOL v6 = [v5 updateRecordZoneID];
  id v7 = +[IMDCKRecordSaltManager sharedInstance];
  id v8 = [v7 cachedSalt];
  id v9 = (void *)[v3 createCKRecordForUpdateT1:v4 zoneID:v6 salt:v8];

  return v9;
}

+ (id)ckRecordWithT2Info:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E7F0];
  id v4 = a3;
  id v5 = +[IMDRecordZoneManager sharedInstance];
  BOOL v6 = [v5 updateRecordZoneID];
  id v7 = +[IMDCKRecordSaltManager sharedInstance];
  id v8 = [v7 cachedSalt];
  id v9 = (void *)[v3 createCKRecordForUpdateT2:v4 zoneID:v6 salt:v8];

  return v9;
}

+ (id)ckRecordWithT3Info:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E7F0];
  id v4 = a3;
  id v5 = +[IMDRecordZoneManager sharedInstance];
  BOOL v6 = [v5 updateRecordZoneID];
  id v7 = +[IMDCKRecordSaltManager sharedInstance];
  id v8 = [v7 cachedSalt];
  id v9 = (void *)[v3 createCKRecordForUpdateT3:v4 zoneID:v6 salt:v8];

  return v9;
}

+ (void)handleMessageUpdateWithCKRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDChatRegistry sharedInstance];
  [v4 handleMessageUpdate:v3];
}

+ (void)generatePreviewForTransfer:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6EBF8];
  id v4 = a3;
  id v7 = [v3 sharedInstance];
  id v5 = [v4 localPath];
  BOOL v6 = [MEMORY[0x1E4F6E950] contextWithKnownSender:1 serviceName:*MEMORY[0x1E4F6E198]];
  [v7 generatePreviewForTransfer:v4 attachmentPath:v5 balloonBundleID:0 senderContext:v6 completionBlock:0];
}

@end