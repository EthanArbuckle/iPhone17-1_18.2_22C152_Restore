@interface FPXFakeDefaultDomainExtension
- (FPXFakeDefaultDomainExtension)initWithDomain:(id)a3;
- (NSFileProviderDomain)domain;
- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8;
- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7;
- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5;
- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9;
- (void)setDomain:(id)a3;
@end

@implementation FPXFakeDefaultDomainExtension

- (FPXFakeDefaultDomainExtension)initWithDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPXFakeDefaultDomainExtension;
  v6 = [(FPXFakeDefaultDomainExtension *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_domain, a3);
  }

  return v7;
}

- (id)itemForIdentifier:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = a5;
  v8 = [v6 errorWithDomain:@"NSFileProviderErrorDomain" code:-1000 userInfo:0];
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v8);

  objc_super v9 = objc_opt_new();

  return v9;
}

- (id)enumeratorForContainerItemIdentifier:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    v10 = [(FPXFakeDefaultDomainExtension *)self domain];
    int v11 = [v10 isHidden];

    if (v11) {
      uint64_t v12 = -2011;
    }
    else {
      uint64_t v12 = -1000;
    }
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:v12 userInfo:0];
  }

  return 0;
}

- (id)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 contents:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  v15 = [NSString stringWithFormat:@"Calling createItem on fake extension instance"];
  v16 = fp_current_or_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    int v17 = 138543362;
    v18 = v15;
    _os_log_fault_impl(&dword_1A33AE000, v16, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v17, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension createItemBasedOnTemplate:fields:contents:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 61, (const char *)[v15 UTF8String]);
}

- (id)deleteItemWithIdentifier:(id)a3 baseVersion:(id)a4 options:(unint64_t)a5 request:(id)a6 completionHandler:(id)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = [NSString stringWithFormat:@"Calling deleteItem on fake extension instance"];
  v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    int v16 = 138543362;
    int v17 = v14;
    _os_log_fault_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v16, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension deleteItemWithIdentifier:baseVersion:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 70, (const char *)[v14 UTF8String]);
}

- (id)fetchContentsForItemWithIdentifier:(id)a3 version:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [NSString stringWithFormat:@"Calling fetchContent on fake extension instance"];
  id v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    int v15 = 138543362;
    int v16 = v13;
    _os_log_fault_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v15, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension fetchContentsForItemWithIdentifier:version:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 80, (const char *)[v13 UTF8String]);
}

- (id)modifyItem:(id)a3 baseVersion:(id)a4 changedFields:(unint64_t)a5 contents:(id)a6 options:(unint64_t)a7 request:(id)a8 completionHandler:(id)a9
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = [NSString stringWithFormat:@"Calling modifyItem on fake extension instance"];
  uint64_t v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    int v19 = 138543362;
    v20 = v17;
    _os_log_fault_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", (uint8_t *)&v19, 0xCu);
  }

  __assert_rtn("-[FPXFakeDefaultDomainExtension modifyItem:baseVersion:changedFields:contents:options:request:completionHandler:]", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXFakeDefaultDomainExtension.m", 92, (const char *)[v17 UTF8String]);
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
}

@end