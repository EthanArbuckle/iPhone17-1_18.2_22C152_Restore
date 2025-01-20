@interface _LSCanOpenURLManager
+ (BindingEvaluator)bindingEvaluatorForScheme:(SEL)a3;
+ (_LSCanOpenURLManager)sharedManager;
+ (id)queryForApplicationsAvailableForOpeningURL:(id)a3;
- (BOOL)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7;
- (BOOL)findApplicationBundleID:(unsigned int *)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 forXPCConnection:(id)a6;
- (BOOL)internalCanOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7;
- (BOOL)isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7;
- (BOOL)isXPCConnection:(id)a3 allowedToCheckScheme:(id)a4 error:(id *)a5;
- (BOOL)legacy_isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7;
- (_LSCanOpenURLManager)init;
- (id)copySchemesMap;
- (int64_t)schemeTypeOfScheme:(id)a3;
- (unint64_t)schemeQueryLimit;
- (void)getIsURL:(id)a3 alwaysCheckable:(BOOL *)a4 hasHandler:(BOOL *)a5;
- (void)resetSchemeQueryLimitForApplicationWithIdentifier:(id)a3;
- (void)writeSchemesMap;
@end

@implementation _LSCanOpenURLManager

- (BOOL)internalCanOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  v14 = [v12 scheme];
  v15 = [v14 lowercaseString];

  if (v15)
  {
    __int16 v26 = 0;
    [(_LSCanOpenURLManager *)self getIsURL:v12 alwaysCheckable:&v26 hasHandler:(char *)&v26 + 1];
    if ((_BYTE)v26
      || (BOOL v16 = [(_LSCanOpenURLManager *)self isXPCConnection:v13 allowedToCheckScheme:v15 error:a7], LOBYTE(v26) = v16, v16))
    {
      if (!HIBYTE(v26)) {
        goto LABEL_17;
      }
      if (v10 && v9) {
        goto LABEL_14;
      }
      uint64_t v17 = _LSGetSchemeType(v15);
      char v18 = v17 != 1 || v9;
      BOOL v19 = !v10;
      if (v17) {
        BOOL v19 = 0;
      }
      if (!v19 && (v18 & 1) != 0)
      {
LABEL_14:
        BOOL v20 = 1;
      }
      else
      {
LABEL_17:
        v22 = [[_LSURLOverride alloc] initWithOriginalURL:v12];
        v23 = v22;
        if (v22)
        {
          v24 = [(_LSURLOverride *)v22 overrideURL];
          BOOL v20 = [(_LSCanOpenURLManager *)self internalCanOpenURL:v24 publicSchemes:v10 privateSchemes:v9 XPCConnection:v13 error:a7];
        }
        else if (a7)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10814, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]", 276, 0);
          BOOL v20 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v20 = 0;
        }
      }
    }
    else
    {
      BOOL v20 = 0;
    }
    LOBYTE(a7) = v20;
  }
  else if (a7)
  {
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v28[0] = @"url";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) internalCanOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]", 282, v21);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (BOOL)canOpenURL:(id)a3 publicSchemes:(BOOL)a4 privateSchemes:(BOOL)a5 XPCConnection:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager canOpenURL:publicSchemes:privateSchemes:XPCConnection:error:]");
  LOBYTE(a7) = [(_LSCanOpenURLManager *)self internalCanOpenURL:v12 publicSchemes:v10 privateSchemes:v9 XPCConnection:v13 error:a7];

  return (char)a7;
}

+ (_LSCanOpenURLManager)sharedManager
{
  _LSAssertRunningInServer((uint64_t)"+[_LSCanOpenURLManager sharedManager]");
  if (+[_LSCanOpenURLManager sharedManager]::once != -1) {
    dispatch_once(&+[_LSCanOpenURLManager sharedManager]::once, &__block_literal_global_20);
  }
  v2 = (void *)+[_LSCanOpenURLManager sharedManager]::result;

  return (_LSCanOpenURLManager *)v2;
}

- (_LSCanOpenURLManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LSCanOpenURLManager;
  v2 = [(_LSCanOpenURLManager *)&v9 init];
  if (v2)
  {
    if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer]) {
      v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else {
      v3 = [(_LSCanOpenURLManager *)v2 copySchemesMap];
    }
    canOpenURLsMap = v2->_canOpenURLsMap;
    v2->_canOpenURLsMap = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.launchservices.canopenurl", v5);
    canOpenURLsMapQueue = v2->_canOpenURLsMapQueue;
    v2->_canOpenURLsMapQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (int64_t)schemeTypeOfScheme:(id)a3
{
  v5 = (NSString *)a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager schemeTypeOfScheme:]");
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 116, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];
  }
  int64_t v6 = _LSGetSchemeType(v5);

  return v6;
}

- (unint64_t)schemeQueryLimit
{
  return 50;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:]");
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_LSCanOpenURLManager resetSchemeQueryLimitForApplicationWithIdentifier:]();
    }
  }
  else if (v4)
  {
    MEMORY[0x185310450]();
    canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74___LSCanOpenURLManager_resetSchemeQueryLimitForApplicationWithIdentifier___block_invoke;
    v7[3] = &unk_1E522DCE8;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(canOpenURLsMapQueue, v7);
  }
}

+ (id)queryForApplicationsAvailableForOpeningURL:(id)a3
{
  id v3 = a3;
  id v4 = [[_LSAvailableApplicationsForURLQuery alloc] initWithURL:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canOpenURLsMapQueue, 0);

  objc_storeStrong((id *)&self->_canOpenURLsMap, 0);
}

- (void)writeSchemesMap
{
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) writeSchemesMap]");
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    id v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[_LSCanOpenURLManager(PrivateSchemeChecking) writeSchemesMap]();
    }
  }
  else
  {
    canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke;
    v6[3] = &unk_1E522BA28;
    v6[4] = self;
    v6[5] = a2;
    _LSDispatchCoalescedAfterDelay((atomic_uchar *)&self->_saveFlag, canOpenURLsMapQueue, v6, 1.0);
  }
}

- (id)copySchemesMap
{
  _LSAssertRunningInServer((uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) copySchemesMap]");
  id v4 = [(id)__LSDefaultsGetSharedInstance() queriedSchemesMapFileURL];
  if (!v4)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"LSCanOpenURLManager.mm" lineNumber:203 description:@"Failed to get URL for lsd-schemes file"];
  }
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v4];
  if (!v5)
  {
    int64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7 = [v4 path];
    char v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      objc_super v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_LSCanOpenURLManager(PrivateSchemeChecking) copySchemesMap]();
      }
    }
    else
    {
      objc_super v9 = _LSDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "Scheme mapping file does not exist, creating file.", v12, 2u);
      }
    }

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  return v5;
}

- (void)getIsURL:(id)a3 alwaysCheckable:(BOOL *)a4 hasHandler:(BOOL *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 293, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  BOOL v10 = [v9 scheme];
  v11 = v10;
  if (v10)
  {
    if ([v10 caseInsensitiveCompare:@"com-apple-audiounit"])
    {
      id v12 = objc_opt_class();
      if (v12)
      {
        [v12 bindingEvaluatorForScheme:v11];
      }
      else
      {
        uint64_t v30 = 0;
        memset(v29, 0, sizeof(v29));
      }
      int Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)v29);
      LaunchServices::BindingEvaluator::setOptions((uint64_t)v29, Options | 4);
      id v28 = 0;
      v25 = 0;
      id v26 = 0;
      char v27 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      BOOL v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v16, 0);

      if (v14)
      {
        LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)v29, &v20);
        BOOL v13 = v24 != 0;
        if (v24)
        {
          if (v21) {
            LOBYTE(v14) = *(unsigned char *)(v21 + 164) & 1;
          }
          else {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
      if (v25 && v27) {
        _LSContextDestroy(v25);
      }
      id v17 = v26;
      v25 = 0;
      id v26 = 0;

      char v27 = 0;
      id v18 = v28;
      id v28 = 0;

      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v29);
    }
    else
    {
      BOOL v13 = 1;
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
    LOBYTE(v14) = 0;
  }

  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v13;
  }
}

- (BOOL)isXPCConnection:(id)a3 allowedToCheckScheme:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 335, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];
    }
    id v29 = 0;
    id v26 = 0;
    id v27 = 0;
    char v28 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    id v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v12, 0);

    if (v13)
    {
      unsigned int v25 = 0;
      uint64_t v24 = 0;
      if (![(_LSCanOpenURLManager *)self findApplicationBundleID:&v25 bundleData:&v24 context:v13 forXPCConnection:v9]|| v24 && (*(unsigned char *)(v24 + 164) & 1) != 0)
      {
        BOOL v16 = 1;
      }
      else
      {
        long long v14 = *(_OWORD *)(v24 + 76);
        long long v31 = *(_OWORD *)(v24 + 60);
        long long v32 = v14;
        _LSMakeVersionNumber(9, 0, 0, v30);
        v34[0] = v31;
        v34[1] = v32;
        v33[0] = v30[0];
        v33[1] = v30[1];
        if ((unint64_t)_LSVersionNumberCompare(v34, v33) > 1) {
          BOOL v15 = [(_LSCanOpenURLManager *)self legacy_isBundleID:v25 bundleData:v24 context:v13 allowedToCheckScheme:v11 error:a5];
        }
        else {
          BOOL v15 = [(_LSCanOpenURLManager *)self isBundleID:v25 bundleData:v24 context:v13 allowedToCheckScheme:v11 error:a5];
        }
        BOOL v16 = v15;
      }
    }
    else if (a5)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v17 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v17, 0);

      if (v18) {
        id v19 = 0;
      }
      else {
        id v19 = v29;
      }
      BOOL v16 = 0;
      *a5 = v19;
    }
    else
    {
      BOOL v16 = 0;
    }
    if (v26 && v28) {
      _LSContextDestroy(v26);
    }
    id v20 = v27;
    id v26 = 0;
    id v27 = 0;

    char v28 = 0;
    id v21 = v29;
    id v29 = 0;
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)findApplicationBundleID:(unsigned int *)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 forXPCConnection:(id)a6
{
  id v11 = a6;
  id v12 = v11;
  if (a5 && a5->db)
  {
    if (v11) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 391, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
  }
  unsigned int v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 392, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

LABEL_4:
  uint64_t v13 = [v12 _xpcConnection];
  long long v14 = (void *)_LSCopyBundleURLForXPCConnection(v13, 0);

  if (v14)
  {
    BOOL v15 = [[FSNode alloc] initWithURL:v14 flags:0 error:0];
    if (v15)
    {
      if (_LSBundleFindWithNode((uint64_t)a5, v15, a3, a4))
      {

        BOOL v16 = [v14 path];
        uint64_t v17 = [v16 rangeOfString:@".app/" options:4];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v19 = 0;
        }
        else
        {
          id v20 = [v16 substringToIndex:v17 + v18];
          id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v20 isDirectory:1];
          id v22 = [[FSNode alloc] initWithURL:v21 flags:0 error:0];
          if (v22) {
            BOOL v19 = _LSBundleFindWithNode((uint64_t)a5, v22, a3, a4) == 0;
          }
          else {
            BOOL v19 = 0;
          }
        }
        BOOL v15 = 0;
      }
      else
      {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 426, @"Invalid parameter not satisfying: %@", @"bundleID != kCSStoreNullID" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_4;
    }
  }
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 427, @"Invalid parameter not satisfying: %@", @"bundleData != NULL" object file lineNumber description];

  if (!a5)
  {
LABEL_17:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 428, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_4:
  if (!a5->db) {
    goto LABEL_17;
  }
  if (v13) {
    goto LABEL_6;
  }
LABEL_18:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 429, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];

LABEL_6:
  if (a4->types)
  {
    long long v14 = _LSDatabaseGetStringArray(a5->db);
    if (v13) {
      goto LABEL_8;
    }
LABEL_11:
    char v15 = 0;
    if (!a7) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  long long v14 = 0;
  if (!v13) {
    goto LABEL_11;
  }
LABEL_8:
  char v15 = [v14 containsObject:v13];
  if (!a7) {
    goto LABEL_14;
  }
LABEL_12:
  if ((v15 & 1) == 0)
  {
    BOOL v16 = [NSString stringWithFormat:@"This app is not allowed to query for scheme %@", v13];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -106, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) isBundleID:bundleData:context:allowedToCheckScheme:error:]", 448, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v15;
}

- (BOOL)legacy_isBundleID:(unsigned int)a3 bundleData:(const LSBundleData *)a4 context:(LSContext *)a5 allowedToCheckScheme:(id)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 461, @"Invalid parameter not satisfying: %@", @"bundleID != kCSStoreNullID" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_35;
      }
      goto LABEL_4;
    }
  }
  char v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 462, @"Invalid parameter not satisfying: %@", @"bundleData != NULL" object file lineNumber description];

  if (!a5)
  {
LABEL_35:
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 463, @"Invalid parameter not satisfying: %@", @"context != NULL && context->db != NULL" object file lineNumber description];

    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_4:
  if (!a5->db) {
    goto LABEL_35;
  }
  if (v13) {
    goto LABEL_6;
  }
LABEL_36:
  uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"LSCanOpenURLManager.mm", 464, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];

LABEL_6:
  if ([(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer])
  {
    long long v14 = _LSDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]();
    }
    goto LABEL_15;
  }
  char v15 = _CSStringCopyCFString();
  long long v14 = v15;
  if (!v15)
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_24;
  }
  uint64_t v37 = 0;
  v38[0] = &v37;
  v38[1] = 0x3032000000;
  v38[2] = __Block_byref_object_copy__13;
  v38[3] = __Block_byref_object_dispose__13;
  id v39 = 0;
  canOpenURLsMapQueue = self->_canOpenURLsMapQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke;
  block[3] = &unk_1E522DD10;
  v36 = &v37;
  block[4] = self;
  long long v14 = v15;
  uint64_t v35 = v14;
  dispatch_sync(canOpenURLsMapQueue, block);
  uint64_t v17 = *(void **)(v38[0] + 40);
  if (v17)
  {
    if ([v17 containsObject:v13])
    {
      uint64_t v18 = _LSDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]();
      }

      goto LABEL_22;
    }
    if ((unint64_t)[*(id *)(v38[0] + 40) count] > 0x31)
    {
      unsigned int v25 = _LSDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:].cold.4((uint64_t)v14, (uint64_t)v38, v25);
      }

      BOOL v19 = 0;
      goto LABEL_23;
    }
    id v20 = _LSDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v26 = [*(id *)(v38[0] + 40) count];
      *(_DWORD *)buf = 138412802;
      v43 = v14;
      __int16 v44 = 1024;
      int v45 = v26;
      __int16 v46 = 2112;
      id v47 = v13;
      _os_log_debug_impl(&dword_182959000, v20, OS_LOG_TYPE_DEBUG, "LSTesting: app %@ has only asked about %d schemes, adding %@ and allowing", buf, 0x1Cu);
    }
  }
  else
  {
    id v20 = _LSDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]();
    }
  }

  MEMORY[0x185310450]();
  id v21 = self->_canOpenURLsMapQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke_73;
  v31[3] = &unk_1E522DD38;
  v31[4] = self;
  long long v32 = v14;
  id v33 = v13;
  dispatch_barrier_async(v21, v31);

LABEL_22:
  BOOL v19 = 1;
LABEL_23:

  _Block_object_dispose(&v37, 8);
LABEL_24:

  if (a7) {
    char v22 = v19;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41 = @"This app has exceeded the number of allowed scheme queries";
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", -107, (uint64_t)"-[_LSCanOpenURLManager(PrivateSchemeChecking) legacy_isBundleID:bundleData:context:allowedToCheckScheme:error:]", 524, v23);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v19;
}

+ (BindingEvaluator)bindingEvaluatorForScheme:(SEL)a3
{
  LaunchServices::BindingEvaluator::CreateWithURLScheme((LaunchServices::BindingEvaluator *)a4, &retstr->var0);
  LaunchServices::BindingEvaluator::setOptions((uint64_t)retstr, 64);
  id v5 = operator new(8uLL);
  __p = v5;
  void *v5 = 0xE00000002;
  char v8 = v5 + 1;
  id v9 = v5 + 1;
  LaunchServices::BindingEvaluator::setAllowedBundleClasses((uint64_t)retstr, (uint64_t)&__p);
  result = (BindingEvaluator *)__p;
  if (__p)
  {
    char v8 = __p;
    operator delete(__p);
  }
  return result;
}

- (void)resetSchemeQueryLimitForApplicationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_182959000, v0, v1, "should not reset scheme query limit in system lsd", v2, v3, v4, v5, v6);
}

@end