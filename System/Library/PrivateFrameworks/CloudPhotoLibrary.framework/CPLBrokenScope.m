@interface CPLBrokenScope
- (BOOL)hasEngineRecoveryMechanism;
- (BOOL)isInternal;
- (BOOL)shouldShowAlertToUser;
- (CPLBrokenScope)initWithEngineScope:(id)a3 engineLibrary:(id)a4;
- (CPLEngineLibrary)engineLibrary;
- (CPLEngineScope)engineScope;
- (NSString)alertMessage;
- (NSString)alternateRecoverDescription;
- (NSString)brokenMessage;
- (NSString)brokenTitle;
- (NSString)createRadarButtonTitle;
- (NSString)internalRecoveryInstructions;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (NSString)readMoreButtonTitle;
- (NSString)recoverButtonTitle;
- (NSURL)createRadarURL;
- (NSURL)readMoreURL;
- (void)_showAlertWithMessage:(id)a3 readMoreURL:(id)a4 createRadarURL:(id)a5 showsRecoverButton:(BOOL)a6;
- (void)recoverUsingEngineWithCompletionHandler:(id)a3;
- (void)showAlertToUser;
@end

@implementation CPLBrokenScope

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engineLibrary);
  objc_storeStrong((id *)&self->_engineScope, 0);
  objc_storeStrong((id *)&self->_lastShownAlertDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)shouldShowAlertToUser
{
  return self->_shouldShowAlertToUser;
}

- (BOOL)isInternal
{
  return self->_internal;
}

- (CPLEngineLibrary)engineLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engineLibrary);
  return (CPLEngineLibrary *)WeakRetained;
}

- (CPLEngineScope)engineScope
{
  return self->_engineScope;
}

- (NSString)internalRecoveryInstructions
{
  return 0;
}

- (void)recoverUsingEngineWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[CPLErrors notImplementedError];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (NSString)recoverButtonTitle
{
  return (NSString *)@"Clean-up For Me";
}

- (BOOL)hasEngineRecoveryMechanism
{
  if (!self->_internal) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"CPLProposeBrokenScopeRecovery"];

  return v3;
}

- (void)showAlertToUser
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__CPLBrokenScope_showAlertToUser__block_invoke;
  v6[3] = &unk_1E60A5DD8;
  v6[4] = self;
  char v3 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_17230;
  block[3] = &unk_1E60A6978;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

void __33__CPLBrokenScope_showAlertToUser__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2 || ([v2 timeIntervalSinceNow], v3 < -180.0))
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;

    if ([*(id *)(a1 + 32) shouldShowAlertToUser])
    {
      v7 = *(void **)(a1 + 32);
      id v14 = [v7 alertMessage];
      id v8 = [*(id *)(a1 + 32) readMoreURL];
      v9 = [*(id *)(a1 + 32) createRadarURL];
      objc_msgSend(v7, "_showAlertWithMessage:readMoreURL:createRadarURL:showsRecoverButton:", v14, v8, v9, objc_msgSend(*(id *)(a1 + 32), "hasEngineRecoveryMechanism"));
    }
    else if (!_CPLSilentLogging)
    {
      v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(void **)(a1 + 32);
        uint64_t v12 = v11[4];
        v13 = [v11 brokenMessage];
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Broken scope detected: %@\n%@", buf, 0x16u);
      }
    }
  }
}

- (void)_showAlertWithMessage:(id)a3 readMoreURL:(id)a4 createRadarURL:(id)a5 showsRecoverButton:(BOOL)a6
{
  BOOL v6 = a6;
  v42[4] = *MEMORY[0x1E4F143B8];
  v10 = (CPLEngineScope *)a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v13 = *MEMORY[0x1E4F1D9A8];
  v41[0] = *MEMORY[0x1E4F1D990];
  v41[1] = v13;
  v42[0] = @"iCloud Photo Library";
  v42[1] = v10;
  uint64_t v14 = *MEMORY[0x1E4F1D9B8];
  v41[2] = *MEMORY[0x1E4F1D9E0];
  v41[3] = v14;
  v42[2] = @"OK";
  v42[3] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (v11)
  {
    __int16 v17 = [(CPLBrokenScope *)self readMoreButtonTitle];
    [v16 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  if (v6)
  {
    uint64_t v18 = [(CPLBrokenScope *)self recoverButtonTitle];
  }
  else
  {
    if (!v12) {
      goto LABEL_8;
    }
    uint64_t v18 = [(CPLBrokenScope *)self createRadarButtonTitle];
  }
  uint64_t v19 = (void *)v18;
  [v16 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];

LABEL_8:
  SInt32 error = 0;
  CFUserNotificationRef v20 = CFUserNotificationCreate(0, 60.0, 3uLL, &error, (CFDictionaryRef)v16);
  if (v20)
  {
    v21 = v20;
    if (!_CPLSilentLogging)
    {
      v22 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v10;
        _os_log_impl(&dword_1B4CAC000, v22, OS_LOG_TYPE_DEFAULT, "Waiting for response to message: %@", buf, 0xCu);
      }
    }
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v21, 60.0, &responseFlags);
    CFRelease(v21);
    CFOptionFlags v23 = responseFlags & 3;
    if (!_CPLSilentLogging)
    {
      v24 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [NSNumber numberWithUnsignedLong:v23];
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_DEFAULT, "Button pressed is %@", buf, 0xCu);
      }
    }
    if (v11 && v23 == 1)
    {
      v26 = (void *)MEMORY[0x1E4F223E0];
      id v27 = v11;
    }
    else
    {
      if (v23 != 2) {
        goto LABEL_30;
      }
      if (v6)
      {
        BOOL shouldShowAlertToUser = self->_shouldShowAlertToUser;
        self->_BOOL shouldShowAlertToUser = 0;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke;
        v33[3] = &unk_1E60AA378;
        v33[4] = self;
        BOOL v34 = shouldShowAlertToUser;
        [(CPLBrokenScope *)self recoverUsingEngineWithCompletionHandler:v33];
        goto LABEL_30;
      }
      if (!v12) {
        goto LABEL_30;
      }
      v26 = (void *)MEMORY[0x1E4F223E0];
      id v27 = v12;
    }
    v28 = v27;
    v29 = [v26 defaultWorkspace];
    [v29 openURL:v28 configuration:0 completionHandler:0];
  }
  else if (!_CPLSilentLogging)
  {
    v30 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      engineScope = self->_engineScope;
      *(_DWORD *)buf = 138412546;
      v38 = engineScope;
      __int16 v39 = 1024;
      SInt32 v40 = error;
      _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Could not create user notification for broken scope %@: %d", buf, 0x12u);
    }
  }
LABEL_30:
}

void __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke_2;
  v10[3] = &unk_1E60AA350;
  id v11 = v3;
  uint64_t v12 = v4;
  char v13 = *(unsigned char *)(a1 + 40);
  BOOL v6 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_17230;
  block[3] = &unk_1E60A6978;
  id v15 = v6;
  v7 = v5;
  id v8 = v3;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

void __86__CPLBrokenScope__showAlertWithMessage_readMoreURL_createRadarURL_showsRecoverButton___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v4;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_ERROR, "Failed to clean-up: %@", buf, 0xCu);
      }

      v2 = *(void **)(a1 + 32);
    }
    if (([v2 isCPLOperationCancelledError] & 1) == 0)
    {
      uint64_t v5 = *(unsigned char **)(a1 + 40);
      BOOL v6 = @"Failed to clean-up library";
      if (v5[24])
      {
        id v7 = [NSString alloc];
        id v8 = [*(id *)(a1 + 32) localizedDescription];
        BOOL v6 = (__CFString *)[v7 initWithFormat:@"%@\n\n%@", @"Failed to clean-up library", v8];

        uint64_t v5 = *(unsigned char **)(a1 + 40);
      }
      dispatch_block_t v9 = [v5 readMoreURL];
      v10 = [*(id *)(a1 + 40) createRadarURL];
      [v5 _showAlertWithMessage:v6 readMoreURL:v9 createRadarURL:v10 showsRecoverButton:0];
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 25) = *(unsigned char *)(a1 + 48);
  }
  else
  {
    [*(id *)(a1 + 40) _showAlertWithMessage:@"Library has been cleaned up successfully." readMoreURL:0 createRadarURL:0 showsRecoverButton:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    id v11 = [WeakRetained syncManager];
    uint64_t v12 = [*(id *)(a1 + 40) engineScope];
    [v11 removeBrokenScope:v12];
  }
}

- (NSURL)createRadarURL
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_internal)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [(CPLBrokenScope *)self radarTitle];
    [v3 setObject:v4 forKeyedSubscript:@"Title"];

    [v3 setObject:@"Other Bug" forKeyedSubscript:@"Classification"];
    [v3 setObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics" forKeyedSubscript:@"ExtensionIdentifiers"];
    [v3 setObject:@"Not Applicable" forKeyedSubscript:@"Reproducibility"];
    [v3 setObject:@"Photos Backend iCloud" forKeyedSubscript:@"ComponentName"];
    [v3 setObject:@"630691" forKeyedSubscript:@"ComponentID"];
    [v3 setObject:@"all" forKeyedSubscript:@"ComponentVersion"];
    uint64_t v5 = [(CPLBrokenScope *)self radarDescription];
    [v3 setObject:v5 forKeyedSubscript:@"Description"];

    BOOL v6 = [MEMORY[0x1E4F29088] componentsWithString:@"tap-to-radar://new"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x1E4F290C8];
          uint64_t v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v19);
          uint64_t v16 = [v14 queryItemWithName:v13 value:v15];
          [v7 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v6 setQueryItems:v7];
    __int16 v17 = [v6 URL];
  }
  else
  {
    __int16 v17 = 0;
  }
  return (NSURL *)v17;
}

- (NSString)createRadarButtonTitle
{
  return (NSString *)@"Create Radar";
}

- (NSString)radarDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(CPLBrokenScope *)self brokenMessage];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@\n\nremaining scope is: %@", v4, self->_engineScope];

  return (NSString *)v5;
}

- (NSString)radarTitle
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(CPLEngineScope *)self->_engineScope scopeIdentifier];
  uint64_t v5 = +[CPLScopeChange descriptionForScopeType:[(CPLEngineScope *)self->_engineScope scopeType]];
  BOOL v6 = (void *)[v3 initWithFormat:@"Library has broken scope %@ (%@)", v4, v5];

  return (NSString *)v6;
}

- (NSURL)readMoreURL
{
  if (self->_internal)
  {
    v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://at.apple.com/icpl-unsupported-scopes"];
  }
  else
  {
    v2 = 0;
  }
  return (NSURL *)v2;
}

- (NSString)readMoreButtonTitle
{
  return (NSString *)@"Read More";
}

- (NSString)alertMessage
{
  id v3 = [(CPLBrokenScope *)self brokenMessage];
  if (self->_internal)
  {
    uint64_t v4 = [(CPLBrokenScope *)self internalRecoveryInstructions];
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      uint64_t v6 = [v3 stringByAppendingFormat:@"\n\nTo clean-up library, run the following command:\n%@", v4];

      id v3 = (void *)v6;
    }
  }
  return (NSString *)v3;
}

- (NSString)brokenMessage
{
  if (self->_internal)
  {
    int64_t v4 = [(CPLEngineScope *)self->_engineScope scopeType];
    if ((unint64_t)(v4 - 4) < 2) {
      return (NSString *)@"Library has remains of shared library and must be cleaned before synchronization can continue.";
    }
    if ((unint64_t)(v4 - 1) <= 2)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBrokenScope.m"];
      [v6 handleFailureInMethod:a2, self, v7, 80, @"%@ should not be a broken scope", self->_engineScope object file lineNumber description];

      abort();
    }
  }
  return (NSString *)@"Library has unsupported scopes and must be cleaned before synchronization can continue.";
}

- (NSString)brokenTitle
{
  return (NSString *)@"iCloud Photo Library";
}

- (NSString)alternateRecoverDescription
{
  int64_t v4 = [(CPLEngineScope *)self->_engineScope scopeType];
  if ((unint64_t)(v4 - 4) < 2) {
    return (NSString *)@"feature is enabled";
  }
  if ((unint64_t)(v4 - 1) <= 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLBrokenScope.m"];
    [v6 handleFailureInMethod:a2, self, v7, 54, @"%@ should not be a broken scope", self->_engineScope object file lineNumber description];

    abort();
  }
  return 0;
}

- (CPLBrokenScope)initWithEngineScope:(id)a3 engineLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPLBrokenScope;
  uint64_t v9 = [(CPLBrokenScope *)&v13 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.warnalert", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_engineScope, a3);
    objc_storeWeak((id *)&v9->_engineLibrary, v8);
    v9->_internal = os_variant_has_internal_content();
    v9->_BOOL shouldShowAlertToUser = CPLDontWarnAboutUnsupportedScopes() ^ 1;
  }

  return v9;
}

@end