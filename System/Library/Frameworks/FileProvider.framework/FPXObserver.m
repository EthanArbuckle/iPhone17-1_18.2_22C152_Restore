@interface FPXObserver
- (BOOL)isInvalidated;
- (FPXObserver)init;
- (FPXObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5;
- (id)updateForProviderItem:(id)a3;
- (void)_fixupFavoriteRank:(id)a3;
- (void)verifyVendorToken:(id)a3;
@end

@implementation FPXObserver

- (void)verifyVendorToken:(id)a3
{
  id v8 = a3;
  v5 = [(FPItemID *)self->_observedItemID identifier];
  int v6 = [v5 isEqualToString:@"NSFileProviderWorkingSetContainerItemIdentifier"];

  if (v6 && (unint64_t)[v8 length] > 0x1F4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"FPXEnumerator.m" lineNumber:144 description:@"page and sync anchor length shouldn't exceed 500 bytes!"];
  }
}

- (FPXObserver)initWithObservedItemID:(id)a3 domainContext:(id)a4 nsFileProviderRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FPXObserver;
  v11 = [(FPXObserver *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    observedItemID = v11->_observedItemID;
    v11->_observedItemID = (FPItemID *)v12;

    objc_storeStrong((id *)&v11->_domainContext, a4);
    uint64_t v14 = [(FPXDomainContext *)v11->_domainContext vendorInstance];
    strongVendorInstance = v11->_strongVendorInstance;
    v11->_strongVendorInstance = (NSFileProviderReplicatedExtension *)v14;

    uint64_t v16 = [(FPXDomainContext *)v11->_domainContext extensionContext];
    strongExtensionContext = v11->_strongExtensionContext;
    v11->_strongExtensionContext = (FPXExtensionContext *)v16;

    objc_storeStrong((id *)&v11->_nsFileProviderRequest, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsFileProviderRequest, 0);
  objc_storeStrong((id *)&self->_strongExtensionContext, 0);
  objc_storeStrong((id *)&self->_strongVendorInstance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_domainContext, 0);

  objc_storeStrong((id *)&self->_observedItemID, 0);
}

- (FPXObserver)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"shouldn't be called"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    v5 = v2;
    _os_log_fault_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPXObserver init]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 50, (const char *)[v2 UTF8String]);
}

- (void)_fixupFavoriteRank:(id)a3
{
  id v4 = a3;
  v5 = [v4 favoriteRank];
  uint64_t v6 = [v5 unsignedLongLongValue];

  if (v6 == 1)
  {
    v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;

    uint64_t v10 = arc4random_uniform(0x7D0u) - 1000 + (unint64_t)(v9 * 1000.0);
    v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(FPXObserver *)(uint64_t)v4 _fixupFavoriteRank:v11];
    }

    uint64_t v12 = [v4 strippedCopy];
    v13 = [NSNumber numberWithUnsignedLongLong:v10];
    [v12 setFavoriteRank:v13];

    [(FPXExtensionContext *)self->_strongExtensionContext singleItemChange:v12 changedFields:32 bounce:0 completionHandler:&__block_literal_global_20];
  }
}

void __34__FPXObserver__fixupFavoriteRank___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __34__FPXObserver__fixupFavoriteRank___block_invoke_cold_1((uint64_t)v4, v5, v6);
    }
  }
}

- (id)updateForProviderItem:(id)a3
{
  id v5 = (FPXEnumeratorAlternateContentsItem *)a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"FPXEnumerator.m", 113, @"Invalid parameter not satisfying: %@", @"providerItem" object file lineNumber description];
  }
  uint64_t v6 = [(FPXDomainContext *)self->_domainContext itemFromVendorItem:v5];
  if (v6
    && +[FPExtensionCollection item:v6 isValidForObservedItemID:self->_observedItemID])
  {
    v7 = [(FPXDomainContext *)self->_domainContext extensionContext];
    double v8 = [v6 itemID];
    double v9 = [v7 alternateContentsURLWrapperForItemID:v8];
    uint64_t v10 = [v9 url];

    if (v10)
    {
      v11 = [[FPXEnumeratorAlternateContentsItem alloc] initWithOriginalDocumentItem:v6 alternateContentsURL:v10];

      uint64_t v12 = [(FPXDomainContext *)self->_domainContext itemFromVendorItem:v11];

      id v5 = v11;
      uint64_t v6 = (void *)v12;
    }

    uint64_t v13 = [v6 favoriteRank];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      v15 = [v6 favoriteRank];
      uint64_t v16 = [v15 unsignedLongLongValue];

      if (v16 == 1) {
        [(FPXObserver *)self _fixupFavoriteRank:v6];
      }
    }
    id v17 = v6;
    uint64_t v6 = v17;
  }
  else
  {
    v18 = fp_current_or_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[FPXObserver updateForProviderItem:]();
    }

    id v17 = 0;
  }

  return v17;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)_fixupFavoriteRank:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] fixing up favorite rank (%llu) for %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __34__FPXObserver__fixupFavoriteRank___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't set favorite rank for %@; %@",
    (uint8_t *)&v6,
    0x16u);
}

- (void)updateForProviderItem:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] item %@ isn't valid for current enumeration (enumeratedItem: %@)");
}

@end