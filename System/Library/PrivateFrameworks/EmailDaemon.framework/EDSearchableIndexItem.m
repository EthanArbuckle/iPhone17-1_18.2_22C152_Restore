@interface EDSearchableIndexItem
+ (OS_os_log)log;
+ (id)_accountIdentifierForBaseMessage:(id)a3;
+ (id)_domainIdentifierForBaseMessage:(id)a3;
+ (id)accountIdentifierForMessage:(id)a3;
+ (id)csIdentifierForMailbox:(id)a3;
+ (id)domainIdentifierForAccountID:(id)a3 mailboxPersistentID:(id)a4;
+ (id)domainIdentifierForMessage:(id)a3;
+ (id)gmailLabelsForBaseMessage:(id)a3;
+ (id)itemWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6;
+ (id)itemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5;
+ (id)mailboxIdentifiersForBaseMessage:(id)a3;
+ (id)mailboxIdentifiersForMessage:(id)a3;
+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4;
+ (id)searchableMessageFlagsForBaseMessage:(id)a3;
+ (id)searchableMessageIDForPersistedMessageID:(id)a3;
+ (id)searchableMessageUpdateForBaseMessage:(id)a3;
+ (id)suggestionsSearchableItemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5 isEncrypted:(BOOL)a6 includeEncryptedBody:(BOOL)a7;
+ (int64_t)indexingPriorityByIndexingType:(int64_t)a3;
- (BOOL)alwaysMarkAsIndexed;
- (BOOL)fetchBody;
- (BOOL)hasCompleteData;
- (BOOL)includeEncryptedBody;
- (BOOL)isEncrypted;
- (BOOL)requiresPreprocessing;
- (BOOL)shouldExcludeFromIndex;
- (BOOL)shouldIndexImmediatelyPostPreprocessing;
- (EDBaseMessage)baseMessage;
- (EDPersistedMessage)message;
- (EDSearchableIndexItem)initWithIdentifier:(id)a3;
- (EDSearchableIndexItem)initWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6;
- (EDSearchableIndexItem)initWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5;
- (NSData)bodyData;
- (NSDate)dateReceived;
- (NSString)domainIdentifier;
- (NSString)identifier;
- (id)addressesAttributeKey;
- (id)calendarEventsAttributeKey;
- (id)fetchIndexableAttachments;
- (id)flightNumbersAttributeKey;
- (id)linksAttributeKey;
- (id)phoneNumbersAttributeKey;
- (id)searchableItem;
- (id)trackingNumbersAttributeKey;
- (int64_t)indexingType;
- (unint64_t)estimatedSizeInBytes;
- (unint64_t)itemInstantiationTime;
- (void)addDataDetectionAttributesToAttributeSet:(id)a3;
- (void)addFlagsAttributesToAttributeSet:(id)a3;
- (void)addMailCategoryAttributesToAttributeSet:(id)a3;
- (void)addStaticAttributesToAttributeSet:(id)a3;
- (void)addUpdatableAttributesToAttributeSet:(id)a3;
- (void)preprocess;
- (void)setBodyData:(id)a3;
- (void)setHasCompleteData:(BOOL)a3;
- (void)setIncludeEncryptedBody:(BOOL)a3;
- (void)setIndexingType:(int64_t)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType;
- (void)setNeedsAllAttributesIndexingType;
@end

@implementation EDSearchableIndexItem

- (unint64_t)estimatedSizeInBytes
{
  if (self->_bodyData)
  {
    bodyData = self->_bodyData;
    return [(NSData *)bodyData length];
  }
  else
  {
    v4 = [(EDSearchableIndexItem *)self baseMessage];
    unint64_t v5 = [v4 fileSize];

    return v5;
  }
}

- (id)searchableItem
{
  searchableItem = self->_searchableItem;
  if (!searchableItem)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F23850]);
    v6 = [(id)*MEMORY[0x1E4F443A8] identifier];
    v7 = (void *)[v5 initWithItemContentType:v6];

    v8 = [MEMORY[0x1E4F60320] externalDataTypeIdentifiers];
    [v7 setProviderDataTypeIdentifiers:v8];

    int64_t v9 = [(EDSearchableIndexItem *)self indexingType];
    switch(v9)
    {
      case 0:
        goto LABEL_7;
      case 1:
        goto LABEL_12;
      case 2:
        [(EDSearchableIndexItem *)self addUpdatableAttributesToAttributeSet:v7];
        goto LABEL_8;
      case 3:
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexItem.m" lineNumber:452 description:@"EDSearchableIndexItem has invalid indexingType = EDIndexableItemIndexingTypeAttachment"];
        goto LABEL_10;
      case 4:
        [(EDSearchableIndexItem *)self addDataDetectionAttributesToAttributeSet:v7];
        break;
      case 5:
        [(EDSearchableIndexItem *)self addDataDetectionAttributesToAttributeSet:v7];
LABEL_7:
        [(EDSearchableIndexItem *)self addStaticAttributesToAttributeSet:v7];
LABEL_8:
        [(EDSearchableIndexItem *)self addMailCategoryAttributesToAttributeSet:v7];
        break;
      case 6:
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexItem.m" lineNumber:456 description:@"EDSearchableIndexItem has invalid indexingType = EDIndexableItemIndexingTypeRichLinks"];
LABEL_10:

        break;
      case 7:
        [(EDSearchableIndexItem *)self addMailCategoryAttributesToAttributeSet:v7];
LABEL_12:
        [(EDSearchableIndexItem *)self addFlagsAttributesToAttributeSet:v7];
        break;
      default:
        break;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F23840]);
    v12 = [(EDSearchableIndexItem *)self identifier];
    v13 = [(EDSearchableIndexItem *)self domainIdentifier];
    v14 = (CSSearchableItem *)[v11 initWithUniqueIdentifier:v12 domainIdentifier:v13 attributeSet:v7];
    v15 = self->_searchableItem;
    self->_searchableItem = v14;

    v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(CSSearchableItem *)self->_searchableItem setExpirationDate:v16];

    if (v9) {
      BOOL v17 = v9 == 5;
    }
    else {
      BOOL v17 = 1;
    }
    uint64_t v18 = !v17;
    [(CSSearchableItem *)self->_searchableItem setIsUpdate:v18];

    searchableItem = self->_searchableItem;
  }

  return searchableItem;
}

- (void)addMailCategoryAttributesToAttributeSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(EDSearchableIndexItem *)self message];
  v6 = [v5 category];

  if (v6 && [v6 state])
  {
    v7 = +[EDSearchableIndexItem log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [(EDSearchableIndexItem *)self message];
      int v14 = 138543618;
      v15 = v6;
      __int16 v16 = 2114;
      BOOL v17 = v8;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Indexing category: %{public}@ for message: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    int64_t v9 = [[EDSearchableMessageCategoryUpdate alloc] initWithCategory:v6];
    [(EDSearchableMessageCategoryUpdate *)v9 addToAttributes:v4];
LABEL_9:

    goto LABEL_10;
  }
  v10 = [(EDSearchableIndexItem *)self message];
  id v11 = [v10 mailbox];
  uint64_t v12 = [v11 type];

  if (v12 == 7)
  {
    int64_t v9 = +[EDSearchableIndexItem log];
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      v13 = [(EDSearchableIndexItem *)self message];
      [(EDSearchableIndexItem *)v13 addMailCategoryAttributesToAttributeSet:&v9->super];
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (NSString)domainIdentifier
{
  v3 = objc_opt_class();
  id v4 = [(EDSearchableIndexItem *)self baseMessage];
  id v5 = [v3 _domainIdentifierForBaseMessage:v4];

  return (NSString *)v5;
}

- (BOOL)shouldExcludeFromIndex
{
  v2 = [(EDSearchableIndexItem *)self baseMessage];
  v3 = [v2 mailbox];
  BOOL v4 = v3 == 0;

  return v4;
}

- (EDBaseMessage)baseMessage
{
  return self->_baseMessage;
}

- (void)addStaticAttributesToAttributeSet:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  v65 = [(EDSearchableIndexItem *)self bodyData];
  BOOL v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"IndexDecryptedMessages"];

  BOOL v6 = (v5 & 1) != 0
    || ![(EDSearchableIndexItem *)self isEncrypted]
    || [(EDSearchableIndexItem *)self includeEncryptedBody];
  if (!v65 && v6)
  {
    unint64_t v7 = [(EDSearchableIndexItem *)self estimatedSizeInBytes];
    if (v7 <= 0x2000000)
    {
      buf[0] = 0;
      v10 = [(EDBaseMessage *)self->_baseMessage bestAlternativePart:buf];
      v65 = [v10 dataUsingEncoding:4];

      [(EDSearchableIndexItem *)self setHasCompleteData:buf[0]];
    }
    else
    {
      v8 = +[EDSearchableIndexItem log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v9 = [(EDSearchableIndexItem *)self identifier];
        *(_DWORD *)buf = 138543618;
        v69 = v9;
        __int16 v70 = 2048;
        unint64_t v71 = v7;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Skipping body indexing for message %{public}@ due to large message size:%lu", buf, 0x16u);
      }
      v65 = 0;
    }
  }
  v49 = [(EDBaseMessage *)self->_baseMessage mailbox];
  uint64_t v11 = [v49 type];
  uint64_t v12 = [(EDBaseMessage *)self->_baseMessage subject];
  v13 = [v12 subjectWithoutPrefix];

  v51 = v13;
  if (![v13 length] && v11 != 5)
  {
    v66[0] = @"mailboxtype";
    int v14 = [NSNumber numberWithInteger:v11];
    v67[0] = v14;
    v66[1] = @"identifier";
    uint64_t v15 = [(EDSearchableIndexItem *)self identifier];
    __int16 v16 = (void *)v15;
    BOOL v17 = @"<null>";
    if (v15) {
      BOOL v17 = (__CFString *)v15;
    }
    v67[1] = v17;
    v66[2] = @"hasCompleteContent";
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[EDSearchableIndexItem hasCompleteData](self, "hasCompleteData"));
    v67[2] = v18;
    v66[3] = @"hasHeaders";
    v19 = NSNumber;
    v20 = [(EDBaseMessage *)self->_baseMessage headersDictionary];
    v21 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "count") != 0);
    v67[3] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:4];

    v23 = +[EDSearchableIndexItem log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[EDSearchableIndexItem addStaticAttributesToAttributeSet:]((uint64_t)v22, v23);
    }
  }
  v24 = [(EDSearchableIndexItem *)self message];

  if (v24)
  {
    v25 = NSString;
    v26 = [(EDSearchableIndexItem *)self message];
    uint64_t v27 = objc_msgSend(v25, "stringWithFormat:", @"%lld", objc_msgSend(v26, "globalMessageID"));
  }
  else
  {
    uint64_t v27 = 0;
  }
  v28 = [(EDSearchableIndexItem *)self message];
  v50 = (void *)v27;
  v29 = [v28 messageIDHeader];
  uint64_t v30 = [v29 stringValue];

  v48 = (void *)v30;
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v31 = [(EDSearchableIndexItem *)self message];
    v59 = [v31 notificationID];
  }
  else
  {
    v59 = 0;
  }
  v32 = [(EDBaseMessage *)self->_baseMessage account];
  v64 = v32;
  v62 = [(id)objc_opt_class() searchableMessageUpdateForBaseMessage:self->_baseMessage];
  v53 = objc_msgSend((id)objc_opt_class(), "searchableMessageAttachmentsForBaseMessage:includeEncryptedBody:", self->_baseMessage, -[EDSearchableIndexItem includeEncryptedBody](self, "includeEncryptedBody"));
  v33 = [EDSearchableMessage alloc];
  v58 = [(EDBaseMessage *)self->_baseMessage dateSent];
  v60 = [(EDBaseMessage *)self->_baseMessage dateReceived];
  BOOL v34 = [(EDSearchableIndexItem *)self isEncrypted];
  v55 = [(EDBaseMessage *)self->_baseMessage senders];
  v54 = [(EDBaseMessage *)self->_baseMessage to];
  v56 = [(EDBaseMessage *)self->_baseMessage cc];
  v57 = [(EDBaseMessage *)self->_baseMessage bcc];
  BOOL v47 = v34;
  v61 = [(EDBaseMessage *)self->_baseMessage headersDictionary];
  if (v6) {
    v35 = v65;
  }
  else {
    v35 = 0;
  }
  char v36 = [(EDBaseMessage *)self->_baseMessage isPartOfExistingThread];
  BOOL v37 = [(EDSearchableIndexItem *)self hasCompleteData];
  v52 = [v32 identifier];
  char v38 = [v32 isManaged];
  v39 = [(id)objc_opt_class() csAccountTypeString];
  v40 = [v64 emailAddressStrings];
  v41 = [(EDSearchableIndexItem *)self message];
  v42 = [v41 category];
  LOBYTE(v46) = v38;
  BYTE1(v45) = v37;
  LOBYTE(v45) = v36;
  v43 = -[EDSearchableMessage initWithSubjectWithoutPrefix:dateSent:dateReceived:isEncrypted:priority:senders:to:cc:bcc:allHeaders:htmlContent:messageID:messageIDHeader:notificationID:isPartOfExistingThread:hasCompleteData:accountIdentifier:accountIsManaged:accountType:accountEmailAddresses:update:attachments:category:](v33, "initWithSubjectWithoutPrefix:dateSent:dateReceived:isEncrypted:priority:senders:to:cc:bcc:allHeaders:htmlContent:messageID:messageIDHeader:notificationID:isPartOfExistingThread:hasCompleteData:accountIdentifier:accountIsManaged:accountType:accountEmailAddresses:update:attachments:category:", v51, v58, v60, v47, 0, v55, v54, v56, v57, v61, v35, v50, v48, v59, v45,
          v52,
          v46,
          v39,
          v40,
          v62,
          v53,
          v42);

  v44 = [(EDSearchableIndexItem *)self identifier];
  [(EDSearchableMessage *)v43 addToAttributes:v63 forIdentifier:v44];
}

- (EDPersistedMessage)message
{
  return self->_message;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (BOOL)hasCompleteData
{
  return self->_hasCompleteData;
}

- (BOOL)includeEncryptedBody
{
  return self->_includeEncryptedBody;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)addMailCategoryAttributesToAttributeSet:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Inbox message is not categorized before indexing: %{public}@", buf, 0xCu);
}

+ (id)searchableMessageUpdateForBaseMessage:(id)a3
{
  id v3 = a3;
  [v3 conversationID];
  BOOL v4 = EFStringWithInt64();
  char v5 = [(id)objc_opt_class() mailboxIdentifiersForBaseMessage:v3];
  BOOL v6 = [(id)objc_opt_class() gmailLabelsForBaseMessage:v3];
  unint64_t v7 = [(id)objc_opt_class() searchableMessageFlagsForBaseMessage:v3];
  v8 = [[EDSearchableMessageUpdate alloc] initWithConversationIdentifier:v4 mailboxIdentifiers:v5 gmailLabels:v6 isLikelyJunk:0 dateLastViewed:0 flags:v7];

  return v8;
}

+ (id)searchableMessageFlagsForBaseMessage:(id)a3
{
  id v3 = [a3 flags];
  BOOL v4 = -[EDSearchableMessageFlags initWithRead:flagged:flagColor:replied:]([EDSearchableMessageFlags alloc], "initWithRead:flagged:flagColor:replied:", [v3 read], objc_msgSend(v3, "flagged"), objc_msgSend(v3, "flagColor"), objc_msgSend(v3, "replied"));

  return v4;
}

+ (id)mailboxIdentifiersForBaseMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  BOOL v6 = [v4 mailbox];
  unint64_t v7 = [v6 URLString];
  if ([v7 length]) {
    [v5 addObject:v7];
  }
  v8 = [a1 csIdentifierForMailbox:v6];

  if ([v8 length]) {
    [v5 addObject:v8];
  }
  int64_t v9 = [v5 allObjects];

  return v9;
}

+ (id)csIdentifierForMailbox:(id)a3
{
  id v3 = a3;
  switch([v3 type])
  {
    case 1:
      id v4 = (id *)MEMORY[0x1E4F22990];
      goto LABEL_10;
    case 2:
      id v4 = (id *)MEMORY[0x1E4F22978];
      goto LABEL_10;
    case 3:
      id v4 = (id *)MEMORY[0x1E4F229A0];
      goto LABEL_10;
    case 4:
      id v4 = (id *)MEMORY[0x1E4F22998];
      goto LABEL_10;
    case 5:
      id v4 = (id *)MEMORY[0x1E4F22980];
      goto LABEL_10;
    case 6:
      id v4 = (id *)kEDSearchableIndexOutboxIdentifier;
      goto LABEL_10;
    case 7:
      id v4 = (id *)MEMORY[0x1E4F22988];
LABEL_10:
      id v6 = *v4;
      break;
    default:
      id v5 = [v3 URL];
      id v6 = [v5 absoluteString];

      break;
  }

  return v6;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EDSearchableIndexItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_81 != -1) {
    dispatch_once(&log_onceToken_81, block);
  }
  v2 = (void *)log_log_81;

  return (OS_os_log *)v2;
}

+ (id)gmailLabelsForBaseMessage:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)_domainIdentifierForBaseMessage:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _accountIdentifierForBaseMessage:v4];
  id v6 = [v4 mailbox];
  unint64_t v7 = [v6 persistentID];

  v8 = [a1 domainIdentifierForAccountID:v5 mailboxPersistentID:v7];

  return v8;
}

+ (id)domainIdentifierForAccountID:(id)a3 mailboxPersistentID:(id)a4
{
  id v4 = [NSString stringWithFormat:@"%@.%@", a3, a4];

  return v4;
}

+ (id)_accountIdentifierForBaseMessage:(id)a3
{
  id v3 = [a3 account];
  id v4 = [v3 identifier];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMessage, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_searchableItem, 0);
}

- (int64_t)indexingType
{
  return self->_indexingType;
}

- (void)setIndexingType:(int64_t)a3
{
  self->_indexingType = a3;
}

- (EDSearchableIndexItem)initWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 persistentID];
  if (![v11 length])
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexItem.m" lineNumber:82 description:@"Message does not have a valid identifier. Please consider using initWithIdentifier:message:bodyData: if you need something special."];
  }
  uint64_t v12 = [(EDSearchableIndexItem *)self initWithIdentifier:v11 message:v9 bodyData:v10 fetchBody:v5];

  return v12;
}

- (EDSearchableIndexItem)initWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EDSearchableIndexItem;
  v13 = [(EDSearchableIndexItem *)&v20 init];
  if (v13)
  {
    v13->_itemInstantiationTime = mach_absolute_time();
    objc_storeStrong((id *)&v13->_baseMessage, a4);
    int v14 = [v11 persistentID];

    if (v14) {
      objc_storeStrong((id *)&v13->_message, a4);
    }
    uint64_t v15 = [v12 copy];
    bodyData = v13->_bodyData;
    v13->_bodyData = (NSData *)v15;

    uint64_t v17 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;

    v13->_fetchBody = a6;
    *(_WORD *)&v13->_isEncrypted = 0;
    v13->_hasCompleteData = v13->_bodyData != 0;
  }

  return v13;
}

void __28__EDSearchableIndexItem_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_81;
  log_log_81 = (uint64_t)v1;
}

+ (id)itemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithMessage:v8 bodyData:v9 fetchBody:v5];

  return v10;
}

+ (id)itemWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 message:v11 bodyData:v12 fetchBody:v6];

  return v13;
}

- (EDSearchableIndexItem)initWithIdentifier:(id)a3
{
  return [(EDSearchableIndexItem *)self initWithIdentifier:a3 message:0 bodyData:0 fetchBody:0];
}

+ (id)suggestionsSearchableItemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5 isEncrypted:(BOOL)a6 includeEncryptedBody:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  int v14 = [v12 persistentID];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    objc_msgSend(NSString, "ef_UUID");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v17 = v16;

  uint64_t v18 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v17 message:v12 bodyData:v13 fetchBody:v9];
  [v18 setIsEncrypted:v8];
  [v18 setIncludeEncryptedBody:v7];
  v19 = [v18 searchableItem];

  return v19;
}

- (NSDate)dateReceived
{
  v2 = [(EDSearchableIndexItem *)self baseMessage];
  id v3 = [v2 dateReceived];

  return (NSDate *)v3;
}

+ (int64_t)indexingPriorityByIndexingType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 2;
  }
  else {
    return qword_1DB640650[a3];
  }
}

+ (id)domainIdentifierForMessage:(id)a3
{
  id v3 = [a1 _domainIdentifierForBaseMessage:a3];

  return v3;
}

+ (id)accountIdentifierForMessage:(id)a3
{
  id v3 = [a1 _accountIdentifierForBaseMessage:a3];

  return v3;
}

+ (id)mailboxIdentifiersForMessage:(id)a3
{
  id v3 = [a1 mailboxIdentifiersForBaseMessage:a3];

  return v3;
}

+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4
{
  return 0;
}

+ (id)searchableMessageIDForPersistedMessageID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60498]);
  BOOL v5 = [v3 stringValue];
  BOOL v6 = (void *)[v4 initWithString:v5];

  return v6;
}

- (id)linksAttributeKey
{
  if (linksAttributeKey_onceToken != -1) {
    dispatch_once(&linksAttributeKey_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)linksAttributeKey_sInstance;

  return v2;
}

void __42__EDSearchableIndexItem_linksAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_links" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)linksAttributeKey_sInstance;
  linksAttributeKey_sInstance = v0;
}

- (id)phoneNumbersAttributeKey
{
  if (phoneNumbersAttributeKey_onceToken != -1) {
    dispatch_once(&phoneNumbersAttributeKey_onceToken, &__block_literal_global_37_0);
  }
  v2 = (void *)phoneNumbersAttributeKey_sInstance;

  return v2;
}

void __49__EDSearchableIndexItem_phoneNumbersAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_phone_numbers" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)phoneNumbersAttributeKey_sInstance;
  phoneNumbersAttributeKey_sInstance = v0;
}

- (id)addressesAttributeKey
{
  if (addressesAttributeKey_onceToken != -1) {
    dispatch_once(&addressesAttributeKey_onceToken, &__block_literal_global_39_0);
  }
  v2 = (void *)addressesAttributeKey_sInstance;

  return v2;
}

void __46__EDSearchableIndexItem_addressesAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_addresses" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)addressesAttributeKey_sInstance;
  addressesAttributeKey_sInstance = v0;
}

- (id)calendarEventsAttributeKey
{
  if (calendarEventsAttributeKey_onceToken != -1) {
    dispatch_once(&calendarEventsAttributeKey_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)calendarEventsAttributeKey_sInstance;

  return v2;
}

void __51__EDSearchableIndexItem_calendarEventsAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_calendar_events" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)calendarEventsAttributeKey_sInstance;
  calendarEventsAttributeKey_sInstance = v0;
}

- (id)trackingNumbersAttributeKey
{
  if (trackingNumbersAttributeKey_onceToken != -1) {
    dispatch_once(&trackingNumbersAttributeKey_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)trackingNumbersAttributeKey_sInstance;

  return v2;
}

void __52__EDSearchableIndexItem_trackingNumbersAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_tracking_numbers" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)trackingNumbersAttributeKey_sInstance;
  trackingNumbersAttributeKey_sInstance = v0;
}

- (id)flightNumbersAttributeKey
{
  if (flightNumbersAttributeKey_onceToken != -1) {
    dispatch_once(&flightNumbersAttributeKey_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)flightNumbersAttributeKey_sInstance;

  return v2;
}

void __50__EDSearchableIndexItem_flightNumbersAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_flight_numbers" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  os_log_t v1 = (void *)flightNumbersAttributeKey_sInstance;
  flightNumbersAttributeKey_sInstance = v0;
}

- (BOOL)requiresPreprocessing
{
  return 0;
}

- (id)fetchIndexableAttachments
{
}

- (void)setNeedsAllAttributesIndexingType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(EDSearchableIndexItem *)self indexingType];
  if (v3)
  {
    int64_t v4 = v3;
    BOOL v5 = +[EDSearchableIndexItem log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(EDSearchableIndexItem *)self identifier];
      int v8 = 138543874;
      BOOL v9 = v6;
      __int16 v10 = 2048;
      int64_t v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Upgrading item %{public}@ from type:%ld to type:%ld", (uint8_t *)&v8, 0x20u);
    }
    [(EDSearchableIndexItem *)self setIndexingType:0];
    self->_fetchBody = 1;
    searchableItem = self->_searchableItem;
    self->_searchableItem = 0;
  }
}

- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(EDSearchableIndexItem *)self indexingType];
  if (v3 != 5)
  {
    int64_t v4 = v3;
    BOOL v5 = +[EDSearchableIndexItem log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(EDSearchableIndexItem *)self identifier];
      int v8 = 138543874;
      BOOL v9 = v6;
      __int16 v10 = 2048;
      int64_t v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = 5;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Upgrading item %{public}@ from type:%ld to type:%ld", (uint8_t *)&v8, 0x20u);
    }
    [(EDSearchableIndexItem *)self setIndexingType:5];
    self->_fetchBody = 1;
    searchableItem = self->_searchableItem;
    self->_searchableItem = 0;
  }
}

- (void)addFlagsAttributesToAttributeSet:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(id)objc_opt_class() searchableMessageFlagsForBaseMessage:self->_baseMessage];
  [v4 addToAttributes:v5];
}

- (void)addUpdatableAttributesToAttributeSet:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(id)objc_opt_class() searchableMessageUpdateForBaseMessage:self->_baseMessage];
  [v4 addToAttributes:v5];
}

- (void)addDataDetectionAttributesToAttributeSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(EDSearchableIndexItem *)self message];

    if (v5)
    {
      BOOL v6 = [(EDSearchableIndexItem *)self message];
      BOOL v7 = [v6 dataDetectionAttributes];

      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __66__EDSearchableIndexItem_addDataDetectionAttributesToAttributeSet___block_invoke;
      uint64_t v14 = &unk_1E6C05940;
      id v15 = v4;
      id v16 = self;
      [v7 enumerateKeysAndObjectsUsingBlock:&v11];
      int v8 = +[EDSearchableIndexItem log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        __int16 v10 = [MEMORY[0x1E4F60E00] partiallyRedactedDictionary:v7];
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = identifier;
        __int16 v19 = 2112;
        objc_super v20 = v10;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Adding data detection results\n%@", buf, 0x16u);
      }
    }
  }
}

void __66__EDSearchableIndexItem_addDataDetectionAttributesToAttributeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:@"link"])
  {
    BOOL v6 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) linksAttributeKey];
    [v6 setValue:v5 forCustomKey:v7];
  }
  else if ([v13 isEqualToString:@"address"])
  {
    int v8 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) addressesAttributeKey];
    [v8 setValue:v5 forCustomKey:v7];
  }
  else if ([v13 isEqualToString:@"calendarEvent"])
  {
    BOOL v9 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) calendarEventsAttributeKey];
    [v9 setValue:v5 forCustomKey:v7];
  }
  else if ([v13 isEqualToString:@"phoneNumber"])
  {
    __int16 v10 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) phoneNumbersAttributeKey];
    [v10 setValue:v5 forCustomKey:v7];
  }
  else if ([v13 isEqual:@"TrackingNumber"])
  {
    uint64_t v11 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) trackingNumbersAttributeKey];
    [v11 setValue:v5 forCustomKey:v7];
  }
  else
  {
    if (![v13 isEqual:@"FlightInformation"]) {
      goto LABEL_14;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) flightNumbersAttributeKey];
    [v12 setValue:v5 forCustomKey:v7];
  }

LABEL_14:
}

- (void)preprocess
{
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (BOOL)alwaysMarkAsIndexed
{
  return 1;
}

- (unint64_t)itemInstantiationTime
{
  return self->_itemInstantiationTime;
}

- (void)setBodyData:(id)a3
{
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (void)setIncludeEncryptedBody:(BOOL)a3
{
  self->_includeEncryptedBody = a3;
}

- (BOOL)fetchBody
{
  return self->_fetchBody;
}

- (void)setHasCompleteData:(BOOL)a3
{
  self->_hasCompleteData = a3;
}

- (void)addStaticAttributesToAttributeSet:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Warning: about to index message with an empty subject. %{public}@", (uint8_t *)&v2, 0xCu);
}

@end