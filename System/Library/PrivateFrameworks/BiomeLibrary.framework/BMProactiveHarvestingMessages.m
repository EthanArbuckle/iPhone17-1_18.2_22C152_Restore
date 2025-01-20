@interface BMProactiveHarvestingMessages
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingContentAttachment)attachment;
- (BMProactiveHarvestingMessages)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21;
- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33;
- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33 messageEffect:(id)a34 isKnownSender:(id)a35 conversationUUID:(id)a36;
- (BMProactiveHarvestingNamedHandle)fromHandle;
- (BOOL)hasIsBusinessChat;
- (BOOL)hasIsFromMe;
- (BOOL)hasIsGroupThread;
- (BOOL)hasIsJunk;
- (BOOL)hasIsKnownSender;
- (BOOL)hasIsNew;
- (BOOL)hasIsPinned;
- (BOOL)hasIsRead;
- (BOOL)hasIsTwoFactorCode;
- (BOOL)hasMessageEffect;
- (BOOL)hasTapbackType;
- (BOOL)isBusinessChat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isGroupThread;
- (BOOL)isJunk;
- (BOOL)isKnownSender;
- (BOOL)isNew;
- (BOOL)isPinned;
- (BOOL)isRead;
- (BOOL)isTwoFactorCode;
- (NSArray)accountHandles;
- (NSArray)toHandles;
- (NSDate)absoluteTimestamp;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)attachmentURL;
- (NSString)author;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)conversationId;
- (NSString)conversationUUID;
- (NSString)description;
- (NSString)domainID;
- (NSString)messageType;
- (NSString)messagesService;
- (NSString)personaId;
- (NSString)recipients;
- (NSString)suggestedNickname;
- (NSString)suggestedPhotoPath;
- (NSString)tapbackAssociatedMessageID;
- (NSString)uniqueID;
- (NSString)url;
- (id)_accountHandlesJSONArray;
- (id)_toHandlesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)messageEffect;
- (int)tapbackType;
- (unsigned)dataVersion;
- (void)setHasIsBusinessChat:(BOOL)a3;
- (void)setHasIsFromMe:(BOOL)a3;
- (void)setHasIsGroupThread:(BOOL)a3;
- (void)setHasIsJunk:(BOOL)a3;
- (void)setHasIsKnownSender:(BOOL)a3;
- (void)setHasIsNew:(BOOL)a3;
- (void)setHasIsPinned:(BOOL)a3;
- (void)setHasIsRead:(BOOL)a3;
- (void)setHasIsTwoFactorCode:(BOOL)a3;
- (void)setHasMessageEffect:(BOOL)a3;
- (void)setHasTapbackType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingMessages

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_domainID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void)setHasIsKnownSender:(BOOL)a3
{
  self->_hasIsKnownSender = a3;
}

- (BOOL)hasIsKnownSender
{
  return self->_hasIsKnownSender;
}

- (BOOL)isKnownSender
{
  return self->_isKnownSender;
}

- (void)setHasMessageEffect:(BOOL)a3
{
  self->_hasMessageEffect = a3;
}

- (BOOL)hasMessageEffect
{
  return self->_hasMessageEffect;
}

- (int)messageEffect
{
  return self->_messageEffect;
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setHasTapbackType:(BOOL)a3
{
  self->_hasTapbackType = a3;
}

- (BOOL)hasTapbackType
{
  return self->_hasTapbackType;
}

- (int)tapbackType
{
  return self->_tapbackType;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (void)setHasIsBusinessChat:(BOOL)a3
{
  self->_hasIsBusinessChat = a3;
}

- (BOOL)hasIsBusinessChat
{
  return self->_hasIsBusinessChat;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (void)setHasIsPinned:(BOOL)a3
{
  self->_hasIsPinned = a3;
}

- (BOOL)hasIsPinned
{
  return self->_hasIsPinned;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (void)setHasIsRead:(BOOL)a3
{
  self->_hasIsRead = a3;
}

- (BOOL)hasIsRead
{
  return self->_hasIsRead;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setHasIsJunk:(BOOL)a3
{
  self->_hasIsJunk = a3;
}

- (BOOL)hasIsJunk
{
  return self->_hasIsJunk;
}

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (void)setHasIsGroupThread:(BOOL)a3
{
  self->_hasIsGroupThread = a3;
}

- (BOOL)hasIsGroupThread
{
  return self->_hasIsGroupThread;
}

- (BOOL)isGroupThread
{
  return self->_isGroupThread;
}

- (void)setHasIsFromMe:(BOOL)a3
{
  self->_hasIsFromMe = a3;
}

- (BOOL)hasIsFromMe
{
  return self->_hasIsFromMe;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  self->_hasIsTwoFactorCode = a3;
}

- (BOOL)hasIsTwoFactorCode
{
  return self->_hasIsTwoFactorCode;
}

- (BOOL)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (void)setHasIsNew:(BOOL)a3
{
  self->_hasIsNew = a3;
}

- (BOOL)hasIsNew
{
  return self->_hasIsNew;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)url
{
  return self->_url;
}

- (BMProactiveHarvestingContentAttachment)attachment
{
  return self->_attachment;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSArray)toHandles
{
  return self->_toHandles;
}

- (BMProactiveHarvestingNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (NSString)content
{
  return self->_content;
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (NSString)recipients
{
  return self->_recipients;
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMProactiveHarvestingMessages *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingMessages *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_146;
      }
    }
    v13 = [(BMProactiveHarvestingMessages *)self domainID];
    uint64_t v14 = [v5 domainID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingMessages *)self domainID];
      v17 = [v5 domainID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_146;
      }
    }
    v19 = [(BMProactiveHarvestingMessages *)self absoluteTimestamp];
    uint64_t v20 = [v5 absoluteTimestamp];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingMessages *)self absoluteTimestamp];
      v23 = [v5 absoluteTimestamp];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_146;
      }
    }
    v25 = [(BMProactiveHarvestingMessages *)self conversationId];
    uint64_t v26 = [v5 conversationId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingMessages *)self conversationId];
      v29 = [v5 conversationId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_146;
      }
    }
    v31 = [(BMProactiveHarvestingMessages *)self author];
    uint64_t v32 = [v5 author];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMProactiveHarvestingMessages *)self author];
      v35 = [v5 author];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_146;
      }
    }
    v37 = [(BMProactiveHarvestingMessages *)self suggestedNickname];
    uint64_t v38 = [v5 suggestedNickname];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMProactiveHarvestingMessages *)self suggestedNickname];
      v41 = [v5 suggestedNickname];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_146;
      }
    }
    v43 = [(BMProactiveHarvestingMessages *)self suggestedPhotoPath];
    uint64_t v44 = [v5 suggestedPhotoPath];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMProactiveHarvestingMessages *)self suggestedPhotoPath];
      v47 = [v5 suggestedPhotoPath];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_146;
      }
    }
    v49 = [(BMProactiveHarvestingMessages *)self recipients];
    uint64_t v50 = [v5 recipients];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMProactiveHarvestingMessages *)self recipients];
      v53 = [v5 recipients];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_146;
      }
    }
    v55 = [(BMProactiveHarvestingMessages *)self attachmentURL];
    uint64_t v56 = [v5 attachmentURL];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMProactiveHarvestingMessages *)self attachmentURL];
      v59 = [v5 attachmentURL];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_146;
      }
    }
    v61 = [(BMProactiveHarvestingMessages *)self content];
    uint64_t v62 = [v5 content];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMProactiveHarvestingMessages *)self content];
      v65 = [v5 content];
      int v66 = [v64 isEqual:v65];

      if (!v66) {
        goto LABEL_146;
      }
    }
    v67 = [(BMProactiveHarvestingMessages *)self fromHandle];
    uint64_t v68 = [v5 fromHandle];
    if (v67 == (void *)v68)
    {
    }
    else
    {
      v69 = (void *)v68;
      v70 = [(BMProactiveHarvestingMessages *)self fromHandle];
      v71 = [v5 fromHandle];
      int v72 = [v70 isEqual:v71];

      if (!v72) {
        goto LABEL_146;
      }
    }
    v73 = [(BMProactiveHarvestingMessages *)self toHandles];
    uint64_t v74 = [v5 toHandles];
    if (v73 == (void *)v74)
    {
    }
    else
    {
      v75 = (void *)v74;
      v76 = [(BMProactiveHarvestingMessages *)self toHandles];
      v77 = [v5 toHandles];
      int v78 = [v76 isEqual:v77];

      if (!v78) {
        goto LABEL_146;
      }
    }
    v79 = [(BMProactiveHarvestingMessages *)self accountIdentifier];
    uint64_t v80 = [v5 accountIdentifier];
    if (v79 == (void *)v80)
    {
    }
    else
    {
      v81 = (void *)v80;
      v82 = [(BMProactiveHarvestingMessages *)self accountIdentifier];
      v83 = [v5 accountIdentifier];
      int v84 = [v82 isEqual:v83];

      if (!v84) {
        goto LABEL_146;
      }
    }
    v85 = [(BMProactiveHarvestingMessages *)self accountType];
    uint64_t v86 = [v5 accountType];
    if (v85 == (void *)v86)
    {
    }
    else
    {
      v87 = (void *)v86;
      v88 = [(BMProactiveHarvestingMessages *)self accountType];
      v89 = [v5 accountType];
      int v90 = [v88 isEqual:v89];

      if (!v90) {
        goto LABEL_146;
      }
    }
    v91 = [(BMProactiveHarvestingMessages *)self accountHandles];
    uint64_t v92 = [v5 accountHandles];
    if (v91 == (void *)v92)
    {
    }
    else
    {
      v93 = (void *)v92;
      v94 = [(BMProactiveHarvestingMessages *)self accountHandles];
      v95 = [v5 accountHandles];
      int v96 = [v94 isEqual:v95];

      if (!v96) {
        goto LABEL_146;
      }
    }
    v97 = [(BMProactiveHarvestingMessages *)self attachment];
    uint64_t v98 = [v5 attachment];
    if (v97 == (void *)v98)
    {
    }
    else
    {
      v99 = (void *)v98;
      v100 = [(BMProactiveHarvestingMessages *)self attachment];
      v101 = [v5 attachment];
      int v102 = [v100 isEqual:v101];

      if (!v102) {
        goto LABEL_146;
      }
    }
    v103 = [(BMProactiveHarvestingMessages *)self url];
    uint64_t v104 = [v5 url];
    if (v103 == (void *)v104)
    {
    }
    else
    {
      v105 = (void *)v104;
      v106 = [(BMProactiveHarvestingMessages *)self url];
      v107 = [v5 url];
      int v108 = [v106 isEqual:v107];

      if (!v108) {
        goto LABEL_146;
      }
    }
    v109 = [(BMProactiveHarvestingMessages *)self contentProtection];
    uint64_t v110 = [v5 contentProtection];
    if (v109 == (void *)v110)
    {
    }
    else
    {
      v111 = (void *)v110;
      v112 = [(BMProactiveHarvestingMessages *)self contentProtection];
      v113 = [v5 contentProtection];
      int v114 = [v112 isEqual:v113];

      if (!v114) {
        goto LABEL_146;
      }
    }
    v115 = [(BMProactiveHarvestingMessages *)self personaId];
    uint64_t v116 = [v5 personaId];
    if (v115 == (void *)v116)
    {
    }
    else
    {
      v117 = (void *)v116;
      v118 = [(BMProactiveHarvestingMessages *)self personaId];
      v119 = [v5 personaId];
      int v120 = [v118 isEqual:v119];

      if (!v120) {
        goto LABEL_146;
      }
    }
    if (-[BMProactiveHarvestingMessages hasIsNew](self, "hasIsNew") || [v5 hasIsNew])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsNew]) {
        goto LABEL_146;
      }
      if (![v5 hasIsNew]) {
        goto LABEL_146;
      }
      int v121 = [(BMProactiveHarvestingMessages *)self isNew];
      if (v121 != [v5 isNew]) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasIsTwoFactorCode]
      || [v5 hasIsTwoFactorCode])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsTwoFactorCode]) {
        goto LABEL_146;
      }
      if (![v5 hasIsTwoFactorCode]) {
        goto LABEL_146;
      }
      int v122 = [(BMProactiveHarvestingMessages *)self isTwoFactorCode];
      if (v122 != [v5 isTwoFactorCode]) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasIsFromMe]
      || [v5 hasIsFromMe])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsFromMe]) {
        goto LABEL_146;
      }
      if (![v5 hasIsFromMe]) {
        goto LABEL_146;
      }
      int v123 = [(BMProactiveHarvestingMessages *)self isFromMe];
      if (v123 != [v5 isFromMe]) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasIsGroupThread]
      || [v5 hasIsGroupThread])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsGroupThread]) {
        goto LABEL_146;
      }
      if (![v5 hasIsGroupThread]) {
        goto LABEL_146;
      }
      int v124 = [(BMProactiveHarvestingMessages *)self isGroupThread];
      if (v124 != [v5 isGroupThread]) {
        goto LABEL_146;
      }
    }
    if (-[BMProactiveHarvestingMessages hasIsJunk](self, "hasIsJunk") || [v5 hasIsJunk])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsJunk]) {
        goto LABEL_146;
      }
      if (![v5 hasIsJunk]) {
        goto LABEL_146;
      }
      int v125 = [(BMProactiveHarvestingMessages *)self isJunk];
      if (v125 != [v5 isJunk]) {
        goto LABEL_146;
      }
    }
    if (-[BMProactiveHarvestingMessages hasIsRead](self, "hasIsRead") || [v5 hasIsRead])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsRead]) {
        goto LABEL_146;
      }
      if (![v5 hasIsRead]) {
        goto LABEL_146;
      }
      int v126 = [(BMProactiveHarvestingMessages *)self isRead];
      if (v126 != [v5 isRead]) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasIsPinned]
      || [v5 hasIsPinned])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsPinned]) {
        goto LABEL_146;
      }
      if (![v5 hasIsPinned]) {
        goto LABEL_146;
      }
      int v127 = [(BMProactiveHarvestingMessages *)self isPinned];
      if (v127 != [v5 isPinned]) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasIsBusinessChat]
      || [v5 hasIsBusinessChat])
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsBusinessChat]) {
        goto LABEL_146;
      }
      if (![v5 hasIsBusinessChat]) {
        goto LABEL_146;
      }
      int v128 = [(BMProactiveHarvestingMessages *)self isBusinessChat];
      if (v128 != [v5 isBusinessChat]) {
        goto LABEL_146;
      }
    }
    v129 = [(BMProactiveHarvestingMessages *)self tapbackAssociatedMessageID];
    uint64_t v130 = [v5 tapbackAssociatedMessageID];
    if (v129 == (void *)v130)
    {
    }
    else
    {
      v131 = (void *)v130;
      v132 = [(BMProactiveHarvestingMessages *)self tapbackAssociatedMessageID];
      v133 = [v5 tapbackAssociatedMessageID];
      int v134 = [v132 isEqual:v133];

      if (!v134) {
        goto LABEL_146;
      }
    }
    if ([(BMProactiveHarvestingMessages *)self hasTapbackType]
      || [v5 hasTapbackType])
    {
      if (![(BMProactiveHarvestingMessages *)self hasTapbackType]) {
        goto LABEL_146;
      }
      if (![v5 hasTapbackType]) {
        goto LABEL_146;
      }
      int v135 = [(BMProactiveHarvestingMessages *)self tapbackType];
      if (v135 != [v5 tapbackType]) {
        goto LABEL_146;
      }
    }
    v136 = [(BMProactiveHarvestingMessages *)self messageType];
    uint64_t v137 = [v5 messageType];
    if (v136 == (void *)v137)
    {
    }
    else
    {
      v138 = (void *)v137;
      v139 = [(BMProactiveHarvestingMessages *)self messageType];
      v140 = [v5 messageType];
      int v141 = [v139 isEqual:v140];

      if (!v141) {
        goto LABEL_146;
      }
    }
    v142 = [(BMProactiveHarvestingMessages *)self messagesService];
    uint64_t v143 = [v5 messagesService];
    if (v142 == (void *)v143)
    {
    }
    else
    {
      v144 = (void *)v143;
      v145 = [(BMProactiveHarvestingMessages *)self messagesService];
      v146 = [v5 messagesService];
      int v147 = [v145 isEqual:v146];

      if (!v147) {
        goto LABEL_146;
      }
    }
    if (![(BMProactiveHarvestingMessages *)self hasMessageEffect]
      && ![v5 hasMessageEffect]
      || [(BMProactiveHarvestingMessages *)self hasMessageEffect]
      && [v5 hasMessageEffect]
      && (int v148 = [(BMProactiveHarvestingMessages *)self messageEffect],
          v148 == [v5 messageEffect]))
    {
      if (![(BMProactiveHarvestingMessages *)self hasIsKnownSender]
        && ![v5 hasIsKnownSender]
        || [(BMProactiveHarvestingMessages *)self hasIsKnownSender]
        && [v5 hasIsKnownSender]
        && (int v149 = [(BMProactiveHarvestingMessages *)self isKnownSender],
            v149 == [v5 isKnownSender]))
      {
        v151 = [(BMProactiveHarvestingMessages *)self conversationUUID];
        v152 = [v5 conversationUUID];
        if (v151 == v152)
        {
          char v12 = 1;
        }
        else
        {
          v153 = [(BMProactiveHarvestingMessages *)self conversationUUID];
          v154 = [v5 conversationUUID];
          char v12 = [v153 isEqual:v154];
        }
        goto LABEL_147;
      }
    }
LABEL_146:
    char v12 = 0;
LABEL_147:

    goto LABEL_148;
  }
  char v12 = 0;
LABEL_148:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v114[34] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMProactiveHarvestingMessages *)self uniqueID];
  uint64_t v4 = [(BMProactiveHarvestingMessages *)self domainID];
  id v5 = [(BMProactiveHarvestingMessages *)self absoluteTimestamp];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMProactiveHarvestingMessages *)self absoluteTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    objc_msgSend(v6, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = [(BMProactiveHarvestingMessages *)self conversationId];
  uint64_t v10 = [(BMProactiveHarvestingMessages *)self author];
  uint64_t v11 = [(BMProactiveHarvestingMessages *)self suggestedNickname];
  uint64_t v12 = [(BMProactiveHarvestingMessages *)self suggestedPhotoPath];
  v112 = [(BMProactiveHarvestingMessages *)self recipients];
  v111 = [(BMProactiveHarvestingMessages *)self attachmentURL];
  uint64_t v110 = [(BMProactiveHarvestingMessages *)self content];
  v13 = [(BMProactiveHarvestingMessages *)self fromHandle];
  v109 = [v13 jsonDictionary];

  int v108 = [(BMProactiveHarvestingMessages *)self _toHandlesJSONArray];
  v107 = [(BMProactiveHarvestingMessages *)self accountIdentifier];
  v106 = [(BMProactiveHarvestingMessages *)self accountType];
  v105 = [(BMProactiveHarvestingMessages *)self _accountHandlesJSONArray];
  uint64_t v14 = [(BMProactiveHarvestingMessages *)self attachment];
  uint64_t v104 = [v14 jsonDictionary];

  v103 = [(BMProactiveHarvestingMessages *)self url];
  int v102 = [(BMProactiveHarvestingMessages *)self contentProtection];
  v101 = [(BMProactiveHarvestingMessages *)self personaId];
  if ([(BMProactiveHarvestingMessages *)self hasIsNew])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isNew](self, "isNew"));
    id v100 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v100 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsTwoFactorCode])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isTwoFactorCode](self, "isTwoFactorCode"));
    id v99 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v99 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsFromMe])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isFromMe](self, "isFromMe"));
    id v98 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v98 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsGroupThread])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isGroupThread](self, "isGroupThread"));
    id v97 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v97 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsJunk])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isJunk](self, "isJunk"));
    id v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v96 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsRead])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isRead](self, "isRead"));
    id v95 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v95 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsPinned])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isPinned](self, "isPinned"));
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v94 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsBusinessChat])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isBusinessChat](self, "isBusinessChat"));
    id v93 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v93 = 0;
  }
  uint64_t v92 = [(BMProactiveHarvestingMessages *)self tapbackAssociatedMessageID];
  if ([(BMProactiveHarvestingMessages *)self hasTapbackType])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMessages tapbackType](self, "tapbackType"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  int v90 = [(BMProactiveHarvestingMessages *)self messageType];
  v89 = [(BMProactiveHarvestingMessages *)self messagesService];
  if ([(BMProactiveHarvestingMessages *)self hasMessageEffect])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMessages messageEffect](self, "messageEffect"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if ([(BMProactiveHarvestingMessages *)self hasIsKnownSender])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isKnownSender](self, "isKnownSender"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  uint64_t v86 = [(BMProactiveHarvestingMessages *)self conversationUUID];
  v113[0] = @"uniqueID";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)v15;
  v114[0] = v15;
  v113[1] = @"domainID";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v16;
  v114[1] = v16;
  v113[2] = @"absoluteTimestamp";
  uint64_t v17 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v74 = (void *)v17;
  v114[2] = v17;
  v113[3] = @"conversationId";
  uint64_t v18 = v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v18;
  v114[3] = v18;
  v113[4] = @"author";
  uint64_t v19 = v10;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v72 = (void *)v19;
  v114[4] = v19;
  v113[5] = @"suggestedNickname";
  uint64_t v20 = v11;
  if (!v11)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v20;
  v114[5] = v20;
  v113[6] = @"suggestedPhotoPath";
  uint64_t v21 = v12;
  if (!v12)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v21;
  v114[6] = v21;
  v113[7] = @"recipients";
  uint64_t v22 = (uint64_t)v112;
  if (!v112)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v114[7] = v22;
  v113[8] = @"attachmentURL";
  v23 = v111;
  if (!v111)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v114[8] = v23;
  v113[9] = @"content";
  uint64_t v24 = (uint64_t)v110;
  if (!v110)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v68 = (void *)v24;
  v114[9] = v24;
  v113[10] = @"fromHandle";
  uint64_t v25 = (uint64_t)v109;
  if (!v109)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v80 = (void *)v25;
  v114[10] = v25;
  v113[11] = @"toHandles";
  uint64_t v26 = (uint64_t)v108;
  if (!v108)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)v26;
  v114[11] = v26;
  v113[12] = @"accountIdentifier";
  uint64_t v27 = (uint64_t)v107;
  if (!v107)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v27;
  v114[12] = v27;
  v113[13] = @"accountType";
  uint64_t v29 = (uint64_t)v106;
  if (!v106)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v29;
  v114[13] = v29;
  v113[14] = @"accountHandles";
  uint64_t v30 = (uint64_t)v105;
  if (!v105)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  int v66 = (void *)v30;
  v114[14] = v30;
  v113[15] = @"attachment";
  uint64_t v31 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v31;
  v114[15] = v31;
  v113[16] = @"url";
  uint64_t v32 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = (void *)v32;
  v114[16] = v32;
  v113[17] = @"contentProtection";
  uint64_t v33 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v33;
  v114[17] = v33;
  v113[18] = @"personaId";
  uint64_t v34 = (uint64_t)v101;
  if (!v101)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v62 = (void *)v34;
  v114[18] = v34;
  v113[19] = @"isNew";
  uint64_t v35 = (uint64_t)v100;
  if (!v100)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v35;
  v114[19] = v35;
  v113[20] = @"isTwoFactorCode";
  uint64_t v36 = (uint64_t)v99;
  if (!v99)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  int v60 = (void *)v36;
  v114[20] = v36;
  v113[21] = @"isFromMe";
  uint64_t v37 = (uint64_t)v98;
  if (!v98)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v37;
  v114[21] = v37;
  v113[22] = @"isGroupThread";
  uint64_t v38 = (uint64_t)v97;
  if (!v97)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v38;
  v114[22] = v38;
  v113[23] = @"isJunk";
  uint64_t v39 = (uint64_t)v96;
  if (!v96)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v39;
  v114[23] = v39;
  v113[24] = @"isRead";
  uint64_t v40 = (uint64_t)v95;
  if (!v95)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)v3;
  uint64_t v56 = (void *)v40;
  v114[24] = v40;
  v113[25] = @"isPinned";
  uint64_t v41 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)v10;
  v83 = (void *)v9;
  int v84 = v8;
  v55 = (void *)v41;
  v114[25] = v41;
  v113[26] = @"isBusinessChat";
  uint64_t v42 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v53 = v42;
  v114[26] = v42;
  v113[27] = @"tapbackAssociatedMessageID";
  v43 = v92;
  if (!v92)
  {
    v43 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v42, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68);
  }
  v81 = (void *)v4;
  v114[27] = v43;
  v113[28] = @"tapbackType";
  uint64_t v44 = v91;
  if (!v91)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  int v78 = (void *)v11;
  v114[28] = v44;
  v113[29] = @"messageType";
  v45 = v90;
  if (!v90)
  {
    v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v22;
  v114[29] = v45;
  v113[30] = @"messagesService";
  v46 = v89;
  if (!v89)
  {
    v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v12;
  v114[30] = v46;
  v113[31] = @"messageEffect";
  int v48 = v88;
  if (!v88)
  {
    int v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v114[31] = v48;
  v113[32] = @"isKnownSender";
  v49 = v87;
  if (!v87)
  {
    v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v114[32] = v49;
  v113[33] = @"conversationUUID";
  uint64_t v50 = v86;
  if (!v86)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v114[33] = v50;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v114, v113, 34, v53);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  if (!v86) {

  }
  v51 = v28;
  if (!v87)
  {

    v51 = v28;
  }
  if (!v88)
  {

    v51 = v28;
  }
  if (!v89)
  {

    v51 = v28;
  }
  if (!v90)
  {

    v51 = v28;
  }
  if (!v91)
  {

    v51 = v28;
  }
  if (!v92)
  {

    v51 = v28;
  }
  if (!v93)
  {

    v51 = v28;
  }
  if (!v94)
  {

    v51 = v28;
  }
  if (!v95)
  {

    v51 = v28;
  }
  if (!v96)
  {

    v51 = v28;
  }
  if (!v97)
  {

    v51 = v28;
  }
  if (!v98)
  {

    v51 = v28;
  }
  if (!v99)
  {

    v51 = v28;
  }
  if (!v100)
  {

    v51 = v28;
  }
  if (!v101)
  {

    v51 = v28;
  }
  if (!v102)
  {

    v51 = v28;
  }
  if (!v103)
  {

    v51 = v28;
  }
  if (!v104)
  {

    v51 = v28;
  }
  if (!v105)
  {

    v51 = v28;
  }
  if (!v106)
  {

    v51 = v28;
  }
  if (!v107) {

  }
  if (!v108) {
  if (!v109)
  }

  if (!v110) {
  if (!v111)
  }

  if (v112)
  {
    if (v47) {
      goto LABEL_159;
    }
  }
  else
  {

    if (v47)
    {
LABEL_159:
      if (v78) {
        goto LABEL_160;
      }
      goto LABEL_170;
    }
  }

  if (v78)
  {
LABEL_160:
    if (v82) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:

  if (v82)
  {
LABEL_161:
    if (v83) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v83)
  {
LABEL_162:
    if (v84) {
      goto LABEL_163;
    }
    goto LABEL_173;
  }
LABEL_172:

  if (v84)
  {
LABEL_163:
    if (v81) {
      goto LABEL_164;
    }
LABEL_174:

    if (v85) {
      goto LABEL_165;
    }
    goto LABEL_175;
  }
LABEL_173:

  if (!v81) {
    goto LABEL_174;
  }
LABEL_164:
  if (v85) {
    goto LABEL_165;
  }
LABEL_175:

LABEL_165:

  return v77;
}

- (id)_accountHandlesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMessages *)self accountHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_toHandlesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMProactiveHarvestingMessages *)self toHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMProactiveHarvestingMessages)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v422[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v14 = *MEMORY[0x1E4F502C8];
        uint64_t v421 = *MEMORY[0x1E4F28568];
        uint64_t v15 = v6;
        id v16 = [NSString alloc];
        uint64_t v246 = objc_opt_class();
        uint64_t v17 = v16;
        uint64_t v6 = v15;
        uint64_t v18 = (void *)[v17 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v246, @"uniqueID"];
        v422[0] = v18;
        v331 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v422 forKeys:&v421 count:1];
        id v19 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2);
        id v332 = 0;
        uint64_t v20 = 0;
        *a4 = v19;
        goto LABEL_376;
      }
      id v332 = 0;
      uint64_t v20 = 0;
      goto LABEL_377;
    }
    id v332 = v6;
  }
  else
  {
    id v332 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"domainID"];
  v331 = (void *)v7;
  if (v7 && (id v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v419 = *MEMORY[0x1E4F28568];
        v23 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"domainID"];
        v420 = v23;
        v330 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v420 forKeys:&v419 count:1];
        id v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2);
        uint64_t v18 = 0;
        uint64_t v20 = 0;
        *a4 = v24;
        goto LABEL_375;
      }
      uint64_t v18 = 0;
      uint64_t v20 = 0;
      goto LABEL_376;
    }
    id v328 = v8;
  }
  else
  {
    id v328 = 0;
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  v330 = (void *)v9;
  if (!v9 || (long long v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v327 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    id v12 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v11 doubleValue];
    v327 = (id *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
LABEL_22:

    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    id v25 = v10;
    v327 = [v11 dateFromString:v25];

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = a4;
    if (a4)
    {
      id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v97 = *MEMORY[0x1E4F502C8];
      uint64_t v417 = *MEMORY[0x1E4F28568];
      int v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v418 = v48;
      v329 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v418 forKeys:&v417 count:1];
      id v98 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v97, 2);
      v23 = 0;
      uint64_t v20 = 0;
      *a4 = v98;
      uint64_t v18 = v328;
      goto LABEL_374;
    }
    uint64_t v20 = 0;
    uint64_t v18 = v328;
    goto LABEL_375;
  }
  v327 = v10;
LABEL_23:
  uint64_t v26 = [v5 objectForKeyedSubscript:@"conversationId"];
  v329 = (void *)v26;
  if (v26 && (uint64_t v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v415 = *MEMORY[0x1E4F28568];
        id v325 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationId"];
        id v416 = v325;
        v326 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v416 forKeys:&v415 count:1];
        id v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
        int v48 = 0;
        uint64_t v20 = 0;
        *a4 = v47;
        uint64_t v18 = v328;
        v23 = v327;
        goto LABEL_373;
      }
      int v48 = 0;
      uint64_t v20 = 0;
      uint64_t v18 = v328;
      v23 = v327;
      goto LABEL_374;
    }
    id v324 = v27;
  }
  else
  {
    id v324 = 0;
  }
  uint64_t v28 = [v5 objectForKeyedSubscript:@"author"];
  v326 = (void *)v28;
  if (v28 && (uint64_t v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v325 = 0;
        uint64_t v20 = 0;
        uint64_t v18 = v328;
        v23 = v327;
        int v48 = v324;
        goto LABEL_373;
      }
      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v50 = *MEMORY[0x1E4F502C8];
      uint64_t v413 = *MEMORY[0x1E4F28568];
      id v321 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"author"];
      id v414 = v321;
      v323 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v414 forKeys:&v413 count:1];
      id v51 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v50, 2);
      id v325 = 0;
      uint64_t v20 = 0;
      *a4 = v51;
      goto LABEL_114;
    }
    id v325 = v29;
  }
  else
  {
    id v325 = 0;
  }
  uint64_t v30 = [v5 objectForKeyedSubscript:@"suggestedNickname"];
  v323 = (void *)v30;
  if (v30)
  {
    uint64_t v31 = (void *)v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v321 = v31;
        goto LABEL_32;
      }
      if (a4)
      {
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v70 = *MEMORY[0x1E4F502C8];
        uint64_t v411 = *MEMORY[0x1E4F28568];
        id v318 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestedNickname"];
        id v412 = v318;
        v319 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v412 forKeys:&v411 count:1];
        id v71 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v70, 2);
        id v321 = 0;
        uint64_t v20 = 0;
        *a4 = v71;
        goto LABEL_129;
      }
      id v321 = 0;
      uint64_t v20 = 0;
LABEL_114:
      uint64_t v18 = v328;
      v23 = v327;
      int v48 = v324;
      goto LABEL_372;
    }
  }
  id v321 = 0;
LABEL_32:
  uint64_t v32 = [v5 objectForKeyedSubscript:@"suggestedPhotoPath"];
  v319 = (void *)v32;
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v318 = v33;
        goto LABEL_35;
      }
      if (a4)
      {
        id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v76 = *MEMORY[0x1E4F502C8];
        uint64_t v409 = *MEMORY[0x1E4F28568];
        id v316 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestedPhotoPath"];
        id v410 = v316;
        v317 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v410 forKeys:&v409 count:1];
        id v77 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2);
        id v318 = 0;
        uint64_t v20 = 0;
        *a4 = v77;
        goto LABEL_132;
      }
      id v318 = 0;
      uint64_t v20 = 0;
LABEL_129:
      uint64_t v18 = v328;
      v23 = v327;
      int v48 = v324;
      goto LABEL_371;
    }
  }
  id v318 = 0;
LABEL_35:
  uint64_t v34 = [v5 objectForKeyedSubscript:@"recipients"];
  v317 = (void *)v34;
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v316 = v35;
        goto LABEL_38;
      }
      if (a4)
      {
        id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v79 = *MEMORY[0x1E4F502C8];
        uint64_t v407 = *MEMORY[0x1E4F28568];
        id v314 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recipients"];
        id v408 = v314;
        v315 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v408 forKeys:&v407 count:1];
        id v80 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
        id v316 = 0;
        uint64_t v20 = 0;
        *a4 = v80;
        goto LABEL_153;
      }
      id v316 = 0;
      uint64_t v20 = 0;
LABEL_132:
      uint64_t v18 = v328;
      v23 = v327;
      int v48 = v324;
      goto LABEL_370;
    }
  }
  id v316 = 0;
LABEL_38:
  uint64_t v36 = [v5 objectForKeyedSubscript:@"attachmentURL"];
  v315 = (void *)v36;
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v314 = v37;
        goto LABEL_41;
      }
      if (a4)
      {
        id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v82 = *MEMORY[0x1E4F502C8];
        uint64_t v405 = *MEMORY[0x1E4F28568];
        id v312 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"attachmentURL"];
        id v406 = v312;
        v313 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v406 forKeys:&v405 count:1];
        id v83 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2);
        id v314 = 0;
        uint64_t v20 = 0;
        *a4 = v83;
        goto LABEL_157;
      }
      id v314 = 0;
      uint64_t v20 = 0;
LABEL_153:
      uint64_t v18 = v328;
      v23 = v327;
      int v48 = v324;
      goto LABEL_369;
    }
  }
  id v314 = 0;
LABEL_41:
  uint64_t v38 = [v5 objectForKeyedSubscript:@"content"];
  v311 = self;
  v313 = (void *)v38;
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v312 = v39;
        goto LABEL_44;
      }
      if (a4)
      {
        id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v85 = *MEMORY[0x1E4F502C8];
        uint64_t v403 = *MEMORY[0x1E4F28568];
        id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"content"];
        id v404 = v72;
        uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v404 forKeys:&v403 count:1];
        id v86 = (id)[v84 initWithDomain:v85 code:2 userInfo:v41];
        id v312 = 0;
        uint64_t v20 = 0;
        *a4 = v86;
        goto LABEL_112;
      }
      id v312 = 0;
      uint64_t v20 = 0;
LABEL_157:
      uint64_t v18 = v328;
      v23 = v327;
      int v48 = v324;
      goto LABEL_368;
    }
  }
  id v312 = 0;
LABEL_44:
  uint64_t v40 = [v5 objectForKeyedSubscript:@"fromHandle"];
  if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v306 = v40;
    uint64_t v41 = 0;
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      uint64_t v20 = 0;
      uint64_t v18 = v328;
      v23 = v327;
      id v72 = v40;
      goto LABEL_367;
    }
    id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v88 = *MEMORY[0x1E4F502C8];
    uint64_t v401 = *MEMORY[0x1E4F28568];
    uint64_t v41 = (BMProactiveHarvestingNamedHandle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"fromHandle"];
    v402 = v41;
    v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v402 forKeys:&v401 count:1];
    *a4 = (id)[v87 initWithDomain:v88 code:2 userInfo:v89];

    uint64_t v20 = 0;
    id v72 = v40;
LABEL_112:
    uint64_t v18 = v328;
    v23 = v327;
    goto LABEL_366;
  }
  id v72 = v40;
  id v344 = 0;
  uint64_t v41 = [[BMProactiveHarvestingNamedHandle alloc] initWithJSONDictionary:v72 error:&v344];
  id v73 = v344;
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v18 = v328;
    v23 = v327;
    if (a4) {
      *a4 = v73;
    }

    uint64_t v20 = 0;
    goto LABEL_366;
  }
  v306 = v40;

LABEL_47:
  uint64_t v42 = [v5 objectForKeyedSubscript:@"toHandles"];
  v43 = [MEMORY[0x1E4F1CA98] null];
  int v44 = [v42 isEqual:v43];

  v307 = v6;
  v305 = v41;
  if (v44)
  {

LABEL_68:
    v52 = 0;
    goto LABEL_69;
  }
  if (!v42) {
    goto LABEL_68;
  }
  objc_opt_class();
  obuint64_t j = v42;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v100 = *MEMORY[0x1E4F502C8];
      uint64_t v399 = *MEMORY[0x1E4F28568];
      v322 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"toHandles"];
      v400 = v322;
      uint64_t v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v400 forKeys:&v399 count:1];
      uint64_t v102 = v100;
      v103 = (void *)v101;
      uint64_t v20 = 0;
      *a4 = (id)[v99 initWithDomain:v102 code:2 userInfo:v101];
      uint64_t v18 = v328;
      v23 = v327;
      goto LABEL_364;
    }
    uint64_t v20 = 0;
    uint64_t v18 = v328;
    v23 = v327;
    goto LABEL_365;
  }
  v52 = v42;
LABEL_69:
  v322 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v52, "count"));
  long long v340 = 0u;
  long long v341 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  obuint64_t j = v52;
  uint64_t v53 = [obj countByEnumeratingWithState:&v340 objects:v398 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v341;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v341 != v55) {
          objc_enumerationMutation(obj);
        }
        v57 = *(void **)(*((void *)&v340 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v90 = a4;
          if (a4)
          {
            id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v92 = *MEMORY[0x1E4F502C8];
            uint64_t v396 = *MEMORY[0x1E4F28568];
            id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"toHandles"];
            id v397 = v58;
            id v93 = (void *)MEMORY[0x1E4F1C9E8];
            id v94 = &v397;
            id v95 = &v396;
            goto LABEL_121;
          }
LABEL_130:
          uint64_t v20 = 0;
          v103 = obj;
          uint64_t v6 = v307;
          uint64_t v18 = v328;
          v23 = v327;
          uint64_t v41 = v305;
          goto LABEL_364;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v90 = a4;
          if (!a4) {
            goto LABEL_130;
          }
          id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v92 = *MEMORY[0x1E4F502C8];
          uint64_t v394 = *MEMORY[0x1E4F28568];
          id v58 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"toHandles"];
          id v395 = v58;
          id v93 = (void *)MEMORY[0x1E4F1C9E8];
          id v94 = &v395;
          id v95 = &v394;
LABEL_121:
          id v65 = [v93 dictionaryWithObjects:v94 forKeys:v95 count:1];
          uint64_t v20 = 0;
          *int v90 = (id)[v91 initWithDomain:v92 code:2 userInfo:v65];
LABEL_125:
          id v303 = obj;
          uint64_t v6 = v307;
          uint64_t v18 = v328;
          v23 = v327;
          uint64_t v41 = v305;
          goto LABEL_362;
        }
        id v58 = v57;
        v59 = [BMProactiveHarvestingNamedHandle alloc];
        id v339 = 0;
        int v60 = [(BMProactiveHarvestingNamedHandle *)v59 initWithJSONDictionary:v58 error:&v339];
        id v61 = v339;
        if (v61)
        {
          id v65 = v61;
          if (a4) {
            *a4 = v61;
          }

          uint64_t v20 = 0;
          goto LABEL_125;
        }
        [v322 addObject:v60];
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v340 objects:v398 count:16];
    }
    while (v54);
  }

  id v58 = [v5 objectForKeyedSubscript:@"accountIdentifier"];
  if (v58 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    uint64_t v6 = v307;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v103 = 0;
        uint64_t v20 = 0;
        uint64_t v18 = v328;
        v23 = v327;
        uint64_t v41 = v305;
        goto LABEL_363;
      }
      id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v125 = *MEMORY[0x1E4F502C8];
      uint64_t v392 = *MEMORY[0x1E4F28568];
      id v65 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountIdentifier"];
      id v393 = v65;
      uint64_t v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v393 forKeys:&v392 count:1];
      int v127 = v124;
      v64 = (void *)v126;
      id v303 = 0;
      uint64_t v20 = 0;
      *a4 = (id)[v127 initWithDomain:v125 code:2 userInfo:v126];
LABEL_230:
      uint64_t v18 = v328;
      v23 = v327;
      uint64_t v41 = v305;
      goto LABEL_361;
    }
    id v62 = v58;
  }
  else
  {
    id v62 = 0;
    uint64_t v6 = v307;
  }
  uint64_t v63 = [v5 objectForKeyedSubscript:@"accountType"];
  v310 = (void *)v63;
  id v303 = v62;
  if (!v63 || (v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v65 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v129 = *MEMORY[0x1E4F502C8];
      uint64_t v390 = *MEMORY[0x1E4F28568];
      id v304 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountType"];
      id v391 = v304;
      uint64_t v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v391 forKeys:&v390 count:1];
      uint64_t v131 = v129;
      v64 = v310;
      v309 = (void *)v130;
      id v132 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v131, 2);
      id v65 = 0;
      uint64_t v20 = 0;
      *a4 = v132;
      uint64_t v18 = v328;
      v23 = v327;
      uint64_t v41 = v305;

      goto LABEL_360;
    }
    id v65 = 0;
    uint64_t v20 = 0;
    goto LABEL_230;
  }
  id v65 = v64;
LABEL_85:
  int v66 = [v5 objectForKeyedSubscript:@"accountHandles"];
  v67 = [MEMORY[0x1E4F1CA98] null];
  int v68 = [v66 isEqual:v67];

  if (v68)
  {
  }
  else
  {
    uint64_t v41 = v305;
    if (v66)
    {
      objc_opt_class();
      id v304 = v66;
      v64 = v310;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v20 = 0;
          uint64_t v18 = v328;
          v23 = v327;
          goto LABEL_360;
        }
        id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v134 = *MEMORY[0x1E4F502C8];
        uint64_t v388 = *MEMORY[0x1E4F28568];
        v308 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"accountHandles"];
        v389 = v308;
        v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v389 forKeys:&v388 count:1];
        uint64_t v135 = v134;
        v64 = v310;
        id v136 = (id)[v133 initWithDomain:v135 code:2 userInfo:v112];
        uint64_t v20 = 0;
        *a4 = v136;
LABEL_177:
        uint64_t v18 = v328;
        v23 = v327;
        goto LABEL_358;
      }
      uint64_t v104 = v66;
      goto LABEL_137;
    }
  }
  uint64_t v104 = 0;
  v64 = v310;
LABEL_137:
  v308 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v104, "count"));
  long long v335 = 0u;
  long long v336 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  id v304 = v104;
  uint64_t v105 = [v304 countByEnumeratingWithState:&v335 objects:v387 count:16];
  if (!v105) {
    goto LABEL_146;
  }
  uint64_t v106 = v105;
  uint64_t v107 = *(void *)v336;
  v64 = v310;
  while (2)
  {
    for (uint64_t j = 0; j != v106; ++j)
    {
      if (*(void *)v336 != v107) {
        objc_enumerationMutation(v304);
      }
      v109 = *(void **)(*((void *)&v335 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v116 = *MEMORY[0x1E4F502C8];
          uint64_t v385 = *MEMORY[0x1E4F28568];
          v302 = (BMProactiveHarvestingContentAttachment *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"accountHandles"];
          v386 = v302;
          uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v386 forKeys:&v385 count:1];
          v118 = v115;
          uint64_t v119 = v116;
LABEL_168:
          int v122 = (void *)v117;
          uint64_t v18 = v328;
          v23 = v327;
          uint64_t v20 = 0;
          *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
          id v123 = v304;
          uint64_t v6 = v307;
          goto LABEL_169;
        }
LABEL_172:
        uint64_t v20 = 0;
        v112 = v304;
        uint64_t v6 = v307;
        uint64_t v18 = v328;
        v23 = v327;
        uint64_t v41 = v305;
        v64 = v310;
        goto LABEL_358;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v121 = *MEMORY[0x1E4F502C8];
          uint64_t v383 = *MEMORY[0x1E4F28568];
          v302 = (BMProactiveHarvestingContentAttachment *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountHandles"];
          v384 = v302;
          uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v384 forKeys:&v383 count:1];
          v118 = v120;
          uint64_t v119 = v121;
          goto LABEL_168;
        }
        goto LABEL_172;
      }
      id v110 = v109;
      [v308 addObject:v110];
    }
    uint64_t v106 = [v304 countByEnumeratingWithState:&v335 objects:v387 count:16];
    if (v106) {
      continue;
    }
    break;
  }
LABEL_146:

  uint64_t v111 = [v5 objectForKeyedSubscript:@"attachment"];
  uint64_t v301 = v111;
  if (!v111 || (v112 = (void *)v111, objc_opt_class(), uint64_t v41 = v305, (objc_opt_isKindOfClass() & 1) != 0))
  {
    v302 = 0;
    goto LABEL_149;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = v307;
    if (a4)
    {
      id v300 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v298 = *MEMORY[0x1E4F502C8];
      uint64_t v381 = *MEMORY[0x1E4F28568];
      id v169 = [NSString alloc];
      id v123 = v112;
      uint64_t v247 = objc_opt_class();
      v170 = v169;
      v64 = v310;
      v302 = (BMProactiveHarvestingContentAttachment *)[v170 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v247, @"attachment"];
      v382 = v302;
      int v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
      uint64_t v20 = 0;
      *a4 = (id)[v300 initWithDomain:v298 code:2 userInfo:v122];
      uint64_t v18 = v328;
      v23 = v327;
      goto LABEL_357;
    }
    uint64_t v20 = 0;
    goto LABEL_177;
  }
  id v137 = v112;
  v138 = [BMProactiveHarvestingContentAttachment alloc];
  id v334 = 0;
  v302 = [(BMProactiveHarvestingContentAttachment *)v138 initWithJSONDictionary:v137 error:&v334];
  id v139 = v334;
  uint64_t v6 = v307;
  if (!v139)
  {

LABEL_149:
    uint64_t v113 = [v5 objectForKeyedSubscript:@"url"];
    v299 = (void *)v113;
    if (v113)
    {
      int v114 = (void *)v113;
      objc_opt_class();
      uint64_t v6 = v307;
      if (objc_opt_isKindOfClass())
      {
        id v297 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v123 = (id)v301;
            uint64_t v20 = 0;
            id v297 = 0;
            uint64_t v18 = v328;
            v23 = v327;
LABEL_356:

            int v122 = v297;
            goto LABEL_357;
          }
          id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v172 = *MEMORY[0x1E4F502C8];
          uint64_t v379 = *MEMORY[0x1E4F28568];
          id v173 = [NSString alloc];
          uint64_t v248 = objc_opt_class();
          v174 = v173;
          v64 = v310;
          v294 = (void *)[v174 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v248, @"url"];
          v380 = v294;
          v296 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v380 forKeys:&v379 count:1];
          uint64_t v20 = 0;
          id v297 = 0;
          *a4 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v172, 2);
          uint64_t v18 = v328;
          v23 = v327;
          v142 = (void *)v301;
          goto LABEL_355;
        }
        id v297 = v114;
      }
    }
    else
    {
      id v297 = 0;
      uint64_t v6 = v307;
    }
    uint64_t v141 = [v5 objectForKeyedSubscript:@"contentProtection"];
    v142 = (void *)v301;
    v296 = (void *)v141;
    if (!v141 || (uint64_t v143 = (void *)v141, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v144 = 0;
      goto LABEL_190;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v144 = v143;
LABEL_190:
      v145 = [v5 objectForKeyedSubscript:@"personaId"];
      v294 = v144;
      if (!v145 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v289 = v145;
        id v292 = 0;
        goto LABEL_193;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v289 = v145;
        id v292 = v145;
LABEL_193:
        uint64_t v146 = [v5 objectForKeyedSubscript:@"isNew"];
        v291 = (void *)v146;
        if (!v146 || (int v147 = (void *)v146, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v290 = 0;
          goto LABEL_196;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v290 = v147;
LABEL_196:
          uint64_t v148 = [v5 objectForKeyedSubscript:@"isTwoFactorCode"];
          v288 = (void *)v148;
          if (!v148 || (int v149 = (void *)v148, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v287 = 0;
            goto LABEL_199;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v287 = v149;
LABEL_199:
            uint64_t v150 = [v5 objectForKeyedSubscript:@"isFromMe"];
            v285 = (void *)v150;
            if (!v150 || (v151 = (void *)v150, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v286 = 0;
              goto LABEL_202;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v286 = v151;
LABEL_202:
              uint64_t v152 = [v5 objectForKeyedSubscript:@"isGroupThread"];
              v283 = (void *)v152;
              if (!v152 || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v284 = 0;
                goto LABEL_205;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v284 = v153;
LABEL_205:
                uint64_t v154 = [v5 objectForKeyedSubscript:@"isJunk"];
                v281 = (void *)v154;
                if (!v154 || (v155 = (void *)v154, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v282 = 0;
                  goto LABEL_208;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v282 = v155;
LABEL_208:
                  uint64_t v156 = [v5 objectForKeyedSubscript:@"isRead"];
                  v279 = (void *)v156;
                  if (!v156 || (v157 = (void *)v156, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v280 = 0;
                    goto LABEL_211;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v280 = v157;
LABEL_211:
                    uint64_t v158 = [v5 objectForKeyedSubscript:@"isPinned"];
                    v277 = (void *)v158;
                    if (!v158 || (v159 = (void *)v158, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v278 = 0;
                      goto LABEL_214;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v278 = v159;
LABEL_214:
                      uint64_t v160 = [v5 objectForKeyedSubscript:@"isBusinessChat"];
                      v275 = (void *)v160;
                      if (!v160 || (v161 = (void *)v160, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v276 = 0;
                        goto LABEL_217;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v276 = v161;
LABEL_217:
                        uint64_t v162 = [v5 objectForKeyedSubscript:@"tapbackAssociatedMessageID"];
                        v273 = (void *)v162;
                        if (!v162 || (v163 = (void *)v162, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v274 = 0;
                          goto LABEL_220;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v274 = v163;
LABEL_220:
                          uint64_t v164 = [v5 objectForKeyedSubscript:@"tapbackType"];
                          v271 = (void *)v164;
                          if (!v164 || (v165 = (void *)v164, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v272 = 0;
                            goto LABEL_223;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v272 = v165;
LABEL_223:
                            uint64_t v166 = [v5 objectForKeyedSubscript:@"messageType"];
                            v269 = (void *)v166;
                            if (!v166 || (v167 = (void *)v166, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v270 = 0;
LABEL_226:
                              id v168 = [v5 objectForKeyedSubscript:@"messagesService"];
                              v267 = v168;
                              if (!v168) {
                                goto LABEL_291;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v168 = 0;
                                goto LABEL_291;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v168 = v168;
LABEL_291:
                                v265 = [v5 objectForKeyedSubscript:@"messageEffect"];
                                v266 = v168;
                                if (!v265 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v268 = 0;
                                  goto LABEL_294;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v268 = v265;
LABEL_294:
                                  v263 = [v5 objectForKeyedSubscript:@"isKnownSender"];
                                  if (!v263 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v264 = 0;
LABEL_297:
                                    id v217 = [v5 objectForKeyedSubscript:@"conversationUUID"];
                                    v262 = v217;
                                    if (!v217)
                                    {
LABEL_318:
                                      uint64_t v18 = v328;
                                      v23 = v327;
                                      v261 = v217;
                                      uint64_t v20 = objc_retain(-[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](v311, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", v332, v328, v327, v324, v325, v321, v318, v316, v314, v312, v305,
                                                v322,
                                                v303,
                                                v65,
                                                v308,
                                                v302,
                                                v297,
                                                v144,
                                                v292,
                                                v290,
                                                v287,
                                                v286,
                                                v284,
                                                v282,
                                                v280,
                                                v278,
                                                v276,
                                                v274,
                                                v272,
                                                v270,
                                                v168,
                                                v268,
                                                v264,
                                                v217));
                                      v311 = v20;
LABEL_339:
                                      v142 = (void *)v301;

                                      v145 = v289;
LABEL_340:

LABEL_341:
LABEL_342:

LABEL_343:
LABEL_344:

                                      goto LABEL_345;
                                    }
                                    v218 = v217;
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v217 = 0;
                                      goto LABEL_318;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v217 = v218;
                                      goto LABEL_318;
                                    }
                                    if (a4)
                                    {
                                      id v241 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v242 = *MEMORY[0x1E4F502C8];
                                      uint64_t v345 = *MEMORY[0x1E4F28568];
                                      v243 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"conversationUUID"];
                                      v346 = v243;
                                      v244 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v346 forKeys:&v345 count:1];
                                      *a4 = (id)[v241 initWithDomain:v242 code:2 userInfo:v244];
                                    }
                                    v261 = 0;
                                    uint64_t v20 = 0;
LABEL_338:
                                    uint64_t v18 = v328;
                                    v23 = v327;
                                    v64 = v310;
                                    goto LABEL_339;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v264 = v263;
                                    goto LABEL_297;
                                  }
                                  if (a4)
                                  {
                                    id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v239 = *MEMORY[0x1E4F502C8];
                                    uint64_t v347 = *MEMORY[0x1E4F28568];
                                    v261 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isKnownSender"];
                                    v348 = v261;
                                    v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v348 forKeys:&v347 count:1];
                                    id v240 = (id)objc_msgSend(v238, "initWithDomain:code:userInfo:", v239, 2);
                                    uint64_t v20 = 0;
                                    id v264 = 0;
                                    *a4 = v240;
                                    goto LABEL_338;
                                  }
                                  id v264 = 0;
                                  uint64_t v20 = 0;
LABEL_387:
                                  uint64_t v18 = v328;
                                  v23 = v327;
                                  v64 = v310;
                                  v145 = v289;
                                  v142 = (void *)v301;
                                  goto LABEL_340;
                                }
                                if (a4)
                                {
                                  id v235 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v236 = *MEMORY[0x1E4F502C8];
                                  uint64_t v349 = *MEMORY[0x1E4F28568];
                                  id v264 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"messageEffect"];
                                  id v350 = v264;
                                  v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
                                  id v237 = (id)objc_msgSend(v235, "initWithDomain:code:userInfo:", v236, 2);
                                  uint64_t v20 = 0;
                                  id v268 = 0;
                                  *a4 = v237;
                                  goto LABEL_387;
                                }
                                id v268 = 0;
                                uint64_t v20 = 0;
LABEL_385:
                                uint64_t v18 = v328;
                                v23 = v327;
                                v64 = v310;
                                v145 = v289;
                                v142 = (void *)v301;
                                goto LABEL_341;
                              }
                              if (a4)
                              {
                                id v233 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v234 = *MEMORY[0x1E4F502C8];
                                uint64_t v351 = *MEMORY[0x1E4F28568];
                                id v268 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messagesService"];
                                id v352 = v268;
                                v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v352 forKeys:&v351 count:1];
                                uint64_t v20 = 0;
                                v266 = 0;
                                *a4 = (id)objc_msgSend(v233, "initWithDomain:code:userInfo:", v234, 2);
                                goto LABEL_385;
                              }
                              v266 = 0;
                              uint64_t v20 = 0;
LABEL_383:
                              uint64_t v18 = v328;
                              v23 = v327;
                              v64 = v310;
                              v145 = v289;
                              v142 = (void *)v301;
                              goto LABEL_342;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v270 = v167;
                              goto LABEL_226;
                            }
                            if (a4)
                            {
                              id v231 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v232 = *MEMORY[0x1E4F502C8];
                              uint64_t v353 = *MEMORY[0x1E4F28568];
                              v266 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageType"];
                              v354 = v266;
                              v267 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v354 forKeys:&v353 count:1];
                              uint64_t v20 = 0;
                              id v270 = 0;
                              *a4 = (id)objc_msgSend(v231, "initWithDomain:code:userInfo:", v232, 2);
                              goto LABEL_383;
                            }
                            id v270 = 0;
                            uint64_t v20 = 0;
                            uint64_t v18 = v328;
                            v23 = v327;
                            v64 = v310;
LABEL_381:
                            v145 = v289;
                            v142 = (void *)v301;
                            goto LABEL_343;
                          }
                          if (a4)
                          {
                            id v227 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v228 = *MEMORY[0x1E4F502C8];
                            uint64_t v355 = *MEMORY[0x1E4F28568];
                            id v229 = [NSString alloc];
                            uint64_t v260 = objc_opt_class();
                            v230 = v229;
                            v64 = v310;
                            id v270 = (id)[v230 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v260, @"tapbackType"];
                            id v356 = v270;
                            v269 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v356 forKeys:&v355 count:1];
                            uint64_t v20 = 0;
                            id v272 = 0;
                            *a4 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v228, 2);
                            uint64_t v18 = v328;
                            v23 = v327;
                            goto LABEL_381;
                          }
                          id v272 = 0;
                          uint64_t v20 = 0;
LABEL_379:
                          uint64_t v18 = v328;
                          v23 = v327;
                          v145 = v289;
                          v142 = (void *)v301;
                          goto LABEL_344;
                        }
                        if (a4)
                        {
                          id v223 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v224 = *MEMORY[0x1E4F502C8];
                          uint64_t v357 = *MEMORY[0x1E4F28568];
                          id v225 = [NSString alloc];
                          uint64_t v259 = objc_opt_class();
                          v226 = v225;
                          v64 = v310;
                          id v272 = (id)[v226 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v259, @"tapbackAssociatedMessageID"];
                          id v358 = v272;
                          v271 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v358 forKeys:&v357 count:1];
                          uint64_t v20 = 0;
                          id v274 = 0;
                          *a4 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v224, 2);
                          goto LABEL_379;
                        }
                        id v274 = 0;
                        uint64_t v20 = 0;
LABEL_334:
                        uint64_t v18 = v328;
                        v23 = v327;
                        v145 = v289;
                        v142 = (void *)v301;
LABEL_345:

                        goto LABEL_346;
                      }
                      if (a4)
                      {
                        id v219 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v220 = *MEMORY[0x1E4F502C8];
                        uint64_t v359 = *MEMORY[0x1E4F28568];
                        id v221 = [NSString alloc];
                        uint64_t v258 = objc_opt_class();
                        v222 = v221;
                        v64 = v310;
                        id v274 = (id)[v222 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v258, @"isBusinessChat"];
                        id v360 = v274;
                        v273 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v360 forKeys:&v359 count:1];
                        uint64_t v20 = 0;
                        id v276 = 0;
                        *a4 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v220, 2);
                        goto LABEL_334;
                      }
                      id v276 = 0;
                      uint64_t v20 = 0;
LABEL_330:
                      uint64_t v18 = v328;
                      v23 = v327;
                      v145 = v289;
                      v142 = (void *)v301;
LABEL_346:

                      goto LABEL_347;
                    }
                    if (a4)
                    {
                      id v213 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v214 = *MEMORY[0x1E4F502C8];
                      uint64_t v361 = *MEMORY[0x1E4F28568];
                      id v215 = [NSString alloc];
                      uint64_t v257 = objc_opt_class();
                      v216 = v215;
                      v64 = v310;
                      id v276 = (id)[v216 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v257, @"isPinned"];
                      id v362 = v276;
                      v275 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v362 forKeys:&v361 count:1];
                      uint64_t v20 = 0;
                      id v278 = 0;
                      *a4 = (id)objc_msgSend(v213, "initWithDomain:code:userInfo:", v214, 2);
                      goto LABEL_330;
                    }
                    id v278 = 0;
                    uint64_t v20 = 0;
LABEL_326:
                    uint64_t v18 = v328;
                    v23 = v327;
                    v145 = v289;
                    v142 = (void *)v301;
LABEL_347:

                    v208 = v279;
                    goto LABEL_348;
                  }
                  if (a4)
                  {
                    id v209 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v210 = *MEMORY[0x1E4F502C8];
                    uint64_t v363 = *MEMORY[0x1E4F28568];
                    id v211 = [NSString alloc];
                    uint64_t v256 = objc_opt_class();
                    v212 = v211;
                    v64 = v310;
                    id v278 = (id)[v212 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v256, @"isRead"];
                    id v364 = v278;
                    v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v364 forKeys:&v363 count:1];
                    uint64_t v20 = 0;
                    id v280 = 0;
                    *a4 = (id)objc_msgSend(v209, "initWithDomain:code:userInfo:", v210, 2);
                    goto LABEL_326;
                  }
                  id v280 = 0;
                  uint64_t v20 = 0;
                  uint64_t v18 = v328;
                  v23 = v327;
                  v145 = v289;
                  v208 = v279;
LABEL_322:
                  v142 = (void *)v301;
LABEL_348:

                  v202 = v281;
                  goto LABEL_349;
                }
                if (a4)
                {
                  id v203 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v204 = *MEMORY[0x1E4F502C8];
                  uint64_t v365 = *MEMORY[0x1E4F28568];
                  id v205 = [NSString alloc];
                  uint64_t v255 = objc_opt_class();
                  v206 = v205;
                  v64 = v310;
                  id v280 = (id)[v206 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v255, @"isJunk"];
                  id v366 = v280;
                  uint64_t v207 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v366 forKeys:&v365 count:1];
                  uint64_t v20 = 0;
                  id v282 = 0;
                  *a4 = (id)[v203 initWithDomain:v204 code:2 userInfo:v207];
                  v208 = (void *)v207;
                  uint64_t v18 = v328;
                  v23 = v327;
                  v145 = v289;
                  goto LABEL_322;
                }
                id v282 = 0;
                uint64_t v20 = 0;
                uint64_t v18 = v328;
                v23 = v327;
                v145 = v289;
                v202 = v281;
LABEL_315:
                v142 = (void *)v301;
LABEL_349:

                v196 = v283;
                goto LABEL_350;
              }
              if (a4)
              {
                id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v198 = *MEMORY[0x1E4F502C8];
                uint64_t v367 = *MEMORY[0x1E4F28568];
                id v199 = [NSString alloc];
                uint64_t v254 = objc_opt_class();
                v200 = v199;
                v64 = v310;
                id v282 = (id)[v200 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v254, @"isGroupThread"];
                id v368 = v282;
                uint64_t v201 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v368 forKeys:&v367 count:1];
                uint64_t v20 = 0;
                id v284 = 0;
                *a4 = (id)[v197 initWithDomain:v198 code:2 userInfo:v201];
                v202 = (void *)v201;
                uint64_t v18 = v328;
                v23 = v327;
                v145 = v289;
                goto LABEL_315;
              }
              id v284 = 0;
              uint64_t v20 = 0;
              uint64_t v18 = v328;
              v23 = v327;
              v145 = v289;
              v196 = v283;
LABEL_309:
              v142 = (void *)v301;
LABEL_350:

              goto LABEL_351;
            }
            if (a4)
            {
              id v191 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v192 = *MEMORY[0x1E4F502C8];
              uint64_t v369 = *MEMORY[0x1E4F28568];
              id v193 = [NSString alloc];
              uint64_t v253 = objc_opt_class();
              v194 = v193;
              v64 = v310;
              id v284 = (id)[v194 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v253, @"isFromMe"];
              id v370 = v284;
              uint64_t v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v370 forKeys:&v369 count:1];
              uint64_t v20 = 0;
              id v286 = 0;
              *a4 = (id)[v191 initWithDomain:v192 code:2 userInfo:v195];
              v196 = (void *)v195;
              uint64_t v18 = v328;
              v23 = v327;
              v145 = v289;
              goto LABEL_309;
            }
            id v286 = 0;
            uint64_t v20 = 0;
LABEL_303:
            uint64_t v18 = v328;
            v23 = v327;
            v145 = v289;
            v142 = (void *)v301;
LABEL_351:

            goto LABEL_352;
          }
          if (a4)
          {
            id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v188 = *MEMORY[0x1E4F502C8];
            uint64_t v371 = *MEMORY[0x1E4F28568];
            id v189 = [NSString alloc];
            uint64_t v252 = objc_opt_class();
            v190 = v189;
            v64 = v310;
            id v286 = (id)[v190 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v252, @"isTwoFactorCode"];
            id v372 = v286;
            v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v372 forKeys:&v371 count:1];
            uint64_t v20 = 0;
            id v287 = 0;
            *a4 = (id)objc_msgSend(v187, "initWithDomain:code:userInfo:", v188, 2);
            goto LABEL_303;
          }
          id v287 = 0;
          uint64_t v20 = 0;
LABEL_288:
          uint64_t v18 = v328;
          v23 = v327;
          v145 = v289;
          v142 = (void *)v301;
LABEL_352:

          goto LABEL_353;
        }
        if (a4)
        {
          id v183 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v184 = *MEMORY[0x1E4F502C8];
          uint64_t v373 = *MEMORY[0x1E4F28568];
          id v185 = [NSString alloc];
          uint64_t v251 = objc_opt_class();
          v186 = v185;
          v64 = v310;
          id v287 = (id)[v186 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v251, @"isNew"];
          id v374 = v287;
          v288 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v374 forKeys:&v373 count:1];
          uint64_t v20 = 0;
          id v290 = 0;
          *a4 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
          goto LABEL_288;
        }
        id v290 = 0;
        uint64_t v20 = 0;
        uint64_t v18 = v328;
        v23 = v327;
        v145 = v289;
LABEL_282:
        v142 = (void *)v301;
LABEL_353:

        goto LABEL_354;
      }
      if (a4)
      {
        id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v293 = *MEMORY[0x1E4F502C8];
        uint64_t v375 = *MEMORY[0x1E4F28568];
        id v180 = [NSString alloc];
        uint64_t v250 = objc_opt_class();
        v181 = v180;
        v64 = v310;
        id v290 = (id)[v181 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v250, @"personaId"];
        id v376 = v290;
        v291 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v376 forKeys:&v375 count:1];
        id v182 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v293, 2);
        uint64_t v20 = 0;
        id v292 = 0;
        *a4 = v182;
        uint64_t v18 = v328;
        v23 = v327;
        goto LABEL_282;
      }
      id v292 = 0;
      uint64_t v20 = 0;
      uint64_t v18 = v328;
      v23 = v327;
      v142 = (void *)v301;
LABEL_354:

      goto LABEL_355;
    }
    if (a4)
    {
      id v295 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v175 = *MEMORY[0x1E4F502C8];
      uint64_t v377 = *MEMORY[0x1E4F28568];
      id v176 = [NSString alloc];
      uint64_t v249 = objc_opt_class();
      v177 = v176;
      v64 = v310;
      id v292 = (id)[v177 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v249, @"contentProtection"];
      id v378 = v292;
      v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
      id v178 = (id)[v295 initWithDomain:v175 code:2 userInfo:v145];
      uint64_t v20 = 0;
      v294 = 0;
      *a4 = v178;
      uint64_t v18 = v328;
      v23 = v327;
      goto LABEL_354;
    }
    v294 = 0;
    uint64_t v20 = 0;
    uint64_t v18 = v328;
    v23 = v327;
LABEL_355:
    id v123 = v142;

    goto LABEL_356;
  }
  v140 = v139;
  int v122 = v137;
  uint64_t v18 = v328;
  v23 = v327;
  if (a4) {
    *a4 = v139;
  }

  uint64_t v20 = 0;
  id v123 = v122;
LABEL_169:
  v64 = v310;
LABEL_357:

  v112 = v123;
  uint64_t v41 = v305;
LABEL_358:

LABEL_360:
LABEL_361:

LABEL_362:
  v103 = v303;
LABEL_363:

LABEL_364:
LABEL_365:
  id v72 = v306;

LABEL_366:
LABEL_367:

  int v48 = v324;
  self = v311;
LABEL_368:

LABEL_369:
LABEL_370:

LABEL_371:
LABEL_372:

LABEL_373:
LABEL_374:

LABEL_375:
LABEL_376:

LABEL_377:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMProactiveHarvestingMessages *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_domainID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_author) {
    PBDataWriterWriteStringField();
  }
  if (self->_suggestedNickname) {
    PBDataWriterWriteStringField();
  }
  if (self->_suggestedPhotoPath) {
    PBDataWriterWriteStringField();
  }
  if (self->_recipients) {
    PBDataWriterWriteStringField();
  }
  if (self->_attachmentURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_content) {
    PBDataWriterWriteStringField();
  }
  if (self->_fromHandle)
  {
    uint64_t v24 = 0;
    PBDataWriterPlaceMark();
    [(BMProactiveHarvestingNamedHandle *)self->_fromHandle writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_toHandles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        uint64_t v24 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_accountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accountType) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = self->_accountHandles;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v13);
  }

  if (self->_attachment)
  {
    uint64_t v24 = 0;
    PBDataWriterPlaceMark();
    -[BMProactiveHarvestingContentAttachment writeTo:](self->_attachment, "writeTo:", v4, v16);
    PBDataWriterRecallMark();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsNew) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTwoFactorCode) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFromMe) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsGroupThread) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsJunk) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRead) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsPinned) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBusinessChat) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_tapbackAssociatedMessageID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTapbackType) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_messageType) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesService) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasMessageEffect) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsKnownSender) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_conversationUUID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v120.receiver = self;
  v120.super_class = (Class)BMProactiveHarvestingMessages;
  id v5 = [(BMEventBase *)&v120 init];
  if (!v5) {
    goto LABEL_186;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_133;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 72;
          goto LABEL_133;
        case 3u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v24 = *v8;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v9])
          {
            double v26 = *(double *)(*(void *)&v4[*v11] + v25);
            *(void *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v26 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v26;
          continue;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 80;
          goto LABEL_133;
        case 5u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 88;
          goto LABEL_133;
        case 6u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 96;
          goto LABEL_133;
        case 7u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 104;
          goto LABEL_133;
        case 8u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 112;
          goto LABEL_133;
        case 9u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 120;
          goto LABEL_133;
        case 0xAu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 128;
          goto LABEL_133;
        case 0xBu:
          uint64_t v121 = 0;
          uint64_t v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          uint64_t v27 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_188;
          }
          uint64_t v28 = 136;
          goto LABEL_48;
        case 0xCu:
          uint64_t v121 = 0;
          uint64_t v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          id v29 = [[BMProactiveHarvestingNamedHandle alloc] initByReadFrom:v4];
          if (!v29) {
            goto LABEL_188;
          }
          uint64_t v30 = v29;
          [v6 addObject:v29];
          PBReaderRecallMark();
          goto LABEL_44;
        case 0xDu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 152;
          goto LABEL_133;
        case 0xEu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 160;
          goto LABEL_133;
        case 0xFu:
          uint64_t v31 = PBReaderReadString();
          if (!v31) {
            goto LABEL_188;
          }
          uint64_t v30 = (void *)v31;
          [v7 addObject:v31];
LABEL_44:

          continue;
        case 0x10u:
          uint64_t v121 = 0;
          uint64_t v122 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_188;
          }
          uint64_t v27 = [[BMProactiveHarvestingContentAttachment alloc] initByReadFrom:v4];
          if (!v27) {
            goto LABEL_188;
          }
          uint64_t v28 = 176;
LABEL_48:
          uint64_t v32 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = v27;

          PBReaderRecallMark();
          continue;
        case 0x11u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 184;
          goto LABEL_133;
        case 0x12u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 192;
          goto LABEL_133;
        case 0x13u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 200;
          goto LABEL_133;
        case 0x14u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          v5->_hasIsNew = 1;
          while (2)
          {
            uint64_t v36 = *v8;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v11] + v37);
              *(void *)&v4[v36] = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v19 = v34++ >= 9;
                if (v19)
                {
                  uint64_t v35 = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v35 = 0;
          }
LABEL_137:
          BOOL v110 = v35 != 0;
          uint64_t v111 = 32;
          goto LABEL_179;
        case 0x15u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasIsTwoFactorCode = 1;
          while (2)
          {
            uint64_t v43 = *v8;
            uint64_t v44 = *(void *)&v4[v43];
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)&v4[*v11] + v44);
              *(void *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v19 = v41++ >= 9;
                if (v19)
                {
                  uint64_t v42 = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v42 = 0;
          }
LABEL_141:
          BOOL v110 = v42 != 0;
          uint64_t v111 = 34;
          goto LABEL_179;
        case 0x16u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          v5->_hasIsFromMe = 1;
          while (2)
          {
            uint64_t v50 = *v8;
            uint64_t v51 = *(void *)&v4[v50];
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)&v4[*v11] + v51);
              *(void *)&v4[v50] = v52;
              v49 |= (unint64_t)(v53 & 0x7F) << v47;
              if (v53 < 0)
              {
                v47 += 7;
                BOOL v19 = v48++ >= 9;
                if (v19)
                {
                  uint64_t v49 = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v49 = 0;
          }
LABEL_145:
          BOOL v110 = v49 != 0;
          uint64_t v111 = 36;
          goto LABEL_179;
        case 0x17u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          v5->_hasIsGroupThread = 1;
          while (2)
          {
            uint64_t v57 = *v8;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)&v4[*v11] + v58);
              *(void *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                BOOL v19 = v55++ >= 9;
                if (v19)
                {
                  uint64_t v56 = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v56 = 0;
          }
LABEL_149:
          BOOL v110 = v56 != 0;
          uint64_t v111 = 38;
          goto LABEL_179;
        case 0x18u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          v5->_hasIsJunk = 1;
          while (2)
          {
            uint64_t v64 = *v8;
            uint64_t v65 = *(void *)&v4[v64];
            unint64_t v66 = v65 + 1;
            if (v65 == -1 || v66 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)&v4[*v11] + v65);
              *(void *)&v4[v64] = v66;
              v63 |= (unint64_t)(v67 & 0x7F) << v61;
              if (v67 < 0)
              {
                v61 += 7;
                BOOL v19 = v62++ >= 9;
                if (v19)
                {
                  uint64_t v63 = 0;
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v63 = 0;
          }
LABEL_153:
          BOOL v110 = v63 != 0;
          uint64_t v111 = 40;
          goto LABEL_179;
        case 0x19u:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          v5->_hasIsRead = 1;
          while (2)
          {
            uint64_t v71 = *v8;
            uint64_t v72 = *(void *)&v4[v71];
            unint64_t v73 = v72 + 1;
            if (v72 == -1 || v73 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)&v4[*v11] + v72);
              *(void *)&v4[v71] = v73;
              v70 |= (unint64_t)(v74 & 0x7F) << v68;
              if (v74 < 0)
              {
                v68 += 7;
                BOOL v19 = v69++ >= 9;
                if (v19)
                {
                  uint64_t v70 = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v70 = 0;
          }
LABEL_157:
          BOOL v110 = v70 != 0;
          uint64_t v111 = 42;
          goto LABEL_179;
        case 0x1Au:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          v5->_hasIsPinned = 1;
          while (2)
          {
            uint64_t v78 = *v8;
            uint64_t v79 = *(void *)&v4[v78];
            unint64_t v80 = v79 + 1;
            if (v79 == -1 || v80 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v81 = *(unsigned char *)(*(void *)&v4[*v11] + v79);
              *(void *)&v4[v78] = v80;
              v77 |= (unint64_t)(v81 & 0x7F) << v75;
              if (v81 < 0)
              {
                v75 += 7;
                BOOL v19 = v76++ >= 9;
                if (v19)
                {
                  uint64_t v77 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v77 = 0;
          }
LABEL_161:
          BOOL v110 = v77 != 0;
          uint64_t v111 = 44;
          goto LABEL_179;
        case 0x1Bu:
          char v82 = 0;
          unsigned int v83 = 0;
          uint64_t v84 = 0;
          v5->_hasIsBusinessChat = 1;
          while (2)
          {
            uint64_t v85 = *v8;
            uint64_t v86 = *(void *)&v4[v85];
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)&v4[*v11] + v86);
              *(void *)&v4[v85] = v87;
              v84 |= (unint64_t)(v88 & 0x7F) << v82;
              if (v88 < 0)
              {
                v82 += 7;
                BOOL v19 = v83++ >= 9;
                if (v19)
                {
                  uint64_t v84 = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v84 = 0;
          }
LABEL_165:
          BOOL v110 = v84 != 0;
          uint64_t v111 = 46;
          goto LABEL_179;
        case 0x1Cu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 208;
          goto LABEL_133;
        case 0x1Du:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v91 = 0;
          v5->_hasTapbackType = 1;
          while (2)
          {
            uint64_t v92 = *v8;
            uint64_t v93 = *(void *)&v4[v92];
            unint64_t v94 = v93 + 1;
            if (v93 == -1 || v94 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v95 = *(unsigned char *)(*(void *)&v4[*v11] + v93);
              *(void *)&v4[v92] = v94;
              v91 |= (unint64_t)(v95 & 0x7F) << v89;
              if (v95 < 0)
              {
                v89 += 7;
                BOOL v19 = v90++ >= 9;
                if (v19)
                {
                  LODWORD(v91) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v91) = 0;
          }
LABEL_169:
          uint64_t v112 = 56;
          goto LABEL_174;
        case 0x1Eu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 216;
          goto LABEL_133;
        case 0x1Fu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 224;
          goto LABEL_133;
        case 0x20u:
          char v96 = 0;
          unsigned int v97 = 0;
          uint64_t v91 = 0;
          v5->_hasMessageEffect = 1;
          while (2)
          {
            uint64_t v98 = *v8;
            uint64_t v99 = *(void *)&v4[v98];
            unint64_t v100 = v99 + 1;
            if (v99 == -1 || v100 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v101 = *(unsigned char *)(*(void *)&v4[*v11] + v99);
              *(void *)&v4[v98] = v100;
              v91 |= (unint64_t)(v101 & 0x7F) << v96;
              if (v101 < 0)
              {
                v96 += 7;
                BOOL v19 = v97++ >= 9;
                if (v19)
                {
                  LODWORD(v91) = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v91) = 0;
          }
LABEL_173:
          uint64_t v112 = 60;
LABEL_174:
          *(_DWORD *)((char *)&v5->super.super.isa + v112) = v91;
          continue;
        case 0x21u:
          char v102 = 0;
          unsigned int v103 = 0;
          uint64_t v104 = 0;
          v5->_hasIsKnownSender = 1;
          break;
        case 0x22u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 232;
LABEL_133:
          v109 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_188:

          goto LABEL_185;
      }
      while (1)
      {
        uint64_t v105 = *v8;
        uint64_t v106 = *(void *)&v4[v105];
        unint64_t v107 = v106 + 1;
        if (v106 == -1 || v107 > *(void *)&v4[*v9]) {
          break;
        }
        char v108 = *(unsigned char *)(*(void *)&v4[*v11] + v106);
        *(void *)&v4[v105] = v107;
        v104 |= (unint64_t)(v108 & 0x7F) << v102;
        if ((v108 & 0x80) == 0) {
          goto LABEL_176;
        }
        v102 += 7;
        BOOL v19 = v103++ >= 9;
        if (v19)
        {
          uint64_t v104 = 0;
          goto LABEL_178;
        }
      }
      v4[*v10] = 1;
LABEL_176:
      if (v4[*v10]) {
        uint64_t v104 = 0;
      }
LABEL_178:
      BOOL v110 = v104 != 0;
      uint64_t v111 = 50;
LABEL_179:
      *((unsigned char *)&v5->super.super.isa + v111) = v110;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v113 = [v6 copy];
  toHandles = v5->_toHandles;
  v5->_toHandles = (NSArray *)v113;

  uint64_t v115 = [v7 copy];
  accountHandles = v5->_accountHandles;
  v5->_accountHandles = (NSArray *)v115;

  int v117 = v4[*v10];
  if (v117) {
LABEL_185:
  }
    v118 = 0;
  else {
LABEL_186:
  }
    v118 = v5;

  return v118;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  uint64_t v37 = [(BMProactiveHarvestingMessages *)self uniqueID];
  char v39 = [(BMProactiveHarvestingMessages *)self domainID];
  uint64_t v35 = [(BMProactiveHarvestingMessages *)self absoluteTimestamp];
  unint64_t v38 = [(BMProactiveHarvestingMessages *)self conversationId];
  uint64_t v36 = [(BMProactiveHarvestingMessages *)self author];
  char v33 = [(BMProactiveHarvestingMessages *)self suggestedNickname];
  unsigned int v34 = [(BMProactiveHarvestingMessages *)self suggestedPhotoPath];
  uint64_t v31 = [(BMProactiveHarvestingMessages *)self recipients];
  uint64_t v32 = [(BMProactiveHarvestingMessages *)self attachmentURL];
  uint64_t v28 = [(BMProactiveHarvestingMessages *)self content];
  uint64_t v30 = [(BMProactiveHarvestingMessages *)self fromHandle];
  double v26 = [(BMProactiveHarvestingMessages *)self toHandles];
  id v29 = [(BMProactiveHarvestingMessages *)self accountIdentifier];
  unint64_t v25 = [(BMProactiveHarvestingMessages *)self accountType];
  uint64_t v27 = [(BMProactiveHarvestingMessages *)self accountHandles];
  uint64_t v16 = [(BMProactiveHarvestingMessages *)self attachment];
  uint64_t v24 = [(BMProactiveHarvestingMessages *)self url];
  uint64_t v23 = [(BMProactiveHarvestingMessages *)self contentProtection];
  uint64_t v15 = [(BMProactiveHarvestingMessages *)self personaId];
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isNew](self, "isNew"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isTwoFactorCode](self, "isTwoFactorCode"));
  long long v21 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isFromMe](self, "isFromMe"));
  int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isGroupThread](self, "isGroupThread"));
  BOOL v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isJunk](self, "isJunk"));
  unsigned int v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isRead](self, "isRead"));
  char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isPinned](self, "isPinned"));
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isBusinessChat](self, "isBusinessChat"));
  uint64_t v3 = [(BMProactiveHarvestingMessages *)self tapbackAssociatedMessageID];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMessages tapbackType](self, "tapbackType"));
  id v5 = [(BMProactiveHarvestingMessages *)self messageType];
  uint64_t v6 = [(BMProactiveHarvestingMessages *)self messagesService];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMProactiveHarvestingMessages messageEffect](self, "messageEffect"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMProactiveHarvestingMessages isKnownSender](self, "isKnownSender"));
  uint64_t v9 = [(BMProactiveHarvestingMessages *)self conversationUUID];
  id v18 = (id)objc_msgSend(v17, "initWithFormat:", @"BMProactiveHarvestingMessages with uniqueID: %@, domainID: %@, absoluteTimestamp: %@, conversationId: %@, author: %@, suggestedNickname: %@, suggestedPhotoPath: %@, recipients: %@, attachmentURL: %@, content: %@, fromHandle: %@, toHandles: %@, accountIdentifier: %@, accountType: %@, accountHandles: %@, attachment: %@, url: %@, contentProtection: %@, personaId: %@, isNew: %@, isTwoFactorCode: %@, isFromMe: %@, isGroupThread: %@, isJunk: %@, isRead: %@, isPinned: %@, isBusinessChat: %@, tapbackAssociatedMessageID: %@, tapbackType: %@, messageType: %@, messagesService: %@, messageEffect: %@, isKnownSender: %@, conversationUUID: %@", v37, v39, v35, v38, v36, v33, v34, v31, v32, v28, v30, v26, v29, v25, v27, v16,
              v24,
              v23,
              v15,
              v22,
              v14,
              v21,
              v20,
              v19,
              v13,
              v12,
              v11,
              v3,
              v4,
              v5,
              v6,
              v7,
              v8,
              v9);

  return (NSString *)v18;
}

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33 messageEffect:(id)a34 isKnownSender:(id)a35 conversationUUID:(id)a36
{
  id v73 = a3;
  id v72 = a4;
  id v82 = a5;
  id v71 = a6;
  id v70 = a7;
  id v52 = a8;
  id v69 = a8;
  id v68 = a9;
  id v67 = a10;
  id v66 = a11;
  id v65 = a12;
  id v64 = a13;
  id v63 = a14;
  id v62 = a15;
  id v61 = a16;
  id v60 = a17;
  id v59 = a18;
  id v58 = a19;
  id v57 = a20;
  id v56 = a21;
  id v80 = a22;
  id v41 = a23;
  id v42 = a24;
  id v81 = a25;
  id v79 = a26;
  id v78 = a27;
  id v77 = a28;
  id v76 = a29;
  id v43 = a30;
  id v44 = a31;
  id v45 = a32;
  id v55 = a33;
  id v75 = a34;
  id v74 = a35;
  id v54 = a36;
  v83.receiver = self;
  v83.super_class = (Class)BMProactiveHarvestingMessages;
  char v46 = [(BMEventBase *)&v83 init];
  if (v46)
  {
    v46->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v46->_uniqueID, a3);
    objc_storeStrong((id *)&v46->_domainID, a4);
    if (v82)
    {
      v46->_hasRaw_absoluteTimestamp = 1;
      [v82 timeIntervalSinceReferenceDate];
    }
    else
    {
      v46->_hasRaw_absoluteTimestamp = 0;
      double v47 = -1.0;
    }
    v46->_raw_absoluteTimestamp = v47;
    objc_storeStrong((id *)&v46->_conversationId, a6);
    objc_storeStrong((id *)&v46->_author, a7);
    objc_storeStrong((id *)&v46->_suggestedNickname, v52);
    objc_storeStrong((id *)&v46->_suggestedPhotoPath, a9);
    objc_storeStrong((id *)&v46->_recipients, a10);
    objc_storeStrong((id *)&v46->_attachmentURL, a11);
    objc_storeStrong((id *)&v46->_content, a12);
    objc_storeStrong((id *)&v46->_fromHandle, a13);
    objc_storeStrong((id *)&v46->_toHandles, a14);
    objc_storeStrong((id *)&v46->_accountIdentifier, a15);
    objc_storeStrong((id *)&v46->_accountType, a16);
    objc_storeStrong((id *)&v46->_accountHandles, a17);
    objc_storeStrong((id *)&v46->_attachment, a18);
    objc_storeStrong((id *)&v46->_url, a19);
    objc_storeStrong((id *)&v46->_contentProtection, a20);
    objc_storeStrong((id *)&v46->_personaId, a21);
    if (v80)
    {
      v46->_hasIsNew = 1;
      v46->_isNew = [v80 BOOLValue];
    }
    else
    {
      v46->_hasIsNew = 0;
      v46->_isNew = 0;
    }
    if (v41)
    {
      v46->_hasIsTwoFactorCode = 1;
      v46->_isTwoFactorCode = [v41 BOOLValue];
    }
    else
    {
      v46->_hasIsTwoFactorCode = 0;
      v46->_isTwoFactorCode = 0;
    }
    if (v42)
    {
      v46->_hasIsFromMe = 1;
      v46->_isFromMe = [v42 BOOLValue];
    }
    else
    {
      v46->_hasIsFromMe = 0;
      v46->_isFromMe = 0;
    }
    if (v81)
    {
      v46->_hasIsGroupThread = 1;
      v46->_isGroupThread = [v81 BOOLValue];
    }
    else
    {
      v46->_hasIsGroupThread = 0;
      v46->_isGroupThread = 0;
    }
    if (v79)
    {
      v46->_hasIsJunk = 1;
      v46->_isJunk = [v79 BOOLValue];
    }
    else
    {
      v46->_hasIsJunk = 0;
      v46->_isJunk = 0;
    }
    if (v78)
    {
      v46->_hasIsRead = 1;
      v46->_isRead = [v78 BOOLValue];
    }
    else
    {
      v46->_hasIsRead = 0;
      v46->_isRead = 0;
    }
    if (v77)
    {
      v46->_hasIsPinned = 1;
      v46->_isPinned = [v77 BOOLValue];
    }
    else
    {
      v46->_hasIsPinned = 0;
      v46->_isPinned = 0;
    }
    if (v76)
    {
      v46->_hasIsBusinessChat = 1;
      v46->_isBusinessChat = [v76 BOOLValue];
    }
    else
    {
      v46->_hasIsBusinessChat = 0;
      v46->_isBusinessChat = 0;
    }
    objc_storeStrong((id *)&v46->_tapbackAssociatedMessageID, a30);
    if (v44)
    {
      v46->_hasTapbackType = 1;
      int v48 = [v44 intValue];
    }
    else
    {
      v46->_hasTapbackType = 0;
      int v48 = -1;
    }
    v46->_tapbackType = v48;
    objc_storeStrong((id *)&v46->_messageType, a32);
    objc_storeStrong((id *)&v46->_messagesService, a33);
    if (v75)
    {
      v46->_hasMessageEffect = 1;
      int v49 = [v75 intValue];
    }
    else
    {
      v46->_hasMessageEffect = 0;
      int v49 = -1;
    }
    v46->_messageEffect = v49;
    if (v74)
    {
      v46->_hasIsKnownSender = 1;
      v46->_isKnownSender = [v74 BOOLValue];
    }
    else
    {
      v46->_hasIsKnownSender = 0;
      v46->_isKnownSender = 0;
    }
    objc_storeStrong((id *)&v46->_conversationUUID, a36);
  }

  return v46;
}

+ (id)protoFields
{
  v38[34] = *MEMORY[0x1E4F143B8];
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v38[0] = v37;
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"domainID" number:2 type:13 subMessageClass:0];
  v38[1] = v36;
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:3 type:0 subMessageClass:0];
  v38[2] = v35;
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationId" number:4 type:13 subMessageClass:0];
  v38[3] = v34;
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"author" number:5 type:13 subMessageClass:0];
  v38[4] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedNickname" number:6 type:13 subMessageClass:0];
  v38[5] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedPhotoPath" number:7 type:13 subMessageClass:0];
  v38[6] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recipients" number:8 type:13 subMessageClass:0];
  v38[7] = v30;
  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachmentURL" number:9 type:13 subMessageClass:0];
  v38[8] = v29;
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"content" number:10 type:13 subMessageClass:0];
  v38[9] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fromHandle" number:11 type:14 subMessageClass:objc_opt_class()];
  v38[10] = v27;
  double v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"toHandles" number:12 type:14 subMessageClass:objc_opt_class()];
  v38[11] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountIdentifier" number:13 type:13 subMessageClass:0];
  v38[12] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountType" number:14 type:13 subMessageClass:0];
  v38[13] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountHandles" number:15 type:13 subMessageClass:0];
  v38[14] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachment" number:16 type:14 subMessageClass:objc_opt_class()];
  v38[15] = v22;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"url" number:17 type:13 subMessageClass:0];
  v38[16] = v21;
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentProtection" number:18 type:13 subMessageClass:0];
  v38[17] = v20;
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personaId" number:19 type:13 subMessageClass:0];
  v38[18] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNew" number:20 type:12 subMessageClass:0];
  v38[19] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTwoFactorCode" number:21 type:12 subMessageClass:0];
  v38[20] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFromMe" number:22 type:12 subMessageClass:0];
  v38[21] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGroupThread" number:23 type:12 subMessageClass:0];
  v38[22] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJunk" number:24 type:12 subMessageClass:0];
  v38[23] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRead" number:25 type:12 subMessageClass:0];
  v38[24] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPinned" number:26 type:12 subMessageClass:0];
  v38[25] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBusinessChat" number:27 type:12 subMessageClass:0];
  v38[26] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tapbackAssociatedMessageID" number:28 type:13 subMessageClass:0];
  v38[27] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tapbackType" number:29 type:2 subMessageClass:0];
  v38[28] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageType" number:30 type:13 subMessageClass:0];
  v38[29] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messagesService" number:31 type:13 subMessageClass:0];
  v38[30] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageEffect" number:32 type:2 subMessageClass:0];
  v38[31] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isKnownSender" number:33 type:12 subMessageClass:0];
  v38[32] = v10;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationUUID" number:34 type:13 subMessageClass:0];
  v38[33] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:34];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4098;
}

+ (id)columns
{
  v38[34] = *MEMORY[0x1E4F143B8];
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"domainID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  unsigned int v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  char v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"author" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestedNickname" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestedPhotoPath" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recipients" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"attachmentURL" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"content" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"fromHandle_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_18806];
  double v26 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"toHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_151];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountIdentifier" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountType" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"accountHandles_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_153];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"attachment_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_155];
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"url" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contentProtection" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personaId" dataType:2 requestOnly:0 fieldNumber:19 protoDataType:13 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNew" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTwoFactorCode" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFromMe" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:12 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGroupThread" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJunk" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRead" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPinned" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBusinessChat" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:12 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tapbackAssociatedMessageID" dataType:2 requestOnly:0 fieldNumber:28 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tapbackType" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:2 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageType" dataType:2 requestOnly:0 fieldNumber:30 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messagesService" dataType:2 requestOnly:0 fieldNumber:31 protoDataType:13 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageEffect" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:2 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isKnownSender" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationUUID" dataType:2 requestOnly:0 fieldNumber:34 protoDataType:13 convertedType:0];
  v38[0] = v37;
  v38[1] = v36;
  v38[2] = v35;
  v38[3] = v34;
  v38[4] = v33;
  v38[5] = v32;
  v38[6] = v31;
  v38[7] = v30;
  v38[8] = v29;
  v38[9] = v28;
  v38[10] = v27;
  v38[11] = v26;
  v38[12] = v25;
  v38[13] = v24;
  v38[14] = v23;
  v38[15] = v22;
  v38[16] = v21;
  v38[17] = v20;
  v38[18] = v19;
  v38[19] = v18;
  v38[20] = v17;
  v38[21] = v16;
  v38[22] = v15;
  v38[23] = v14;
  v38[24] = v2;
  v38[25] = v3;
  v38[26] = v4;
  v38[27] = v13;
  v38[28] = v5;
  v38[29] = v6;
  v38[30] = v7;
  v38[31] = v12;
  v38[32] = v8;
  v38[33] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:34];

  return v11;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 attachment];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _accountHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _toHandlesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMProactiveHarvestingMessages_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 fromHandle];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingMessages alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[13] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21
{
  return -[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
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
           0,
           0,
           0);
}

- (BMProactiveHarvestingMessages)initWithUniqueID:(id)a3 domainID:(id)a4 absoluteTimestamp:(id)a5 conversationId:(id)a6 author:(id)a7 suggestedNickname:(id)a8 suggestedPhotoPath:(id)a9 recipients:(id)a10 attachmentURL:(id)a11 content:(id)a12 fromHandle:(id)a13 toHandles:(id)a14 accountIdentifier:(id)a15 accountType:(id)a16 accountHandles:(id)a17 attachment:(id)a18 url:(id)a19 contentProtection:(id)a20 personaId:(id)a21 isNew:(id)a22 isTwoFactorCode:(id)a23 isFromMe:(id)a24 isGroupThread:(id)a25 isJunk:(id)a26 isRead:(id)a27 isPinned:(id)a28 isBusinessChat:(id)a29 tapbackAssociatedMessageID:(id)a30 tapbackType:(id)a31 messageType:(id)a32 messagesService:(id)a33
{
  return -[BMProactiveHarvestingMessages initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:](self, "initWithUniqueID:domainID:absoluteTimestamp:conversationId:author:suggestedNickname:suggestedPhotoPath:recipients:attachmentURL:content:fromHandle:toHandles:accountIdentifier:accountType:accountHandles:attachment:url:contentProtection:personaId:isNew:isTwoFactorCode:isFromMe:isGroupThread:isJunk:isRead:isPinned:isBusinessChat:tapbackAssociatedMessageID:tapbackType:messageType:messagesService:messageEffect:isKnownSender:conversationUUID:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
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
           a31,
           a32,
           a33,
           0,
           0,
           0);
}

@end