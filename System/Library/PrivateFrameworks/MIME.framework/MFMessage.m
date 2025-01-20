@interface MFMessage
+ (Class)dataMessageStoreToUse;
+ (id)messageWithRFC822Data:(id)a3;
+ (id)messageWithRFC822Data:(id)a3 forMailboxUID:(id)a4;
+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4;
+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4 generateMessageIDHash:(BOOL)a5;
+ (void)setMessageClassForStore:(id)a3;
- (BOOL)_doesDateAppearToBeSane:(id)a3;
- (BOOL)calculatedNumberOfAttachments;
- (BOOL)canBeTriaged;
- (BOOL)fetchDataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 isComplete:(BOOL *)a6 downloadIfNecessary:(BOOL)a7;
- (BOOL)isLibraryMessage;
- (BOOL)isMessageContentsLocallyAvailable;
- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (BOOL)needsDateReceived;
- (BOOL)strongParentPart;
- (BOOL)updateSubjectFromEncryptedContent;
- (ECAngleBracketIDHash)listIDHash;
- (ECSubject)subject;
- (ECSubject)subjectIfAvailable;
- (MFMessage)init;
- (MFMessageHeaders)headersIfAvailable;
- (MFMessageStore)messageStore;
- (MFMimePart)parentPart;
- (MFMimePart)strongParentPartReference;
- (NSArray)bcc;
- (NSArray)bccIfCached;
- (NSArray)cc;
- (NSArray)ccIfCached;
- (NSArray)to;
- (NSArray)toIfCached;
- (NSData)headerData;
- (NSData)headerDataIfAvailable;
- (NSDate)dateReceived;
- (NSDate)dateSent;
- (NSString)ef_publicDescription;
- (NSString)externalID;
- (NSString)summary;
- (NSURL)externalReference;
- (NSUUID)documentID;
- (double)dateReceivedAsTimeIntervalSince1970;
- (double)dateSentAsTimeIntervalSince1970;
- (id)_copyDateFromDateHeaderInHeaders:(id)a3;
- (id)_copyDateFromReceivedHeadersInHeaders:(id)a3;
- (id)_privacySafeDescription;
- (id)additionalHeadersForForward;
- (id)additionalHeadersForReply;
- (id)bestAlternativeInPart:(id)a3;
- (id)bodyData;
- (id)bodyDataIsComplete:(BOOL *)a3;
- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4;
- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4 downloadIfNecessary:(BOOL)a5;
- (id)contentType;
- (id)dataConsumerForMimePart:(id)a3;
- (id)dataForMimePart:(id)a3;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)dataPathForMimePart:(id)a3;
- (id)defaultAlternativeInPart:(id)a3;
- (id)firstSender;
- (id)headerDataDownloadIfNecessary:(BOOL)a3;
- (id)headers;
- (id)messageBody;
- (id)messageBodyIfAvailable;
- (id)messageBodyIfAvailableUpdatingFlags:(BOOL)a3;
- (id)messageBodyUpdatingFlags:(BOOL)a3;
- (id)messageData;
- (id)messageDataHolder;
- (id)messageDataHolderIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4;
- (id)messageDataIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4;
- (id)messageDataIsPartial:(BOOL *)a3;
- (id)messageID;
- (id)messageIDHeader;
- (id)messageIDHeaderHash;
- (id)messageIDHeaderInFortyBytesOrLess;
- (id)messageURL;
- (id)path;
- (id)persistentID;
- (id)preferredEmailAddressToReplyWith;
- (id)senderAddressComment;
- (id)senders;
- (id)sendersIfCached;
- (id)uniqueArray:(id)a3 withStore:(id)a4;
- (int64_t)_messageIDHeaderHashIvar;
- (int64_t)conversationID;
- (int64_t)generationCompare:(id)a3;
- (int64_t)messageIDHash;
- (unint64_t)fileSize;
- (unint64_t)generationNumber;
- (unint64_t)messageSize;
- (unint64_t)numberOfAttachments;
- (unsigned)preferredEncoding;
- (unsigned)uid;
- (void)_setDateReceivedFromHeaders:(id)a3;
- (void)_setDateSentFromHeaders:(id)a3;
- (void)calculateAttachmentInfoFromBody:(id)a3;
- (void)loadCachedHeaderValuesFromHeaders:(id)a3;
- (void)setBcc:(id)a3;
- (void)setCc:(id)a3;
- (void)setContentType:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setDateReceivedAsTimeIntervalSince1970:(double)a3;
- (void)setDateSentAsTimeIntervalSince1970:(double)a3;
- (void)setDocumentID:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setGenerationNumber:(unint64_t)a3;
- (void)setListIDHash:(id)a3;
- (void)setMessageIDHash:(int64_t)a3;
- (void)setMessageIDHeader:(id)a3;
- (void)setMessageInfo:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceivedTimeIntervalSince1970:(double)a8 dateSentTimeIntervalSince1970:(double)a9 messageIDHash:(int64_t)a10 conversationID:(int64_t)a11 summary:(id)a12;
- (void)setMessagePropertiesFromMessage:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setMessageURL:(id)a3;
- (void)setNumberOfAttachments:(unint64_t)a3;
- (void)setNumberOfAttachments:(unint64_t)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5;
- (void)setParentPart:(id)a3;
- (void)setPreferredEncoding:(unsigned int)a3;
- (void)setSender:(id)a3;
- (void)setStrongParentPart:(BOOL)a3;
- (void)setStrongParentPartReference:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10;
- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11;
- (void)setTo:(id)a3;
- (void)updateSubjectFromEncryptedContent;
@end

@implementation MFMessage

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10 withOptions:(unsigned int)a11
{
  id v41 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  v23 = (NSString *)a10;
  v24 = [(MFMessage *)self messageStore];
  if (v24)
  {
    if (v19)
    {
      uint64_t v25 = [(MFMessage *)self uniqueArray:v19 withStore:v24];

      id v19 = (id)v25;
    }
    if (v20)
    {
      uint64_t v26 = [(MFMessage *)self uniqueArray:v20 withStore:v24];

      id v20 = (id)v26;
    }
    if (v21)
    {
      uint64_t v27 = [(MFMessage *)self uniqueArray:v21 withStore:v24];

      id v21 = (id)v27;
    }
    if (v22)
    {
      uint64_t v28 = [(MFMessage *)self uniqueArray:v22 withStore:v24];

      id v22 = (id)v28;
    }
  }
  _MFLockGlobalLock();
  self->_dateSentInterval = a9;
  self->_dateReceivedInterval = a8;
  if (a11)
  {
    v29 = (ECSubject *)[objc_alloc(MEMORY[0x1E4F608E0]) initWithString:v41];
    subject = self->_subject;
    self->_subject = v29;
  }
  if ((a11 & 2) != 0)
  {
    if (([(NSArray *)self->_to isEqual:v19] & 1) == 0)
    {
      v31 = (NSArray *)[v19 copy];
      to = self->_to;
      self->_to = v31;
    }
    if (([(NSArray *)self->_cc isEqual:v20] & 1) == 0)
    {
      v33 = (NSArray *)[v20 copy];
      cc = self->_cc;
      self->_cc = v33;
    }
    if (([(NSArray *)self->_bcc isEqual:v21] & 1) == 0)
    {
      v35 = (NSArray *)[v21 copy];
      bcc = self->_bcc;
      self->_bcc = v35;
    }
  }
  if ((a11 & 4) != 0 && ([(NSArray *)self->_sender isEqual:v22] & 1) == 0)
  {
    v37 = (NSArray *)[v22 copy];
    sender = self->_sender;
    self->_sender = v37;
  }
  if ((a11 & 8) != 0 && self->_summary != v23)
  {
    v39 = (NSString *)[(NSString *)v23 copy];
    summary = self->_summary;
    self->_summary = v39;
  }
  _MFUnlockGlobalLock();
}

- (id)uniqueArray:(id)a3 withStore:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(v6, "uniquedString:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (id)messageBodyIfAvailableUpdatingFlags:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFMessage *)self messageStore];
  id v6 = [v5 bodyForMessage:self fetchIfNotAvailable:0 updateFlags:v3];

  return v6;
}

- (id)headerDataDownloadIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFMessage *)self messageStore];
  if (v3) {
    uint64_t v6 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [v5 headerDataForMessage:self downloadIfNecessary:v6];

  return v7;
}

- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4 downloadIfNecessary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [(MFMessage *)self messageStore];
  if (v5) {
    uint64_t v10 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = [v9 bodyDataForMessage:self isComplete:a3 isPartial:a4 downloadIfNecessary:v10];

  return v11;
}

- (MFMessageStore)messageStore
{
  _MFLockGlobalLock();
  BOOL v3 = self->_store;
  _MFUnlockGlobalLock();
  return v3;
}

- (id)headers
{
  BOOL v3 = [(MFMessage *)self messageStore];
  v4 = [v3 headersForMessage:self fetchIfNotAvailable:_ECIsNetworkActivityAllowed()];

  return v4;
}

- (MFMessageHeaders)headersIfAvailable
{
  BOOL v3 = [(MFMessage *)self messageStore];
  v4 = [v3 headersForMessage:self fetchIfNotAvailable:0];

  return (MFMessageHeaders *)v4;
}

- (NSString)externalID
{
  _MFLockGlobalLock();
  BOOL v3 = self->_externalID;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setGenerationNumber:(unint64_t)a3
{
}

- (id)messageURL
{
  BOOL v3 = [(MFMessage *)self parentPart];
  v4 = [v3 attachmentURLs];
  BOOL v5 = [v4 lastObject];

  p_messageURL = &self->_messageURL;
  messageURL = self->_messageURL;
  if (!messageURL)
  {
    if (!v5)
    {
      id v8 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v9 = NSString;
      uint64_t v10 = [(MFMessage *)self messageID];
      v11 = [v9 stringWithFormat:@"x-attach://%@", v10];
      BOOL v5 = [v8 URLWithString:v11];
    }
    objc_storeStrong((id *)p_messageURL, v5);
    messageURL = *p_messageURL;
  }
  v12 = messageURL;

  return v12;
}

- (MFMimePart)parentPart
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentPart);
  return (MFMimePart *)WeakRetained;
}

- (NSDate)dateReceived
{
  _MFLockGlobalLock();
  unsigned int dateReceivedInterval = self->_dateReceivedInterval;
  if (!dateReceivedInterval)
  {
    _MFUnlockGlobalLock();
    v4 = [(MFMessage *)self headers];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    unsigned int dateReceivedInterval = self->_dateReceivedInterval;
  }
  BOOL v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)dateReceivedInterval];
  _MFUnlockGlobalLock();
  return (NSDate *)v5;
}

- (id)_privacySafeDescription
{
  _MFLockGlobalLock();
  LODWORD(v3) = self->_dateReceivedInterval;
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v3];
  _MFUnlockGlobalLock();
  BOOL v5 = NSString;
  uint64_t v6 = objc_opt_class();
  [(MFMessage *)self conversationID];
  v7 = EFStringWithInt64();
  id v8 = EFStringWithInt64();
  uint64_t v9 = [v5 stringWithFormat:@"<%@ %p> ConversationID:%@ messageID:%@ received:%@", v6, self, v7, v8, v4];

  return v9;
}

- (int64_t)conversationID
{
  _MFLockGlobalLock();
  int64_t conversationID = self->_conversationID;
  _MFUnlockGlobalLock();
  return conversationID;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  if (v4) {
    [(MFMessage *)self description];
  }
  else {
  BOOL v5 = [(MFMessage *)self _privacySafeDescription];
  }
  return (NSString *)v5;
}

- (void)setMessageIDHash:(int64_t)a3
{
  _MFLockGlobalLock();
  self->_messageIDHeaderHash = a3;
  _MFUnlockGlobalLock();
}

- (id)messageIDHeader
{
  _MFLockGlobalLock();
  unint64_t v3 = self->_cachedMessageIDHeader;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    int v4 = [(MFMessage *)self headers];
    BOOL v5 = [v4 firstHeaderForKey:*MEMORY[0x1E4F606F0]];
    [(MFMessage *)self setMessageIDHeader:v5];

    _MFLockGlobalLock();
    unint64_t v3 = self->_cachedMessageIDHeader;
    _MFUnlockGlobalLock();
  }
  return v3;
}

- (void)setMessageIDHeader:(id)a3
{
  id v6 = a3;
  _MFLockGlobalLock();
  int v4 = (NSString *)[v6 copy];
  cachedMessageIDHeader = self->_cachedMessageIDHeader;
  self->_cachedMessageIDHeader = v4;

  _MFUnlockGlobalLock();
}

- (NSDate)dateSent
{
  _MFLockGlobalLock();
  unsigned int dateSentInterval = self->_dateSentInterval;
  _MFUnlockGlobalLock();
  if (!dateSentInterval)
  {
    int v4 = [(MFMessage *)self headers];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    unsigned int dateSentInterval = self->_dateSentInterval;
    _MFUnlockGlobalLock();
  }
  BOOL v5 = (void *)MEMORY[0x1E4F1C9C8];
  return (NSDate *)[v5 dateWithTimeIntervalSince1970:(double)dateSentInterval];
}

- (NSArray)cc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __15__MFMessage_cc__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  v2 = _cachedIvarLoadFromHeaders(self, 1, v4);
  return (NSArray *)v2;
}

- (id)sendersIfCached
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__MFMessage_sendersIfCached__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  v2 = _cachedIvarLoadFromHeaders(self, 0, v4);
  return v2;
}

- (NSArray)to
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __15__MFMessage_to__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  v2 = _cachedIvarLoadFromHeaders(self, 1, v4);
  return (NSArray *)v2;
}

- (NSArray)bcc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __16__MFMessage_bcc__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  v2 = _cachedIvarLoadFromHeaders(self, 1, v4);
  return (NSArray *)v2;
}

id __28__MFMessage_sendersIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 72);
}

id __16__MFMessage_bcc__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

id __15__MFMessage_to__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __15__MFMessage_cc__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

- (id)bestAlternativeInPart:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMessage *)self messageStore];
  id v6 = [v5 bestAlternativeForPart:v4];

  return v6;
}

- (void)setConversationID:(int64_t)a3
{
  _MFLockGlobalLock();
  if (self->_conversationID != a3) {
    self->_int64_t conversationID = a3;
  }
  _MFUnlockGlobalLock();
}

- (MFMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessage;
  result = [(MFMessage *)&v3 init];
  if (result)
  {
    result->_preferredEncoding = -1;
    atomic_store(0, &result->_generationNumber);
  }
  return result;
}

- (void)setListIDHash:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_listIDHash, a3);
  _MFUnlockGlobalLock();
}

- (void)setExternalID:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_externalID, a3);
  _MFUnlockGlobalLock();
}

- (ECSubject)subject
{
  _MFLockGlobalLock();
  objc_super v3 = self->_subject;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    id v4 = [(MFMessage *)self headers];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    objc_super v3 = self->_subject;
    _MFUnlockGlobalLock();
  }
  return v3;
}

- (BOOL)fetchDataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 isComplete:(BOOL *)a6 downloadIfNecessary:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  char v22 = 0;
  long long v15 = [MFProgressFilterDataConsumer alloc];
  v23[0] = v14;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  long long v17 = [(MFBaseFilterDataConsumer *)v15 initWithConsumers:v16];

  v18 = [(MFMessage *)self messageStore];
  if (v7) {
    uint64_t v19 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v19 = 0;
  }
  objc_msgSend(v18, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", v13, location, length, a6, v17, v19, &v22);

  BOOL v20 = v22 != 0;
  return v20;
}

- (void)setContentType:(id)a3
{
  id v9 = a3;
  id v4 = [(MFMessage *)self messageStore];
  id v5 = v4;
  if (v9 && v4)
  {
    uint64_t v6 = [v4 uniquedString:v9];

    id v9 = (id)v6;
  }

  _MFLockGlobalLock();
  BOOL v7 = (NSString *)[v9 copy];
  contentType = self->_contentType;
  self->_contentType = v7;

  _MFUnlockGlobalLock();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_strongParentPartReference, 0);
  objc_storeStrong((id *)&self->_cachedMessageIDHeader, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_destroyWeak((id *)&self->_parentPart);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_listIDHash, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_senderAddressComment, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

+ (Class)dataMessageStoreToUse
{
  return (Class)objc_opt_class();
}

+ (id)messageWithRFC822Data:(id)a3
{
  objc_super v3 = [a1 messageWithRFC822Data:a3 withParentPart:0];
  return v3;
}

+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4
{
  id v4 = [a1 messageWithRFC822Data:a3 withParentPart:a4 generateMessageIDHash:0];
  return v4;
}

+ (id)messageWithRFC822Data:(id)a3 forMailboxUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "dataMessageStoreToUse")), "initWithData:", v6);
  [v8 setMailboxUid:v7];
  [a1 setMessageClassForStore:v8];
  id v9 = [v8 message];
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];

  v12 = (void *)MEMORY[0x1E4F1CB10];
  id v13 = [NSString stringWithFormat:@"%@://%@", @"x-attach-RFC822", v11];
  id v14 = [v12 URLWithString:v13];
  [v9 setMessageURL:v14];

  return v9;
}

+ (id)messageWithRFC822Data:(id)a3 withParentPart:(id)a4 generateMessageIDHash:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "dataMessageStoreToUse")), "initWithData:", v8);
  [a1 setMessageClassForStore:v10];
  v11 = [v10 message];
  [v11 setParentPart:v9];
  v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];

  id v14 = (void *)MEMORY[0x1E4F1CB10];
  long long v15 = [NSString stringWithFormat:@"%@://%@", @"x-attach-RFC822", v13];
  long long v16 = [v14 URLWithString:v15];
  [v11 setMessageURL:v16];

  if (v5 && ![v11 messageIDHash])
  {
    long long v17 = [v11 headers];
    objc_msgSend(v11, "setMessageIDHash:", MFMessageIDHashFromHeaders(v17, 1));
  }
  v18 = [v11 headers];
  uint64_t v19 = [v18 firstHeaderForKey:*MEMORY[0x1E4F60780]];

  if (v19)
  {
    BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v19];
    [v11 setDocumentID:v20];
  }
  return v11;
}

+ (void)setMessageClassForStore:(id)a3
{
  id v3 = a3;
  [v3 setMessageClass:objc_opt_class()];
}

- (BOOL)strongParentPart
{
  v2 = [(MFMessage *)self strongParentPartReference];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setStrongParentPart:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = [(MFMessage *)self parentPart];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(MFMessage *)self setStrongParentPartReference:v5];
  if (v3)
  {
  }
}

- (void)setParentPart:(id)a3
{
  objc_storeWeak((id *)&self->_parentPart, a3);
  [(MFMessage *)self setStrongParentPart:a3 != 0];
}

- (void)setMessageStore:(id)a3
{
  id v6 = a3;
  _MFLockGlobalLock();
  uint64_t v5 = self->_store;
  objc_storeStrong((id *)&self->_store, a3);
  _MFUnlockGlobalLock();
}

- (id)messageBody
{
  BOOL v3 = [(MFMessage *)self messageStore];
  id v4 = [v3 bodyForMessage:self fetchIfNotAvailable:_ECIsNetworkActivityAllowed() updateFlags:1];

  return v4;
}

- (id)messageBodyIfAvailable
{
  BOOL v3 = [(MFMessage *)self messageStore];
  id v4 = [v3 bodyForMessage:self fetchIfNotAvailable:0 updateFlags:1];

  return v4;
}

- (id)messageBodyUpdatingFlags:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MFMessage *)self messageStore];
  id v6 = [v5 bodyForMessage:self fetchIfNotAvailable:_ECIsNetworkActivityAllowed() updateFlags:v3];

  return v6;
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v11 = [(MFMessage *)self messageStore];
  id v23 = 0;
  if (v6) {
    uint64_t v12 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [v11 fullBodyDataForMessage:self andHeaderDataIfReadilyAvailable:&v23 isComplete:a5 downloadIfNecessary:v12 didDownload:0];
  id v14 = v23;
  if (!v14)
  {
    if (v6) {
      uint64_t v15 = _ECIsNetworkActivityAllowed();
    }
    else {
      uint64_t v15 = 0;
    }
    id v14 = [v11 headerDataForMessage:self downloadIfNecessary:v15];
  }
  if (v14) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v17 = !v16;
  if (!v16)
  {
    uint64_t v18 = [v14 length];
    unint64_t v19 = [v13 length] + v18;
    if (a4) {
      *a4 = v19;
    }
    if (a3)
    {
      BOOL v20 = +[MFMutableData dataWithCapacity:v19];
      [v20 appendData:v14];
      [v20 appendData:v13];
      objc_msgSend(v20, "mf_makeImmutable");
      id v21 = v20;
      *a3 = v21;
    }
  }

  return v17;
}

- (id)messageDataIsPartial:(BOOL *)a3
{
  uint64_t v5 = [(MFMessage *)self messageStore];
  BOOL v6 = [v5 bodyDataForMessage:self isComplete:0 isPartial:a3 downloadIfNecessary:0];

  if (v6)
  {
    id v7 = [(MFMessage *)self messageStore];
    id v8 = [v7 headerDataForMessage:self downloadIfNecessary:0];

    if (v8)
    {
      id v9 = +[MFMutableData dataWithCapacity:](MFMutableData, "dataWithCapacity:", [v8 length] + objc_msgSend(v6, "length"));
      [v9 appendData:v8];
      [v9 appendData:v6];
      objc_msgSend(v9, "mf_makeImmutable");
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)messageDataIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4
{
  id v6 = 0;
  [(MFMessage *)self messageData:&v6 messageSize:0 isComplete:a3 downloadIfNecessary:a4];
  id v4 = v6;
  return v4;
}

- (id)messageData
{
  return [(MFMessage *)self messageDataIsComplete:0 downloadIfNecessary:1];
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v11 = [(MFMessage *)self messageStore];
  id v23 = 0;
  if (v6) {
    uint64_t v12 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [v11 fullBodyDataForMessage:self andHeaderDataIfReadilyAvailable:&v23 isComplete:a5 downloadIfNecessary:v12 didDownload:0];
  id v14 = v23;
  if (!v14)
  {
    if (v6) {
      uint64_t v15 = _ECIsNetworkActivityAllowed();
    }
    else {
      uint64_t v15 = 0;
    }
    id v14 = [v11 headerDataForMessage:self downloadIfNecessary:v15];
  }
  if (v14) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  BOOL v17 = !v16;
  if (!v16)
  {
    uint64_t v18 = [v14 length];
    uint64_t v19 = [v13 length];
    if (a4) {
      *a4 = v19 + v18;
    }
    if (a3)
    {
      BOOL v20 = +[MFDataHolder dataHolderWithData:v14];
      [v20 addData:v13];
      id v21 = v20;
      *a3 = v21;
    }
  }

  return v17;
}

- (id)messageDataHolderIsComplete:(BOOL *)a3 downloadIfNecessary:(BOOL)a4
{
  id v6 = 0;
  [(MFMessage *)self messageDataHolder:&v6 messageSize:0 isComplete:a3 downloadIfNecessary:a4];
  id v4 = v6;
  return v4;
}

- (id)messageDataHolder
{
  return [(MFMessage *)self messageDataHolderIsComplete:0 downloadIfNecessary:1];
}

- (id)dataConsumerForMimePart:(id)a3
{
  return 0;
}

- (unint64_t)messageSize
{
  unint64_t v3 = 0;
  [(MFMessage *)self messageData:0 messageSize:&v3 isComplete:0 downloadIfNecessary:1];
  return v3;
}

- (unint64_t)fileSize
{
  return 0;
}

- (id)preferredEmailAddressToReplyWith
{
  return 0;
}

- (id)messageID
{
  return 0;
}

- (void)setMessageURL:(id)a3
{
}

- (int64_t)messageIDHash
{
  _MFLockGlobalLock();
  int64_t messageIDHeaderHash = self->_messageIDHeaderHash;
  if (messageIDHeaderHash == 0x7FFFFFFFFFFFFFFFLL || messageIDHeaderHash == 0) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = self->_messageIDHeaderHash;
  }
  _MFUnlockGlobalLock();
  if (!messageIDHeaderHash)
  {
    if ([(MFMessage *)self isMessageContentsLocallyAvailable])
    {
      id v6 = [(MFMessage *)self headers];
      [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v6];

      _MFLockGlobalLock();
      if (self->_messageIDHeaderHash == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v5 = 0;
      }
      else {
        int64_t v5 = self->_messageIDHeaderHash;
      }
      _MFUnlockGlobalLock();
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)messageIDHeaderHash
{
  int64_t v2 = [(MFMessage *)self messageIDHash];
  unint64_t v3 = 0;
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithHash:v2];
  }
  return v3;
}

- (id)messageIDHeaderInFortyBytesOrLess
{
  int64_t v2 = [(MFMessage *)self messageIDHeader];
  if ([v2 rangeOfString:@"@"] == 37)
  {
    objc_msgSend(v2, "substringWithRange:", 1, 36);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)[v2 length] < 0x29)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 substringToIndex:40];
  }
  id v4 = v3;

  return v4;
}

- (int64_t)_messageIDHeaderHashIvar
{
  [(MFMessage *)self messageIDHash];
  _MFLockGlobalLock();
  int64_t messageIDHeaderHash = self->_messageIDHeaderHash;
  _MFUnlockGlobalLock();
  return messageIDHeaderHash;
}

- (NSURL)externalReference
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMessage *)self messageID];
  uint64_t v4 = [(MFMessage *)self externalID];
  int64_t v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v7 setScheme:*MEMORY[0x1E4F5FC68]];
    [v7 setHost:@"message"];
    id v8 = [NSString stringWithFormat:@"/%@", v3];
    [v7 setPath:v8];

    id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"uuid" value:v5];
    v12[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setQueryItems:v10];

    id v6 = [v7 URL];
  }
  return (NSURL *)v6;
}

- (BOOL)isMessageContentsLocallyAvailable
{
  id v3 = [(MFMessage *)self path];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int64_t v5 = [(MFMessage *)self path];
    LOBYTE(v6) = [v4 fileExistsAtPath:v5];
  }
  else
  {
    return [MEMORY[0x1E4F29060] isMainThread] ^ 1;
  }
  return v6;
}

- (unint64_t)numberOfAttachments
{
  return self->_numberOfAttachments;
}

- (BOOL)calculatedNumberOfAttachments
{
  return *((unsigned char *)self + 160) & 1;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  if (self->_preferredEncoding != a3)
  {
    self->_preferredEncoding = a3;
    _MFLockGlobalLock();
    subject = self->_subject;
    self->_subject = 0;

    senderAddressComment = self->_senderAddressComment;
    self->_senderAddressComment = 0;

    sender = self->_sender;
    self->_sender = 0;

    to = self->_to;
    self->_to = 0;

    cc = self->_cc;
    self->_cc = 0;

    bcc = self->_bcc;
    self->_bcc = 0;

    _MFUnlockGlobalLock();
  }
}

- (BOOL)_doesDateAppearToBeSane:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSince1970];
    BOOL v6 = v5 > 160736400.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_copyDateFromReceivedHeadersInHeaders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 copyHeadersForKey:*MEMORY[0x1E4F606F8]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = [v9 rangeOfString:@";" options:4];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [v9 substringFromIndex:v10 + v11];
        id v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "mf_copyDateInCommonFormatsWithString:", v12);

        if (v13) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v13 = 0;
  }

  if (![(MFMessage *)self _doesDateAppearToBeSane:v13])
  {

    id v13 = 0;
  }

  return v13;
}

- (id)_copyDateFromDateHeaderInHeaders:(id)a3
{
  uint64_t v4 = (void *)[a3 copyFirstHeaderForKey:*MEMORY[0x1E4F606A0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)objc_msgSend(MEMORY[0x1E4F1C9C8], "mf_copyDateInCommonFormatsWithString:", v4);
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:
  if (![(MFMessage *)self _doesDateAppearToBeSane:v6])
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_setDateReceivedFromHeaders:(id)a3
{
  id v7 = a3;
  id v4 = -[MFMessage _copyDateFromReceivedHeadersInHeaders:](self, "_copyDateFromReceivedHeadersInHeaders:");
  if (v4 || (id v4 = [(MFMessage *)self _copyDateFromDateHeaderInHeaders:v7]) != 0)
  {
    int v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = 0;
    int v5 = 1;
  }
  [v6 timeIntervalSince1970];
  -[MFMessage setDateReceivedAsTimeIntervalSince1970:](self, "setDateReceivedAsTimeIntervalSince1970:");
  if (v5) {
}
  }

- (void)_setDateSentFromHeaders:(id)a3
{
  id v7 = a3;
  id v4 = -[MFMessage _copyDateFromDateHeaderInHeaders:](self, "_copyDateFromDateHeaderInHeaders:");
  if (v4
    || (id v4 = [(MFMessage *)self _copyDateFromReceivedHeadersInHeaders:v7]) != 0)
  {
    int v5 = 0;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = 0;
    int v5 = 1;
  }
  [v6 timeIntervalSince1970];
  -[MFMessage setDateSentAsTimeIntervalSince1970:](self, "setDateSentAsTimeIntervalSince1970:");
  if (v5) {
}
  }

- (void)loadCachedHeaderValuesFromHeaders:(id)a3
{
  id v4 = a3;
  _MFLockGlobalLock();
  subject = self->_subject;
  sender = self->_sender;
  contentType = self->_contentType;
  to = self->_to;
  cc = self->_cc;
  bcc = self->_bcc;
  unsigned int dateSentInterval = self->_dateSentInterval;
  unsigned int dateReceivedInterval = self->_dateReceivedInterval;
  listIDHash = self->_listIDHash;
  _MFUnlockGlobalLock();
  if (subject)
  {
    uint64_t v11 = 0;
    if (sender) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [v4 copyFirstHeaderForKey:*MEMORY[0x1E4F60738]];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F608E0]) initWithString:v19];
    [(MFMessage *)self setSubject:v20];

    uint64_t v11 = (__CFString *)v19;
    if (sender)
    {
LABEL_3:
      uint64_t v12 = v11;
      if (!to) {
        goto LABEL_4;
      }
LABEL_19:
      id v13 = v12;
      if (!cc) {
        goto LABEL_20;
      }
      goto LABEL_8;
    }
  }
  uint64_t v12 = (__CFString *)[v4 copyAddressListForSender];

  id v21 = v12;
  if (!v12)
  {
    id v21 = [MEMORY[0x1E4F1C978] array];
  }
  [(MFMessage *)self setSender:v21];
  if (v12)
  {
    if (to) {
      goto LABEL_19;
    }
  }
  else
  {

    if (to) {
      goto LABEL_19;
    }
  }
LABEL_4:
  id v13 = (__CFString *)[v4 copyAddressListForTo];

  id v14 = v13;
  if (!v13)
  {
    id v14 = [MEMORY[0x1E4F1C978] array];
  }
  [(MFMessage *)self setTo:v14];
  if (!v13)
  {

    if (!cc) {
      goto LABEL_20;
    }
LABEL_8:
    long long v15 = v13;
    if (!bcc) {
      goto LABEL_9;
    }
LABEL_24:
    long long v16 = v15;
    if (contentType) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
  if (cc) {
    goto LABEL_8;
  }
LABEL_20:
  long long v15 = (__CFString *)[v4 copyAddressListForCc];

  char v22 = v15;
  if (!v15)
  {
    char v22 = [MEMORY[0x1E4F1C978] array];
  }
  [(MFMessage *)self setCc:v22];
  if (v15)
  {
    if (bcc) {
      goto LABEL_24;
    }
  }
  else
  {

    if (bcc) {
      goto LABEL_24;
    }
  }
LABEL_9:
  long long v16 = (__CFString *)[v4 copyAddressListForBcc];

  long long v17 = v16;
  if (!v16)
  {
    long long v17 = [MEMORY[0x1E4F1C978] array];
  }
  [(MFMessage *)self setBcc:v17];
  if (v16)
  {
    if (contentType)
    {
LABEL_13:
      long long v18 = v16;
      goto LABEL_38;
    }
  }
  else
  {

    if (contentType) {
      goto LABEL_13;
    }
  }
LABEL_25:
  id v23 = (void *)[v4 copyFirstStringValueForKey:*MEMORY[0x1E4F60698]];

  if (v23)
  {
    id v30 = 0;
    +[MFMimePart parseContentTypeHeader:v23 type:&v30 subtype:0];
    long long v18 = (__CFString *)v30;
  }
  else
  {
    long long v18 = 0;
  }
  if (v18) {
    v24 = v18;
  }
  else {
    v24 = &stru_1F08428B0;
  }
  [(MFMessage *)self setContentType:v24];

LABEL_38:
  if (!dateReceivedInterval) {
    [(MFMessage *)self _setDateReceivedFromHeaders:v4];
  }
  if (!dateSentInterval) {
    [(MFMessage *)self _setDateSentFromHeaders:v4];
  }
  if (!listIDHash)
  {
    uint64_t v25 = [v4 firstHeaderForKey:*MEMORY[0x1E4F606D0]];
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithAngleBracketID:v25];
    [(MFMessage *)self setListIDHash:v26];
  }
}

- (ECSubject)subjectIfAvailable
{
  _MFLockGlobalLock();
  id v3 = self->_subject;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setSubject:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_subject, a3);
  _MFUnlockGlobalLock();
}

- (void)setDateReceivedAsTimeIntervalSince1970:(double)a3
{
  _MFLockGlobalLock();
  self->_unsigned int dateReceivedInterval = a3;
  _MFUnlockGlobalLock();
}

- (double)dateReceivedAsTimeIntervalSince1970
{
  unsigned int dateReceivedInterval = self->_dateReceivedInterval;
  if (!dateReceivedInterval)
  {
    id v4 = [(MFMessage *)self headers];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    return (double)self->_dateReceivedInterval;
  }
  return (double)dateReceivedInterval;
}

- (BOOL)needsDateReceived
{
  return self->_dateReceivedInterval == 0;
}

- (double)dateSentAsTimeIntervalSince1970
{
  _MFLockGlobalLock();
  unsigned int dateSentInterval = self->_dateSentInterval;
  _MFUnlockGlobalLock();
  if (!dateSentInterval)
  {
    id v4 = [(MFMessage *)self headers];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    unsigned int dateSentInterval = self->_dateSentInterval;
    _MFUnlockGlobalLock();
  }
  return (double)dateSentInterval;
}

- (void)setDateSentAsTimeIntervalSince1970:(double)a3
{
  _MFLockGlobalLock();
  self->_unsigned int dateSentInterval = a3;
  _MFUnlockGlobalLock();
}

- (id)contentType
{
  int64_t v2 = self;
  _MFLockGlobalLock();
  id v3 = v2->_contentType;
  _MFUnlockGlobalLock();
  if (!v3)
  {
    id v4 = [(MFMessage *)v2 headers];
    [(MFMessage *)v2 loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    id v3 = v2->_contentType;
    _MFUnlockGlobalLock();
  }

  return v3;
}

- (id)senders
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__MFMessage_senders__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  int64_t v2 = _cachedIvarLoadFromHeaders(self, 1, v4);
  return v2;
}

id __20__MFMessage_senders__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 72);
}

- (id)firstSender
{
  int64_t v2 = [(MFMessage *)self senders];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setSender:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  _MFLockGlobalLock();
  if (([v14 isEqual:self->_sender] & 1) == 0)
  {
    _MFUnlockGlobalLock();
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v14;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v15 + 1) + 8 * v8);
          uint64_t v10 = [(MFMessage *)self messageStore];
          uint64_t v11 = v10;
          if (v10 && v9)
          {
            uint64_t v12 = [v10 uniquedString:v9];

            id v9 = (id)v12;
          }

          [(NSArray *)v4 addObject:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    _MFLockGlobalLock();
    sender = self->_sender;
    self->_sender = v4;
  }
  _MFUnlockGlobalLock();
}

- (id)senderAddressComment
{
  _MFLockGlobalLock();
  p_senderAddressComment = &self->_senderAddressComment;
  id v4 = self->_senderAddressComment;
  _MFUnlockGlobalLock();
  if (!v4)
  {
    id v5 = [(MFMessage *)self firstSender];
    uint64_t v6 = [v5 emailAddressValue];
    uint64_t v7 = [v6 displayName];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 stringValue];
    }
    uint64_t v10 = v9;

    if ([v10 length])
    {
      uint64_t v11 = [(MFMessage *)self messageStore];
      uint64_t v12 = v11;
      if (v11 && v10)
      {
        id v13 = [v11 uniquedString:v10];
      }
      else
      {
        id v13 = v10;
      }

      id v14 = v13;
      _MFLockGlobalLock();
      if (!*p_senderAddressComment) {
        objc_storeStrong((id *)p_senderAddressComment, v13);
      }
      uint64_t v10 = v14;
      _MFUnlockGlobalLock();
    }
    else
    {
      id v14 = 0;
    }

    id v4 = (NSString *)v14;
  }
  return v4;
}

- (NSArray)toIfCached
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__MFMessage_toIfCached__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  int64_t v2 = _cachedIvarLoadFromHeaders(self, 0, v4);
  return (NSArray *)v2;
}

id __23__MFMessage_toIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

- (void)setTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  _MFLockGlobalLock();
  if (([v14 isEqual:self->_to] & 1) == 0)
  {
    _MFUnlockGlobalLock();
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v14;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v15 + 1) + 8 * v8);
          uint64_t v10 = [(MFMessage *)self messageStore];
          uint64_t v11 = v10;
          if (v10 && v9)
          {
            uint64_t v12 = [v10 uniquedString:v9];

            id v9 = (id)v12;
          }

          [(NSArray *)v4 addObject:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    _MFLockGlobalLock();
    to = self->_to;
    self->_to = v4;
  }
  _MFUnlockGlobalLock();
}

- (NSArray)ccIfCached
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__MFMessage_ccIfCached__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  int64_t v2 = _cachedIvarLoadFromHeaders(self, 0, v4);
  return (NSArray *)v2;
}

id __23__MFMessage_ccIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

- (void)setCc:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  _MFLockGlobalLock();
  if (([v14 isEqual:self->_cc] & 1) == 0)
  {
    _MFUnlockGlobalLock();
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v14;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v15 + 1) + 8 * v8);
          uint64_t v10 = [(MFMessage *)self messageStore];
          uint64_t v11 = v10;
          if (v10 && v9)
          {
            uint64_t v12 = [v10 uniquedString:v9];

            id v9 = (id)v12;
          }

          [(NSArray *)v4 addObject:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    _MFLockGlobalLock();
    cc = self->_cc;
    self->_cc = v4;
  }
  _MFUnlockGlobalLock();
}

- (NSArray)bccIfCached
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__MFMessage_bccIfCached__block_invoke;
  v4[3] = &unk_1E5F89678;
  v4[4] = self;
  int64_t v2 = _cachedIvarLoadFromHeaders(self, 0, v4);
  return (NSArray *)v2;
}

id __24__MFMessage_bccIfCached__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

- (void)setBcc:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  _MFLockGlobalLock();
  if (([v14 isEqual:self->_bcc] & 1) == 0)
  {
    _MFUnlockGlobalLock();
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v14;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v15 + 1) + 8 * v8);
          uint64_t v10 = [(MFMessage *)self messageStore];
          uint64_t v11 = v10;
          if (v10 && v9)
          {
            uint64_t v12 = [v10 uniquedString:v9];

            id v9 = (id)v12;
          }

          [(NSArray *)v4 addObject:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    _MFLockGlobalLock();
    bcc = self->_bcc;
    self->_bcc = v4;
  }
  _MFUnlockGlobalLock();
}

- (ECAngleBracketIDHash)listIDHash
{
  _MFLockGlobalLock();
  listIDHash = self->_listIDHash;
  _MFUnlockGlobalLock();
  if (!listIDHash)
  {
    id v4 = [(MFMessage *)self headersIfAvailable];
    [(MFMessage *)self loadCachedHeaderValuesFromHeaders:v4];

    _MFLockGlobalLock();
    listIDHash = self->_listIDHash;
    if (listIDHash) {
      id v5 = listIDHash;
    }
    _MFUnlockGlobalLock();
  }
  if ([(ECAngleBracketIDHash *)listIDHash int64Value]) {
    uint64_t v6 = listIDHash;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6;

  return v7;
}

- (NSUUID)documentID
{
  _MFLockGlobalLock();
  id v3 = self->_documentID;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setDocumentID:(id)a3
{
  id v5 = a3;
  _MFLockGlobalLock();
  objc_storeStrong((id *)&self->_documentID, a3);
  _MFUnlockGlobalLock();
}

- (NSString)summary
{
  _MFLockGlobalLock();
  id v3 = self->_summary;
  _MFUnlockGlobalLock();
  return v3;
}

- (void)setMessageInfo:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceivedTimeIntervalSince1970:(double)a8 dateSentTimeIntervalSince1970:(double)a9 messageIDHash:(int64_t)a10 conversationID:(int64_t)a11 summary:(id)a12
{
  id v25 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a12;
  [(MFMessage *)self setSubject:v25 to:v20 cc:v21 bcc:v22 sender:v23 dateReceived:v24 dateSent:a8 summary:a9];
  [(MFMessage *)self setConversationID:a11];
  [(MFMessage *)self setMessageIDHash:a10];
}

- (void)setSubject:(id)a3 to:(id)a4 cc:(id)a5 bcc:(id)a6 sender:(id)a7 dateReceived:(double)a8 dateSent:(double)a9 summary:(id)a10
{
  LODWORD(v10) = 15;
  [(MFMessage *)self setSubject:a3 to:a4 cc:a5 bcc:a6 sender:a7 dateReceived:a10 dateSent:a8 summary:a9 withOptions:v10];
}

- (BOOL)updateSubjectFromEncryptedContent
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = [(MFMessage *)self headersIfAvailable];
    id v4 = [v3 firstHeaderForKey:*MEMORY[0x1E4F60698]];

    if (!v4)
    {
      BOOL v15 = 0;
      goto LABEL_16;
    }
    id v20 = 0;
    id v21 = 0;
    BOOL v5 = +[MFMimePart parseContentTypeHeader:v4 type:&v21 subtype:&v20];
    id v6 = v21;
    id v7 = v20;
    if (!v5
      || ![v6 isEqualToString:@"application"]
      || ([v7 isEqualToString:@"pkcs7-mime"] & 1) == 0)
    {
      BOOL v15 = 0;
LABEL_14:

LABEL_16:
      return v15;
    }
    uint64_t v8 = [(MFMessage *)self messageBodyIfAvailableUpdatingFlags:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v15 = 0;
LABEL_26:

      goto LABEL_14;
    }
    id v9 = [v8 topLevelPart];
    uint64_t v10 = v9;
    if (!v9)
    {
      BOOL v15 = 0;
LABEL_25:

      goto LABEL_26;
    }
    [v9 decodeIfNecessary];
    char v19 = 0;
    id v11 = (id)[v10 decryptedMessageBodyIsEncrypted:&v19 isSigned:0];
    uint64_t v12 = [v10 wrappedSubject];
    if (v12)
    {
      id v13 = [(MFMessage *)self subject];
      char v14 = [v13 isEqual:v12];

      if ((v14 & 1) == 0)
      {
        if (v19)
        {
          [(MFMessage *)self setSubject:v12];
          BOOL v15 = 1;
LABEL_24:

          goto LABEL_25;
        }
        long long v17 = MFLogGeneral();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          long long v18 = [(MFMessage *)self messageIDHeader];
          [(MFMessage *)v18 updateSubjectFromEncryptedContent];
        }
      }
    }
    BOOL v15 = 0;
    goto LABEL_24;
  }
  return 0;
}

- (void)setMessagePropertiesFromMessage:(id)a3
{
  id v17 = a3;
  id v4 = [v17 senders];
  BOOL v5 = [v17 to];
  id v6 = [v17 cc];
  id v7 = [v17 bcc];
  uint64_t v8 = [v17 subject];
  id v9 = [v8 subjectString];

  [v17 dateReceivedAsTimeIntervalSince1970];
  double v11 = v10;
  [v17 dateSentAsTimeIntervalSince1970];
  double v13 = v12;
  uint64_t v14 = [v17 _messageIDHeaderHashIvar];
  uint64_t v15 = [v17 conversationID];
  long long v16 = [v17 summary];
  [(MFMessage *)self setSubject:v9 to:v5 cc:v6 bcc:v7 sender:v4 dateReceived:v16 dateSent:v11 summary:v13];
  [(MFMessage *)self setConversationID:v15];
  [(MFMessage *)self setMessageIDHash:v14];
}

- (unsigned)uid
{
  return 0;
}

- (id)path
{
  return 0;
}

- (id)persistentID
{
  return 0;
}

- (id)bodyData
{
  id v3 = [(MFMessage *)self messageStore];
  id v4 = [v3 bodyDataForMessage:self isComplete:0 isPartial:0 downloadIfNecessary:_ECIsNetworkActivityAllowed()];

  return v4;
}

- (id)bodyDataIsComplete:(BOOL *)a3
{
  return [(MFMessage *)self bodyDataIsComplete:a3 isPartial:0];
}

- (id)bodyDataIsComplete:(BOOL *)a3 isPartial:(BOOL *)a4
{
  return [(MFMessage *)self bodyDataIsComplete:a3 isPartial:a4 downloadIfNecessary:1];
}

- (NSData)headerData
{
  return (NSData *)[(MFMessage *)self headerDataDownloadIfNecessary:1];
}

- (NSData)headerDataIfAvailable
{
  return (NSData *)[(MFMessage *)self headerDataDownloadIfNecessary:0];
}

- (id)dataForMimePart:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F29060] currentThread];
  id v6 = [v5 threadDictionary];
  id v7 = [v6 objectForKeyedSubscript:@"__MIME_PART_DECODE_DOWNLOAD"];
  int v8 = [v7 BOOLValue];

  id v9 = [(MFMessage *)self messageStore];
  if (v8) {
    uint64_t v10 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v10 = 0;
  }
  double v11 = objc_msgSend(v9, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v4, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v10, 0);

  return v11;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  uint64_t v10 = [(MFMessage *)self messageStore];
  double v11 = objc_msgSend(v10, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v9, location, length, a5, _ECIsNetworkActivityAllowed(), 0);

  return v11;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  BOOL v8 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  uint64_t v14 = [(MFMessage *)self messageStore];
  if (v8) {
    uint64_t v15 = _ECIsNetworkActivityAllowed();
  }
  else {
    uint64_t v15 = 0;
  }
  long long v16 = objc_msgSend(v14, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v13, location, length, a5, v15, a7);

  return v16;
}

- (id)dataPathForMimePart:(id)a3
{
  return 0;
}

- (void)calculateAttachmentInfoFromBody:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if ((*((unsigned char *)self + 160) & 1) == 0)
  {
    if (v4
      || ([(MFMessage *)self messageBodyUpdatingFlags:0],
          (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      __int16 v7 = 0;
      unsigned int v6 = [v5 numberOfAttachmentsSigned:(char *)&v7 + 1 encrypted:&v7];
      [(MFMessage *)self setNumberOfAttachments:v6 isSigned:HIBYTE(v7) isEncrypted:v7];
      *((unsigned char *)self + 160) |= 1u;
    }
  }
}

- (void)setNumberOfAttachments:(unint64_t)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = [(MFMessage *)self messageStore];
  [v9 setNumberOfAttachments:a3 isSigned:v6 isEncrypted:v5 forMessage:self];
}

- (void)setNumberOfAttachments:(unint64_t)a3
{
  self->_numberOfAttachments = a3;
}

- (unint64_t)generationNumber
{
  return atomic_load(&self->_generationNumber);
}

- (int64_t)generationCompare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MFMessage *)self generationNumber];
  unint64_t v6 = [v4 generationNumber];
  if (v6 > v5) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = v6 < v5;
  }

  return v7;
}

- (id)defaultAlternativeInPart:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MFMessage *)self messageStore];
  unint64_t v6 = [v5 defaultAlternativeForPart:v4];

  return v6;
}

- (BOOL)canBeTriaged
{
  int64_t v2 = self;
  id v3 = [(MFMessage *)self messageStore];
  LOBYTE(v2) = [v3 messageCanBeTriaged:v2];

  return (char)v2;
}

- (BOOL)isLibraryMessage
{
  return 0;
}

- (id)additionalHeadersForReply
{
  return 0;
}

- (id)additionalHeadersForForward
{
  return 0;
}

- (MFMimePart)strongParentPartReference
{
  return self->_strongParentPartReference;
}

- (void)setStrongParentPartReference:(id)a3
{
}

- (void)updateSubjectFromEncryptedContent
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AFB03000, log, OS_LOG_TYPE_ERROR, "Signed message has protected header that does not match outer header: %{public}@", buf, 0xCu);
}

@end