@interface BMPBMailContentEvent
+ (Class)accountHandlesType;
+ (Class)attachmentsType;
+ (Class)bccHandlesType;
+ (Class)ccHandlesType;
+ (Class)headersType;
+ (Class)mailboxIdentifiersType;
+ (Class)toHandlesType;
- (BMPBNamedHandle)fromHandle;
- (BMPBNamedHandle)listId;
- (BMPBNamedHandle)replyTo;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasAccountIdentifier;
- (BOOL)hasAccountType;
- (BOOL)hasBcc;
- (BOOL)hasCc;
- (BOOL)hasContentProtection;
- (BOOL)hasConversationId;
- (BOOL)hasDateReceived;
- (BOOL)hasDomainId;
- (BOOL)hasFrom;
- (BOOL)hasFromHandle;
- (BOOL)hasHtmlContent;
- (BOOL)hasHtmlContentData;
- (BOOL)hasIsFlagged;
- (BOOL)hasIsFromMe;
- (BOOL)hasIsFullyDownloaded;
- (BOOL)hasIsJunk;
- (BOOL)hasIsNew;
- (BOOL)hasIsRead;
- (BOOL)hasIsTwoFactorCode;
- (BOOL)hasIsVIP;
- (BOOL)hasListId;
- (BOOL)hasMailCategories;
- (BOOL)hasMessageIdentifier;
- (BOOL)hasPersonaId;
- (BOOL)hasReplyTo;
- (BOOL)hasSecurityMethod;
- (BOOL)hasSubject;
- (BOOL)hasTextContent;
- (BOOL)hasTo;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlagged;
- (BOOL)isFromMe;
- (BOOL)isFullyDownloaded;
- (BOOL)isJunk;
- (BOOL)isNew;
- (BOOL)isRead;
- (BOOL)isTwoFactorCode;
- (BOOL)isVIP;
- (BOOL)readFrom:(id)a3;
- (NSData)htmlContent;
- (NSMutableArray)accountHandles;
- (NSMutableArray)attachments;
- (NSMutableArray)bccHandles;
- (NSMutableArray)ccHandles;
- (NSMutableArray)headers;
- (NSMutableArray)mailboxIdentifiers;
- (NSMutableArray)toHandles;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)bcc;
- (NSString)cc;
- (NSString)contentProtection;
- (NSString)conversationId;
- (NSString)domainId;
- (NSString)from;
- (NSString)htmlContentData;
- (NSString)messageIdentifier;
- (NSString)personaId;
- (NSString)securityMethod;
- (NSString)subject;
- (NSString)textContent;
- (NSString)to;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (double)dateReceived;
- (id)accountHandlesAtIndex:(unint64_t)a3;
- (id)attachmentsAtIndex:(unint64_t)a3;
- (id)bccHandlesAtIndex:(unint64_t)a3;
- (id)ccHandlesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)headersAtIndex:(unint64_t)a3;
- (id)mailboxIdentifiersAtIndex:(unint64_t)a3;
- (id)toHandlesAtIndex:(unint64_t)a3;
- (int)mailCategories;
- (unint64_t)accountHandlesCount;
- (unint64_t)attachmentsCount;
- (unint64_t)bccHandlesCount;
- (unint64_t)ccHandlesCount;
- (unint64_t)hash;
- (unint64_t)headersCount;
- (unint64_t)mailboxIdentifiersCount;
- (unint64_t)toHandlesCount;
- (void)addAccountHandles:(id)a3;
- (void)addAttachments:(id)a3;
- (void)addBccHandles:(id)a3;
- (void)addCcHandles:(id)a3;
- (void)addHeaders:(id)a3;
- (void)addMailboxIdentifiers:(id)a3;
- (void)addToHandles:(id)a3;
- (void)clearAccountHandles;
- (void)clearAttachments;
- (void)clearBccHandles;
- (void)clearCcHandles;
- (void)clearHeaders;
- (void)clearMailboxIdentifiers;
- (void)clearToHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAccountHandles:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBcc:(id)a3;
- (void)setBccHandles:(id)a3;
- (void)setCc:(id)a3;
- (void)setCcHandles:(id)a3;
- (void)setContentProtection:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setDateReceived:(double)a3;
- (void)setDomainId:(id)a3;
- (void)setFrom:(id)a3;
- (void)setFromHandle:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasDateReceived:(BOOL)a3;
- (void)setHasIsFlagged:(BOOL)a3;
- (void)setHasIsFromMe:(BOOL)a3;
- (void)setHasIsFullyDownloaded:(BOOL)a3;
- (void)setHasIsJunk:(BOOL)a3;
- (void)setHasIsNew:(BOOL)a3;
- (void)setHasIsRead:(BOOL)a3;
- (void)setHasIsTwoFactorCode:(BOOL)a3;
- (void)setHasIsVIP:(BOOL)a3;
- (void)setHasMailCategories:(BOOL)a3;
- (void)setHeaders:(id)a3;
- (void)setHtmlContent:(id)a3;
- (void)setHtmlContentData:(id)a3;
- (void)setIsFlagged:(BOOL)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsFullyDownloaded:(BOOL)a3;
- (void)setIsJunk:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setIsTwoFactorCode:(BOOL)a3;
- (void)setIsVIP:(BOOL)a3;
- (void)setListId:(id)a3;
- (void)setMailCategories:(int)a3;
- (void)setMailboxIdentifiers:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setReplyTo:(id)a3;
- (void)setSecurityMethod:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTextContent:(id)a3;
- (void)setTo:(id)a3;
- (void)setToHandles:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBMailContentEvent

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

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (BOOL)hasFrom
{
  return self->_from != 0;
}

- (BOOL)hasTo
{
  return self->_to != 0;
}

- (BOOL)hasCc
{
  return self->_cc != 0;
}

- (BOOL)hasBcc
{
  return self->_bcc != 0;
}

- (void)clearHeaders
{
}

- (void)addHeaders:(id)a3
{
  id v4 = a3;
  headers = self->_headers;
  id v8 = v4;
  if (!headers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_headers;
    self->_headers = v6;

    id v4 = v8;
    headers = self->_headers;
  }
  [(NSMutableArray *)headers addObject:v4];
}

- (unint64_t)headersCount
{
  return [(NSMutableArray *)self->_headers count];
}

- (id)headersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_headers objectAtIndex:a3];
}

+ (Class)headersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (BOOL)hasHtmlContentData
{
  return self->_htmlContentData != 0;
}

- (void)setIsFullyDownloaded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isFullyDownloaded = a3;
}

- (void)setHasIsFullyDownloaded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsFullyDownloaded
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasHtmlContent
{
  return self->_htmlContent != 0;
}

- (BOOL)hasTextContent
{
  return self->_textContent != 0;
}

- (BOOL)hasSecurityMethod
{
  return self->_securityMethod != 0;
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

- (BOOL)hasReplyTo
{
  return self->_replyTo != 0;
}

- (void)clearMailboxIdentifiers
{
}

- (void)addMailboxIdentifiers:(id)a3
{
  id v4 = a3;
  mailboxIdentifiers = self->_mailboxIdentifiers;
  id v8 = v4;
  if (!mailboxIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_mailboxIdentifiers;
    self->_mailboxIdentifiers = v6;

    id v4 = v8;
    mailboxIdentifiers = self->_mailboxIdentifiers;
  }
  [(NSMutableArray *)mailboxIdentifiers addObject:v4];
}

- (unint64_t)mailboxIdentifiersCount
{
  return [(NSMutableArray *)self->_mailboxIdentifiers count];
}

- (id)mailboxIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mailboxIdentifiers objectAtIndex:a3];
}

+ (Class)mailboxIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasListId
{
  return self->_listId != 0;
}

- (BOOL)hasAccountType
{
  return self->_accountType != 0;
}

- (void)clearAttachments
{
}

- (void)addAttachments:(id)a3
{
  id v4 = a3;
  attachments = self->_attachments;
  id v8 = v4;
  if (!attachments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_attachments;
    self->_attachments = v6;

    id v4 = v8;
    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v4];
}

- (unint64_t)attachmentsCount
{
  return [(NSMutableArray *)self->_attachments count];
}

- (id)attachmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attachments objectAtIndex:a3];
}

+ (Class)attachmentsType
{
  return (Class)objc_opt_class();
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

- (void)clearCcHandles
{
}

- (void)addCcHandles:(id)a3
{
  id v4 = a3;
  ccHandles = self->_ccHandles;
  id v8 = v4;
  if (!ccHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_ccHandles;
    self->_ccHandles = v6;

    id v4 = v8;
    ccHandles = self->_ccHandles;
  }
  [(NSMutableArray *)ccHandles addObject:v4];
}

- (unint64_t)ccHandlesCount
{
  return [(NSMutableArray *)self->_ccHandles count];
}

- (id)ccHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ccHandles objectAtIndex:a3];
}

+ (Class)ccHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearBccHandles
{
}

- (void)addBccHandles:(id)a3
{
  id v4 = a3;
  bccHandles = self->_bccHandles;
  id v8 = v4;
  if (!bccHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bccHandles;
    self->_bccHandles = v6;

    id v4 = v8;
    bccHandles = self->_bccHandles;
  }
  [(NSMutableArray *)bccHandles addObject:v4];
}

- (unint64_t)bccHandlesCount
{
  return [(NSMutableArray *)self->_bccHandles count];
}

- (id)bccHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bccHandles objectAtIndex:a3];
}

+ (Class)bccHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)setDateReceived:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_dateReceived = a3;
}

- (void)setHasDateReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDateReceived
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMailCategories:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mailCategories = a3;
}

- (void)setHasMailCategories:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMailCategories
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsNew:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isNew = a3;
}

- (void)setHasIsNew:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsNew
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsTwoFactorCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTwoFactorCode = a3;
}

- (void)setHasIsTwoFactorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTwoFactorCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsRead
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsVIP:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isVIP = a3;
}

- (void)setHasIsVIP:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsVIP
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsFlagged:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_isFlagged = a3;
}

- (void)setHasIsFlagged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsFlagged
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBMailContentEvent;
  id v4 = [(BMPBMailContentEvent *)&v8 description];
  v5 = [(BMPBMailContentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
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
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountIdentifier"];
  }
  messageIdentifier = self->_messageIdentifier;
  if (messageIdentifier) {
    [v4 setObject:messageIdentifier forKey:@"messageIdentifier"];
  }
  frouint64_t m = self->_from;
  if (from) {
    [v4 setObject:from forKey:@"from"];
  }
  to = self->_to;
  if (to) {
    [v4 setObject:to forKey:@"to"];
  }
  cc = self->_cc;
  if (cc) {
    [v4 setObject:cc forKey:@"cc"];
  }
  bcc = self->_bcc;
  if (bcc) {
    [v4 setObject:bcc forKey:@"bcc"];
  }
  if ([(NSMutableArray *)self->_headers count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_headers, "count"));
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v15 = self->_headers;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v96 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v95 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v95 objects:v103 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"headers"];
  }
  subject = self->_subject;
  if (subject) {
    [v4 setObject:subject forKey:@"subject"];
  }
  htmlContentData = self->_htmlContentData;
  if (htmlContentData) {
    [v4 setObject:htmlContentData forKey:@"htmlContentData"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_isFullyDownloaded];
    [v4 setObject:v23 forKey:@"isFullyDownloaded"];
  }
  htmlContent = self->_htmlContent;
  if (htmlContent) {
    [v4 setObject:htmlContent forKey:@"htmlContent"];
  }
  textContent = self->_textContent;
  if (textContent) {
    [v4 setObject:textContent forKey:@"textContent"];
  }
  securityMethod = self->_securityMethod;
  if (securityMethod) {
    [v4 setObject:securityMethod forKey:@"securityMethod"];
  }
  accountHandles = self->_accountHandles;
  if (accountHandles) {
    [v4 setObject:accountHandles forKey:@"accountHandles"];
  }
  replyTo = self->_replyTo;
  if (replyTo)
  {
    v29 = [(BMPBNamedHandle *)replyTo dictionaryRepresentation];
    [v4 setObject:v29 forKey:@"replyTo"];
  }
  mailboxIdentifiers = self->_mailboxIdentifiers;
  if (mailboxIdentifiers) {
    [v4 setObject:mailboxIdentifiers forKey:@"mailboxIdentifiers"];
  }
  listId = self->_listId;
  if (listId)
  {
    v32 = [(BMPBNamedHandle *)listId dictionaryRepresentation];
    [v4 setObject:v32 forKey:@"listId"];
  }
  accountType = self->_accountType;
  if (accountType) {
    [v4 setObject:accountType forKey:@"accountType"];
  }
  if ([(NSMutableArray *)self->_attachments count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_attachments, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v35 = self->_attachments;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v91 objects:v102 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v92;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v92 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v91 + 1) + 8 * j) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v91 objects:v102 count:16];
      }
      while (v37);
    }

    [v4 setObject:v34 forKey:@"attachments"];
  }
  fromHandle = self->_fromHandle;
  if (fromHandle)
  {
    v42 = [(BMPBNamedHandle *)fromHandle dictionaryRepresentation];
    [v4 setObject:v42 forKey:@"fromHandle"];
  }
  if ([(NSMutableArray *)self->_toHandles count])
  {
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_toHandles, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v44 = self->_toHandles;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v87 objects:v101 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v88;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v88 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = [*(id *)(*((void *)&v87 + 1) + 8 * k) dictionaryRepresentation];
          [v43 addObject:v49];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v87 objects:v101 count:16];
      }
      while (v46);
    }

    [v4 setObject:v43 forKey:@"toHandles"];
  }
  if ([(NSMutableArray *)self->_ccHandles count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_ccHandles, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v51 = self->_ccHandles;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v83 objects:v100 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v84;
      do
      {
        for (uint64_t m = 0; m != v53; ++m)
        {
          if (*(void *)v84 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v83 + 1) + 8 * m) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v83 objects:v100 count:16];
      }
      while (v53);
    }

    [v4 setObject:v50 forKey:@"ccHandles"];
  }
  if ([(NSMutableArray *)self->_bccHandles count])
  {
    v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_bccHandles, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v58 = self->_bccHandles;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v79 objects:v99 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v80;
      do
      {
        for (uint64_t n = 0; n != v60; ++n)
        {
          if (*(void *)v80 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * n), "dictionaryRepresentation", (void)v79);
          [v57 addObject:v63];
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v79 objects:v99 count:16];
      }
      while (v60);
    }

    [v4 setObject:v57 forKey:@"bccHandles"];
  }
  contentProtectiouint64_t n = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }
  conversationId = self->_conversationId;
  if (conversationId) {
    [v4 setObject:conversationId forKey:@"conversationId"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v71 = [NSNumber numberWithDouble:self->_dateReceived];
    [v4 setObject:v71 forKey:@"dateReceived"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_96:
      if ((has & 0x80) == 0) {
        goto LABEL_97;
      }
      goto LABEL_107;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_96;
  }
  v72 = objc_msgSend(NSNumber, "numberWithInt:", self->_mailCategories, (void)v79);
  [v4 setObject:v72 forKey:@"mailCategories"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_97:
    if ((has & 0x200) == 0) {
      goto LABEL_98;
    }
    goto LABEL_108;
  }
LABEL_107:
  v73 = objc_msgSend(NSNumber, "numberWithBool:", self->_isNew, (void)v79);
  [v4 setObject:v73 forKey:@"isNew"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_98:
    if ((has & 0x10) == 0) {
      goto LABEL_99;
    }
    goto LABEL_109;
  }
LABEL_108:
  v74 = objc_msgSend(NSNumber, "numberWithBool:", self->_isTwoFactorCode, (void)v79);
  [v4 setObject:v74 forKey:@"isTwoFactorCode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_99:
    if ((has & 0x40) == 0) {
      goto LABEL_100;
    }
    goto LABEL_110;
  }
LABEL_109:
  v75 = objc_msgSend(NSNumber, "numberWithBool:", self->_isFromMe, (void)v79);
  [v4 setObject:v75 forKey:@"isFromMe"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_100:
    if ((has & 0x100) == 0) {
      goto LABEL_101;
    }
    goto LABEL_111;
  }
LABEL_110:
  v76 = objc_msgSend(NSNumber, "numberWithBool:", self->_isJunk, (void)v79);
  [v4 setObject:v76 forKey:@"isJunk"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_101:
    if ((has & 0x400) == 0) {
      goto LABEL_102;
    }
LABEL_112:
    v78 = objc_msgSend(NSNumber, "numberWithBool:", self->_isVIP, (void)v79);
    [v4 setObject:v78 forKey:@"isVIP"];

    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_104;
    }
    goto LABEL_103;
  }
LABEL_111:
  v77 = objc_msgSend(NSNumber, "numberWithBool:", self->_isRead, (void)v79);
  [v4 setObject:v77 forKey:@"isRead"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_112;
  }
LABEL_102:
  if ((has & 8) != 0)
  {
LABEL_103:
    v68 = objc_msgSend(NSNumber, "numberWithBool:", self->_isFlagged, (void)v79);
    [v4 setObject:v68 forKey:@"isFlagged"];
  }
LABEL_104:
  id v69 = v4;

  return v69;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMailContentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
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
  if (self->_accountIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_from) {
    PBDataWriterWriteStringField();
  }
  if (self->_to) {
    PBDataWriterWriteStringField();
  }
  if (self->_cc) {
    PBDataWriterWriteStringField();
  }
  if (self->_bcc) {
    PBDataWriterWriteStringField();
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v5 = self->_headers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v7);
  }

  if (self->_subject) {
    PBDataWriterWriteStringField();
  }
  if (self->_htmlContentData) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_htmlContent) {
    PBDataWriterWriteDataField();
  }
  if (self->_textContent) {
    PBDataWriterWriteStringField();
  }
  if (self->_securityMethod) {
    PBDataWriterWriteStringField();
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v10 = self->_accountHandles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v62 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v12);
  }

  if (self->_replyTo) {
    PBDataWriterWriteSubmessage();
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v15 = self->_mailboxIdentifiers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v17);
  }

  if (self->_listId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_accountType) {
    PBDataWriterWriteStringField();
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v20 = self->_attachments;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v53 objects:v72 count:16];
    }
    while (v22);
  }

  if (self->_fromHandle) {
    PBDataWriterWriteSubmessage();
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v25 = self->_toHandles;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v49 objects:v71 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v50;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v49 objects:v71 count:16];
    }
    while (v27);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v30 = self->_ccHandles;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v45 objects:v70 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v45 objects:v70 count:16];
    }
    while (v32);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v35 = self->_bccHandles;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v41 objects:v69 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v42;
    do
    {
      for (juint64_t j = 0; jj != v37; ++jj)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v41 objects:v69 count:16];
    }
    while (v37);
  }

  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_96:
      if ((has & 0x80) == 0) {
        goto LABEL_97;
      }
      goto LABEL_107;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_96;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_97:
    if ((has & 0x200) == 0) {
      goto LABEL_98;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_98:
    if ((has & 0x10) == 0) {
      goto LABEL_99;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_99:
    if ((has & 0x40) == 0) {
      goto LABEL_100;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_100:
    if ((has & 0x100) == 0) {
      goto LABEL_101;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_101:
    if ((has & 0x400) == 0) {
      goto LABEL_102;
    }
LABEL_112:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_104;
    }
    goto LABEL_103;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_112;
  }
LABEL_102:
  if ((has & 8) != 0) {
LABEL_103:
  }
    PBDataWriterWriteBOOLField();
LABEL_104:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v36 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v36;
  }
  if (self->_domainId)
  {
    objc_msgSend(v36, "setDomainId:");
    id v4 = v36;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((_WORD *)v4 + 128) |= 1u;
  }
  if (self->_accountIdentifier) {
    objc_msgSend(v36, "setAccountIdentifier:");
  }
  if (self->_messageIdentifier) {
    objc_msgSend(v36, "setMessageIdentifier:");
  }
  if (self->_from) {
    objc_msgSend(v36, "setFrom:");
  }
  if (self->_to) {
    objc_msgSend(v36, "setTo:");
  }
  if (self->_cc) {
    objc_msgSend(v36, "setCc:");
  }
  if (self->_bcc) {
    objc_msgSend(v36, "setBcc:");
  }
  if ([(BMPBMailContentEvent *)self headersCount])
  {
    [v36 clearHeaders];
    unint64_t v5 = [(BMPBMailContentEvent *)self headersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBMailContentEvent *)self headersAtIndex:i];
        [v36 addHeaders:v8];
      }
    }
  }
  if (self->_subject) {
    objc_msgSend(v36, "setSubject:");
  }
  v9 = v36;
  if (self->_htmlContentData)
  {
    objc_msgSend(v36, "setHtmlContentData:");
    v9 = v36;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v9[250] = self->_isFullyDownloaded;
    *((_WORD *)v9 + 128) |= 0x20u;
  }
  if (self->_htmlContent) {
    objc_msgSend(v36, "setHtmlContent:");
  }
  if (self->_textContent) {
    objc_msgSend(v36, "setTextContent:");
  }
  if (self->_securityMethod) {
    objc_msgSend(v36, "setSecurityMethod:");
  }
  if ([(BMPBMailContentEvent *)self accountHandlesCount])
  {
    [v36 clearAccountHandles];
    unint64_t v10 = [(BMPBMailContentEvent *)self accountHandlesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(BMPBMailContentEvent *)self accountHandlesAtIndex:j];
        [v36 addAccountHandles:v13];
      }
    }
  }
  if (self->_replyTo) {
    objc_msgSend(v36, "setReplyTo:");
  }
  if ([(BMPBMailContentEvent *)self mailboxIdentifiersCount])
  {
    [v36 clearMailboxIdentifiers];
    unint64_t v14 = [(BMPBMailContentEvent *)self mailboxIdentifiersCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(BMPBMailContentEvent *)self mailboxIdentifiersAtIndex:k];
        [v36 addMailboxIdentifiers:v17];
      }
    }
  }
  if (self->_listId) {
    objc_msgSend(v36, "setListId:");
  }
  if (self->_accountType) {
    objc_msgSend(v36, "setAccountType:");
  }
  if ([(BMPBMailContentEvent *)self attachmentsCount])
  {
    [v36 clearAttachments];
    unint64_t v18 = [(BMPBMailContentEvent *)self attachmentsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(BMPBMailContentEvent *)self attachmentsAtIndex:m];
        [v36 addAttachments:v21];
      }
    }
  }
  if (self->_fromHandle) {
    objc_msgSend(v36, "setFromHandle:");
  }
  if ([(BMPBMailContentEvent *)self toHandlesCount])
  {
    [v36 clearToHandles];
    unint64_t v22 = [(BMPBMailContentEvent *)self toHandlesCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        v25 = [(BMPBMailContentEvent *)self toHandlesAtIndex:n];
        [v36 addToHandles:v25];
      }
    }
  }
  if ([(BMPBMailContentEvent *)self ccHandlesCount])
  {
    [v36 clearCcHandles];
    unint64_t v26 = [(BMPBMailContentEvent *)self ccHandlesCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        v29 = [(BMPBMailContentEvent *)self ccHandlesAtIndex:ii];
        [v36 addCcHandles:v29];
      }
    }
  }
  if ([(BMPBMailContentEvent *)self bccHandlesCount])
  {
    [v36 clearBccHandles];
    unint64_t v30 = [(BMPBMailContentEvent *)self bccHandlesCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (juint64_t j = 0; jj != v31; ++jj)
      {
        uint64_t v33 = [(BMPBMailContentEvent *)self bccHandlesAtIndex:jj];
        [v36 addBccHandles:v33];
      }
    }
  }
  if (self->_contentProtection) {
    objc_msgSend(v36, "setContentProtection:");
  }
  v34 = v36;
  if (self->_personaId)
  {
    objc_msgSend(v36, "setPersonaId:");
    v34 = v36;
  }
  if (self->_conversationId)
  {
    objc_msgSend(v36, "setConversationId:");
    v34 = v36;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v34[2] = *(void *)&self->_dateReceived;
    *((_WORD *)v34 + 128) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_75:
      if ((has & 0x80) == 0) {
        goto LABEL_76;
      }
      goto LABEL_88;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_75;
  }
  *((_DWORD *)v34 + 40) = self->_mailCategories;
  *((_WORD *)v34 + 128) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_76:
    if ((has & 0x200) == 0) {
      goto LABEL_77;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((unsigned char *)v34 + 252) = self->_isNew;
  *((_WORD *)v34 + 128) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_77:
    if ((has & 0x10) == 0) {
      goto LABEL_78;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((unsigned char *)v34 + 254) = self->_isTwoFactorCode;
  *((_WORD *)v34 + 128) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_78:
    if ((has & 0x40) == 0) {
      goto LABEL_79;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)v34 + 249) = self->_isFromMe;
  *((_WORD *)v34 + 128) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_79:
    if ((has & 0x100) == 0) {
      goto LABEL_80;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((unsigned char *)v34 + 251) = self->_isJunk;
  *((_WORD *)v34 + 128) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_80:
    if ((has & 0x400) == 0) {
      goto LABEL_81;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((unsigned char *)v34 + 253) = self->_isRead;
  *((_WORD *)v34 + 128) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_81:
    if ((has & 8) == 0) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }
LABEL_93:
  *((unsigned char *)v34 + 255) = self->_isVIP;
  *((_WORD *)v34 + 128) |= 0x400u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_82:
    *((unsigned char *)v34 + 248) = self->_isFlagged;
    *((_WORD *)v34 + 128) |= 8u;
  }
LABEL_83:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  v9 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v8;

  if (*(_WORD *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_WORD *)(v5 + 256) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_messageIdentifier copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v12;

  uint64_t v14 = [(NSString *)self->_from copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v14;

  uint64_t v16 = [(NSString *)self->_to copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v16;

  uint64_t v18 = [(NSString *)self->_cc copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_bcc copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  unint64_t v22 = self->_headers;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v114 objects:v124 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v115 != v25) {
          objc_enumerationMutation(v22);
        }
        unint64_t v27 = (void *)[*(id *)(*((void *)&v114 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addHeaders:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v114 objects:v124 count:16];
    }
    while (v24);
  }

  uint64_t v28 = [(NSString *)self->_subject copyWithZone:a3];
  v29 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v28;

  uint64_t v30 = [(NSString *)self->_htmlContentData copyWithZone:a3];
  unint64_t v31 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v30;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 250) = self->_isFullyDownloaded;
    *(_WORD *)(v5 + 256) |= 0x20u;
  }
  uint64_t v32 = [(NSData *)self->_htmlContent copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v32;

  uint64_t v34 = [(NSString *)self->_textContent copyWithZone:a3];
  v35 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v34;

  uint64_t v36 = [(NSString *)self->_securityMethod copyWithZone:a3];
  uint64_t v37 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v36;

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v38 = self->_accountHandles;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v111;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v111 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = (void *)[*(id *)(*((void *)&v110 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addAccountHandles:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v110 objects:v123 count:16];
    }
    while (v40);
  }

  id v44 = [(BMPBNamedHandle *)self->_replyTo copyWithZone:a3];
  long long v45 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v44;

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v46 = self->_mailboxIdentifiers;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v106 objects:v122 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v107;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v107 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v106 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addMailboxIdentifiers:v51];
      }
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v106 objects:v122 count:16];
    }
    while (v48);
  }

  id v52 = [(BMPBNamedHandle *)self->_listId copyWithZone:a3];
  long long v53 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v52;

  uint64_t v54 = [(NSString *)self->_accountType copyWithZone:a3];
  long long v55 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v54;

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v56 = self->_attachments;
  uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v103;
    do
    {
      for (uint64_t m = 0; m != v58; ++m)
      {
        if (*(void *)v103 != v59) {
          objc_enumerationMutation(v56);
        }
        long long v61 = (void *)[*(id *)(*((void *)&v102 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addAttachments:v61];
      }
      uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v102 objects:v121 count:16];
    }
    while (v58);
  }

  id v62 = [(BMPBNamedHandle *)self->_fromHandle copyWithZone:a3];
  long long v63 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v62;

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v64 = self->_toHandles;
  uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v98 objects:v120 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v99;
    do
    {
      for (uint64_t n = 0; n != v66; ++n)
      {
        if (*(void *)v99 != v67) {
          objc_enumerationMutation(v64);
        }
        id v69 = (void *)[*(id *)(*((void *)&v98 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addToHandles:v69];
      }
      uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v98 objects:v120 count:16];
    }
    while (v66);
  }

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v70 = self->_ccHandles;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v94 objects:v119 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v95;
    do
    {
      for (iuint64_t i = 0; ii != v72; ++ii)
      {
        if (*(void *)v95 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v5 addCcHandles:v75];
      }
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v94 objects:v119 count:16];
    }
    while (v72);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v76 = self->_bccHandles;
  uint64_t v77 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v90 objects:v118 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v91;
    do
    {
      for (juint64_t j = 0; jj != v78; ++jj)
      {
        if (*(void *)v91 != v79) {
          objc_enumerationMutation(v76);
        }
        long long v81 = objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * jj), "copyWithZone:", a3, (void)v90);
        [(id)v5 addBccHandles:v81];
      }
      uint64_t v78 = [(NSMutableArray *)v76 countByEnumeratingWithState:&v90 objects:v118 count:16];
    }
    while (v78);
  }

  uint64_t v82 = [(NSString *)self->_contentProtection copyWithZone:a3];
  long long v83 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v82;

  uint64_t v84 = [(NSString *)self->_personaId copyWithZone:a3];
  long long v85 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v84;

  uint64_t v86 = [(NSString *)self->_conversationId copyWithZone:a3];
  long long v87 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v86;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_dateReceived;
    *(_WORD *)(v5 + 256) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_56:
      if ((has & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_67;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_56;
  }
  *(_DWORD *)(v5 + 160) = self->_mailCategories;
  *(_WORD *)(v5 + 256) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_57:
    if ((has & 0x200) == 0) {
      goto LABEL_58;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(unsigned char *)(v5 + 252) = self->_isNew;
  *(_WORD *)(v5 + 256) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_58:
    if ((has & 0x10) == 0) {
      goto LABEL_59;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(unsigned char *)(v5 + 254) = self->_isTwoFactorCode;
  *(_WORD *)(v5 + 256) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_59:
    if ((has & 0x40) == 0) {
      goto LABEL_60;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(unsigned char *)(v5 + 249) = self->_isFromMe;
  *(_WORD *)(v5 + 256) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_60:
    if ((has & 0x100) == 0) {
      goto LABEL_61;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(unsigned char *)(v5 + 251) = self->_isJunk;
  *(_WORD *)(v5 + 256) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_61:
    if ((has & 0x400) == 0) {
      goto LABEL_62;
    }
LABEL_72:
    *(unsigned char *)(v5 + 255) = self->_isVIP;
    *(_WORD *)(v5 + 256) |= 0x400u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_63;
  }
LABEL_71:
  *(unsigned char *)(v5 + 253) = self->_isRead;
  *(_WORD *)(v5 + 256) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_72;
  }
LABEL_62:
  if ((has & 8) != 0)
  {
LABEL_63:
    *(unsigned char *)(v5 + 248) = self->_isFlagged;
    *(_WORD *)(v5 + 256) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_130;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_130;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_130;
    }
  }
  __int16 v7 = *((_WORD *)v4 + 128);
  if (*(_WORD *)&self->_has)
  {
    if ((v7 & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_130;
    }
  }
  else if (v7)
  {
    goto LABEL_130;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](accountIdentifier, "isEqual:"))
  {
    goto LABEL_130;
  }
  messageIdentifier = self->_messageIdentifier;
  if ((unint64_t)messageIdentifier | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](messageIdentifier, "isEqual:")) {
      goto LABEL_130;
    }
  }
  frouint64_t m = self->_from;
  if ((unint64_t)from | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](from, "isEqual:")) {
      goto LABEL_130;
    }
  }
  to = self->_to;
  if ((unint64_t)to | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](to, "isEqual:")) {
      goto LABEL_130;
    }
  }
  cc = self->_cc;
  if ((unint64_t)cc | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](cc, "isEqual:")) {
      goto LABEL_130;
    }
  }
  bcc = self->_bcc;
  if ((unint64_t)bcc | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](bcc, "isEqual:")) {
      goto LABEL_130;
    }
  }
  headers = self->_headers;
  if ((unint64_t)headers | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](headers, "isEqual:")) {
      goto LABEL_130;
    }
  }
  subject = self->_subject;
  if ((unint64_t)subject | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](subject, "isEqual:")) {
      goto LABEL_130;
    }
  }
  htmlContentData = self->_htmlContentData;
  if ((unint64_t)htmlContentData | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](htmlContentData, "isEqual:")) {
      goto LABEL_130;
    }
  }
  __int16 v17 = *((_WORD *)v4 + 128);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0) {
      goto LABEL_130;
    }
    if (self->_isFullyDownloaded)
    {
      if (!*((unsigned char *)v4 + 250)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 250))
    {
      goto LABEL_130;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  htmlContent = self->_htmlContent;
  if ((unint64_t)htmlContent | *((void *)v4 + 17)
    && !-[NSData isEqual:](htmlContent, "isEqual:"))
  {
    goto LABEL_130;
  }
  textContent = self->_textContent;
  if ((unint64_t)textContent | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](textContent, "isEqual:")) {
      goto LABEL_130;
    }
  }
  securityMethod = self->_securityMethod;
  if ((unint64_t)securityMethod | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](securityMethod, "isEqual:")) {
      goto LABEL_130;
    }
  }
  accountHandles = self->_accountHandles;
  if ((unint64_t)accountHandles | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](accountHandles, "isEqual:")) {
      goto LABEL_130;
    }
  }
  replyTo = self->_replyTo;
  if ((unint64_t)replyTo | *((void *)v4 + 24))
  {
    if (!-[BMPBNamedHandle isEqual:](replyTo, "isEqual:")) {
      goto LABEL_130;
    }
  }
  mailboxIdentifiers = self->_mailboxIdentifiers;
  if ((unint64_t)mailboxIdentifiers | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](mailboxIdentifiers, "isEqual:")) {
      goto LABEL_130;
    }
  }
  listId = self->_listId;
  if ((unint64_t)listId | *((void *)v4 + 19))
  {
    if (!-[BMPBNamedHandle isEqual:](listId, "isEqual:")) {
      goto LABEL_130;
    }
  }
  accountType = self->_accountType;
  if ((unint64_t)accountType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](accountType, "isEqual:")) {
      goto LABEL_130;
    }
  }
  attachments = self->_attachments;
  if ((unint64_t)attachments | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](attachments, "isEqual:")) {
      goto LABEL_130;
    }
  }
  fromHandle = self->_fromHandle;
  if ((unint64_t)fromHandle | *((void *)v4 + 15))
  {
    if (!-[BMPBNamedHandle isEqual:](fromHandle, "isEqual:")) {
      goto LABEL_130;
    }
  }
  toHandles = self->_toHandles;
  if ((unint64_t)toHandles | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](toHandles, "isEqual:")) {
      goto LABEL_130;
    }
  }
  ccHandles = self->_ccHandles;
  if ((unint64_t)ccHandles | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](ccHandles, "isEqual:")) {
      goto LABEL_130;
    }
  }
  bccHandles = self->_bccHandles;
  if ((unint64_t)bccHandles | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](bccHandles, "isEqual:")) {
      goto LABEL_130;
    }
  }
  contentProtectiouint64_t n = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_130;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](personaId, "isEqual:")) {
      goto LABEL_130;
    }
  }
  conversationId = self->_conversationId;
  if ((unint64_t)conversationId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](conversationId, "isEqual:")) {
      goto LABEL_130;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v35 = *((_WORD *)v4 + 128);
  if ((has & 2) != 0)
  {
    if ((v35 & 2) == 0 || self->_dateReceived != *((double *)v4 + 2)) {
      goto LABEL_130;
    }
  }
  else if ((v35 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_mailCategories != *((_DWORD *)v4 + 40)) {
      goto LABEL_130;
    }
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0) {
      goto LABEL_130;
    }
    if (self->_isNew)
    {
      if (!*((unsigned char *)v4 + 252)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 252))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x80) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x200) == 0) {
      goto LABEL_130;
    }
    if (self->_isTwoFactorCode)
    {
      if (!*((unsigned char *)v4 + 254)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 254))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x10) != 0)
  {
    if ((v35 & 0x10) == 0) {
      goto LABEL_130;
    }
    if (self->_isFromMe)
    {
      if (!*((unsigned char *)v4 + 249)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 249))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x40) != 0)
  {
    if ((v35 & 0x40) == 0) {
      goto LABEL_130;
    }
    if (self->_isJunk)
    {
      if (!*((unsigned char *)v4 + 251)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 251))
    {
      goto LABEL_130;
    }
  }
  else if ((v35 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x100) == 0) {
      goto LABEL_130;
    }
    if (self->_isRead)
    {
      if (!*((unsigned char *)v4 + 253)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 253))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 128) & 0x400) == 0) {
      goto LABEL_130;
    }
    if (self->_isVIP)
    {
      if (!*((unsigned char *)v4 + 255)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 255))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 128) & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 8) != 0)
  {
    if ((v35 & 8) != 0)
    {
      if (self->_isFlagged)
      {
        if (!*((unsigned char *)v4 + 248)) {
          goto LABEL_130;
        }
      }
      else if (*((unsigned char *)v4 + 248))
      {
        goto LABEL_130;
      }
      BOOL v36 = 1;
      goto LABEL_131;
    }
LABEL_130:
    BOOL v36 = 0;
    goto LABEL_131;
  }
  BOOL v36 = (v35 & 8) == 0;
LABEL_131:

  return v36;
}

- (unint64_t)hash
{
  NSUInteger v54 = [(NSString *)self->_uniqueId hash];
  NSUInteger v53 = [(NSString *)self->_domainId hash];
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
    unint64_t v52 = v10;
  }
  else
  {
    unint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_accountIdentifier hash];
  NSUInteger v50 = [(NSString *)self->_messageIdentifier hash];
  NSUInteger v49 = [(NSString *)self->_from hash];
  NSUInteger v48 = [(NSString *)self->_to hash];
  NSUInteger v47 = [(NSString *)self->_cc hash];
  NSUInteger v46 = [(NSString *)self->_bcc hash];
  uint64_t v45 = [(NSMutableArray *)self->_headers hash];
  NSUInteger v44 = [(NSString *)self->_subject hash];
  NSUInteger v43 = [(NSString *)self->_htmlContentData hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v42 = 2654435761 * self->_isFullyDownloaded;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v41 = [(NSData *)self->_htmlContent hash];
  NSUInteger v40 = [(NSString *)self->_textContent hash];
  NSUInteger v39 = [(NSString *)self->_securityMethod hash];
  uint64_t v38 = [(NSMutableArray *)self->_accountHandles hash];
  unint64_t v37 = [(BMPBNamedHandle *)self->_replyTo hash];
  uint64_t v36 = [(NSMutableArray *)self->_mailboxIdentifiers hash];
  unint64_t v35 = [(BMPBNamedHandle *)self->_listId hash];
  NSUInteger v34 = [(NSString *)self->_accountType hash];
  uint64_t v11 = [(NSMutableArray *)self->_attachments hash];
  unint64_t v12 = [(BMPBNamedHandle *)self->_fromHandle hash];
  uint64_t v13 = [(NSMutableArray *)self->_toHandles hash];
  uint64_t v14 = [(NSMutableArray *)self->_ccHandles hash];
  uint64_t v15 = [(NSMutableArray *)self->_bccHandles hash];
  NSUInteger v16 = [(NSString *)self->_contentProtection hash];
  NSUInteger v17 = [(NSString *)self->_personaId hash];
  NSUInteger v18 = [(NSString *)self->_conversationId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    double dateReceived = self->_dateReceived;
    double v22 = -dateReceived;
    if (dateReceived >= 0.0) {
      double v22 = self->_dateReceived;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v25 = 2654435761 * self->_mailCategories;
    if ((has & 0x80) != 0)
    {
LABEL_23:
      uint64_t v26 = 2654435761 * self->_isNew;
      if ((has & 0x200) != 0) {
        goto LABEL_24;
      }
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_23;
    }
  }
  uint64_t v26 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_24:
    uint64_t v27 = 2654435761 * self->_isTwoFactorCode;
    if ((has & 0x10) != 0) {
      goto LABEL_25;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v27 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_25:
    uint64_t v28 = 2654435761 * self->_isFromMe;
    if ((has & 0x40) != 0) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v28 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_26:
    uint64_t v29 = 2654435761 * self->_isJunk;
    if ((has & 0x100) != 0) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v29 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_27:
    uint64_t v30 = 2654435761 * self->_isRead;
    if ((has & 0x400) != 0) {
      goto LABEL_28;
    }
LABEL_36:
    uint64_t v31 = 0;
    if ((has & 8) != 0) {
      goto LABEL_29;
    }
LABEL_37:
    uint64_t v32 = 0;
    return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32;
  }
LABEL_35:
  uint64_t v30 = 0;
  if ((has & 0x400) == 0) {
    goto LABEL_36;
  }
LABEL_28:
  uint64_t v31 = 2654435761 * self->_isVIP;
  if ((has & 8) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  uint64_t v32 = 2654435761 * self->_isFlagged;
  return v53 ^ v54 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 30)) {
    -[BMPBMailContentEvent setUniqueId:](self, "setUniqueId:");
  }
  if (*((void *)v4 + 13)) {
    -[BMPBMailContentEvent setDomainId:](self, "setDomainId:");
  }
  if (*((_WORD *)v4 + 128))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[BMPBMailContentEvent setAccountIdentifier:](self, "setAccountIdentifier:");
  }
  if (*((void *)v4 + 22)) {
    -[BMPBMailContentEvent setMessageIdentifier:](self, "setMessageIdentifier:");
  }
  if (*((void *)v4 + 14)) {
    -[BMPBMailContentEvent setFrom:](self, "setFrom:");
  }
  if (*((void *)v4 + 28)) {
    -[BMPBMailContentEvent setTo:](self, "setTo:");
  }
  if (*((void *)v4 + 9)) {
    -[BMPBMailContentEvent setCc:](self, "setCc:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBMailContentEvent setBcc:](self, "setBcc:");
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v5 = *((id *)v4 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BMPBMailContentEvent *)self addHeaders:*(void *)(*((void *)&v71 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 26)) {
    -[BMPBMailContentEvent setSubject:](self, "setSubject:");
  }
  if (*((void *)v4 + 18)) {
    -[BMPBMailContentEvent setHtmlContentData:](self, "setHtmlContentData:");
  }
  if ((*((_WORD *)v4 + 128) & 0x20) != 0)
  {
    self->_isFullyDownloaded = *((unsigned char *)v4 + 250);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 17)) {
    -[BMPBMailContentEvent setHtmlContent:](self, "setHtmlContent:");
  }
  if (*((void *)v4 + 27)) {
    -[BMPBMailContentEvent setTextContent:](self, "setTextContent:");
  }
  if (*((void *)v4 + 25)) {
    -[BMPBMailContentEvent setSecurityMethod:](self, "setSecurityMethod:");
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(v10);
        }
        [(BMPBMailContentEvent *)self addAccountHandles:*(void *)(*((void *)&v67 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v12);
  }

  replyTo = self->_replyTo;
  uint64_t v16 = *((void *)v4 + 24);
  if (replyTo)
  {
    if (v16) {
      -[BMPBNamedHandle mergeFrom:](replyTo, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[BMPBMailContentEvent setReplyTo:](self, "setReplyTo:");
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v17 = *((id *)v4 + 21);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        [(BMPBMailContentEvent *)self addMailboxIdentifiers:*(void *)(*((void *)&v63 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
    }
    while (v19);
  }

  listId = self->_listId;
  uint64_t v23 = *((void *)v4 + 19);
  if (listId)
  {
    if (v23) {
      -[BMPBNamedHandle mergeFrom:](listId, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[BMPBMailContentEvent setListId:](self, "setListId:");
  }
  if (*((void *)v4 + 5)) {
    -[BMPBMailContentEvent setAccountType:](self, "setAccountType:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v24 = *((id *)v4 + 6);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v78 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v60 != v27) {
          objc_enumerationMutation(v24);
        }
        [(BMPBMailContentEvent *)self addAttachments:*(void *)(*((void *)&v59 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v59 objects:v78 count:16];
    }
    while (v26);
  }

  fromHandle = self->_fromHandle;
  uint64_t v30 = *((void *)v4 + 15);
  if (fromHandle)
  {
    if (v30) {
      -[BMPBNamedHandle mergeFrom:](fromHandle, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[BMPBMailContentEvent setFromHandle:](self, "setFromHandle:");
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v31 = *((id *)v4 + 29);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v77 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v56;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v31);
        }
        [(BMPBMailContentEvent *)self addToHandles:*(void *)(*((void *)&v55 + 1) + 8 * n)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v77 count:16];
    }
    while (v33);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v36 = *((id *)v4 + 10);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v51 objects:v76 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v52;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(v36);
        }
        [(BMPBMailContentEvent *)self addCcHandles:*(void *)(*((void *)&v51 + 1) + 8 * ii)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v51 objects:v76 count:16];
    }
    while (v38);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v41 = *((id *)v4 + 8);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v48;
    do
    {
      for (juint64_t j = 0; jj != v43; ++jj)
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(v41);
        }
        -[BMPBMailContentEvent addBccHandles:](self, "addBccHandles:", *(void *)(*((void *)&v47 + 1) + 8 * jj), (void)v47);
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
    }
    while (v43);
  }

  if (*((void *)v4 + 11)) {
    -[BMPBMailContentEvent setContentProtection:](self, "setContentProtection:");
  }
  if (*((void *)v4 + 23)) {
    -[BMPBMailContentEvent setPersonaId:](self, "setPersonaId:");
  }
  if (*((void *)v4 + 12)) {
    -[BMPBMailContentEvent setConversationId:](self, "setConversationId:");
  }
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 2) != 0)
  {
    self->_double dateReceived = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v46 = *((_WORD *)v4 + 128);
    if ((v46 & 4) == 0)
    {
LABEL_105:
      if ((v46 & 0x80) == 0) {
        goto LABEL_106;
      }
      goto LABEL_116;
    }
  }
  else if ((v46 & 4) == 0)
  {
    goto LABEL_105;
  }
  self->_mailCategories = *((_DWORD *)v4 + 40);
  *(_WORD *)&self->_has |= 4u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x80) == 0)
  {
LABEL_106:
    if ((v46 & 0x200) == 0) {
      goto LABEL_107;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_isNew = *((unsigned char *)v4 + 252);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x200) == 0)
  {
LABEL_107:
    if ((v46 & 0x10) == 0) {
      goto LABEL_108;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_isTwoFactorCode = *((unsigned char *)v4 + 254);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x10) == 0)
  {
LABEL_108:
    if ((v46 & 0x40) == 0) {
      goto LABEL_109;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_isFromMe = *((unsigned char *)v4 + 249);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x40) == 0)
  {
LABEL_109:
    if ((v46 & 0x100) == 0) {
      goto LABEL_110;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_isJunuint64_t k = *((unsigned char *)v4 + 251);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x100) == 0)
  {
LABEL_110:
    if ((v46 & 0x400) == 0) {
      goto LABEL_111;
    }
LABEL_121:
    self->_isVIP = *((unsigned char *)v4 + 255);
    *(_WORD *)&self->_has |= 0x400u;
    if ((*((_WORD *)v4 + 128) & 8) == 0) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
LABEL_120:
  self->_isRead = *((unsigned char *)v4 + 253);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v46 = *((_WORD *)v4 + 128);
  if ((v46 & 0x400) != 0) {
    goto LABEL_121;
  }
LABEL_111:
  if ((v46 & 8) != 0)
  {
LABEL_112:
    self->_isFlagged = *((unsigned char *)v4 + 248);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_113:
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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSString)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSString)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
}

- (NSString)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
}

- (NSMutableArray)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
}

- (BOOL)isFullyDownloaded
{
  return self->_isFullyDownloaded;
}

- (NSData)htmlContent
{
  return self->_htmlContent;
}

- (void)setHtmlContent:(id)a3
{
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
}

- (NSString)securityMethod
{
  return self->_securityMethod;
}

- (void)setSecurityMethod:(id)a3
{
}

- (NSMutableArray)accountHandles
{
  return self->_accountHandles;
}

- (void)setAccountHandles:(id)a3
{
}

- (BMPBNamedHandle)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
}

- (NSMutableArray)mailboxIdentifiers
{
  return self->_mailboxIdentifiers;
}

- (void)setMailboxIdentifiers:(id)a3
{
}

- (BMPBNamedHandle)listId
{
  return self->_listId;
}

- (void)setListId:(id)a3
{
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
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

- (NSMutableArray)ccHandles
{
  return self->_ccHandles;
}

- (void)setCcHandles:(id)a3
{
}

- (NSMutableArray)bccHandles
{
  return self->_bccHandles;
}

- (void)setBccHandles:(id)a3
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

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (double)dateReceived
{
  return self->_dateReceived;
}

- (int)mailCategories
{
  return self->_mailCategories;
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

- (BOOL)isJunk
{
  return self->_isJunk;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (BOOL)isFlagged
{
  return self->_isFlagged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_toHandles, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_securityMethod, 0);
  objc_storeStrong((id *)&self->_replyTo, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_mailboxIdentifiers, 0);
  objc_storeStrong((id *)&self->_listId, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_fromHandle, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_ccHandles, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_bccHandles, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_accountHandles, 0);
}

@end