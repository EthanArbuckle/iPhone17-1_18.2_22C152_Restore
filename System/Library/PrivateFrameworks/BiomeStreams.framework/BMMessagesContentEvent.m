@interface BMMessagesContentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMContentAttachment)attachment;
- (BMMessagesContentEvent)initWithCoder:(id)a3;
- (BMMessagesContentEvent)initWithProto:(id)a3;
- (BMMessagesContentEvent)initWithProtoData:(id)a3;
- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16;
- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16 contentProtection:(id)a17;
- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18;
- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30;
- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30 messageEffect:(id)a31 isKnownSender:(id)a32 conversationUUID:(id)a33;
- (BMNamedHandle)fromHandle;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)accountHandles;
- (NSArray)toHandles;
- (NSNumber)isBusinessChat;
- (NSNumber)isFromMe;
- (NSNumber)isGroupThread;
- (NSNumber)isJunk;
- (NSNumber)isKnownSender;
- (NSNumber)isNew;
- (NSNumber)isPinned;
- (NSNumber)isRead;
- (NSNumber)isTwoFactorCode;
- (NSNumber)messageEffect;
- (NSNumber)tapbackType;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)conversationId;
- (NSString)conversationUUID;
- (NSString)domainId;
- (NSString)messageType;
- (NSString)messagesService;
- (NSString)personaId;
- (NSString)suggestedNickname;
- (NSString)suggestedPhotoPath;
- (NSString)tapbackAssociatedMessageID;
- (NSString)uniqueId;
- (NSURL)URL;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMMessagesContentEvent

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30 messageEffect:(id)a31 isKnownSender:(id)a32 conversationUUID:(id)a33
{
  id v82 = a3;
  id v55 = a4;
  id v79 = a4;
  id v56 = a5;
  id v78 = a5;
  id v57 = a7;
  id v39 = a7;
  id v58 = a8;
  id v81 = a8;
  id v77 = a9;
  id v76 = a10;
  id v75 = a11;
  id v80 = a12;
  id v74 = a13;
  id v73 = a14;
  id v72 = a15;
  id v71 = a16;
  id v70 = a17;
  id v69 = a18;
  id v68 = a19;
  id v67 = a20;
  id v66 = a21;
  id v65 = a22;
  id v40 = a23;
  id v63 = a24;
  id v61 = a25;
  id v41 = a26;
  id v42 = a27;
  id v43 = a28;
  id v44 = a29;
  id v64 = a30;
  id v62 = a31;
  id v60 = a32;
  id v45 = a33;
  if (v82)
  {
    if (v39) {
      goto LABEL_3;
    }
  }
  else
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"BMMessagesContentEvent.m", 61, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v39) {
      goto LABEL_3;
    }
  }
  v50 = [MEMORY[0x1E4F28B00] currentHandler];
  [v50 handleFailureInMethod:a2, self, @"BMMessagesContentEvent.m", 62, @"Invalid parameter not satisfying: %@", @"conversationId" object file lineNumber description];

LABEL_3:
  if (!v81)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"BMMessagesContentEvent.m", 63, @"Invalid parameter not satisfying: %@", @"fromHandle" object file lineNumber description];
  }
  if (!v80)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"BMMessagesContentEvent.m", 64, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  v83.receiver = self;
  v83.super_class = (Class)BMMessagesContentEvent;
  v46 = [(BMMessagesContentEvent *)&v83 init];
  v47 = v46;
  if (v46)
  {
    objc_storeStrong((id *)&v46->_uniqueId, a3);
    objc_storeStrong((id *)&v47->_domainId, v55);
    objc_storeStrong((id *)&v47->_personaId, v56);
    v47->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v47->_conversationId, v57);
    objc_storeStrong((id *)&v47->_fromHandle, v58);
    objc_storeStrong((id *)&v47->_toHandles, a9);
    objc_storeStrong((id *)&v47->_suggestedNickname, a10);
    objc_storeStrong((id *)&v47->_suggestedPhotoPath, a11);
    objc_storeStrong((id *)&v47->_content, a12);
    objc_storeStrong((id *)&v47->_accountIdentifier, a13);
    objc_storeStrong((id *)&v47->_accountHandles, a14);
    objc_storeStrong((id *)&v47->_accountType, a15);
    objc_storeStrong((id *)&v47->_attachment, a16);
    objc_storeStrong((id *)&v47->_URL, a17);
    objc_storeStrong((id *)&v47->_contentProtection, a18);
    objc_storeStrong((id *)&v47->_isNew, a19);
    objc_storeStrong((id *)&v47->_isTwoFactorCode, a20);
    objc_storeStrong((id *)&v47->_isFromMe, a21);
    objc_storeStrong((id *)&v47->_isGroupThread, a22);
    objc_storeStrong((id *)&v47->_isJunk, a23);
    objc_storeStrong((id *)&v47->_isRead, a24);
    objc_storeStrong((id *)&v47->_isPinned, a25);
    objc_storeStrong((id *)&v47->_isBusinessChat, a26);
    objc_storeStrong((id *)&v47->_tapbackAssociatedMessageID, a27);
    objc_storeStrong((id *)&v47->_tapbackType, a28);
    objc_storeStrong((id *)&v47->_messageType, a29);
    objc_storeStrong((id *)&v47->_messagesService, a30);
    objc_storeStrong((id *)&v47->_messageEffect, a31);
    objc_storeStrong((id *)&v47->_isKnownSender, a32);
    objc_storeStrong((id *)&v47->_conversationUUID, a33);
  }

  return v47;
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18 isNew:(id)a19 isTwoFactorCode:(id)a20 isFromMe:(id)a21 isGroupThread:(id)a22 isJunk:(id)a23 isRead:(id)a24 isPinned:(id)a25 isBusinessChat:(id)a26 tapbackAssociatedMessageID:(id)a27 tapbackType:(id)a28 messageType:(id)a29 messagesService:(id)a30
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 conversationId:(id)a7 fromHandle:(id)a8 toHandles:(id)a9 suggestedNickname:(id)a10 suggestedPhotoPath:(id)a11 content:(id)a12 accountIdentifier:(id)a13 accountHandles:(id)a14 accountType:(id)a15 attachment:(id)a16 URL:(id)a17 contentProtection:(id)a18
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16 contentProtection:(id)a17
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMMessagesContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 conversationId:(id)a6 fromHandle:(id)a7 toHandles:(id)a8 suggestedNickname:(id)a9 suggestedPhotoPath:(id)a10 content:(id)a11 accountIdentifier:(id)a12 accountHandles:(id)a13 accountType:(id)a14 attachment:(id)a15 URL:(id)a16
{
  return -[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:", a3, a4, 0, a6, a7, a8, a5, a9, a10, a11, a12, a13, a14, a15,
           a16,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMMessagesContentEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMMessagesContentEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMMessagesContentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMMessagesContentEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMMessagesContentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMMessagesContentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMMessagesContentEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMMessagesContentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMessagesContentEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && [v5 hasAbsoluteTimestamp]
        && [v5 hasConversationId]
        && [v5 hasFromHandle]
        && ([v5 hasContent] & 1) != 0)
      {
        id v63 = [v5 uniqueId];
        id v62 = [v5 domainId];
        id v61 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v7 = v6;
        id v60 = [v5 conversationId];
        id v8 = [BMNamedHandle alloc];
        uint64_t v9 = [v5 fromHandle];
        v59 = [(BMNamedHandle *)v8 initWithProto:v9];
        v10 = [v5 toHandles];
        id v58 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
        id v57 = [v5 suggestedNickname];
        id v56 = [v5 suggestedPhotoPath];
        id v55 = [v5 content];
        v54 = [v5 accountIdentifier];
        v53 = [v5 accountHandles];
        v52 = [v5 accountType];
        v11 = [BMContentAttachment alloc];
        uint64_t v12 = [v5 attachment];
        v51 = [(BMContentAttachment *)v11 initWithProto:v12];
        uint64_t v13 = [v5 url];
        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F1CB10]);
          v25 = [v5 url];
          v48 = objc_msgSend(v14, "initWithString:");
        }
        else
        {
          v48 = 0;
        }
        v50 = [v5 contentProtection];
        int v34 = [v5 hasIsNew];
        if (v34)
        {
          v47 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isNew](v5, "isNew"));
        }
        else
        {
          v47 = 0;
        }
        int v33 = [v5 hasIsTwoFactorCode];
        if (v33)
        {
          v46 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isTwoFactorCode](v5, "isTwoFactorCode"));
        }
        else
        {
          v46 = 0;
        }
        int v32 = [v5 hasIsFromMe];
        if (v32)
        {
          id v45 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isFromMe](v5, "isFromMe"));
        }
        else
        {
          id v45 = 0;
        }
        int v31 = [v5 hasIsGroupThread];
        if (v31)
        {
          id v44 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isGroupThread](v5, "isGroupThread"));
        }
        else
        {
          id v44 = 0;
        }
        int v30 = [v5 hasIsJunk];
        if (v30)
        {
          id v43 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isJunk](v5, "isJunk"));
        }
        else
        {
          id v43 = 0;
        }
        int v29 = [v5 hasIsRead];
        if (v29)
        {
          id v42 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isRead](v5, "isRead"));
        }
        else
        {
          id v42 = 0;
        }
        int v28 = [v5 hasIsPinned];
        if (v28)
        {
          id v41 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isPinned](v5, "isPinned"));
        }
        else
        {
          id v41 = 0;
        }
        int v27 = [v5 hasIsBusinessChat];
        if (v27)
        {
          id v40 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isBusinessChat](v5, "isBusinessChat"));
        }
        else
        {
          id v40 = 0;
        }
        v49 = [v5 tapbackAssociatedMessageID];
        v37 = v10;
        v38 = (void *)v9;
        int v26 = [v5 hasTapbackType];
        if (v26)
        {
          id v39 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject tapbackType](v5, "tapbackType"));
        }
        else
        {
          id v39 = 0;
        }
        v18 = [v5 messageType];
        v19 = [v5 messagesService];
        int v20 = [v5 hasMessageEffect];
        v36 = (void *)v12;
        if (v20)
        {
          v21 = objc_msgSend(NSNumber, "numberWithInt:", -[NSObject messageEffect](v5, "messageEffect"));
        }
        else
        {
          v21 = 0;
        }
        int v22 = [v5 hasIsKnownSender];
        v35 = (void *)v13;
        if (v22)
        {
          v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject isKnownSender](v5, "isKnownSender"));
        }
        else
        {
          v23 = 0;
        }
        v24 = [v5 conversationUUID];
        self = objc_retain(-[BMMessagesContentEvent initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueId:domainId:personaId:absoluteTimestamp:conversationId:fromHandle:toHandles:suggestedNickname:suggestedPhotoPath:content:accountIdentifier:accountHandles:accountType:attachment:URL:contentProtection:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v63, v62, v61, v60, v59, v58, v7, v57, v56, v55, v54, v53, v52,
                   v51,
                   v48,
                   v50,
                   v47,
                   v46,
                   v45,
                   v44,
                   v43,
                   v42,
                   v41,
                   v40,
                   v49,
                   v39,
                   v18,
                   v19,
                   v21,
                   v23,
                   v24));

        if (v22) {
        if (v20)
        }

        if (v26) {
        if (v27)
        }

        if (v28) {
        if (v29)
        }

        if (v30) {
        if (v31)
        }

        if (v32) {
        if (v33)
        }

        if (v34) {
        if (v35)
        }
        {
        }
        v15 = self;
        goto LABEL_17;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMMessagesContentEvent initWithProto:](v16);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMMessagesContentEvent initWithProto:](v5);
      }
    }
    v15 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

BMNamedHandle *__40__BMMessagesContentEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[BMNamedHandle alloc] initWithProto:v2];

  return v3;
}

- (BMMessagesContentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBMessagesContentEvent alloc] initWithData:v4];

    self = [(BMMessagesContentEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMMessagesContentEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMMessagesContentEvent *)self domainId];
  [v3 setDomainId:v5];

  double v6 = [(BMMessagesContentEvent *)self personaId];
  [v3 setPersonaId:v6];

  [(BMMessagesContentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  double v7 = [(BMMessagesContentEvent *)self conversationId];
  [v3 setConversationId:v7];

  id v8 = [(BMMessagesContentEvent *)self fromHandle];
  uint64_t v9 = [v8 proto];
  [v3 setFromHandle:v9];

  v10 = [(BMMessagesContentEvent *)self toHandles];
  v11 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_33);
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v3 setToHandles:v12];

  uint64_t v13 = [(BMMessagesContentEvent *)self suggestedNickname];
  [v3 setSuggestedNickname:v13];

  id v14 = [(BMMessagesContentEvent *)self suggestedPhotoPath];
  [v3 setSuggestedPhotoPath:v14];

  v15 = [(BMMessagesContentEvent *)self content];
  [v3 setContent:v15];

  v16 = [(BMMessagesContentEvent *)self accountIdentifier];
  [v3 setAccountIdentifier:v16];

  v17 = [(BMMessagesContentEvent *)self accountType];
  [v3 setAccountType:v17];

  v18 = [(BMMessagesContentEvent *)self accountHandles];
  v19 = (void *)[v18 mutableCopy];
  [v3 setAccountHandles:v19];

  int v20 = [(BMMessagesContentEvent *)self attachment];
  v21 = [v20 proto];
  [v3 setAttachment:v21];

  int v22 = [(BMMessagesContentEvent *)self URL];
  v23 = [v22 absoluteString];
  [v3 setUrl:v23];

  v24 = [(BMMessagesContentEvent *)self contentProtection];
  [v3 setContentProtection:v24];

  v25 = [(BMMessagesContentEvent *)self isNew];

  if (v25)
  {
    int v26 = [(BMMessagesContentEvent *)self isNew];
    objc_msgSend(v3, "setIsNew:", objc_msgSend(v26, "BOOLValue"));
  }
  int v27 = [(BMMessagesContentEvent *)self isTwoFactorCode];

  if (v27)
  {
    int v28 = [(BMMessagesContentEvent *)self isTwoFactorCode];
    objc_msgSend(v3, "setIsTwoFactorCode:", objc_msgSend(v28, "BOOLValue"));
  }
  int v29 = [(BMMessagesContentEvent *)self isFromMe];

  if (v29)
  {
    int v30 = [(BMMessagesContentEvent *)self isFromMe];
    objc_msgSend(v3, "setIsFromMe:", objc_msgSend(v30, "BOOLValue"));
  }
  int v31 = [(BMMessagesContentEvent *)self isGroupThread];

  if (v31)
  {
    int v32 = [(BMMessagesContentEvent *)self isGroupThread];
    objc_msgSend(v3, "setIsGroupThread:", objc_msgSend(v32, "BOOLValue"));
  }
  int v33 = [(BMMessagesContentEvent *)self isJunk];

  if (v33)
  {
    int v34 = [(BMMessagesContentEvent *)self isJunk];
    objc_msgSend(v3, "setIsJunk:", objc_msgSend(v34, "BOOLValue"));
  }
  v35 = [(BMMessagesContentEvent *)self isRead];

  if (v35)
  {
    v36 = [(BMMessagesContentEvent *)self isRead];
    objc_msgSend(v3, "setIsRead:", objc_msgSend(v36, "BOOLValue"));
  }
  v37 = [(BMMessagesContentEvent *)self isPinned];

  if (v37)
  {
    v38 = [(BMMessagesContentEvent *)self isPinned];
    objc_msgSend(v3, "setIsPinned:", objc_msgSend(v38, "BOOLValue"));
  }
  id v39 = [(BMMessagesContentEvent *)self isBusinessChat];

  if (v39)
  {
    id v40 = [(BMMessagesContentEvent *)self isBusinessChat];
    objc_msgSend(v3, "setIsBusinessChat:", objc_msgSend(v40, "BOOLValue"));
  }
  id v41 = [(BMMessagesContentEvent *)self tapbackAssociatedMessageID];

  if (v41)
  {
    id v42 = [(BMMessagesContentEvent *)self tapbackAssociatedMessageID];
    [v3 setTapbackAssociatedMessageID:v42];
  }
  id v43 = [(BMMessagesContentEvent *)self tapbackType];

  if (v43)
  {
    id v44 = [(BMMessagesContentEvent *)self tapbackType];
    objc_msgSend(v3, "setTapbackType:", objc_msgSend(v44, "integerValue"));
  }
  id v45 = [(BMMessagesContentEvent *)self messageType];

  if (v45)
  {
    v46 = [(BMMessagesContentEvent *)self messageType];
    [v3 setMessageType:v46];
  }
  v47 = [(BMMessagesContentEvent *)self messagesService];

  if (v47)
  {
    v48 = [(BMMessagesContentEvent *)self messagesService];
    [v3 setMessagesService:v48];
  }
  v49 = [(BMMessagesContentEvent *)self messageEffect];

  if (v49)
  {
    v50 = [(BMMessagesContentEvent *)self messageEffect];
    objc_msgSend(v3, "setMessageEffect:", objc_msgSend(v50, "intValue"));
  }
  v51 = [(BMMessagesContentEvent *)self isKnownSender];

  if (v51)
  {
    v52 = [(BMMessagesContentEvent *)self isKnownSender];
    objc_msgSend(v3, "setIsKnownSender:", objc_msgSend(v52, "BOOLValue"));
  }
  v53 = [(BMMessagesContentEvent *)self conversationUUID];

  if (v53)
  {
    v54 = [(BMMessagesContentEvent *)self conversationUUID];
    [v3 setConversationUUID:v54];
  }

  return v3;
}

uint64_t __31__BMMessagesContentEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v5 ^ v3 ^ [(NSString *)self->_conversationId hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    NSUInteger v6 = [(BMMessagesContentEvent *)self proto];
    double v7 = [v5 proto];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_uniqueId && self->_conversationId && self->_fromHandle && self->_toHandles && self->_content)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (BMNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (BMContentAttachment)attachment
{
  return self->_attachment;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSNumber)isNew
{
  return self->_isNew;
}

- (NSNumber)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (NSNumber)isFromMe
{
  return self->_isFromMe;
}

- (NSNumber)isGroupThread
{
  return self->_isGroupThread;
}

- (NSNumber)isJunk
{
  return self->_isJunk;
}

- (NSNumber)isRead
{
  return self->_isRead;
}

- (NSNumber)isPinned
{
  return self->_isPinned;
}

- (NSNumber)isBusinessChat
{
  return self->_isBusinessChat;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (NSNumber)tapbackType
{
  return self->_tapbackType;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (NSNumber)messageEffect
{
  return self->_messageEffect;
}

- (NSNumber)isKnownSender
{
  return self->_isKnownSender;
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_isKnownSender, 0);
  objc_storeStrong((id *)&self->_messageEffect, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_tapbackType, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_isBusinessChat, 0);
  objc_storeStrong((id *)&self->_isPinned, 0);
  objc_storeStrong((id *)&self->_isRead, 0);
  objc_storeStrong((id *)&self->_isJunk, 0);
  objc_storeStrong((id *)&self->_isGroupThread, 0);
  objc_storeStrong((id *)&self->_isFromMe, 0);
  objc_storeStrong((id *)&self->_isTwoFactorCode, 0);
  objc_storeStrong((id *)&self->_isNew, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 2;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMMessagesContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMMessagesContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMMessagesContentEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMMessagesContentEvent: tried to initialize with a non-BMMessagesContentEvent proto", v1, 2u);
}

@end