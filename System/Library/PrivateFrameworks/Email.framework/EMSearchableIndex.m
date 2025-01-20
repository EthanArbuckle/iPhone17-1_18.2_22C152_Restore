@interface EMSearchableIndex
+ (OS_os_log)log;
+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3;
+ (id)persistentIDForSearchableItem:(id)a3;
+ (id)remoteInterface;
+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3;
- (EMRemoteConnection)connection;
- (EMSearchableIndex)initWithRemoteConnection:(id)a3;
- (void)indexSummaries:(id)a3;
- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation EMSearchableIndex

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86BB8];
  [v5 setClasses:v4 forSelector:sel_reindexSearchableItemsWithIdentifiers_acknowledgementHandler_ argumentIndex:0 ofReply:0];

  return v5;
}

- (EMSearchableIndex)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndex;
  v6 = [(EMSearchableIndex *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"richLink:"])
  {
    v4 = [v3 substringFromIndex:objc_msgSend(@"richLink:", "length")];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"attachment:"])
  {
    v4 = [v3 substringFromIndex:objc_msgSend(@"attachment:", "length")];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__EMSearchableIndex_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_36 != -1) {
    dispatch_once(&log_onceToken_36, block);
  }
  v2 = (void *)log_log_36;
  return (OS_os_log *)v2;
}

void __24__EMSearchableIndex_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_36;
  log_log_36 = (uint64_t)v1;
}

+ (id)persistentIDForSearchableItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 uniqueIdentifier];
  id v5 = +[EMSearchableIndex attachmentPersistentIDFromItemIdentifier:v4];
  if (v5)
  {
  }
  else
  {
    v6 = +[EMSearchableIndex richLinkItemIdentifierFromSearchableItemIdentifier:v4];

    if (!v6) {
      goto LABEL_9;
    }
  }
  v7 = [v3 attributeSet];
  v8 = [v7 relatedUniqueIdentifier];

  if (v8)
  {
    objc_super v9 = [v3 attributeSet];
    uint64_t v10 = [v9 relatedUniqueIdentifier];

    v4 = (void *)v10;
  }
  else
  {
    v11 = +[EMSearchableIndex log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[EMSearchableIndex persistentIDForSearchableItem:]((uint64_t)v4, v11);
    }

    v4 = 0;
  }
LABEL_9:

  return v4;
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(EMSearchableIndex *)self connection];
  v8 = [v7 reattemptingRemoteObjectProxy];
  [v8 reindexSearchableItemsWithIdentifiers:v9 acknowledgementHandler:v6];
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  id v6 = a3;
  v4 = [(EMSearchableIndex *)self connection];
  id v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 reindexAllSearchableItemsWithAcknowledgementHandler:v6];
}

- (void)indexSummaries:(id)a3
{
  id v6 = a3;
  v4 = [(EMSearchableIndex *)self connection];
  id v5 = [v4 reattemptingRemoteObjectProxy];
  [v5 indexSummaries:v6];
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)persistentIDForSearchableItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Encountered a searchable item %{public}@ without a relatedUniqueIdentifier message ID indexed", (uint8_t *)&v2, 0xCu);
}

@end