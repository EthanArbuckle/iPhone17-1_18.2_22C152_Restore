@interface _LSDiskUsage
+ (BOOL)supportsSecureCoding;
+ (id)ODRConnection;
+ (id)ODRUsageForBundleIdentifier:(id)a3 error:(id *)a4;
+ (id)_serverQueue;
+ (id)mobileInstallationQueue;
+ (id)propertyQueue;
+ (id)usageFromMobileInstallationForBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_fetchWithXPCConnection:(id)a3 error:(id *)a4;
- (BOOL)fetchClientSideWithError:(id *)a3;
- (BOOL)fetchServerSideWithConnection:(id)a3 error:(id *)a4;
- (NSNumber)dynamicUsage;
- (NSNumber)onDemandResourcesUsage;
- (NSNumber)sharedUsage;
- (NSNumber)staticUsage;
- (_LSDiskUsage)init;
- (_LSDiskUsage)initWithCoder:(id)a3;
- (id)_initWithBundleIdentifier:(id)a3 alreadyKnownUsage:(id)a4 validationToken:(id)a5;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllCachedUsageValues;
@end

@implementation _LSDiskUsage

- (id)_initWithBundleIdentifier:(id)a3 alreadyKnownUsage:(id)a4 validationToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_LSDiskUsage;
  v11 = [(_LSDiskUsage *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    if (v9 && [v9 count]) {
      uint64_t v14 = [v9 mutableCopy];
    }
    else {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    }
    usage = v11->_usage;
    v11->_usage = (NSMutableDictionary *)v14;

    objc_storeStrong(&v11->_validationToken, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_usage, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  v5 = [(id)objc_opt_class() propertyQueue];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __32___LSDiskUsage_encodeWithCoder___block_invoke;
  id v10 = &unk_1E522DCE8;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = self;
  dispatch_sync(v5, &v7);

  objc_msgSend(v6, "encodeObject:forKey:", self->_validationToken, @"validationToken", v7, v8, v9, v10);
}

+ (id)propertyQueue
{
  if (+[_LSDiskUsage(Private) propertyQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) propertyQueue]::once, &__block_literal_global_73);
  }
  v2 = (void *)+[_LSDiskUsage(Private) propertyQueue]::result;

  return v2;
}

- (_LSDiskUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClass:forKey:", v6, objc_opt_class(), @"knownUsage");
  uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"validationToken");
  id v9 = [(_LSDiskUsage *)self _initWithBundleIdentifier:v5 alreadyKnownUsage:v7 validationToken:v8];

  return v9;
}

- (_LSDiskUsage)init
{
}

- (NSNumber)staticUsage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  id v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  v3 = [(id)objc_opt_class() propertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27___LSDiskUsage_staticUsage__block_invoke;
  v6[3] = &unk_1E522DAF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)dynamicUsage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  id v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  if ([(_LSDiskUsage *)self _fetchWithXPCConnection:0 error:0])
  {
    v3 = [(id)objc_opt_class() propertyQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28___LSDiskUsage_dynamicUsage__block_invoke;
    v6[3] = &unk_1E522DAF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)onDemandResourcesUsage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  id v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  if ([(_LSDiskUsage *)self _fetchWithXPCConnection:0 error:0])
  {
    v3 = [(id)objc_opt_class() propertyQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38___LSDiskUsage_onDemandResourcesUsage__block_invoke;
    v6[3] = &unk_1E522DAF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)sharedUsage
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  id v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  if ([(_LSDiskUsage *)self _fetchWithXPCConnection:0 error:0])
  {
    v3 = [(id)objc_opt_class() propertyQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27___LSDiskUsage_sharedUsage__block_invoke;
    v6[3] = &unk_1E522DAF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)removeAllCachedUsageValues
{
  v3 = [(id)objc_opt_class() propertyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke;
  block[3] = &unk_1E522D3E8;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

- (id)debugDescription
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  id v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  v3 = [(id)objc_opt_class() propertyQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32___LSDiskUsage_debugDescription__block_invoke;
  v6[3] = &unk_1E522DAF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)_serverQueue
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDiskUsage(Internal) _serverQueue]");
  if (+[_LSDiskUsage(Internal) _serverQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Internal) _serverQueue]::once, &__block_literal_global_29);
  }
  v2 = (void *)+[_LSDiskUsage(Internal) _serverQueue]::result;

  return v2;
}

- (BOOL)_fetchWithXPCConnection:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = self->_bundleIdentifier;
  if (!v7)
  {
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"invalid input parameters";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDiskUsage(Internal) _fetchWithXPCConnection:error:]", 249, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v8 = [(id)objc_opt_class() propertyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke;
  block[3] = &unk_1E522DAF8;
  block[4] = self;
  void block[5] = &v18;
  dispatch_sync(v8, block);

  if (*((unsigned char *)v19 + 24))
  {
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      uint64_t v16 = 0;
      uint64_t v9 = (id *)&v16;
      BOOL v10 = [(_LSDiskUsage *)self fetchServerSideWithConnection:v6 error:&v16];
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v9 = (id *)&v15;
      BOOL v10 = [(_LSDiskUsage *)self fetchClientSideWithError:&v15];
    }
    BOOL v13 = v10;
    id v12 = *v9;
  }
  else
  {
    id v12 = 0;
    BOOL v13 = 1;
  }
  _Block_object_dispose(&v18, 8);
  if (a4)
  {
LABEL_11:
    if (!v13) {
      *a4 = v12;
    }
  }
LABEL_13:

  return v13;
}

+ (id)mobileInstallationQueue
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDiskUsage(Private) mobileInstallationQueue]");
  if (+[_LSDiskUsage(Private) mobileInstallationQueue]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) mobileInstallationQueue]::once, &__block_literal_global_76);
  }
  v2 = (void *)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;

  return v2;
}

+ (id)usageFromMobileInstallationForBundleIdentifier:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [a1 mobileInstallationQueue];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke;
    objc_super v17 = &unk_1E522E8C8;
    id v18 = v6;
    uint64_t v8 = _LSDispatchWithTimeout(v7, &v14, 5.0);
    uint64_t v9 = objc_msgSend(v8, "result", v14, v15, v16, v17);
    BOOL v10 = v9 == 0;

    if (v10)
    {
      id v12 = [v8 error];
      id v11 = 0;
    }
    else
    {
      id v11 = [v8 result];
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v19 = *MEMORY[0x1E4F28228];
    v20[0] = @"invalid bundleIdentifier";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]", 331, v7);
    id v11 = 0;
  }

  if (a4 && !v11) {
    *a4 = v12;
  }

  return v11;
}

+ (id)ODRConnection
{
  if (+[_LSDiskUsage(Private) ODRConnection]::once != -1) {
    dispatch_once(&+[_LSDiskUsage(Private) ODRConnection]::once, &__block_literal_global_89_0);
  }
  v2 = (void *)+[_LSDiskUsage(Private) ODRConnection]::result;

  return v2;
}

+ (id)ODRUsageForBundleIdentifier:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v21 = *MEMORY[0x1E4F28228];
    v22[0] = @"invalid bundleIdentifier";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"+[_LSDiskUsage(Private) ODRUsageForBundleIdentifier:error:]", 400, v13);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke;
  v18[3] = &unk_1E522E918;
  id v20 = a1;
  id v19 = v6;
  uint64_t v8 = _LSDispatchWithTimeout(0, v18, 5.0);
  uint64_t v9 = [v8 result];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    id v12 = [v8 error];

    id v13 = v19;
    goto LABEL_7;
  }
  id v11 = [v8 result];

  id v12 = 0;
  if (v11) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v14 = [v12 domain];
  if ([v14 isEqual:*MEMORY[0x1E4F28798]])
  {
    BOOL v15 = [v12 code] == 60;

    if (!v15) {
      goto LABEL_13;
    }
    uint64_t v14 = _LSDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl(&dword_182959000, v14, OS_LOG_TYPE_DEFAULT, "timeout waiting for ODR daemon bytesUsedForApplicationWithBundleID to return", v17, 2u);
    }
  }

LABEL_13:
  if (a4)
  {
    id v12 = v12;
    id v11 = 0;
    *a4 = v12;
  }
  else
  {
    id v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)fetchServerSideWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]");
  if ([(id)__LSDefaultsGetSharedInstance() isInSyncBubble])
  {
    uint64_t v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "cannot calculate disk usage per bundle in the sync bubble", buf, 2u);
    }

    uint64_t v8 = 424;
    uint64_t v9 = (void **)&LSApplicationWorkspaceErrorDomain;
    uint64_t v10 = 110;
    goto LABEL_11;
  }
  if (!+[_LSBundleIDValidationToken isToken:correctForBundleIdentifier:connection:]((uint64_t)_LSBundleIDValidationToken, self->_validationToken, self->_bundleIdentifier, v6))
  {
    uint64_t v8 = 428;
    uint64_t v10 = -54;
    uint64_t v9 = (void **)MEMORY[0x1E4F28760];
LABEL_11:
    _LSMakeNSErrorImpl(*v9, v10, (uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]", v8, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  id v11 = (id)[(NSMutableDictionary *)self->_usage mutableCopy];
  if (!v11)
  {
    id v15 = 0;
LABEL_12:
    BOOL v21 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  id v12 = objc_opt_class();
  bundleIdentifier = self->_bundleIdentifier;
  id v26 = 0;
  uint64_t v14 = [v12 usageFromMobileInstallationForBundleIdentifier:bundleIdentifier error:&v26];
  id v15 = v26;
  if (v14)
  {
    [v11 addEntriesFromDictionary:v14];

    uint64_t v16 = objc_opt_class();
    objc_super v17 = self->_bundleIdentifier;
    id v25 = v15;
    id v18 = [v16 ODRUsageForBundleIdentifier:v17 error:&v25];
    id v19 = v25;

    if (v18)
    {
      [v11 setObject:v18 forKeyedSubscript:@"ODR"];

      id v20 = [(id)objc_opt_class() propertyQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke;
      v23[3] = &unk_1E522DCE8;
      v23[4] = self;
      id v24 = v11;
      id v11 = v11;
      dispatch_barrier_async(v20, v23);

      BOOL v21 = 1;
    }
    else
    {
      BOOL v21 = 0;
    }
    id v15 = v19;
  }
  else
  {
    BOOL v21 = 0;
  }

  if (a4)
  {
LABEL_13:
    if (!v21) {
      *a4 = v15;
    }
  }
LABEL_15:

  return v21;
}

- (BOOL)fetchClientSideWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__19;
  id v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  v10[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v10[1] = (void (*)(void, void))3221225472;
  v10[2] = (void (*)(void, void))__50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke;
  v10[3] = (void (*)(void, void))&unk_1E522E940;
  v10[4] = (void (*)(void, void))self;
  v10[5] = (void (*)(void, void))&v11;
  v5 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_144;
  v9[3] = &unk_1E522E968;
  v9[4] = self;
  v9[5] = &v17;
  v9[6] = &v11;
  [v5 getDiskUsage:self completionHandler:v9];
  int v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((unsigned char *)v18 + 24))
  {
    *a3 = (id) v12[5];
    int v6 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

@end