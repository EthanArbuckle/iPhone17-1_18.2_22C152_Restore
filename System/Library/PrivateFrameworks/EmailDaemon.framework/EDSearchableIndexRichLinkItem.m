@interface EDSearchableIndexRichLinkItem
+ (OS_os_log)log;
+ (id)identifierForMessageID:(id)a3 richLinkID:(id)a4;
+ (id)messageIDandRichLinkIDFromRichLinkIdentifier:(id)a3;
+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3;
- (BOOL)alwaysMarkAsIndexed;
- (BOOL)hasCompleteData;
- (BOOL)requiresPreprocessing;
- (BOOL)shouldExcludeFromIndex;
- (BOOL)shouldIndexImmediatelyPostPreprocessing;
- (EDPersistedMessageID)messagePersistentID;
- (EDSearchableIndexRichLinkItem)initWithMessageID:(id)a3 metadatum:(id)a4;
- (EDSearchableIndexRichLinkItemMetadatum)metadatum;
- (NSDate)dateReceived;
- (NSString)domainIdentifier;
- (NSString)identifier;
- (NSString)richLinkPersistentID;
- (id)fetchIndexableAttachments;
- (id)searchableItem;
- (int64_t)indexingType;
- (unint64_t)estimatedSizeInBytes;
- (unint64_t)itemInstantiationTime;
- (void)preprocess;
- (void)setIndexingType:(int64_t)a3;
- (void)setMessagePersistentID:(id)a3;
- (void)setMetadatum:(id)a3;
- (void)setRequiresPreprocessing:(BOOL)a3;
- (void)setRichLinkPersistentID:(id)a3;
@end

@implementation EDSearchableIndexRichLinkItem

+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3
{
  v3 = [MEMORY[0x1E4F60460] richLinkItemIdentifierFromSearchableItemIdentifier:a3];

  return v3;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EDSearchableIndexRichLinkItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_84 != -1) {
    dispatch_once(&log_onceToken_84, block);
  }
  v2 = (void *)log_log_84;

  return (OS_os_log *)v2;
}

void __36__EDSearchableIndexRichLinkItem_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_84;
  log_log_84 = (uint64_t)v1;
}

+ (id)messageIDandRichLinkIDFromRichLinkIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 richLinkItemIdentifierFromSearchableItemIdentifier:v4];
  v6 = [v5 componentsSeparatedByString:@"_"];
  if ([v6 count] == 2)
  {
    v7 = [EDPersistedMessageID alloc];
    v8 = [v6 objectAtIndexedSubscript:0];
    v9 = [(EDPersistedMessageID *)v7 initWithString:v8];

    v10 = [EDPersistedRichLinkID alloc];
    v11 = [v6 objectAtIndexedSubscript:1];
    v12 = [(EDPersistedRichLinkID *)v10 initWithString:v11];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F60DF0]) initWithFirst:v9 second:v12];
  }
  else
  {
    v14 = +[EDSearchableIndexRichLinkItem log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1DB39C000, v14, OS_LOG_TYPE_DEFAULT, "Rich link identifier %@ could not be split up into messageID and rich link ID.", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)identifierForMessageID:(id)a3 richLinkID:(id)a4
{
  id v5 = a4;
  v6 = NSString;
  v7 = [a3 stringValue];
  v8 = [v5 stringValue];
  v9 = [v6 stringWithFormat:@"%@_%@", v7, v8];
  v10 = [(id)*MEMORY[0x1E4F60598] stringByAppendingString:v9];

  return v10;
}

- (EDSearchableIndexRichLinkItem)initWithMessageID:(id)a3 metadatum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EDSearchableIndexRichLinkItem;
  v8 = [(EDSearchableIndexRichLinkItem *)&v16 init];
  if (v8)
  {
    v8->_itemInstantiationTime = mach_absolute_time();
    uint64_t v9 = [v6 copy];
    messagePersistentID = v8->_messagePersistentID;
    v8->_messagePersistentID = (EDPersistedMessageID *)v9;

    objc_storeStrong((id *)&v8->_metadatum, a4);
    v11 = objc_opt_class();
    v12 = [v7 richLinkID];
    uint64_t v13 = [v11 identifierForMessageID:v6 richLinkID:v12];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v13;

    v8->_indexingType = 6;
    v8->_requiresPreprocessing = 1;
  }

  return v8;
}

- (id)searchableItem
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_searchableItem && [(EDSearchableIndexRichLinkItem *)self requiresPreprocessing])
  {
    [(EDSearchableIndexRichLinkItem *)self setRequiresPreprocessing:0];
    id v3 = [(EDSearchableIndexRichLinkItem *)self metadatum];
    id v29 = objc_alloc_init(MEMORY[0x1E4F23850]);
    id v4 = [EDSearchableRichLink alloc];
    v28 = [v3 accountIdentifier];
    id v5 = [v3 mailboxIdentifiers];
    uint64_t v6 = [(EDSearchableIndexRichLinkItem *)self messagePersistentID];
    v27 = [v3 richLinkID];
    v26 = [v3 title];
    v25 = [v3 url];
    id v7 = [v3 dateSent];
    v8 = [v3 dateReceived];
    uint64_t v9 = [v3 senderAddress];
    v10 = [v3 recipientAddresses];
    v24 = (void *)v6;
    v11 = [(EDSearchableRichLink *)v4 initWithAccountIdentifier:v28 mailboxIdentifiers:v5 messageID:v6 id:v27 title:v26 url:v25 dateSent:v7 dateReceived:v8 sender:v9 recipients:v10];

    [(EDSearchableRichLink *)v11 addToAttributes:v29];
    v12 = +[EDSearchableIndexRichLinkItem log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v3 richLinkID];
      v14 = [(EDSearchableIndexRichLinkItem *)self identifier];
      v15 = [(EDSearchableIndexRichLinkItem *)self messagePersistentID];
      *(_DWORD *)buf = 138412802;
      v31 = v13;
      __int16 v32 = 2114;
      v33 = v14;
      __int16 v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Creating rich link attribute set with rich link ID %@ uniqueIdentifier %{public}@ relatedUniqueIdentifier %{public}@", buf, 0x20u);
    }
    id v16 = objc_alloc(MEMORY[0x1E4F23840]);
    id v17 = [(EDSearchableIndexRichLinkItem *)self identifier];
    uint64_t v18 = [(EDSearchableIndexRichLinkItem *)self domainIdentifier];
    v19 = (CSSearchableItem *)[v16 initWithUniqueIdentifier:v17 domainIdentifier:v18 attributeSet:v29];
    searchableItem = self->_searchableItem;
    self->_searchableItem = v19;

    v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(CSSearchableItem *)self->_searchableItem setExpirationDate:v21];
  }
  v22 = self->_searchableItem;

  return v22;
}

- (id)fetchIndexableAttachments
{
  return (id)[MEMORY[0x1E4F60D70] nullFuture];
}

- (void)preprocess
{
  id v2 = [(EDSearchableIndexRichLinkItem *)self searchableItem];
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (NSString)domainIdentifier
{
  id v2 = [(EDSearchableIndexRichLinkItem *)self metadatum];
  id v3 = [v2 domainIdentifier];

  return (NSString *)v3;
}

- (unint64_t)estimatedSizeInBytes
{
  return 0;
}

- (NSDate)dateReceived
{
  return 0;
}

- (BOOL)hasCompleteData
{
  return 1;
}

- (BOOL)alwaysMarkAsIndexed
{
  return 0;
}

- (BOOL)shouldExcludeFromIndex
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)indexingType
{
  return self->_indexingType;
}

- (void)setIndexingType:(int64_t)a3
{
  self->_indexingType = a3;
}

- (unint64_t)itemInstantiationTime
{
  return self->_itemInstantiationTime;
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
}

- (EDSearchableIndexRichLinkItemMetadatum)metadatum
{
  return self->_metadatum;
}

- (void)setMetadatum:(id)a3
{
}

- (NSString)richLinkPersistentID
{
  return self->_richLinkPersistentID;
}

- (void)setRichLinkPersistentID:(id)a3
{
}

- (BOOL)requiresPreprocessing
{
  return self->_requiresPreprocessing;
}

- (void)setRequiresPreprocessing:(BOOL)a3
{
  self->_requiresPreprocessing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkPersistentID, 0);
  objc_storeStrong((id *)&self->_metadatum, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end