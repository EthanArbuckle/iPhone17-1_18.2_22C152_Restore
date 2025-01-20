@interface EDSearchableIndexAttachmentItem
+ (OS_os_log)log;
+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3;
+ (id)identifierForAttachmentPersistentID:(id)a3;
- (BOOL)alwaysMarkAsIndexed;
- (BOOL)hasCompleteData;
- (BOOL)requiresPreprocessing;
- (BOOL)shouldExcludeFromIndex;
- (BOOL)shouldIndexImmediatelyPostPreprocessing;
- (EDPersistedAttachmentID)attachmentPersistentID;
- (EDPersistedMessageID)messagePersistentID;
- (EDSearchableIndexAttachmentItem)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 metadatum:(id)a5;
- (EDSearchableIndexAttachmentItemMetadatum)metadatum;
- (EFPromise)attributeSetForFilePromise;
- (NSDate)dateReceived;
- (NSString)domainIdentifier;
- (NSString)identifier;
- (double)searchableItemProcessingDelay;
- (id)fetchIndexableAttachments;
- (id)searchableItem;
- (int64_t)indexingType;
- (unint64_t)estimatedSizeInBytes;
- (unint64_t)itemInstantiationTime;
- (void)preprocess;
- (void)setAttachmentPersistentID:(id)a3;
- (void)setAttributeSetForFilePromise:(id)a3;
- (void)setIndexingType:(int64_t)a3;
- (void)setMessagePersistentID:(id)a3;
- (void)setMetadatum:(id)a3;
- (void)setRequiresPreprocessing:(BOOL)a3;
- (void)setSearchableItemProcessingDelay:(double)a3;
@end

@implementation EDSearchableIndexAttachmentItem

+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3
{
  v3 = [MEMORY[0x1E4F60460] attachmentPersistentIDFromItemIdentifier:a3];
  if (v3) {
    v4 = [[EDPersistedAttachmentID alloc] initWithString:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDSearchableIndexAttachmentItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_79 != -1) {
    dispatch_once(&log_onceToken_79, block);
  }
  v2 = (void *)log_log_79;

  return (OS_os_log *)v2;
}

void __38__EDSearchableIndexAttachmentItem_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_79;
  log_log_79 = (uint64_t)v1;
}

+ (id)identifierForAttachmentPersistentID:(id)a3
{
  id v3 = (void *)*MEMORY[0x1E4F60590];
  v4 = [a3 stringValue];
  v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (EDSearchableIndexAttachmentItem)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 metadatum:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDSearchableIndexAttachmentItem;
  v11 = [(EDSearchableIndexAttachmentItem *)&v19 init];
  if (v11)
  {
    v11->_itemInstantiationTime = mach_absolute_time();
    uint64_t v12 = [v8 copy];
    attachmentPersistentID = v11->_attachmentPersistentID;
    v11->_attachmentPersistentID = (EDPersistedAttachmentID *)v12;

    uint64_t v14 = [v9 copy];
    messagePersistentID = v11->_messagePersistentID;
    v11->_messagePersistentID = (EDPersistedMessageID *)v14;

    objc_storeStrong((id *)&v11->_metadatum, a5);
    uint64_t v16 = [(id)objc_opt_class() identifierForAttachmentPersistentID:v8];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    v11->_indexingType = 3;
    v11->_requiresPreprocessing = 1;
    v11->_searchableItemProcessingDelay = 0.0;
  }

  return v11;
}

- (void)preprocess
{
  id v2 = [(EDSearchableIndexAttachmentItem *)self searchableItem];
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (id)searchableItem
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!self->_searchableItem && [(EDSearchableIndexAttachmentItem *)self requiresPreprocessing])
  {
    [(EDSearchableIndexAttachmentItem *)self setRequiresPreprocessing:0];
    id v3 = [(EDSearchableIndexAttachmentItem *)self metadatum];
    id v4 = objc_alloc(MEMORY[0x1E4F23850]);
    v5 = [v3 contentType];
    v35 = (void *)[v4 initWithContentType:v5];

    v31 = [v3 mailboxIdentifiers];
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v36.st_blksize = v6;
    *(timespec *)v36.st_qspare = v6;
    v36.st_birthtimespec = v6;
    *(timespec *)&v36.st_size = v6;
    v36.st_mtimespec = v6;
    v36.st_ctimespec = v6;
    *(timespec *)&v36.st_uid = v6;
    v36.st_atimespec = v6;
    *(timespec *)&v36.st_dev = v6;
    id v7 = [v3 attachmentFileURL];
    LODWORD(v4) = stat((const char *)[v7 fileSystemRepresentation], &v36);

    if (v4 || !v36.st_birthtimespec.tv_sec)
    {
      v30 = 0;
    }
    else
    {
      v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v36.st_birthtimespec.tv_sec];
    }
    id v8 = [EDSearchableAttachment alloc];
    v34 = [v3 attachmentFileURL];
    v33 = [v3 contentType];
    v32 = [v3 name];
    id v9 = [v3 accountIdentifier];
    id v10 = [(EDSearchableIndexAttachmentItem *)self messagePersistentID];
    v11 = [v3 messageIDHeader];
    uint64_t v12 = [v3 dateSent];
    v13 = [v3 dateReceived];
    uint64_t v14 = [v3 senderAddress];
    v15 = [v3 recipientAddresses];
    uint64_t v16 = [(EDSearchableAttachment *)v8 initWithContentURL:v34 contentType:v33 name:v32 accountIdentifier:v9 mailboxIdentifiers:v31 messageID:v10 messageIDHeader:v11 dateSent:v12 dateReceived:v13 sender:v14 recipients:v15 downloadDate:v30];

    [(EDSearchableAttachment *)v16 addToAttributes:v35];
    v17 = +[EDSearchableIndexAttachmentItem log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(EDSearchableAttachment *)v16 displayName];
      objc_super v19 = [(EDSearchableAttachment *)v16 contentURL];
      v20 = [(EDSearchableIndexAttachmentItem *)self identifier];
      v21 = [(EDSearchableIndexAttachmentItem *)self messagePersistentID];
      *(_DWORD *)buf = 138413058;
      v38 = v18;
      __int16 v39 = 2112;
      v40 = v19;
      __int16 v41 = 2114;
      v42 = v20;
      __int16 v43 = 2114;
      v44 = v21;
      _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Creating attachment attribute set with displayName %@ contentURL %@ uniqueIdentifier %{public}@ relatedUniqueIdentifier %{public}@", buf, 0x2Au);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F23840]);
    v23 = [(EDSearchableIndexAttachmentItem *)self identifier];
    v24 = [(EDSearchableIndexAttachmentItem *)self domainIdentifier];
    v25 = (CSSearchableItem *)[v22 initWithUniqueIdentifier:v23 domainIdentifier:v24 attributeSet:v35];
    searchableItem = self->_searchableItem;
    self->_searchableItem = v25;

    v27 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(CSSearchableItem *)self->_searchableItem setExpirationDate:v27];
  }
  v28 = self->_searchableItem;

  return v28;
}

- (EFPromise)attributeSetForFilePromise
{
  attributeSetForFilePromise = self->_attributeSetForFilePromise;
  if (!attributeSetForFilePromise)
  {
    id v4 = [MEMORY[0x1E4F60E18] promise];
    v5 = self->_attributeSetForFilePromise;
    self->_attributeSetForFilePromise = v4;

    timespec v6 = self->_attributeSetForFilePromise;
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_notSupportedError");
    [(EFPromise *)v6 finishWithError:v7];

    attributeSetForFilePromise = self->_attributeSetForFilePromise;
  }

  return attributeSetForFilePromise;
}

- (NSString)domainIdentifier
{
  id v2 = [(EDSearchableIndexAttachmentItem *)self metadatum];
  id v3 = [v2 domainIdentifier];

  return (NSString *)v3;
}

- (id)fetchIndexableAttachments
{
  return (id)[MEMORY[0x1E4F60D70] nullFuture];
}

- (NSDate)dateReceived
{
  return 0;
}

- (unint64_t)estimatedSizeInBytes
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(EDSearchableIndexAttachmentItem *)self metadatum];
  v5 = [v4 attachmentFileURL];
  timespec v6 = [v5 path];
  id v7 = [v3 attributesOfItemAtPath:v6 error:0];
  unint64_t v8 = [v7 fileSize];

  return v8;
}

- (BOOL)hasCompleteData
{
  return 1;
}

- (void)setIndexingType:(int64_t)a3
{
  if (a3 != 3)
  {
    timespec v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"EDSearchableIndexAttachmentItem.m" lineNumber:173 description:@"Attempting to set unexpected indexing type on EDSearchableIndexAttachmentItem"];
  }
  self->_indexingType = a3;
}

- (int64_t)indexingType
{
  return self->_indexingType;
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

- (unint64_t)itemInstantiationTime
{
  return self->_itemInstantiationTime;
}

- (EDPersistedAttachmentID)attachmentPersistentID
{
  return self->_attachmentPersistentID;
}

- (void)setAttachmentPersistentID:(id)a3
{
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
}

- (EDSearchableIndexAttachmentItemMetadatum)metadatum
{
  return self->_metadatum;
}

- (void)setMetadatum:(id)a3
{
}

- (void)setAttributeSetForFilePromise:(id)a3
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

- (double)searchableItemProcessingDelay
{
  return self->_searchableItemProcessingDelay;
}

- (void)setSearchableItemProcessingDelay:(double)a3
{
  self->_searchableItemProcessingDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSetForFilePromise, 0);
  objc_storeStrong((id *)&self->_metadatum, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_attachmentPersistentID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end