@interface LSDefaultApplicationQueryServerDatastore
- (__n128)setEntry:forApplication:category:;
- (id)entryForApplication:(id)a3 category:(unint64_t)a4;
- (uint64_t)removeEntriesForBundleIdentifier:;
- (void)removeEntriesForBundleIdentifier:;
- (void)removeEntriesForBundleIdentifier:(id)a3;
- (void)setEntry:(id)a3 forApplication:(id)a4 category:(unint64_t)a5;
- (void)setEntry:forApplication:category:;
@end

@implementation LSDefaultApplicationQueryServerDatastore

- (id)entryForApplication:(id)a3 category:(unint64_t)a4
{
  id v5 = a3;
  id v16 = 0;
  v6 = (_anonymous_namespace_::LSDefaultApplicationQueryState *)objc_claimAutoreleasedReturnValue();
  id v7 = v16;
  if (v6) {
  else
  }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  v8 = [v5 bundleIdentifier];
  id v9 = v15;
  v10 = [v15 objectForKey:v8];
  LSDefaultAppCategoryCopyName(a4);
  v12 = v11;
  v13 = [v10 objectForKey:v11];

  return v13;
}

- (void)setEntry:(id)a3 forApplication:(id)a4 category:(unint64_t)a5
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  unint64_t v11 = a5;
  id v12 = a4;
  v8 = operator new(0x20uLL);
  void *v8 = &unk_1ECB19540;
  v8[1] = &v12;
  v8[2] = &v11;
  v8[3] = &v13;
  id v9 = v14[3] = v8;
  if (v9)
  {
    v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[LSDefaultApplicationQueryServerDatastore setEntry:forApplication:category:]((uint64_t)v9, v10);
    }
  }
}

- (void)removeEntriesForBundleIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v8 = v3;
  v4 = _LSDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    id v5 = *(id *)&buf[4];
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: clearing entries for %@", buf, 0x16u);
  }
  *(void *)buf = &unk_1ECB19588;
  *(void *)&buf[8] = &v8;
  v6 = v10 = buf;
  if (v6)
  {
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[LSDefaultApplicationQueryServerDatastore removeEntriesForBundleIdentifier:]();
    }
  }
}

- (void)setEntry:forApplication:category:
{
  id v13 = *a2;
  id v14 = *a2;
  *a2 = 0;
  id v5 = [**(id **)(a1 + 8) bundleIdentifier];
  unint64_t v6 = **(void **)(a1 + 16);
  uint64_t v7 = **(void ***)(a1 + 24);
  id v8 = v5;
  id v9 = v7;
  id v10 = [*a3 objectForKey:v8];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*a3, "setObject:forKey:");
  }
  LSDefaultAppCategoryCopyName(v6);
  id v12 = v11;
  [v10 setObject:v9 forKey:v11];
}

- (__n128)setEntry:forApplication:category:
{
  *(void *)a2 = &unk_1ECB19540;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)removeEntriesForBundleIdentifier:
{
  id v6 = *a2;
  id v5 = v6;
  *a2 = 0;
  [*a3 removeObjectForKey:**(void **)(a1 + 8)];
}

- (uint64_t)removeEntriesForBundleIdentifier:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1ECB19588;
  a2[1] = v2;
  return result;
}

- (void)setEntry:(uint64_t)a1 forApplication:(NSObject *)a2 category:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Couldn't save default application query state: %@", (uint8_t *)&v2, 0xCu);
}

- (void)removeEntriesForBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Couldn't save default application query state after removing %@: %@");
}

@end