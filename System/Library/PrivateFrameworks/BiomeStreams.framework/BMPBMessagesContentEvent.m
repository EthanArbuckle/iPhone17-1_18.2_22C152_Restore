@interface BMPBMessagesContentEvent
+ (Class)accountHandlesType;
+ (Class)toHandlesType;
- (BMPBContentAttachment)attachment;
- (BMPBNamedHandle)fromHandle;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasAccountIdentifier;
- (BOOL)hasAccountType;
- (BOOL)hasAttachment;
- (BOOL)hasAttachmentURL;
- (BOOL)hasAuthor;
- (BOOL)hasContent;
- (BOOL)hasContentProtection;
- (BOOL)hasConversationId;
- (BOOL)hasConversationUUID;
- (BOOL)hasDomainId;
- (BOOL)hasFromHandle;
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
- (BOOL)hasMessageType;
- (BOOL)hasMessagesService;
- (BOOL)hasPersonaId;
- (BOOL)hasRecipients;
- (BOOL)hasSuggestedNickname;
- (BOOL)hasSuggestedPhotoPath;
- (BOOL)hasTapbackAssociatedMessageID;
- (BOOL)hasTapbackType;
- (BOOL)hasUniqueId;
- (BOOL)hasUrl;
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
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)accountHandles;
- (NSMutableArray)toHandles;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)attachmentURL;
- (NSString)author;
- (NSString)content;
- (NSString)contentProtection;
- (NSString)conversationId;
- (NSString)conversationUUID;
- (NSString)domainId;
- (NSString)messageType;
- (NSString)messagesService;
- (NSString)personaId;
- (NSString)recipients;
- (NSString)suggestedNickname;
- (NSString)suggestedPhotoPath;
- (NSString)tapbackAssociatedMessageID;
- (NSString)uniqueId;
- (NSString)url;
- (double)absoluteTimestamp;
- (id)accountHandlesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)toHandlesAtIndex:(unint64_t)a3;
- (int)messageEffect;
- (int64_t)tapbackType;
- (unint64_t)accountHandlesCount;
- (unint64_t)hash;
- (unint64_t)toHandlesCount;
- (void)addAccountHandles:(id)a3;
- (void)addToHandles:(id)a3;
- (void)clearAccountHandles;
- (void)clearToHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAccountHandles:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentProtection:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setConversationUUID:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
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
- (void)setIsBusinessChat:(BOOL)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsGroupThread:(BOOL)a3;
- (void)setIsJunk:(BOOL)a3;
- (void)setIsKnownSender:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setIsTwoFactorCode:(BOOL)a3;
- (void)setMessageEffect:(int)a3;
- (void)setMessageType:(id)a3;
- (void)setMessagesService:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSuggestedNickname:(id)a3;
- (void)setSuggestedPhotoPath:(id)a3;
- (void)setTapbackAssociatedMessageID:(id)a3;
- (void)setTapbackType:(int64_t)a3;
- (void)setToHandles:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMessagesContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (BOOL)hasAuthor
{
  return self->_author != 0;
}

- (BOOL)hasSuggestedNickname
{
  return self->_suggestedNickname != 0;
}

- (BOOL)hasSuggestedPhotoPath
{
  return self->_suggestedPhotoPath != 0;
}

- (BOOL)hasRecipients
{
  return self->_recipients != 0;
}

- (BOOL)hasAttachmentURL
{
  return self->_attachmentURL != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (BOOL)hasFromHandle
{
  return self->_fromHandle != 0;
}

- (void)clearToHandles
{
}

- (void)addToHandles:(id)a3
{
  id v4 = a3;
  toHandles = self->_toHandles;
  id v8 = v4;
  if (!toHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_toHandles;
    self->_toHandles = v6;

    id v4 = v8;
    toHandles = self->_toHandles;
  }
  [(NSMutableArray *)toHandles addObject:v4];
}

- (unint64_t)toHandlesCount
{
  return [(NSMutableArray *)self->_toHandles count];
}

- (id)toHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_toHandles objectAtIndex:a3];
}

+ (Class)toHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasAccountType
{
  return self->_accountType != 0;
}

- (void)clearAccountHandles
{
}

- (void)addAccountHandles:(id)a3
{
  id v4 = a3;
  accountHandles = self->_accountHandles;
  id v8 = v4;
  if (!accountHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_accountHandles;
    self->_accountHandles = v6;

    id v4 = v8;
    accountHandles = self->_accountHandles;
  }
  [(NSMutableArray *)accountHandles addObject:v4];
}

- (unint64_t)accountHandlesCount
{
  return [(NSMutableArray *)self->_accountHandles count];
}

- (id)accountHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_accountHandles objectAtIndex:a3];
}

+ (Class)accountHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAttachment
{
  return self->_attachment != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (void)setIsNew:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isNew = a3;
}

- (void)setHasIsNew:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsNew
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsTwoFactorCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isTwoFactorCode = a3;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsTwoFactorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsFromMe:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isFromMe = a3;
}

- (void)setHasIsFromMe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsFromMe
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsGroupThread:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isGroupThread = a3;
}

- (void)setHasIsGroupThread:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsGroupThread
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsJunk:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isJunk = a3;
}

- (void)setHasIsJunk:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsJunk
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsRead:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsRead
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsPinned:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isPinned = a3;
}

- (void)setHasIsPinned:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsPinned
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsBusinessChat:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isBusinessChat = a3;
}

- (void)setHasIsBusinessChat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsBusinessChat
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasTapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID != 0;
}

- (void)setTapbackType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_tapbackType = a3;
}

- (void)setHasTapbackType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTapbackType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasMessagesService
{
  return self->_messagesService != 0;
}

- (void)setMessageEffect:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_messageEffect = a3;
}

- (void)setHasMessageEffect:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMessageEffect
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsKnownSender:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isKnownSender = a3;
}

- (void)setHasIsKnownSender:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsKnownSender
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasConversationUUID
{
  return self->_conversationUUID != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBMessagesContentEvent;
  id v4 = [(BMPBMessagesContentEvent *)&v8 description];
  v5 = [(BMPBMessagesContentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  if (*(_WORD *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v4 setObject:conversationId forKey:@"conversationId"];
  }
  author = self->_author;
  if (author) {
    [v4 setObject:author forKey:@"author"];
  }
  suggestedNickname = self->_suggestedNickname;
  if (suggestedNickname) {
    [v4 setObject:suggestedNickname forKey:@"suggestedNickname"];
  }
  suggestedPhotoPath = self->_suggestedPhotoPath;
  if (suggestedPhotoPath) {
    [v4 setObject:suggestedPhotoPath forKey:@"suggestedPhotoPath"];
  }
  recipients = self->_recipients;
  if (recipients) {
    [v4 setObject:recipients forKey:@"recipients"];
  }
  attachmentURL = self->_attachmentURL;
  if (attachmentURL) {
    [v4 setObject:attachmentURL forKey:@"attachmentURL"];
  }
  content = self->_content;
  if (content) {
    [v4 setObject:content forKey:@"content"];
  }
  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    v16 = [(BMPBNamedHandle *)fromHandle dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"fromHandle"];
  }
  if ([(NSMutableArray *)self->_toHandles count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_toHandles, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v18 = self->_toHandles;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v52 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * i), "dictionaryRepresentation", (void)v51);
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"toHandles"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  accountType = self->_accountType;
  if (accountType) {
    [v4 setObject:accountType forKey:@"accountType"];
  }
  accountHandles = self->_accountHandles;
  if (accountHandles) {
    [v4 setObject:accountHandles forKey:@"accountHandles"];
  }
  attachment = self->_attachment;
  if (attachment)
  {
    v28 = [(BMPBContentAttachment *)attachment dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"attachment"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v44 = [NSNumber numberWithBool:self->_isNew];
    [v4 setObject:v44 forKey:@"isNew"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_48:
      if ((has & 0x10) == 0) {
        goto LABEL_49;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_48;
  }
  v45 = objc_msgSend(NSNumber, "numberWithBool:", self->_isTwoFactorCode, (void)v51);
  [v4 setObject:v45 forKey:@"isTwoFactorCode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_49:
    if ((has & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_73;
  }
LABEL_72:
  v46 = objc_msgSend(NSNumber, "numberWithBool:", self->_isFromMe, (void)v51);
  [v4 setObject:v46 forKey:@"isFromMe"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_50:
    if ((has & 0x40) == 0) {
      goto LABEL_51;
    }
    goto LABEL_74;
  }
LABEL_73:
  v47 = objc_msgSend(NSNumber, "numberWithBool:", self->_isGroupThread, (void)v51);
  [v4 setObject:v47 forKey:@"isGroupThread"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_51:
    if ((has & 0x400) == 0) {
      goto LABEL_52;
    }
    goto LABEL_75;
  }
LABEL_74:
  v48 = objc_msgSend(NSNumber, "numberWithBool:", self->_isJunk, (void)v51);
  [v4 setObject:v48 forKey:@"isJunk"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_52:
    if ((has & 0x200) == 0) {
      goto LABEL_53;
    }
    goto LABEL_76;
  }
LABEL_75:
  v49 = objc_msgSend(NSNumber, "numberWithBool:", self->_isRead, (void)v51);
  [v4 setObject:v49 forKey:@"isRead"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_53:
    if ((has & 8) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_76:
  v50 = objc_msgSend(NSNumber, "numberWithBool:", self->_isPinned, (void)v51);
  [v4 setObject:v50 forKey:@"isPinned"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_54:
    v33 = objc_msgSend(NSNumber, "numberWithBool:", self->_isBusinessChat, (void)v51);
    [v4 setObject:v33 forKey:@"isBusinessChat"];
  }
LABEL_55:
  tapbackAssociatedMessageID = self->_tapbackAssociatedMessageID;
  if (tapbackAssociatedMessageID) {
    [v4 setObject:tapbackAssociatedMessageID forKey:@"tapbackAssociatedMessageID"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v35 = [NSNumber numberWithLongLong:self->_tapbackType];
    [v4 setObject:v35 forKey:@"tapbackType"];
  }
  messageType = self->_messageType;
  if (messageType) {
    [v4 setObject:messageType forKey:@"messageType"];
  }
  messagesService = self->_messagesService;
  if (messagesService) {
    [v4 setObject:messagesService forKey:@"messagesService"];
  }
  __int16 v38 = (__int16)self->_has;
  if ((v38 & 4) != 0)
  {
    v39 = [NSNumber numberWithInt:self->_messageEffect];
    [v4 setObject:v39 forKey:@"messageEffect"];

    __int16 v38 = (__int16)self->_has;
  }
  if ((v38 & 0x80) != 0)
  {
    v40 = [NSNumber numberWithBool:self->_isKnownSender];
    [v4 setObject:v40 forKey:@"isKnownSender"];
  }
  conversationUUID = self->_conversationUUID;
  if (conversationUUID) {
    [v4 setObject:conversationUUID forKey:@"conversationUUID"];
  }
  id v42 = v4;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMessagesContentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueId) {
    PBDataWriterWriteStringField();
  }
  if (self->_domainId) {
    PBDataWriterWriteStringField();
  }
  if (*(_WORD *)&self->_has) {
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
  if (self->_fromHandle) {
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_toHandles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_accountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_accountType) {
    PBDataWriterWriteStringField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_accountHandles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  if (self->_attachment) {
    PBDataWriterWriteSubmessage();
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_51:
      if ((has & 0x10) == 0) {
        goto LABEL_52;
      }
      goto LABEL_75;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_51;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_52:
    if ((has & 0x20) == 0) {
      goto LABEL_53;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_53:
    if ((has & 0x40) == 0) {
      goto LABEL_54;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_54:
    if ((has & 0x400) == 0) {
      goto LABEL_55;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_55:
    if ((has & 0x200) == 0) {
      goto LABEL_56;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_56:
    if ((has & 8) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_57:
  }
    PBDataWriterWriteBOOLField();
LABEL_58:
  if (self->_tapbackAssociatedMessageID) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_messageType) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesService) {
    PBDataWriterWriteStringField();
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v16 = (__int16)self->_has;
  }
  if ((v16 & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_conversationUUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v16;
  }
  if (self->_domainId)
  {
    objc_msgSend(v16, "setDomainId:");
    id v4 = v16;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((_WORD *)v4 + 110) |= 1u;
  }
  if (self->_conversationId) {
    objc_msgSend(v16, "setConversationId:");
  }
  if (self->_author) {
    objc_msgSend(v16, "setAuthor:");
  }
  if (self->_suggestedNickname) {
    objc_msgSend(v16, "setSuggestedNickname:");
  }
  if (self->_suggestedPhotoPath) {
    objc_msgSend(v16, "setSuggestedPhotoPath:");
  }
  if (self->_recipients) {
    objc_msgSend(v16, "setRecipients:");
  }
  if (self->_attachmentURL) {
    objc_msgSend(v16, "setAttachmentURL:");
  }
  if (self->_content) {
    objc_msgSend(v16, "setContent:");
  }
  if (self->_fromHandle) {
    objc_msgSend(v16, "setFromHandle:");
  }
  if ([(BMPBMessagesContentEvent *)self toHandlesCount])
  {
    [v16 clearToHandles];
    unint64_t v5 = [(BMPBMessagesContentEvent *)self toHandlesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBMessagesContentEvent *)self toHandlesAtIndex:i];
        [v16 addToHandles:v8];
      }
    }
  }
  if (self->_accountIdentifier) {
    objc_msgSend(v16, "setAccountIdentifier:");
  }
  if (self->_accountType) {
    objc_msgSend(v16, "setAccountType:");
  }
  if ([(BMPBMessagesContentEvent *)self accountHandlesCount])
  {
    [v16 clearAccountHandles];
    unint64_t v9 = [(BMPBMessagesContentEvent *)self accountHandlesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BMPBMessagesContentEvent *)self accountHandlesAtIndex:j];
        [v16 addAccountHandles:v12];
      }
    }
  }
  if (self->_attachment) {
    objc_msgSend(v16, "setAttachment:");
  }
  uint64_t v13 = v16;
  if (self->_url)
  {
    objc_msgSend(v16, "setUrl:");
    uint64_t v13 = v16;
  }
  if (self->_contentProtection)
  {
    objc_msgSend(v16, "setContentProtection:");
    uint64_t v13 = v16;
  }
  if (self->_personaId)
  {
    objc_msgSend(v16, "setPersonaId:");
    uint64_t v13 = v16;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v13[213] = self->_isNew;
    *((_WORD *)v13 + 110) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_45:
      if ((has & 0x10) == 0) {
        goto LABEL_46;
      }
      goto LABEL_71;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_45;
  }
  v13[216] = self->_isTwoFactorCode;
  *((_WORD *)v13 + 110) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_46:
    if ((has & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_72;
  }
LABEL_71:
  v13[209] = self->_isFromMe;
  *((_WORD *)v13 + 110) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_47:
    if ((has & 0x40) == 0) {
      goto LABEL_48;
    }
    goto LABEL_73;
  }
LABEL_72:
  v13[210] = self->_isGroupThread;
  *((_WORD *)v13 + 110) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_48:
    if ((has & 0x400) == 0) {
      goto LABEL_49;
    }
    goto LABEL_74;
  }
LABEL_73:
  v13[211] = self->_isJunk;
  *((_WORD *)v13 + 110) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_49:
    if ((has & 0x200) == 0) {
      goto LABEL_50;
    }
    goto LABEL_75;
  }
LABEL_74:
  v13[215] = self->_isRead;
  *((_WORD *)v13 + 110) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_50:
    if ((has & 8) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_75:
  v13[214] = self->_isPinned;
  *((_WORD *)v13 + 110) |= 0x200u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_51:
    v13[208] = self->_isBusinessChat;
    *((_WORD *)v13 + 110) |= 8u;
  }
LABEL_52:
  if (self->_tapbackAssociatedMessageID)
  {
    objc_msgSend(v16, "setTapbackAssociatedMessageID:");
    uint64_t v13 = v16;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((void *)v13 + 2) = self->_tapbackType;
    *((_WORD *)v13 + 110) |= 2u;
  }
  if (self->_messageType)
  {
    objc_msgSend(v16, "setMessageType:");
    uint64_t v13 = v16;
  }
  if (self->_messagesService)
  {
    objc_msgSend(v16, "setMessagesService:");
    uint64_t v13 = v16;
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 4) != 0)
  {
    *((_DWORD *)v13 + 30) = self->_messageEffect;
    *((_WORD *)v13 + 110) |= 4u;
    __int16 v15 = (__int16)self->_has;
  }
  if ((v15 & 0x80) != 0)
  {
    v13[212] = self->_isKnownSender;
    *((_WORD *)v13 + 110) |= 0x80u;
  }
  if (self->_conversationUUID)
  {
    objc_msgSend(v16, "setConversationUUID:");
    uint64_t v13 = v16;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  if (*(_WORD *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_WORD *)(v5 + 220) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_conversationId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v10;

  uint64_t v12 = [(NSString *)self->_author copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_suggestedNickname copyWithZone:a3];
  __int16 v15 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v14;

  uint64_t v16 = [(NSString *)self->_suggestedPhotoPath copyWithZone:a3];
  long long v17 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v16;

  uint64_t v18 = [(NSString *)self->_recipients copyWithZone:a3];
  long long v19 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v18;

  uint64_t v20 = [(NSString *)self->_attachmentURL copyWithZone:a3];
  long long v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_content copyWithZone:a3];
  long long v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  id v24 = [(BMPBNamedHandle *)self->_fromHandle copyWithZone:a3];
  v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v26 = self->_toHandles;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v66 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addToHandles:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  uint64_t v34 = [(NSString *)self->_accountType copyWithZone:a3];
  v35 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v34;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v36 = self->_accountHandles;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "copyWithZone:", a3, (void)v61);
        [(id)v5 addAccountHandles:v41];
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v38);
  }

  id v42 = [(BMPBContentAttachment *)self->_attachment copyWithZone:a3];
  v43 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v42;

  uint64_t v44 = [(NSString *)self->_url copyWithZone:a3];
  v45 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v44;

  uint64_t v46 = [(NSString *)self->_contentProtection copyWithZone:a3];
  v47 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v46;

  uint64_t v48 = [(NSString *)self->_personaId copyWithZone:a3];
  v49 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v48;

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 213) = self->_isNew;
    *(_WORD *)(v5 + 220) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_19:
      if ((has & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_19;
  }
  *(unsigned char *)(v5 + 216) = self->_isTwoFactorCode;
  *(_WORD *)(v5 + 220) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(unsigned char *)(v5 + 209) = self->_isFromMe;
  *(_WORD *)(v5 + 220) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(unsigned char *)(v5 + 210) = self->_isGroupThread;
  *(_WORD *)(v5 + 220) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_22:
    if ((has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(unsigned char *)(v5 + 211) = self->_isJunk;
  *(_WORD *)(v5 + 220) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(unsigned char *)(v5 + 215) = self->_isRead;
  *(_WORD *)(v5 + 220) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_39:
  *(unsigned char *)(v5 + 214) = self->_isPinned;
  *(_WORD *)(v5 + 220) |= 0x200u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_25:
    *(unsigned char *)(v5 + 208) = self->_isBusinessChat;
    *(_WORD *)(v5 + 220) |= 8u;
  }
LABEL_26:
  uint64_t v51 = -[NSString copyWithZone:](self->_tapbackAssociatedMessageID, "copyWithZone:", a3, (void)v61);
  long long v52 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v51;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_tapbackType;
    *(_WORD *)(v5 + 220) |= 2u;
  }
  uint64_t v53 = [(NSString *)self->_messageType copyWithZone:a3];
  long long v54 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v53;

  uint64_t v55 = [(NSString *)self->_messagesService copyWithZone:a3];
  uint64_t v56 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v55;

  __int16 v57 = (__int16)self->_has;
  if ((v57 & 4) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_messageEffect;
    *(_WORD *)(v5 + 220) |= 4u;
    __int16 v57 = (__int16)self->_has;
  }
  if ((v57 & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 212) = self->_isKnownSender;
    *(_WORD *)(v5 + 220) |= 0x80u;
  }
  uint64_t v58 = [(NSString *)self->_conversationUUID copyWithZone:a3];
  v59 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v58;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_128;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_128;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 110);
  if (*(_WORD *)&self->_has)
  {
    if ((v7 & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_128;
    }
  }
  else if (v7)
  {
    goto LABEL_128;
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 11)
    && !-[NSString isEqual:](conversationId, "isEqual:"))
  {
    goto LABEL_128;
  }
  author = self->_author;
  if ((unint64_t)author | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](author, "isEqual:")) {
      goto LABEL_128;
    }
  }
  suggestedNickname = self->_suggestedNickname;
  if ((unint64_t)suggestedNickname | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](suggestedNickname, "isEqual:")) {
      goto LABEL_128;
    }
  }
  suggestedPhotoPath = self->_suggestedPhotoPath;
  if ((unint64_t)suggestedPhotoPath | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](suggestedPhotoPath, "isEqual:")) {
      goto LABEL_128;
    }
  }
  recipients = self->_recipients;
  if ((unint64_t)recipients | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](recipients, "isEqual:")) {
      goto LABEL_128;
    }
  }
  attachmentURL = self->_attachmentURL;
  if ((unint64_t)attachmentURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](attachmentURL, "isEqual:")) {
      goto LABEL_128;
    }
  }
  content = self->_content;
  if ((unint64_t)content | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](content, "isEqual:")) {
      goto LABEL_128;
    }
  }
  fromHandle = self->_fromHandle;
  if ((unint64_t)fromHandle | *((void *)v4 + 14))
  {
    if (!-[BMPBNamedHandle isEqual:](fromHandle, "isEqual:")) {
      goto LABEL_128;
    }
  }
  toHandles = self->_toHandles;
  if ((unint64_t)toHandles | *((void *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](toHandles, "isEqual:")) {
      goto LABEL_128;
    }
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:")) {
      goto LABEL_128;
    }
  }
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](accountType, "isEqual:")) {
      goto LABEL_128;
    }
  }
  accountHandles = self->_accountHandles;
  if ((unint64_t)accountHandles | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](accountHandles, "isEqual:")) {
      goto LABEL_128;
    }
  }
  attachment = self->_attachment;
  if ((unint64_t)attachment | *((void *)v4 + 6))
  {
    if (!-[BMPBContentAttachment isEqual:](attachment, "isEqual:")) {
      goto LABEL_128;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_128;
    }
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_128;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](personaId, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v25 = *((_WORD *)v4 + 110);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x100) == 0) {
      goto LABEL_128;
    }
    if (self->_isNew)
    {
      if (!*((unsigned char *)v4 + 213)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 213))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x100) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x800) == 0) {
      goto LABEL_128;
    }
    if (self->_isTwoFactorCode)
    {
      if (!*((unsigned char *)v4 + 216)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 216))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x800) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x10) != 0)
  {
    if ((v25 & 0x10) == 0) {
      goto LABEL_128;
    }
    if (self->_isFromMe)
    {
      if (!*((unsigned char *)v4 + 209)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 209))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x10) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0) {
      goto LABEL_128;
    }
    if (self->_isGroupThread)
    {
      if (!*((unsigned char *)v4 + 210)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 210))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 0x40) != 0)
  {
    if ((v25 & 0x40) == 0) {
      goto LABEL_128;
    }
    if (self->_isJunk)
    {
      if (!*((unsigned char *)v4 + 211)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 211))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 0x40) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x400) == 0) {
      goto LABEL_128;
    }
    if (self->_isRead)
    {
      if (!*((unsigned char *)v4 + 215)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 215))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x400) != 0)
  {
    goto LABEL_128;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x200) == 0) {
      goto LABEL_128;
    }
    if (self->_isPinned)
    {
      if (!*((unsigned char *)v4 + 214)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 214))
    {
      goto LABEL_128;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x200) != 0)
  {
    goto LABEL_128;
  }
  if ((has & 8) != 0)
  {
    if ((v25 & 8) == 0) {
      goto LABEL_128;
    }
    if (self->_isBusinessChat)
    {
      if (!*((unsigned char *)v4 + 208)) {
        goto LABEL_128;
      }
    }
    else if (*((unsigned char *)v4 + 208))
    {
      goto LABEL_128;
    }
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_128;
  }
  tapbackAssociatedMessageID = self->_tapbackAssociatedMessageID;
  if ((unint64_t)tapbackAssociatedMessageID | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](tapbackAssociatedMessageID, "isEqual:")) {
      goto LABEL_128;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v27 = *((_WORD *)v4 + 110);
  if ((has & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_tapbackType != *((void *)v4 + 2)) {
      goto LABEL_128;
    }
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_128;
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((void *)v4 + 16)
    && !-[NSString isEqual:](messageType, "isEqual:"))
  {
    goto LABEL_128;
  }
  messagesService = self->_messagesService;
  if ((unint64_t)messagesService | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](messagesService, "isEqual:")) {
      goto LABEL_128;
    }
  }
  __int16 v30 = (__int16)self->_has;
  __int16 v31 = *((_WORD *)v4 + 110);
  if ((v30 & 4) != 0)
  {
    if ((v31 & 4) == 0 || self->_messageEffect != *((_DWORD *)v4 + 30)) {
      goto LABEL_128;
    }
  }
  else if ((v31 & 4) != 0)
  {
    goto LABEL_128;
  }
  if ((v30 & 0x80) == 0)
  {
    if ((v31 & 0x80) == 0) {
      goto LABEL_134;
    }
LABEL_128:
    char v32 = 0;
    goto LABEL_129;
  }
  if ((v31 & 0x80) == 0) {
    goto LABEL_128;
  }
  if (!self->_isKnownSender)
  {
    if (!*((unsigned char *)v4 + 212)) {
      goto LABEL_134;
    }
    goto LABEL_128;
  }
  if (!*((unsigned char *)v4 + 212)) {
    goto LABEL_128;
  }
LABEL_134:
  conversationUUID = self->_conversationUUID;
  if ((unint64_t)conversationUUID | *((void *)v4 + 12)) {
    char v32 = -[NSString isEqual:](conversationUUID, "isEqual:");
  }
  else {
    char v32 = 1;
  }
LABEL_129:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v47 = [(NSString *)self->_uniqueId hash];
  NSUInteger v46 = [(NSString *)self->_domainId hash];
  if (*(_WORD *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v4 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v4 = self->_absoluteTimestamp;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v45 = v10;
  }
  else
  {
    unint64_t v45 = 0;
  }
  NSUInteger v44 = [(NSString *)self->_conversationId hash];
  NSUInteger v43 = [(NSString *)self->_author hash];
  NSUInteger v42 = [(NSString *)self->_suggestedNickname hash];
  NSUInteger v41 = [(NSString *)self->_suggestedPhotoPath hash];
  NSUInteger v40 = [(NSString *)self->_recipients hash];
  NSUInteger v39 = [(NSString *)self->_attachmentURL hash];
  NSUInteger v38 = [(NSString *)self->_content hash];
  unint64_t v37 = [(BMPBNamedHandle *)self->_fromHandle hash];
  uint64_t v36 = [(NSMutableArray *)self->_toHandles hash];
  NSUInteger v35 = [(NSString *)self->_accountIdentifier hash];
  NSUInteger v34 = [(NSString *)self->_accountType hash];
  uint64_t v33 = [(NSMutableArray *)self->_accountHandles hash];
  unint64_t v32 = [(BMPBContentAttachment *)self->_attachment hash];
  NSUInteger v31 = [(NSString *)self->_url hash];
  NSUInteger v30 = [(NSString *)self->_contentProtection hash];
  NSUInteger v29 = [(NSString *)self->_personaId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v28 = 2654435761 * self->_isNew;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_12:
      uint64_t v27 = 2654435761 * self->_isTwoFactorCode;
      if ((has & 0x10) != 0) {
        goto LABEL_13;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v27 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    uint64_t v26 = 2654435761 * self->_isFromMe;
    if ((has & 0x20) != 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v26 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    uint64_t v24 = 2654435761 * self->_isGroupThread;
    if ((has & 0x40) != 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v24 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_15:
    uint64_t v12 = 2654435761 * self->_isJunk;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    uint64_t v13 = 2654435761 * self->_isRead;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_25:
    uint64_t v14 = 0;
    if ((has & 8) != 0) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_isPinned;
  if ((has & 8) != 0)
  {
LABEL_18:
    uint64_t v15 = 2654435761 * self->_isBusinessChat;
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v15 = 0;
LABEL_27:
  NSUInteger v16 = [(NSString *)self->_tapbackAssociatedMessageID hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_tapbackType;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_messageType hash];
  NSUInteger v19 = [(NSString *)self->_messagesService hash];
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 4) != 0)
  {
    uint64_t v21 = 2654435761 * self->_messageEffect;
    if ((v20 & 0x80) != 0) {
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v22 = 0;
    return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v22 ^ [(NSString *)self->_conversationUUID hash];
  }
  uint64_t v21 = 0;
  if ((v20 & 0x80) == 0) {
    goto LABEL_34;
  }
LABEL_32:
  uint64_t v22 = 2654435761 * self->_isKnownSender;
  return v46 ^ v47 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v21 ^ v22 ^ [(NSString *)self->_conversationUUID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 24)) {
    -[BMPBMessagesContentEvent setUniqueId:](self, "setUniqueId:");
  }
  if (*((void *)v4 + 13)) {
    -[BMPBMessagesContentEvent setDomainId:](self, "setDomainId:");
  }
  if (*((_WORD *)v4 + 110))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 11)) {
    -[BMPBMessagesContentEvent setConversationId:](self, "setConversationId:");
  }
  if (*((void *)v4 + 8)) {
    -[BMPBMessagesContentEvent setAuthor:](self, "setAuthor:");
  }
  if (*((void *)v4 + 20)) {
    -[BMPBMessagesContentEvent setSuggestedNickname:](self, "setSuggestedNickname:");
  }
  if (*((void *)v4 + 21)) {
    -[BMPBMessagesContentEvent setSuggestedPhotoPath:](self, "setSuggestedPhotoPath:");
  }
  if (*((void *)v4 + 19)) {
    -[BMPBMessagesContentEvent setRecipients:](self, "setRecipients:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBMessagesContentEvent setAttachmentURL:](self, "setAttachmentURL:");
  }
  if (*((void *)v4 + 9)) {
    -[BMPBMessagesContentEvent setContent:](self, "setContent:");
  }
  fromHandle = self->_fromHandle;
  uint64_t v6 = *((void *)v4 + 14);
  if (fromHandle)
  {
    if (v6) {
      -[BMPBNamedHandle mergeFrom:](fromHandle, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[BMPBMessagesContentEvent setFromHandle:](self, "setFromHandle:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *((id *)v4 + 23);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        [(BMPBMessagesContentEvent *)self addToHandles:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 4)) {
    -[BMPBMessagesContentEvent setAccountIdentifier:](self, "setAccountIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[BMPBMessagesContentEvent setAccountType:](self, "setAccountType:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = *((id *)v4 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        -[BMPBMessagesContentEvent addAccountHandles:](self, "addAccountHandles:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  attachment = self->_attachment;
  uint64_t v18 = *((void *)v4 + 6);
  if (attachment)
  {
    if (v18) {
      -[BMPBContentAttachment mergeFrom:](attachment, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[BMPBMessagesContentEvent setAttachment:](self, "setAttachment:");
  }
  if (*((void *)v4 + 25)) {
    -[BMPBMessagesContentEvent setUrl:](self, "setUrl:");
  }
  if (*((void *)v4 + 10)) {
    -[BMPBMessagesContentEvent setContentProtection:](self, "setContentProtection:");
  }
  if (*((void *)v4 + 18)) {
    -[BMPBMessagesContentEvent setPersonaId:](self, "setPersonaId:");
  }
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x100) != 0)
  {
    self->_isNew = *((unsigned char *)v4 + 213);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v19 = *((_WORD *)v4 + 110);
    if ((v19 & 0x800) == 0)
    {
LABEL_57:
      if ((v19 & 0x10) == 0) {
        goto LABEL_58;
      }
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x800) == 0)
  {
    goto LABEL_57;
  }
  self->_isTwoFactorCode = *((unsigned char *)v4 + 216);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x10) == 0)
  {
LABEL_58:
    if ((v19 & 0x20) == 0) {
      goto LABEL_59;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_isFromMe = *((unsigned char *)v4 + 209);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x20) == 0)
  {
LABEL_59:
    if ((v19 & 0x40) == 0) {
      goto LABEL_60;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_isGroupThread = *((unsigned char *)v4 + 210);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x40) == 0)
  {
LABEL_60:
    if ((v19 & 0x400) == 0) {
      goto LABEL_61;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_isJunk = *((unsigned char *)v4 + 211);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x400) == 0)
  {
LABEL_61:
    if ((v19 & 0x200) == 0) {
      goto LABEL_62;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_isRead = *((unsigned char *)v4 + 215);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v19 = *((_WORD *)v4 + 110);
  if ((v19 & 0x200) == 0)
  {
LABEL_62:
    if ((v19 & 8) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_85:
  self->_isPinned = *((unsigned char *)v4 + 214);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 110) & 8) != 0)
  {
LABEL_63:
    self->_isBusinessChat = *((unsigned char *)v4 + 208);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_64:
  if (*((void *)v4 + 22)) {
    -[BMPBMessagesContentEvent setTapbackAssociatedMessageID:](self, "setTapbackAssociatedMessageID:");
  }
  if ((*((_WORD *)v4 + 110) & 2) != 0)
  {
    self->_tapbackType = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 16)) {
    -[BMPBMessagesContentEvent setMessageType:](self, "setMessageType:");
  }
  if (*((void *)v4 + 17)) {
    -[BMPBMessagesContentEvent setMessagesService:](self, "setMessagesService:");
  }
  __int16 v20 = *((_WORD *)v4 + 110);
  if ((v20 & 4) != 0)
  {
    self->_messageEffect = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 4u;
    __int16 v20 = *((_WORD *)v4 + 110);
  }
  if ((v20 & 0x80) != 0)
  {
    self->_isKnownSender = *((unsigned char *)v4 + 212);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 12)) {
    -[BMPBMessagesContentEvent setConversationUUID:](self, "setConversationUUID:");
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)suggestedNickname
{
  return self->_suggestedNickname;
}

- (void)setSuggestedNickname:(id)a3
{
}

- (NSString)suggestedPhotoPath
{
  return self->_suggestedPhotoPath;
}

- (void)setSuggestedPhotoPath:(id)a3
{
}

- (NSString)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSString)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (BMPBNamedHandle)fromHandle
{
  return self->_fromHandle;
}

- (void)setFromHandle:(id)a3
{
}

- (NSMutableArray)toHandles
{
  return self->_toHandles;
}

- (void)setToHandles:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (NSMutableArray)accountHandles
{
  return self->_accountHandles;
}

- (void)setAccountHandles:(id)a3
{
}

- (BMPBContentAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (BOOL)isTwoFactorCode
{
  return self->_isTwoFactorCode;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BOOL)isGroupThread
{
  return self->_isGroupThread;
}

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

- (NSString)tapbackAssociatedMessageID
{
  return self->_tapbackAssociatedMessageID;
}

- (void)setTapbackAssociatedMessageID:(id)a3
{
}

- (int64_t)tapbackType
{
  return self->_tapbackType;
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (NSString)messagesService
{
  return self->_messagesService;
}

- (void)setMessagesService:(id)a3
{
}

- (int)messageEffect
{
  return self->_messageEffect;
}

- (BOOL)isKnownSender
{
  return self->_isKnownSender;
}

- (NSString)conversationUUID
{
  return self->_conversationUUID;
}

- (void)setConversationUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_tapbackAssociatedMessageID, 0);
  objc_storeStrong((id *)&self->_suggestedPhotoPath, 0);
  objc_storeStrong((id *)&self->_suggestedNickname, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_messagesService, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_conversationUUID, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_accountHandles, 0);
}

@end