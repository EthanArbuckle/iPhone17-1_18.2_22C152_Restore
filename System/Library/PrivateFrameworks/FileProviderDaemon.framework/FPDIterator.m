@interface FPDIterator
+ (id)hybridIteratorForItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5;
+ (id)iteratorForLocator:(id)a3 manager:(id)a4;
+ (id)iteratorForLocator:(id)a3 provider:(id)a4;
+ (id)iteratorForLocator:(id)a3 wantsDisk:(BOOL)a4 provider:(id)a5;
- (BOOL)done;
- (BOOL)shouldDecorateItems;
- (BOOL)skipMaterializedTreeTraversal;
- (NSError)error;
- (id)nextItem;
- (id)nextWithError:(id *)a3;
- (unint64_t)numFoldersPopped;
- (void)setShouldDecorateItems:(BOOL)a3;
- (void)setSkipMaterializedTreeTraversal:(BOOL)a3;
@end

@implementation FPDIterator

+ (id)iteratorForLocator:(id)a3 manager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isProviderItem]
    && ([v5 asFPItem],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 providerItemID],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = [v5 asFPItem];
    v10 = [v9 itemID];
    v11 = [v10 providerID];
    v12 = [v6 providerWithIdentifier:v11 reason:0];

    v13 = [v12 asAppExtensionBackedProvider];
    v14 = [FPDItemIterator alloc];
    v15 = [v5 asFPItem];
    v16 = [(FPDItemIterator *)v14 initWithItem:v15 provider:v13];
  }
  else
  {
    if ([v5 isProviderItem])
    {
      v17 = [v5 asFPItem];
      v12 = [v17 fileURL];
    }
    else
    {
      v12 = [v5 asURL];
    }
    v18 = [FPDDiskIterator alloc];
    if (objc_msgSend(v12, "fp_isFolder")) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = objc_msgSend(v12, "fp_isPackage");
    }
    v16 = [(FPDDiskIterator *)v18 initWithURL:v12 isDirectory:v19];
  }

  return v16;
}

+ (id)iteratorForLocator:(id)a3 provider:(id)a4
{
  return +[FPDIterator iteratorForLocator:a3 wantsDisk:0 provider:a4];
}

+ (id)iteratorForLocator:(id)a3 wantsDisk:(BOOL)a4 provider:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (![v7 isProviderItem])
  {
    v13 = [v7 asURL];
    if (!v13) {
      +[FPDIterator iteratorForLocator:wantsDisk:provider:]();
    }
    goto LABEL_10;
  }
  v9 = [v7 asFPItem];
  v10 = [v9 providerItemID];

  if (!v10)
  {
    v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[FPDIterator iteratorForLocator:wantsDisk:provider:]((uint64_t)v9, v11);
    }

    BOOL v6 = 1;
  }
  uint64_t v12 = [v9 fileURL];
  v13 = (void *)v12;
  if (v6 && v12)
  {

LABEL_10:
    v14 = [FPDDiskIterator alloc];
    if (objc_msgSend(v13, "fp_isFolder")) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = objc_msgSend(v13, "fp_isPackage");
    }
    v16 = [(FPDDiskIterator *)v14 initWithURL:v13 isDirectory:v15];
    goto LABEL_15;
  }
  v17 = [v8 asAppExtensionBackedProvider];
  v16 = [[FPDItemIterator alloc] initWithItem:v9 provider:v17];

LABEL_15:
  return v16;
}

+ (id)hybridIteratorForItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[FPDHybridIterator alloc] initWithItem:v8 domain:v7 enforceFPItem:v5];

  return v9;
}

- (id)nextWithError:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: missing override"];
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138543362;
    BOOL v6 = v3;
    _os_log_fault_impl(&dword_1D744C000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v5, 0xCu);
  }

  __assert_rtn("-[FPDIterator nextWithError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 70, (const char *)[v3 UTF8String]);
}

- (id)nextItem
{
  uint64_t v4 = 0;
  v2 = [(FPDIterator *)self nextWithError:&v4];
  return v2;
}

- (BOOL)done
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: missing override"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    int v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDIterator done]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 82, (const char *)[v2 UTF8String]);
}

- (unint64_t)numFoldersPopped
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithFormat:@"[ASSERT] ‼️ UNREACHABLE: missing override"];
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138543362;
    int v5 = v2;
    _os_log_fault_impl(&dword_1D744C000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v4, 0xCu);
  }

  __assert_rtn("-[FPDIterator numFoldersPopped]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/action operation engine/FPDIterator.m", 88, (const char *)[v2 UTF8String]);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)skipMaterializedTreeTraversal
{
  return self->_skipMaterializedTreeTraversal;
}

- (void)setSkipMaterializedTreeTraversal:(BOOL)a3
{
  self->_skipMaterializedTreeTraversal = a3;
}

- (BOOL)shouldDecorateItems
{
  return self->_shouldDecorateItems;
}

- (void)setShouldDecorateItems:(BOOL)a3
{
  self->_shouldDecorateItems = a3;
}

- (void).cxx_destruct
{
}

+ (void)iteratorForLocator:(uint64_t)a1 wantsDisk:(NSObject *)a2 provider:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Item %@ is a disk identifier, forcing disk enumeration", (uint8_t *)&v2, 0xCu);
}

+ (void)iteratorForLocator:wantsDisk:provider:.cold.2()
{
}

@end