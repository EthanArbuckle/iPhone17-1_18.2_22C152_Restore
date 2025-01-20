@interface IMItem
+ (BOOL)supportsSecureCoding;
+ (Class)classForIMItemType:(int64_t)a3;
+ (Class)classForMessageItemDictionary:(id)a3;
+ (id)stringGUID;
- (BOOL)isAssociatedMessageItem;
- (BOOL)isBreadcrumb;
- (BOOL)isEmojiSticker;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstMessageCandidate;
- (BOOL)isFromMe;
- (BOOL)isLastMessageCandidate;
- (BOOL)isMessageAcknowledgment;
- (BOOL)isMessageEdit;
- (BOOL)isOlderThanItem:(id)a3;
- (BOOL)isReply;
- (BOOL)isSticker;
- (BOOL)unsentIsFromMeItem;
- (BOOL)wasDetonated;
- (IMItem)initWithCoder:(id)a3;
- (IMItem)initWithDictionary:(id)a3;
- (IMItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6;
- (IMItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13 type:(int64_t)a14;
- (NSArray)fileTransferGUIDs;
- (NSData)cloudKitServerChangeTokenBlob;
- (NSDate)clientSendTime;
- (NSDate)time;
- (NSDictionary)senderInfo;
- (NSString)account;
- (NSString)accountID;
- (NSString)balloonBundleID;
- (NSString)cloudKitRecordChangeTag;
- (NSString)cloudKitRecordID;
- (NSString)countryCode;
- (NSString)criticalMessagingAppName;
- (NSString)destinationCallerID;
- (NSString)guid;
- (NSString)handle;
- (NSString)parentChatID;
- (NSString)personCentric;
- (NSString)personCentricID;
- (NSString)replyToGUID;
- (NSString)roomName;
- (NSString)sender;
- (NSString)service;
- (NSString)unformattedID;
- (_NSRange)associatedMessageRange;
- (id)associatedMessageEmoji;
- (id)associatedMessageGUID;
- (id)consumedSessionPayloads;
- (id)context;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emojiSticker;
- (id)pluginSessionGUID;
- (id)tapback;
- (int64_t)associatedMessageType;
- (int64_t)cloudKitSyncState;
- (int64_t)messageID;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)sortID;
- (void)_setMessageID:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setBalloonBundleID:(id)a3;
- (void)setClientSendTime:(id)a3;
- (void)setCloudKitRecordChangeTag:(id)a3;
- (void)setCloudKitRecordID:(id)a3;
- (void)setCloudKitServerChangeTokenBlob:(id)a3;
- (void)setCloudKitSyncState:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCriticalMessagingAppName:(id)a3;
- (void)setDestinationCallerID:(id)a3;
- (void)setFileTransferGUIDs:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHandle:(id)a3;
- (void)setParentChatID:(id)a3;
- (void)setPersonCentric:(id)a3;
- (void)setPersonCentricID:(id)a3;
- (void)setReplyToGUID:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setSender:(id)a3;
- (void)setSenderInfo:(id)a3;
- (void)setService:(id)a3;
- (void)setSortID:(unint64_t)a3;
- (void)setTime:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUnformattedID:(id)a3;
@end

@implementation IMItem

- (NSDate)time
{
  return self->_time;
}

- (id)context
{
  return self->_context;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)service
{
  return self->_service;
}

- (void)setContext:(id)a3
{
}

+ (Class)classForMessageItemDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"type"];
  uint64_t v5 = [v4 longLongValue];

  switch(v5)
  {
    case 0:
      [v3 objectForKey:@"associatedMessageGUID"];

      goto LABEL_4;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
LABEL_4:
      v6 = objc_opt_class();
      break;
    default:
      v6 = 0;
      break;
  }

  return (Class)v6;
}

- (unint64_t)sortID
{
  return self->_sortID;
}

- (id)copyDictionaryRepresentation
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v4 = (void *)MEMORY[0x1A6228190]();
  senderInfo = self->_senderInfo;
  if (senderInfo) {
    CFDictionarySetValue(Mutable, @"senderInfo", senderInfo);
  }
  unformattedID = self->_unformattedID;
  if (unformattedID) {
    CFDictionarySetValue(Mutable, @"unformattedID", unformattedID);
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    CFDictionarySetValue(Mutable, @"countryCode", countryCode);
  }
  guid = self->_guid;
  if (guid) {
    CFDictionarySetValue(Mutable, @"guid", guid);
  }
  roomName = self->_roomName;
  if (roomName) {
    CFDictionarySetValue(Mutable, @"roomName", roomName);
  }
  handle = self->_handle;
  if (handle) {
    CFDictionarySetValue(Mutable, @"handle", handle);
  }
  account = self->_account;
  if (account) {
    CFDictionarySetValue(Mutable, @"account", account);
  }
  accountID = self->_accountID;
  if (accountID) {
    CFDictionarySetValue(Mutable, @"accountID", accountID);
  }
  service = self->_service;
  if (service) {
    CFDictionarySetValue(Mutable, @"service", service);
  }
  v14 = [NSNumber numberWithLongLong:self->_messageID];
  if (v14) {
    CFDictionarySetValue(Mutable, @"messageID", v14);
  }

  v15 = [NSNumber numberWithLongLong:self->_type];
  if (v15) {
    CFDictionarySetValue(Mutable, @"type", v15);
  }

  if ([(NSString *)self->_balloonBundleID length])
  {
    v16 = [(IMItem *)self balloonBundleID];
    if (v16) {
      CFDictionarySetValue(Mutable, @"balloonBundleID", v16);
    }
  }
  time = self->_time;
  if (time)
  {
    [(NSDate *)time timeIntervalSinceReferenceDate];
    v18 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v18) {
      CFDictionarySetValue(Mutable, @"time", v18);
    }
  }
  v19 = [NSNumber numberWithLongLong:self->_cloudKitSyncState];
  if (v19) {
    CFDictionarySetValue(Mutable, @"ckSyncState", v19);
  }

  cloudKitRecordID = self->_cloudKitRecordID;
  if (cloudKitRecordID) {
    CFDictionarySetValue(Mutable, @"ckRecordID", cloudKitRecordID);
  }
  cloudKitServerChangeTokenBlob = self->_cloudKitServerChangeTokenBlob;
  if (cloudKitServerChangeTokenBlob) {
    CFDictionarySetValue(Mutable, @"ckServerChangeTokenBlob", cloudKitServerChangeTokenBlob);
  }
  cloudKitRecordChangeTag = self->_cloudKitRecordChangeTag;
  if (cloudKitRecordChangeTag) {
    CFDictionarySetValue(Mutable, @"ckRecordChangeTag", cloudKitRecordChangeTag);
  }
  destinationCallerID = self->_destinationCallerID;
  if (destinationCallerID) {
    CFDictionarySetValue(Mutable, @"destinationCallerID", destinationCallerID);
  }
  v24 = [NSNumber numberWithUnsignedInteger:self->_sortID];
  if (v24) {
    CFDictionarySetValue(Mutable, @"sortID", v24);
  }

  replyToGUID = self->_replyToGUID;
  if (replyToGUID) {
    CFDictionarySetValue(Mutable, @"replyToGUID", replyToGUID);
  }
  criticalMessagingAppName = self->_criticalMessagingAppName;
  if (criticalMessagingAppName) {
    CFDictionarySetValue(Mutable, @"criticalMessagingAppName", criticalMessagingAppName);
  }
  return Mutable;
}

- (IMItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)IMItem;
  uint64_t v5 = [(IMItem *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"senderInfo"];
    [(IMItem *)v5 setSenderInfo:v6];

    v7 = [v4 objectForKey:@"guid"];
    if (!v7
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7]) == 0
      || (v9 = v8,
          [v8 UUIDString],
          v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      v10 = +[IMItem stringGUID];
    }
    [(IMItem *)v5 setGuid:v10];
    v11 = [v4 objectForKey:@"roomName"];
    [(IMItem *)v5 setRoomName:v11];

    v12 = [v4 objectForKey:@"handle"];
    [(IMItem *)v5 setHandle:v12];

    v13 = [v4 objectForKey:@"account"];
    [(IMItem *)v5 setAccount:v13];

    v14 = [v4 objectForKey:@"accountID"];
    [(IMItem *)v5 setAccountID:v14];

    v15 = [v4 objectForKey:@"service"];
    [(IMItem *)v5 setService:v15];

    v16 = [v4 objectForKey:@"unformattedID"];
    [(IMItem *)v5 setUnformattedID:v16];

    v17 = [v4 objectForKey:@"countryCode"];
    [(IMItem *)v5 setCountryCode:v17];

    v18 = [v4 objectForKey:@"balloonBundleID"];
    [(IMItem *)v5 setBalloonBundleID:v18];

    v19 = [v4 objectForKey:@"time"];
    [v19 doubleValue];
    double v21 = v20;

    if (v21 > 10.0)
    {
      v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v21];
      [(IMItem *)v5 setTime:v22];
    }
    v23 = [v4 objectForKey:@"messageID"];
    v5->_messageID = [v23 longLongValue];

    v24 = [v4 objectForKey:@"type"];
    v5->_type = [v24 longLongValue];

    v25 = [v4 objectForKey:@"ckSyncState"];
    -[IMItem setCloudKitSyncState:](v5, "setCloudKitSyncState:", [v25 integerValue]);

    v26 = [v4 objectForKey:@"ckRecordID"];
    [(IMItem *)v5 setCloudKitRecordID:v26];

    v27 = [v4 objectForKey:@"ckServerChangeTokenBlob"];
    [(IMItem *)v5 setCloudKitServerChangeTokenBlob:v27];

    v28 = [v4 objectForKey:@"ckRecordChangeTag"];
    [(IMItem *)v5 setCloudKitRecordChangeTag:v28];

    v29 = [v4 objectForKey:@"destinationCallerID"];
    [(IMItem *)v5 setDestinationCallerID:v29];

    v30 = [v4 objectForKey:@"sortID"];
    -[IMItem setSortID:](v5, "setSortID:", [v30 unsignedIntegerValue]);

    v31 = [v4 objectForKey:@"replyToGUID"];
    [(IMItem *)v5 setReplyToGUID:v31];
  }
  return v5;
}

- (void)setSortID:(unint64_t)a3
{
  self->_sortID = a3;
}

- (void)setBalloonBundleID:(id)a3
{
}

- (void)setUnformattedID:(id)a3
{
}

- (void)setTime:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (void)setSenderInfo:(id)a3
{
}

- (void)setRoomName:(id)a3
{
}

- (void)setReplyToGUID:(id)a3
{
}

- (void)setHandle:(id)a3
{
}

- (void)setGuid:(id)a3
{
}

- (void)setDestinationCallerID:(id)a3
{
}

- (void)setCountryCode:(id)a3
{
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  self->_cloudKitSyncState = a3;
}

- (void)setCloudKitServerChangeTokenBlob:(id)a3
{
}

- (void)setCloudKitRecordID:(id)a3
{
}

- (void)setCloudKitRecordChangeTag:(id)a3
{
}

- (void)setAccountID:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t type = self->_type;
      if (type != [(IMItem *)v5 type]
        || (int64_t messageID = self->_messageID, messageID != [(IMItem *)v5 messageID]))
      {
        unsigned __int8 v12 = 0;
LABEL_62:

        goto LABEL_63;
      }
      guid = self->_guid;
      v9 = [(IMItem *)v5 guid];
      if (guid != v9)
      {
        v10 = self->_guid;
        v11 = [(IMItem *)v5 guid];
        if (![(NSString *)v10 isEqualToString:v11])
        {
          unsigned __int8 v12 = 0;
          goto LABEL_60;
        }
        v75 = v11;
      }
      handle = self->_handle;
      v14 = [(IMItem *)v5 handle];
      if (handle != v14)
      {
        v15 = self->_handle;
        uint64_t v16 = [(IMItem *)v5 handle];
        v17 = v15;
        v18 = (void *)v16;
        if (![(NSString *)v17 isEqualToString:v16])
        {
          unsigned __int8 v12 = 0;
          v11 = v75;
LABEL_58:

LABEL_59:
          if (guid == v9)
          {
LABEL_61:

            goto LABEL_62;
          }
LABEL_60:

          goto LABEL_61;
        }
        v73 = v18;
      }
      senderInfo = self->_senderInfo;
      double v20 = [(IMItem *)v5 senderInfo];
      v74 = senderInfo;
      if (senderInfo != v20)
      {
        double v21 = self->_senderInfo;
        uint64_t v22 = [(IMItem *)v5 senderInfo];
        v23 = v21;
        v24 = (void *)v22;
        if (![(NSDictionary *)v23 isEqualToDictionary:v22])
        {
          unsigned __int8 v12 = 0;
LABEL_56:

LABEL_57:
          BOOL v51 = handle == v14;
          v11 = v75;
          v18 = v73;
          if (v51) {
            goto LABEL_59;
          }
          goto LABEL_58;
        }
        v71 = v24;
      }
      time = self->_time;
      v26 = [(IMItem *)v5 time];
      v72 = time;
      if (time != v26)
      {
        v27 = self->_time;
        v70 = [(IMItem *)v5 time];
        if (!-[NSDate isEqualToDate:](v27, "isEqualToDate:"))
        {
          unsigned __int8 v12 = 0;
LABEL_54:

LABEL_55:
          v24 = v71;
          if (v74 == v20) {
            goto LABEL_57;
          }
          goto LABEL_56;
        }
      }
      v28 = self->_handle;
      [(IMItem *)v5 handle];
      uint64_t v69 = v68 = v28;
      if (v28 != (NSString *)v69)
      {
        v29 = self->_handle;
        v66 = [(IMItem *)v5 handle];
        if (!-[NSString isEqualToString:](v29, "isEqualToString:"))
        {
          unsigned __int8 v12 = 0;
          v30 = (NSString *)v69;
LABEL_52:

LABEL_53:
          if (v72 == v26) {
            goto LABEL_55;
          }
          goto LABEL_54;
        }
      }
      roomName = self->_roomName;
      [(IMItem *)v5 roomName];
      uint64_t v65 = v64 = roomName;
      v67 = v26;
      if (roomName != (NSString *)v65)
      {
        v32 = self->_roomName;
        v63 = [(IMItem *)v5 roomName];
        if (!-[NSString isEqualToString:](v32, "isEqualToString:"))
        {
          unsigned __int8 v12 = 0;
          v30 = (NSString *)v69;
          objc_super v33 = (void *)v65;
LABEL_50:

LABEL_51:
          v26 = v67;
          if (v68 == v30) {
            goto LABEL_53;
          }
          goto LABEL_52;
        }
      }
      service = self->_service;
      [(IMItem *)v5 service];
      uint64_t v62 = v61 = service;
      if (service != (NSString *)v62)
      {
        v35 = self->_service;
        v60 = [(IMItem *)v5 service];
        if (!-[NSString isEqualToString:](v35, "isEqualToString:"))
        {
          unsigned __int8 v12 = 0;
          v30 = (NSString *)v69;
          v36 = (void *)v62;
LABEL_48:

LABEL_49:
          objc_super v33 = (void *)v65;
          if (v64 == (NSString *)v65) {
            goto LABEL_51;
          }
          goto LABEL_50;
        }
      }
      accountID = self->_accountID;
      [(IMItem *)v5 accountID];
      uint64_t v59 = v58 = accountID;
      if (accountID != (NSString *)v59)
      {
        v38 = self->_accountID;
        v57 = [(IMItem *)v5 accountID];
        if (!-[NSString isEqualToString:](v38, "isEqualToString:"))
        {
          unsigned __int8 v12 = 0;
          v30 = (NSString *)v69;
          v39 = (void *)v59;
LABEL_46:

LABEL_47:
          v36 = (void *)v62;
          if (v61 == (NSString *)v62) {
            goto LABEL_49;
          }
          goto LABEL_48;
        }
      }
      account = self->_account;
      [(IMItem *)v5 account];
      uint64_t v56 = v55 = account;
      if (account == (NSString *)v56
        || (v41 = self->_account,
            [(IMItem *)v5 account],
            v54 = objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v41, "isEqualToString:")))
      {
        destinationCallerID = self->_destinationCallerID;
        uint64_t v44 = [(IMItem *)v5 destinationCallerID];
        if (destinationCallerID == (NSString *)v44)
        {
          unint64_t sortID = self->_sortID;
          unsigned __int8 v12 = sortID == [(IMItem *)v5 sortID];
        }
        else
        {
          v53 = (void *)v44;
          v45 = self->_destinationCallerID;
          uint64_t v46 = [(IMItem *)v5 destinationCallerID];
          v47 = v45;
          v48 = (void *)v46;
          if ([(NSString *)v47 isEqualToString:v46])
          {
            unint64_t v49 = self->_sortID;
            unsigned __int8 v12 = v49 == [(IMItem *)v5 sortID];
          }
          else
          {

            unsigned __int8 v12 = 0;
          }
        }
        v42 = (void *)v56;
        v30 = (NSString *)v69;
        if (v55 == (NSString *)v56)
        {
LABEL_45:

          v39 = (void *)v59;
          if (v58 == (NSString *)v59) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
        v30 = (NSString *)v69;
        v42 = (void *)v56;
      }

      goto LABEL_45;
    }
    v76.receiver = self;
    v76.super_class = (Class)IMItem;
    unsigned __int8 v12 = [(IMItem *)&v76 isEqual:v4];
  }
LABEL_63:

  return v12;
}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int64_t)associatedMessageType
{
  return 0;
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)associatedMessageGUID
{
  return 0;
}

- (id)associatedMessageEmoji
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_parentChatID, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordChangeTag, 0);
  objc_storeStrong((id *)&self->_cloudKitServerChangeTokenBlob, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordID, 0);
  objc_storeStrong((id *)&self->_personCentric, 0);
  objc_storeStrong((id *)&self->_criticalMessagingAppName, 0);
  objc_storeStrong((id *)&self->_replyToGUID, 0);
  objc_storeStrong((id *)&self->_clientSendTime, 0);
  objc_storeStrong((id *)&self->_destinationCallerID, 0);
  objc_storeStrong((id *)&self->_balloonBundleID, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_unformattedID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

+ (Class)classForIMItemType:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"type";
  id v4 = [NSNumber numberWithLongLong:a3];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [a1 classForMessageItemDictionary:v5];

  return (Class)v6;
}

+ (id)stringGUID
{
  return (id)[NSString stringGUID];
}

- (id)description
{
  v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)IMItem;
  NSUInteger v3 = [(IMItem *)&v16 description];
  int64_t v4 = [(IMItem *)self messageID];
  uint64_t v5 = [(IMItem *)self guid];
  v6 = [(IMItem *)self time];
  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IMItem cloudKitSyncState](self, "cloudKitSyncState"));
  v8 = [(IMItem *)self cloudKitRecordID];
  v9 = [(IMItem *)self destinationCallerID];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  if ([(IMItem *)self wasDetonated]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  unsigned __int8 v12 = [(IMItem *)self service];
  v13 = [v15 stringWithFormat:@"[%@ messageID: %lld guid: %@ time: %@ ck-sync-state: %@ ck-record-id %@ destinationCallerID: %@ sortID %@ wasDetonated: %@ service: %@]", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (IMItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6
{
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = *MEMORY[0x1E4F6C5C8];
    id v12 = a5;
    id v13 = a4;
    v14 = [v10 dictionaryWithObject:a3 forKey:v11];
    v15 = [(IMItem *)self initWithSenderInfo:v14 time:v13 guid:v12 messageID:0 account:0 accountID:0 service:0 handle:0 roomName:0 unformattedID:0 countryCode:0 type:a6];

    objc_super v16 = v15;
  }
  else
  {
    id v17 = a5;
    id v18 = a4;
    v19 = [(IMItem *)self initWithSenderInfo:0 time:v18 guid:v17 messageID:0 account:0 accountID:0 service:0 handle:0 roomName:0 unformattedID:0 countryCode:0 type:a6];

    objc_super v16 = v19;
  }

  return v16;
}

- (IMItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13 type:(int64_t)a14
{
  id v18 = a3;
  id v39 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = v20;
  id v23 = a9;
  v24 = v21;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  v40.receiver = self;
  v40.super_class = (Class)IMItem;
  v29 = [(IMItem *)&v40 init];
  v30 = v29;
  if (v29)
  {
    [(IMItem *)v29 setSenderInfo:v18];
    [(IMItem *)v30 setRoomName:v26];
    [(IMItem *)v30 setHandle:v25];
    [(IMItem *)v30 setAccount:v22];
    [(IMItem *)v30 setAccountID:v24];
    id v38 = v23;
    [(IMItem *)v30 setService:v23];
    if (v39)
    {
      [(IMItem *)v30 setTime:v39];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] date];
      v32 = id v31 = v18;
      [(IMItem *)v30 setTime:v32];

      id v18 = v31;
    }
    [(IMItem *)v30 setCountryCode:v28];
    [(IMItem *)v30 setUnformattedID:v27];
    if (v19)
    {
      [(IMItem *)v30 setGuid:v19];
    }
    else
    {
      [NSString stringGUID];
      v34 = id v33 = v18;
      [(IMItem *)v30 setGuid:v34];

      id v18 = v33;
    }
    [(IMItem *)v30 setCloudKitSyncState:0];
    [(IMItem *)v30 setCloudKitRecordID:0];
    [(IMItem *)v30 setCloudKitServerChangeTokenBlob:0];
    [(IMItem *)v30 setCloudKitRecordChangeTag:0];
    [(IMItem *)v30 setSortID:0];
    id v23 = v38;
    v30->_int64_t messageID = a6;
    v30->_int64_t type = a14;
  }

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(IMItem *)self senderInfo];
  [v4 setSenderInfo:v5];

  v6 = [(IMItem *)self time];
  [v4 setTime:v6];

  v7 = [(IMItem *)self guid];
  [v4 setGuid:v7];

  v8 = [(IMItem *)self roomName];
  [v4 setRoomName:v8];

  v9 = [(IMItem *)self handle];
  [v4 setHandle:v9];

  v10 = [(IMItem *)self account];
  [v4 setAccount:v10];

  uint64_t v11 = [(IMItem *)self accountID];
  [v4 setAccountID:v11];

  id v12 = [(IMItem *)self service];
  [v4 setService:v12];

  id v13 = [(IMItem *)self destinationCallerID];
  [v4 setDestinationCallerID:v13];

  v14 = [(IMItem *)self countryCode];
  [v4 setCountryCode:v14];

  v15 = [(IMItem *)self unformattedID];
  [v4 setUnformattedID:v15];

  objc_msgSend(v4, "setType:", -[IMItem type](self, "type"));
  objc_super v16 = [(IMItem *)self context];
  [v4 setContext:v16];

  id v17 = [(IMItem *)self balloonBundleID];
  [v4 setBalloonBundleID:v17];

  id v18 = [(IMItem *)self clientSendTime];
  [v4 setClientSendTime:v18];

  objc_msgSend(v4, "setSortID:", -[IMItem sortID](self, "sortID"));
  return v4;
}

- (IMItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)IMItem;
  uint64_t v5 = [(IMItem *)&v32 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeInt64ForKey:@"type"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"senderInfo"];
    [(IMItem *)v5 setSenderInfo:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
    [(IMItem *)v5 setGuid:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roomName"];
    [(IMItem *)v5 setRoomName:v15];

    objc_super v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    [(IMItem *)v5 setHandle:v16];

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    [(IMItem *)v5 setAccount:v17];

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    [(IMItem *)v5 setAccountID:v18];

    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    [(IMItem *)v5 setService:v19];

    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationCallerID"];
    [(IMItem *)v5 setDestinationCallerID:v20];

    [v4 decodeDoubleForKey:@"time"];
    if (v21 > 10.0)
    {
      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMItem *)v5 setTime:v22];
    }
    v5->_int64_t messageID = [v4 decodeInt64ForKey:@"messageID"];
    id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    [(IMItem *)v5 setCountryCode:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unformattedID"];
    [(IMItem *)v5 setUnformattedID:v24];

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balloonBundleID"];
    [(IMItem *)v5 setBalloonBundleID:v25];

    v5->_cloudKitSyncState = [v4 decodeInt64ForKey:@"ckSyncState"];
    id v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckRecordID"];
    [(IMItem *)v5 setCloudKitRecordID:v26];

    id v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckServerChangeTokenBlob"];
    [(IMItem *)v5 setCloudKitServerChangeTokenBlob:v27];

    id v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckRecordChangeTag"];
    [(IMItem *)v5 setCloudKitRecordChangeTag:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortID"];
    -[IMItem setSortID:](v5, "setSortID:", [v29 unsignedIntegerValue]);

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replyToGUID"];
    [(IMItem *)v5 setReplyToGUID:v30];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"type"];
  v6 = [(IMItem *)self senderInfo];
  [v5 encodeObject:v6 forKey:@"senderInfo"];

  uint64_t v7 = [(IMItem *)self guid];
  [v5 encodeObject:v7 forKey:@"guid"];

  uint64_t v8 = [(IMItem *)self roomName];
  [v5 encodeObject:v8 forKey:@"roomName"];

  uint64_t v9 = [(IMItem *)self handle];
  [v5 encodeObject:v9 forKey:@"handle"];

  uint64_t v10 = [(IMItem *)self account];
  [v5 encodeObject:v10 forKey:@"account"];

  uint64_t v11 = [(IMItem *)self accountID];
  [v5 encodeObject:v11 forKey:@"accountID"];

  id v12 = [(IMItem *)self service];
  [v5 encodeObject:v12 forKey:@"service"];

  id v13 = [(IMItem *)self destinationCallerID];
  [v5 encodeObject:v13 forKey:@"destinationCallerID"];

  v14 = [(IMItem *)self time];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  [v5 encodeDouble:@"time" forKey:v16];
  [v5 encodeInt64:self->_messageID forKey:@"messageID"];
  id v17 = [(IMItem *)self countryCode];
  [v5 encodeObject:v17 forKey:@"countryCode"];

  id v18 = [(IMItem *)self unformattedID];
  [v5 encodeObject:v18 forKey:@"unformattedID"];

  id v19 = [(IMItem *)self balloonBundleID];
  [v5 encodeObject:v19 forKey:@"balloonBundleID"];

  [v5 encodeInt64:self->_cloudKitSyncState forKey:@"ckSyncState"];
  id v20 = [(IMItem *)self cloudKitRecordID];
  [v5 encodeObject:v20 forKey:@"ckRecordID"];

  double v21 = [(IMItem *)self cloudKitServerChangeTokenBlob];
  [v5 encodeObject:v21 forKey:@"ckServerChangeTokenBlob"];

  uint64_t v22 = [(IMItem *)self cloudKitRecordChangeTag];
  [v5 encodeObject:v22 forKey:@"ckRecordChangeTag"];

  id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  [v5 encodeObject:v23 forKey:@"sortID"];

  v24 = [(IMItem *)self replyToGUID];
  [v5 encodeObject:v24 forKey:@"replyToGUID"];

  id v25 = [(IMItem *)self criticalMessagingAppName];
  [v5 encodeObject:v25 forKey:@"criticalMessagingAppName"];
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v5 = a3;
  id v4 = [(IMItem *)self copyDictionaryRepresentation];
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
}

- (id)dictionaryRepresentation
{
  id v2 = [(IMItem *)self copyDictionaryRepresentation];

  return v2;
}

- (BOOL)isFromMe
{
  id v2 = [(IMItem *)self sender];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setSender:(id)a3
{
  id v8 = a3;
  id v4 = [(IMItem *)self senderInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v4 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v6 = *MEMORY[0x1E4F6C5C8];
  if (v8) {
    [(__CFDictionary *)Mutable setObject:v8 forKey:v6];
  }
  else {
    [(__CFDictionary *)Mutable removeObjectForKey:v6];
  }
  if ([(__CFDictionary *)Mutable count]) {
    CFMutableDictionaryRef v7 = Mutable;
  }
  else {
    CFMutableDictionaryRef v7 = 0;
  }
  [(IMItem *)self setSenderInfo:v7];
}

- (void)setPersonCentricID:(id)a3
{
  id v8 = a3;
  id v4 = [(IMItem *)self senderInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v4 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v6 = *MEMORY[0x1E4F6C608];
  if (v8) {
    [(__CFDictionary *)Mutable setObject:v8 forKey:v6];
  }
  else {
    [(__CFDictionary *)Mutable removeObjectForKey:v6];
  }
  if ([(__CFDictionary *)Mutable count]) {
    CFMutableDictionaryRef v7 = Mutable;
  }
  else {
    CFMutableDictionaryRef v7 = 0;
  }
  [(IMItem *)self setSenderInfo:v7];
}

- (NSString)sender
{
  return (NSString *)[(NSDictionary *)self->_senderInfo objectForKey:*MEMORY[0x1E4F6C5C8]];
}

- (NSString)personCentricID
{
  return (NSString *)[(NSDictionary *)self->_senderInfo objectForKey:*MEMORY[0x1E4F6C608]];
}

- (BOOL)isOlderThanItem:(id)a3
{
  id v4 = a3;
  id v5 = [(IMItem *)self time];
  uint64_t v6 = [v4 time];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == 1)
  {
    BOOL v8 = 0;
  }
  else if (v7 == -1)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [v4 messageID];
    BOOL v8 = v9 >= [(IMItem *)self messageID];
  }

  return v8;
}

- (BOOL)unsentIsFromMeItem
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  if (!v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v5 = [(IMItem *)self isFromMe];
  if (v5)
  {
    if ([(IMItem *)self isSent])
    {
LABEL_5:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = [(IMItem *)self errorCode] == 0;
  }
  return v5;
}

- (BOOL)isReply
{
  return 0;
}

- (unint64_t)hash
{
  guid = self->_guid;
  if (guid)
  {
    return [(NSString *)guid hash];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)IMItem;
    return [(IMItem *)&v5 hash];
  }
}

- (BOOL)isFirstMessageCandidate
{
  return 0;
}

- (BOOL)isLastMessageCandidate
{
  return 0;
}

- (BOOL)wasDetonated
{
  return 0;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)unformattedID
{
  return self->_unformattedID;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSDictionary)senderInfo
{
  return self->_senderInfo;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)_setMessageID:(int64_t)a3
{
  self->_int64_t messageID = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)destinationCallerID
{
  return self->_destinationCallerID;
}

- (NSDate)clientSendTime
{
  return self->_clientSendTime;
}

- (void)setClientSendTime:(id)a3
{
}

- (NSString)replyToGUID
{
  return self->_replyToGUID;
}

- (NSString)criticalMessagingAppName
{
  return self->_criticalMessagingAppName;
}

- (void)setCriticalMessagingAppName:(id)a3
{
}

- (NSString)personCentric
{
  return self->_personCentric;
}

- (void)setPersonCentric:(id)a3
{
}

- (int64_t)cloudKitSyncState
{
  return self->_cloudKitSyncState;
}

- (NSString)cloudKitRecordID
{
  return self->_cloudKitRecordID;
}

- (NSData)cloudKitServerChangeTokenBlob
{
  return self->_cloudKitServerChangeTokenBlob;
}

- (NSString)cloudKitRecordChangeTag
{
  return self->_cloudKitRecordChangeTag;
}

- (NSString)parentChatID
{
  return self->_parentChatID;
}

- (void)setParentChatID:(id)a3
{
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
}

- (id)consumedSessionPayloads
{
  return 0;
}

- (id)pluginSessionGUID
{
  BOOL v3 = [(IMItem *)self balloonBundleID];
  uint64_t v4 = [v3 length];

  if (v4 && [(IMItem *)self isBreadcrumb])
  {
    objc_super v5 = [(IMItem *)self associatedMessageGUID];
  }
  else
  {
    objc_super v5 = [(IMItem *)self guid];
  }

  return v5;
}

- (BOOL)isAssociatedMessageItem
{
  return 0;
}

- (BOOL)isMessageAcknowledgment
{
  return 0;
}

- (BOOL)isBreadcrumb
{
  return 0;
}

- (BOOL)isMessageEdit
{
  return 0;
}

- (BOOL)isSticker
{
  return 0;
}

- (BOOL)isEmojiSticker
{
  return 0;
}

- (id)tapback
{
  return 0;
}

- (id)emojiSticker
{
  return 0;
}

@end