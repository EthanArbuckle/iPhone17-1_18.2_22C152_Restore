@interface SGURLContainer
+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 documentIdentifiers:(id)a4 entityStore:(id)a5;
+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 domainSelection:(id)a4 entityStore:(id)a5;
+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 entityStore:(id)a4;
+ (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdentifier:(id)a5 entityStore:(id)a6;
- (SGURLContainer)init;
- (id)numberOfExtractions;
- (void)dealloc;
- (void)flushWrites;
- (void)writeWithEntityStore:(id)a3;
@end

@implementation SGURLContainer

- (void).cxx_destruct
{
}

- (id)numberOfExtractions
{
  v2 = NSNumber;
  uint64_t v3 = [(NSMutableArray *)self->_urls count];
  return (id)[v2 numberWithUnsignedInteger:v3];
}

- (void)flushWrites
{
  self->_needsFlushing = 0;
  +[SGDNotificationBroadcaster emitURLChanged];
}

- (void)dealloc
{
  if (self->_needsFlushing) {
    [(SGURLContainer *)self flushWrites];
  }
  v3.receiver = self;
  v3.super_class = (Class)SGURLContainer;
  [(SGURLContainer *)&v3 dealloc];
}

- (void)writeWithEntityStore:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[SGSqlEntityStore defaultStore];
  }
  v7 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_urls;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1CB79B230](v9);
        self->_needsFlushing = 1;
        objc_msgSend(v7, "writeURL:", v13, (void)v15);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

- (SGURLContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGURLContainer;
  v2 = [(SGURLContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    urls = v2->_urls;
    v2->_urls = (NSMutableArray *)v3;

    v2->_needsFlushing = 0;
  }
  return v2;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 domainSelection:(id)a4 entityStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[SGSqlEntityStore defaultStore];
  }
  uint64_t v12 = v11;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v13 = [v8 globPatterns];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__SGURLContainer_deleteAllURLsWithBundleIdentifier_domainSelection_entityStore___block_invoke;
  v17[3] = &unk_1E65BB718;
  uint64_t v20 = &v21;
  id v14 = v12;
  id v18 = v14;
  id v15 = v7;
  id v19 = v15;
  objc_msgSend(v13, "_pas_enumerateChunksOfSize:usingBlock:", 100, v17);

  LOBYTE(v13) = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v13;
}

uint64_t __80__SGURLContainer_deleteAllURLsWithBundleIdentifier_domainSelection_entityStore___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) deleteURLsFromBundleIdentifier:*(void *)(a1 + 40) groupIdentifierGlobs:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  return result;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 documentIdentifiers:(id)a4 entityStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[SGSqlEntityStore defaultStore];
  }
  uint64_t v12 = v11;
  char v13 = [v11 deleteURLsFromBundleIdentifier:v7 documentIdentifiers:v8];

  return v13;
}

+ (BOOL)deleteAllURLsWithBundleIdentifier:(id)a3 entityStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[SGSqlEntityStore defaultStore];
  }
  id v9 = v8;
  char v10 = [v8 deleteURLsFromBundleIdentifier:v5];

  return v10;
}

+ (id)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdentifier:(id)a5 entityStore:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  char v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[SGSqlEntityStore defaultStore];
  }
  id v15 = v14;
  long long v16 = [v14 urlsFoundBetweenStartDate:v9 endDate:v10 bundleIdentifier:v11];

  return v16;
}

@end