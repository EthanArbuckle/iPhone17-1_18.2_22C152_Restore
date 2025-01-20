@interface NSFileProviderExtension
+ (BOOL)_initializedByViewServices;
+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSDictionary *)metadata error:(NSError *)error;
+ (NSURL)placeholderURLForURL:(NSURL *)url;
+ (id)_relativeComponentsOfURL:(id)a3 fromBaseURL:(id)a4;
+ (id)_resourceIDOfURL:(id)a3 outError:(id *)a4;
- (BOOL)_fp_itemsMightBeTheSame:(id)a3 otherItem:(id)a4 url:(id)a5;
- (NSArray)supportedServiceSourcesForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier error:(NSError *)error;
- (NSFileProviderDomain)domain;
- (NSFileProviderExtension)init;
- (NSFileProviderItem)itemForIdentifier:(NSFileProviderItemIdentifier)identifier error:(NSError *)error;
- (NSFileProviderItemIdentifier)persistentIdentifierForItemAtURL:(NSURL *)url;
- (NSProgress)fetchThumbnailsForItemIdentifiers:(NSArray *)itemIdentifiers requestedSize:(CGSize)size perThumbnailCompletionHandler:(void *)perThumbnailCompletionHandler completionHandler:(void *)completionHandler;
- (NSString)description;
- (NSString)memberQueueProviderIdentifier;
- (NSString)providerIdentifier;
- (NSURL)URLForItemWithPersistentIdentifier:(NSFileProviderItemIdentifier)identifier;
- (NSURL)documentStorageURL;
- (NSURL)memberQueueDocumentStorageURL;
- (OS_dispatch_queue)memberQueue;
- (id)currentRequest;
- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (id)enumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier error:(NSError *)error;
- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 completionHandler:(id)a5;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 completionHandler:(id)a7;
- (id)fetchPublishingURLForItemIdentifier:(id)a3 completionHandler:(id)a4;
- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)_withRequest:(id)a3 execute:(id)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8;
- (void)createDirectoryWithName:(NSString *)directoryName inParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler;
- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)deleteItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleEventsForBackgroundURLSession:(id)a3 completionHandler:(id)a4;
- (void)importDidFinishWithCompletionHandler:(id)a3;
- (void)importDocumentAtURL:(NSURL *)fileURL toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler;
- (void)itemChanged:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 completionHandler:(id)a7;
- (void)itemChangedAtURL:(NSURL *)url;
- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3;
- (void)providePlaceholderAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)renameItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toName:(NSString *)itemName completionHandler:(void *)completionHandler;
- (void)reparentItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemWithIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier newName:(NSString *)newName completionHandler:(void *)completionHandler;
- (void)setDomain:(id)a3;
- (void)setFavoriteRank:(NSNumber *)favoriteRank forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)setLastUsedDate:(NSDate *)lastUsedDate forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueDocumentStorageURL:(id)a3;
- (void)setMemberQueueProviderIdentifier:(id)a3;
- (void)setTagData:(NSData *)tagData forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)startProvidingItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)trashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler;
- (void)untrashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler;
@end

@implementation NSFileProviderExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  id obj = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_opt_class();
    [v5 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 481, @"extension context is of an invalid type of class (expected: %@, actual: %@)", v6, objc_opt_class() object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_extensionContext, obj);
}

- (void)_withRequest:(id)a3 execute:(id)a4
{
  id v9 = a3;
  v7 = (void (**)(void))a4;
  objc_storeStrong((id *)&self->_currentRequest, a3);
  v7[2](v7);
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;
}

- (NSFileProviderExtension)init
{
  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderExtension;
  v2 = [(NSFileProviderExtension *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("serial dispatch queue for extension requests", v3);
    extensionDispatchQueue = v2->_extensionDispatchQueue;
    v2->_extensionDispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("NSFileProviderExtension member sync queue", v6);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (BOOL)writePlaceholderAtURL:(NSURL *)placeholderURL withMetadata:(NSDictionary *)metadata error:(NSError *)error
{
  return +[NSFileProviderManager writePlaceholderAtURL:placeholderURL withDictionary:metadata error:error];
}

+ (NSURL)placeholderURLForURL:(NSURL *)url
{
  return +[NSFileProviderManager placeholderURLForURL:url];
}

- (NSString)providerIdentifier
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__22;
  v11 = __Block_byref_object_dispose__22;
  id v12 = 0;
  v3 = [(NSFileProviderExtension *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NSFileProviderExtension_providerIdentifier__block_invoke;
  v6[3] = &unk_1E5AF2468;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __45__NSFileProviderExtension_providerIdentifier__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v7, v2);
}

- (NSURL)documentStorageURL
{
  v2 = [(NSFileProviderExtension *)self domain];
  v3 = +[NSFileProviderManager managerForDomain:v2];
  uint64_t v4 = [v3 documentStorageURL];

  return (NSURL *)v4;
}

- (NSURL)URLForItemWithPersistentIdentifier:(NSFileProviderItemIdentifier)identifier
{
  v3 = identifier;
  uint64_t v4 = +[NSFileProviderManager legacyDefaultManager];
  uint64_t v5 = [v4 documentStorageURL];

  if ([(NSString *)v3 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 URLByAppendingPathComponent:v3];
  }
  uint64_t v7 = v6;

  return (NSURL *)v7;
}

+ (id)_resourceIDOfURL:(id)a3 outError:(id *)a4
{
  id v6 = 0;
  [a3 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C5A0] error:a4];
  id v4 = v6;

  return v4;
}

+ (id)_relativeComponentsOfURL:(id)a3 fromBaseURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  id v24 = v7;
  id v10 = (id)[v7 copy];
  v25 = v8;
  id v26 = 0;
  v11 = +[NSFileProviderExtension _resourceIDOfURL:v8 outError:&v26];
  id v12 = v26;
  v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    unint64_t i = 0;
    goto LABEL_8;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"NSFileProviderExtension.m", 190, @"%s cannot resolve the resource ID of the URL (%@). Error: %@", "+[NSFileProviderExtension _relativeComponentsOfURL:fromBaseURL:]", v25, v13 object file lineNumber description];
  for (unint64_t i = 0; ; ++i)
  {

LABEL_8:
    v17 = v10;
    v18 = +[NSFileProviderExtension _resourceIDOfURL:v10 outError:0];
    v15 = v18;
    if (v18)
    {
      if ([v18 isEqual:v11]) {
        break;
      }
    }
    uint64_t v19 = [v10 lastPathComponent];
    if (!v19)
    {
      v22 = v24;
      NSLog(&cfstr_TheLastCompone.isa, v24);
      [v9 removeAllObjects];
      goto LABEL_19;
    }
    v20 = (void *)v19;
    [v9 insertObject:v19 atIndex:0];
    v21 = [v10 URLByDeletingLastPathComponent];
    if ([v21 isEqual:v10])
    {
      v22 = v24;
LABEL_17:
      [v9 removeAllObjects];

      goto LABEL_19;
    }
    id v10 = v21;

    if (i >= 0x64)
    {
      v22 = v24;
      NSLog(&cfstr_TheUrlCannotBe.isa, v24, 100);
      v17 = v10;
      goto LABEL_17;
    }
  }
  v22 = v24;
LABEL_19:

  return v9;
}

- (NSFileProviderItemIdentifier)persistentIdentifierForItemAtURL:(NSURL *)url
{
  v3 = url;
  id v4 = +[NSFileProviderManager legacyDefaultManager];
  uint64_t v5 = [v4 documentStorageURL];

  if (objc_msgSend(v5, "fp_relationshipToItemAtURL:", v3) == 1)
  {
    id v6 = @"NSFileProviderRootContainerItemIdentifier";
  }
  else
  {
    id v7 = +[NSFileProviderExtension _relativeComponentsOfURL:v3 fromBaseURL:v5];
    if ([v7 count])
    {
      id v6 = [v7 componentsJoinedByString:@"/"];
    }
    else
    {
      NSLog(&cfstr_SIsCalledWithA.isa, "-[NSFileProviderExtension persistentIdentifierForItemAtURL:]", v3, v5);
      id v6 = 0;
    }
  }

  return (NSFileProviderItemIdentifier)v6;
}

- (void)providePlaceholderAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", url, completionHandler);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 246, @"%@ must implement method %@ and not call super", v6, v7 object file lineNumber description];
}

- (void)startProvidingItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", url, completionHandler);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 252, @"%@ must implement method %@ and not call super", v6, v7 object file lineNumber description];
}

- (void)itemChangedAtURL:(NSURL *)url
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", url);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 258, @"%@ must implement method %@ and not call super", v5, v6 object file lineNumber description];
}

- (NSFileProviderItem)itemForIdentifier:(NSFileProviderItemIdentifier)identifier error:(NSError *)error
{
  return 0;
}

- (void)evictItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 277, @"%@ must implement method %@ and not call super", v6, v7 object file lineNumber description];
}

- (void)itemChanged:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = (void (**)(id, void *, void))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(a2);
    [v21 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 337, @"%@ %@ called with object of unexpected class %@.", v22, v23, objc_opt_class() object file lineNumber description];
  }
  v17 = [v13 itemIdentifier];
  id v24 = 0;
  v18 = [(NSFileProviderExtension *)self itemForIdentifier:v17 error:&v24];
  id v19 = v24;

  if (v18)
  {
    if (hasConflictingVersion(v18, v14, a5))
    {
      v16[2](v16, v18, 0);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
      [WeakRetained applyFieldChangesToItem:v13 baseVersion:v14 changedFields:a5 contents:v15 lastKnownVendorItem:v18 extensionInstance:self completionHandler:v16];
    }
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }
}

- (void)changeItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 completionHandler:(id)a8
{
  id v13 = a8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__NSFileProviderExtension_changeItem_baseVersion_changedFields_contents_options_completionHandler___block_invoke;
  v15[3] = &unk_1E5AF3070;
  id v16 = v13;
  id v14 = v13;
  [(NSFileProviderExtension *)self itemChanged:a3 baseVersion:a4 changedFields:a5 contents:a6 completionHandler:v15];
}

uint64_t __99__NSFileProviderExtension_changeItem_baseVersion_changedFields_contents_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSFileProviderExtension *)self URLForItemWithPersistentIdentifier:v8];
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28C58] fileProviderErrorForNonExistentItemWithIdentifier:v8];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v17);

    v18 = objc_opt_new();
    goto LABEL_14;
  }
  if (!v9) {
    goto LABEL_11;
  }
  v30[0] = 0;
  id v12 = [(NSFileProviderExtension *)self itemForIdentifier:v8 error:v30];
  id v13 = v30[0];
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v15 = v13;
      goto LABEL_10;
    }
    id v29 = v13;
    id v14 = [(NSFileProviderExtension *)self itemForIdentifier:v8 error:&v29];
    id v15 = v29;

    id v16 = [v14 itemVersion];
    if ([v16 isEqual:v9])
    {

LABEL_10:
LABEL_11:
      v18 = objc_opt_new();
      [v18 setTotalUnitCount:1];
      [v18 setCancellable:1];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke;
      v27[3] = &unk_1E5AF0748;
      v27[4] = self;
      id v19 = v11;
      id v28 = v19;
      [v18 setCancellationHandler:v27];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_2;
      v22[3] = &unk_1E5AF4E38;
      id v26 = v10;
      v22[4] = self;
      id v23 = v19;
      id v24 = v8;
      id v25 = v9;
      [(NSFileProviderExtension *)self providePlaceholderAtURL:v23 completionHandler:v22];

      goto LABEL_14;
    }
    v20 = [MEMORY[0x1E4F28C58] fileProviderErrorForNonExistentItemWithIdentifier:v8];
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v20);

    v18 = objc_opt_new();
    id v13 = v15;
  }
  else
  {
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v13);
    v18 = objc_opt_new();
  }

LABEL_14:

  return v18;
}

uint64_t __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopProvidingItemAtURL:*(void *)(a1 + 40)];
}

void __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5AF4E38;
    id v6 = *(id *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    [v4 startProvidingItemAtURL:v5 completionHandler:v8];
  }
}

void __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v18 = 0;
    uint64_t v7 = [v5 itemForIdentifier:v6 error:&v18];
    id v4 = v18;
    if (v7)
    {
      if (*(void *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v8 = [v7 itemVersion];
        if (([v8 isEqual:*(void *)(a1 + 48)] & 1) == 0)
        {
          uint64_t v13 = *(void *)(a1 + 64);
          id v14 = [MEMORY[0x1E4F28C58] fileProviderErrorForNonExistentItemWithIdentifier:*(void *)(a1 + 40)];
          (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v14);

          goto LABEL_11;
        }
      }
      id v9 = *(void **)(a1 + 56);
      id v10 = [v9 lastPathComponent];
      id v11 = [*(id *)(a1 + 32) memberQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_4;
      v15[3] = &unk_1E5AF4E10;
      id v17 = *(id *)(a1 + 64);
      id v16 = v7;
      id v12 = (id)objc_msgSend(v9, "fp_copyToTempFolderWithFilename:queue:precomputedItemSize:completion:", v10, v11, 0, v15);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
LABEL_11:

    goto LABEL_12;
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_12:
}

uint64_t __88__NSFileProviderExtension_fetchContentsForItemWithIdentifier_version_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 usingExistingContentsAtURL:(id)a5 existingVersion:(id)a6 completionHandler:(id)a7
{
  return -[NSFileProviderExtension fetchContentsForItemWithIdentifier:version:completionHandler:](self, "fetchContentsForItemWithIdentifier:version:completionHandler:", a3, a4, a7, a6);
}

+ (BOOL)_initializedByViewServices
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSFileProviderExtension *)self domain];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p for %@>", v4, self, v6];

  return (NSString *)v7;
}

- (id)currentRequest
{
  return self->_currentRequest;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSURL)memberQueueDocumentStorageURL
{
  return self->_memberQueueDocumentStorageURL;
}

- (void)setMemberQueueDocumentStorageURL:(id)a3
{
}

- (NSString)memberQueueProviderIdentifier
{
  return self->_memberQueueProviderIdentifier;
}

- (void)setMemberQueueProviderIdentifier:(id)a3
{
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_memberQueueProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_memberQueueDocumentStorageURL, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_destroyWeak((id *)&self->_extensionContext);

  objc_storeStrong((id *)&self->_extensionDispatchQueue, 0);
}

- (void)importDocumentAtURL:(NSURL *)fileURL toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)createDirectoryWithName:(NSString *)directoryName inParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)renameItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toName:(NSString *)itemName completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)reparentItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemWithIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier newName:(NSString *)newName completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  id v8 = FPNotSupportedError();
  v6[2](v6, 0, v8);
}

- (void)trashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v6 = FPNotSupportedError();
  v4[2](v4, 0, v6);
}

- (void)untrashItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier toParentItemIdentifier:(NSFileProviderItemIdentifier)parentItemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)deleteItemWithIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NSFileProviderExtension(NSFileProviderActions) importDocumentAtURL:toParentItemIdentifier:completionHandler:]();
  }

  uint64_t v6 = FPNotSupportedError();
  v4[2](v4, v6);
}

- (void)setLastUsedDate:(NSDate *)lastUsedDate forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)setTagData:(NSData *)tagData forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (void)setFavoriteRank:(NSNumber *)favoriteRank forItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v5 = completionHandler;
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  uint64_t v7 = FPNotSupportedError();
  v5[2](v5, 0, v7);
}

- (id)fetchPublishingURLForItemIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void, void *))a4;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  uint64_t v6 = FPNotSupportedError();
  v4[2](v4, 0, v6);

  uint64_t v7 = objc_opt_new();

  return v7;
}

- (id)disconnectWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void *))a4;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  uint64_t v6 = FPNotSupportedError();
  v4[2](v4, v6);

  uint64_t v7 = objc_opt_new();

  return v7;
}

- (id)performActionWithIdentifier:(id)a3 onItemsWithIdentifiers:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = fp_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v13;
    id v15 = NSStringFromSelector(a2);
    int v16 = 138412802;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ must implement method %@ and not call super (action identifier: %@)", (uint8_t *)&v16, 0x20u);
  }
  id v10 = FPNotSupportedError();
  v8[2](v8, v10);

  id v11 = objc_opt_new();

  return v11;
}

- (void)handleEventsForBackgroundURLSession:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(void))a4;
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  v4[2](v4);
}

- (NSProgress)fetchThumbnailsForItemIdentifiers:(NSArray *)itemIdentifiers requestedSize:(CGSize)size perThumbnailCompletionHandler:(void *)perThumbnailCompletionHandler completionHandler:(void *)completionHandler
{
  id v7 = completionHandler;
  id v8 = FPNotSupportedError();
  (*((void (**)(void *, void *))completionHandler + 2))(v7, v8);

  return 0;
}

- (NSArray)supportedServiceSourcesForItemIdentifier:(NSFileProviderItemIdentifier)itemIdentifier error:(NSError *)error
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)enumeratorForContainerItemIdentifier:(NSFileProviderItemIdentifier)containerItemIdentifier error:(NSError *)error
{
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  if (error)
  {
    *error = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  }
  return 0;
}

- (id)enumeratorForSearchQuery:(id)a3 error:(id *)a4
{
  uint64_t v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSFileProviderExtension(NSFileProviderActions) setLastUsedDate:forItemIdentifier:completionHandler:]();
  }

  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  }
  return 0;
}

- (void)materializedItemsDidChangeWithCompletionHandler:(id)a3
{
}

- (BOOL)_fp_itemsMightBeTheSame:(id)a3 otherItem:(id)a4 url:(id)a5
{
  v71[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = contentTypeOfItem(v8);
  id v12 = contentTypeOfItem(v9);
  id v13 = v11;
  id v14 = v12;
  int v15 = isFolderContentType(v13);
  if (v15 != isFolderContentType(v14)
    || (areCompatibleContentTypes(v13, v14, (void *)*MEMORY[0x1E4F444D8]) & 1) == 0)
  {

LABEL_28:
    v49 = fp_current_or_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:]();
    }
    goto LABEL_30;
  }
  char v16 = areCompatibleContentTypes(v13, v14, (void *)*MEMORY[0x1E4F44308]);

  if ((v16 & 1) == 0) {
    goto LABEL_28;
  }
  int v17 = isFolderContentType(v13);
  if ((fpfs_supports_parent_mtime_iopolicy() & 1) != 0 || !v17)
  {
    __int16 v18 = [v8 contentModificationDate];
    [v18 timeIntervalSince1970];
    double v20 = v19;

    id v21 = [v9 contentModificationDate];
    [v21 timeIntervalSince1970];
    double v23 = v22;

    if (trunc(v20) != trunc(v23))
    {
      v49 = fp_current_or_default_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:].cold.4();
      }
LABEL_30:

      BOOL v50 = 0;
      goto LABEL_31;
    }
  }
  if ((v17 & 1) == 0)
  {
    char v62 = 0;
    if (v10)
    {
      id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v25 = [v10 path];
      [v24 fileExistsAtPath:v25 isDirectory:&v62];

      if (v62)
      {
        id v26 = [v9 itemIdentifier];
        v27 = [(NSFileProviderExtension *)self URLForItemWithPersistentIdentifier:v26];

        id v28 = v10;
        id v29 = v27;
        memset(&v69, 0, sizeof(v69));
        memset(&v68, 0, sizeof(v68));
        id v30 = [v28 path];
        int v31 = lstat((const char *)[v30 fileSystemRepresentation], &v69);

        if ((v31 & 0x80000000) == 0)
        {
          id v32 = [v29 path];
          int v33 = lstat((const char *)[v32 fileSystemRepresentation], &v68);

          if ((v33 & 0x80000000) == 0
            && (v69.st_mode & 0xF000) == 0x4000
            && (v68.st_mode & 0xF000) == 0x4000
            && v69.st_mtimespec.tv_sec == v68.st_mtimespec.tv_sec)
          {
            uint64_t v67 = 0;
            id v34 = [v28 path];
            if ((fpfs_num_entries((const char *)[v34 fileSystemRepresentation], 0, (_DWORD *)&v67 + 1) & 0x80000000) == 0)
            {
              v56 = v28;
              id v35 = [v29 path];
              int v36 = fpfs_num_entries((const char *)[v35 fileSystemRepresentation], 0, &v67);

              if (v36 < 0 || HIDWORD(v67) != v67)
              {
              }
              else
              {
                uint64_t v37 = *MEMORY[0x1E4F1C530];
                v71[0] = *MEMORY[0x1E4F1C5F8];
                v71[1] = v37;
                uint64_t v38 = *MEMORY[0x1E4F1C680];
                v71[2] = *MEMORY[0x1E4F1C628];
                v71[3] = v38;
                v71[4] = *MEMORY[0x1E4F1C670];
                uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:5];
                v40 = [MEMORY[0x1E4F28CB8] defaultManager];
                v61 = (void *)v39;
                v41 = [v40 enumeratorAtURL:v56 includingPropertiesForKeys:v39 options:16 errorHandler:0];

                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id obj = v41;
                uint64_t v60 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
                if (v60)
                {
                  v58 = v29;
                  uint64_t v59 = *(void *)v64;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v60; ++i)
                    {
                      if (*(void *)v64 != v59) {
                        objc_enumerationMutation(obj);
                      }
                      v43 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                      v44 = [v43 relativePath];
                      v45 = [v29 URLByAppendingPathComponent:v44];

                      v46 = [v43 resourceValuesForKeys:v61 error:0];
                      v47 = [v45 resourceValuesForKeys:v61 error:0];
                      int v48 = [v46 isEqual:v47];

                      if (!v48)
                      {
                        id v29 = v58;
                        goto LABEL_48;
                      }
                      id v29 = v58;
                    }
                    uint64_t v60 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
                    if (v60) {
                      continue;
                    }
                    break;
                  }
                }
                LOBYTE(v48) = 1;
LABEL_48:

                if (v48) {
                  goto LABEL_45;
                }
              }
LABEL_42:
              v55 = fp_current_or_default_log();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
                -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:]();
              }

LABEL_45:
              BOOL v50 = 1;
LABEL_46:

              goto LABEL_31;
            }
          }
        }

        goto LABEL_42;
      }
    }
    v52 = [v8 documentSize];
    v53 = [v9 documentSize];
    char v54 = [v52 isEqual:v53];

    if ((v54 & 1) == 0)
    {
      id v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[NSFileProviderExtension(CreateItem) _fp_itemsMightBeTheSame:otherItem:url:]();
      }
      BOOL v50 = 0;
      goto LABEL_46;
    }
  }
  BOOL v50 = 1;
LABEL_31:

  return v50;
}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v44 = NSStringFromSelector(a2);
      [v43 handleFailureInMethod:a2, self, @"NSFileProviderExtension.m", 876, @"Item passed into %@ is not an FPItem subclass", v44 object file lineNumber description];
    }
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke;
  v52[3] = &unk_1E5AF4E88;
  unint64_t v57 = a6;
  v52[4] = self;
  id v17 = v16;
  id v53 = v17;
  id v18 = v14;
  id v54 = v18;
  id v19 = v15;
  id v55 = v17;
  id v56 = v19;
  SEL v58 = a2;
  unint64_t v59 = a4;
  double v20 = (void *)MEMORY[0x1A6248B00](v52);
  if ([v17 isFolder] && (objc_msgSend(v17, "isPackage") & 1) == 0)
  {
    v41 = [v17 filename];
    v42 = [v17 parentItemIdentifier];
    [(NSFileProviderExtension *)self createDirectoryWithName:v41 inParentItemIdentifier:v42 completionHandler:v20];

    goto LABEL_23;
  }
  id v21 = [v17 typeIdentifier];
  char v22 = [v21 isEqualToString:*MEMORY[0x1E4F226E0]];
  if (v18 || (v22 & 1) == 0)
  {

    goto LABEL_13;
  }
  double v23 = [v17 symlinkTargetPath];

  if (!v23)
  {
LABEL_15:
    if ((a6 & 1) == 0)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2 object:self file:@"NSFileProviderExtension.m" lineNumber:983 description:@"cannot import document without an URL"];
    }
    (*((void (**)(id, void, void))v19 + 2))(v19, 0, 0);
    id v18 = 0;
    goto LABEL_23;
  }
  int v48 = a2;
  id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v25 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_secureTempDirectoryIgnoringPersona");
  id v51 = 0;
  char v26 = [v24 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v51];
  id v27 = v51;
  if (v26)
  {
    v47 = v24;
    id v28 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v29 = [v28 UUIDString];
    id v30 = v25;
    int v31 = (void *)v29;
    v46 = v30;
    id v32 = [v30 URLByAppendingPathComponent:v29];

    id v33 = [v17 symlinkTargetPath];
    id v34 = (const char *)[v33 fileSystemRepresentation];
    id v35 = v32;
    LODWORD(v34) = symlink(v34, (const char *)[v35 fileSystemRepresentation]);

    if (v34)
    {
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());

      [v47 removeItemAtURL:v35 error:0];
      (*((void (**)(id, void, uint64_t))v19 + 2))(v19, 0, v36);
      id v18 = 0;
      int v37 = 1;
      id v27 = (id)v36;
    }
    else
    {
      id v18 = v35;
      int v37 = 0;
    }

    id v25 = v46;
    id v24 = v47;
  }
  else
  {
    (*((void (**)(id, void, id))v19 + 2))(v19, 0, v27);
    id v18 = 0;
    int v37 = 1;
  }

  a2 = v48;
  if (!v37)
  {
LABEL_13:
    if (v18)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
      uint64_t v39 = [v17 parentItemIdentifier];
      v40 = [v17 filename];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_348;
      v49[3] = &unk_1E5AF4EB0;
      id v50 = v20;
      [WeakRetained importDocumentAtURL:v18 intoFolderWithIdentifier:v39 originalName:v40 extensionInstance:self reply:v49];

      goto LABEL_23;
    }
    goto LABEL_15;
  }
LABEL_23:
}

void __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if ((*(unsigned char *)(a1 + 72) & 1) != 0 && objc_msgSend(v6, "fp_isFileProviderError:", -1001))
    {
      id v8 = objc_msgSend(v7, "fp_userInfoItem");
      id v9 = v8;
      if (v8
        && [v8 conformsToProtocol:&unk_1EF6C83B0]
        && objc_msgSend(*(id *)(a1 + 32), "_fp_itemsMightBeTheSame:otherItem:url:", *(void *)(a1 + 40), v9, *(void *)(a1 + 48)))
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_25:

        goto LABEL_26;
      }
    }
  }
  else if (v5)
  {
    id v10 = contentTypeOfItem(v5);
    id v9 = [v10 identifier];

    if (![v9 length] && (dyld_program_sdk_at_least() & 1) == 0)
    {
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Working around missing type identifier for item created by legacy file provider", buf, 2u);
      }

      uint64_t v12 = [*(id *)(a1 + 40) typeIdentifier];

      id v9 = (void *)v12;
    }
    id v13 = [FPItem alloc];
    id v14 = [*(id *)(a1 + 56) providerDomainID];
    id v15 = [v5 itemIdentifier];
    id v16 = [v5 parentItemIdentifier];
    id v17 = [v5 filename];
    id v18 = [(FPItem *)v13 initWithProviderDomainID:v14 itemIdentifier:v15 parentItemIdentifier:v16 filename:v17 typeIdentifier:v9];

    if (!v18)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"NSFileProviderExtension.m", 910, @"item %@ was returned with incomplete properties", v5 object file lineNumber description];
    }
    double v20 = [*(id *)(a1 + 56) lastUsedDate];
    [(FPItem *)v18 setLastUsedDate:v20];

    id v21 = [*(id *)(a1 + 56) tags];
    [(FPItem *)v18 setTags:v21];

    char v22 = [*(id *)(a1 + 56) favoriteRank];
    [(FPItem *)v18 setFavoriteRank:v22];

    double v23 = [*(id *)(a1 + 56) creationDate];
    [(FPItem *)v18 setCreationDate:v23];

    id v24 = [*(id *)(a1 + 56) contentModificationDate];
    [(FPItem *)v18 setContentModificationDate:v24];

    -[FPItem setFileSystemFlags:](v18, "setFileSystemFlags:", [*(id *)(a1 + 56) fileSystemFlags]);
    id v25 = [*(id *)(a1 + 56) extendedAttributes];
    [(FPItem *)v18 setExtendedAttributes:v25];

    char v26 = [*(id *)(a1 + 56) quarantineBlob];
    [(FPItem *)v18 setQuarantineBlob:v26];

    -[FPItem setContentZoneRoot:](v18, "setContentZoneRoot:", [*(id *)(a1 + 56) isContentZoneRoot]);
    -[FPItem setTypeAndCreator:](v18, "setTypeAndCreator:", [*(id *)(a1 + 56) typeAndCreator]);
    unint64_t v27 = *(void *)(a1 + 88) & 0xFFFFFFFFFFFFFFF8;
    if (v27)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v28 = [v5 itemVersion];
      }
      else
      {
        uint64_t v28 = objc_opt_new();
      }
      uint64_t v29 = (void *)v28;
      id v30 = *(void **)(a1 + 32);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_341;
      v31[3] = &unk_1E5AF4E60;
      id v32 = v5;
      id v33 = *(id *)(a1 + 64);
      [v30 changeItem:v18 baseVersion:v29 changedFields:v27 contents:0 options:0x10000 completionHandler:v31];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }

    goto LABEL_25;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_26:
}

void __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_341(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a5;
  if (!v8)
  {
LABEL_6:
    id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  char v9 = dyld_program_sdk_at_least();
  id v10 = fp_current_or_default_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = objc_msgSend(v8, "fp_prettyDescription");
      int v17 = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      double v20 = v13;
      _os_log_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ created, but the provider failed to apply properties afterwards. Returning error: %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_6;
  }
  if (v11)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = objc_msgSend(v8, "fp_prettyDescription");
    int v17 = 138412546;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    double v20 = v16;
    _os_log_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ created, but the provider failed to apply properties afterwards. Error ignored: %@", (uint8_t *)&v17, 0x16u);
  }
  id v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_10:
  v14();
}

uint64_t __107__NSFileProviderExtension_CreateItem__createItemBasedOnTemplate_fields_contents_options_completionHandler___block_invoke_348(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__22;
  char v26 = __Block_byref_object_dispose__22;
  id v27 = 0;
  id obj = 0;
  id v13 = [(NSFileProviderExtension *)self itemForIdentifier:v10 error:&obj];
  objc_storeStrong(&v27, obj);
  if (v13)
  {
    if (a5 >> 31 || !hasConflictingVersion(v13, v11, 1uLL))
    {
      if ((a5 & 1) != 0
        || ([v13 childItemCount],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 longValue],
            v15,
            !v16))
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __102__NSFileProviderExtension_DeleteItem__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke;
        v17[3] = &unk_1E5AF4ED8;
        v17[4] = self;
        id v19 = v12;
        id v18 = v10;
        double v20 = &v22;
        [(NSFileProviderExtension *)self deleteItemWithIdentifier:v18 completionHandler:v17];

        goto LABEL_11;
      }
      id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-1007 userInfo:0];
      (*((void (**)(id, void *))v12 + 2))(v12, v14);
    }
    else
    {
      id v14 = [MEMORY[0x1E4F28C58] fileProviderErrorForRejectedDeletionOfItem:v13];
      (*((void (**)(id, void *))v12 + 2))(v12, v14);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, v23[5]);
  }
LABEL_11:
  _Block_object_dispose(&v22, 8);
}

void __102__NSFileProviderExtension_DeleteItem__deleteItemWithIdentifier_baseVersion_options_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  char v5 = [WeakRetained usesFPFS];

  if (v3 || (v5 & 1) == 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = [v6 itemForIdentifier:v7 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    uint64_t v10 = a1[6];
    if (v9)
    {
      id v11 = [MEMORY[0x1E4F28C58] fileProviderErrorForRejectedDeletionOfItem:v9];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
}

- (void)importDidFinishWithCompletionHandler:(id)a3
{
}

@end