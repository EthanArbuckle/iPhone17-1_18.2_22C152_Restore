@interface LCSCaptureApplication
- (BOOL)isEqual:(id)a3;
- (LCSCaptureApplication)initWithExtensionInfo:(id)a3 attributes:(id)a4;
- (LCSCaptureApplicationAttributes)attributes;
- (LCSExtensionDescribing)extension;
- (NSData)captureIntentContext;
- (NSSet)launchActions;
- (NSString)bundleIdentifier;
- (NSString)description;
- (id)_bundleRecordForBundleIdentifier:(id)a3;
- (id)_captureIntentContextDirectoryURLForBundleIdentifier:(id)a3;
- (id)_captureIntentContextFileURLForBundleIdentifier:(id)a3;
- (id)_resolvedLinkAction;
- (id)acquireLaunchPrewarmAssertionForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_beginObservingMetadataChanges;
- (void)_clearCachedLinkAction;
- (void)_endObservingMetadataChanges;
- (void)_evaluateLaunchPrewarmAssertions;
- (void)_generateCachedLinkAction;
- (void)captureIntentContext;
- (void)dealloc;
- (void)launchActions;
- (void)setCaptureIntentContext:(id)a3;
@end

@implementation LCSCaptureApplication

- (LCSExtensionDescribing)extension
{
  return self->_extension;
}

- (LCSCaptureApplication)initWithExtensionInfo:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)LCSCaptureApplication;
  v9 = [(LCSCaptureApplication *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    uint64_t v11 = [v7 containerBundleIdentifier];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    linkActionQueue = v10->_linkActionQueue;
    v10->_linkActionQueue = (OS_dispatch_queue *)Serial;

    objc_storeStrong((id *)&v10->_attributes, a4);
    objc_initWeak(&location, v10);
    v15 = (void *)MEMORY[0x263F29C18];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __58__LCSCaptureApplication_initWithExtensionInfo_attributes___block_invoke;
    v24 = &unk_2653BEE28;
    objc_copyWeak(&v25, &location);
    uint64_t v16 = [v15 assertionWithIdentifier:@"launchPrewarm" stateDidChangeHandler:&v21];
    launchPrewarmCompoundAssertion = v10->_launchPrewarmCompoundAssertion;
    v10->_launchPrewarmCompoundAssertion = (BSCompoundAssertion *)v16;

    v18 = v10->_launchPrewarmCompoundAssertion;
    v19 = LCSLogCommon();
    -[BSCompoundAssertion setLog:](v18, "setLog:", v19, v21, v22, v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__LCSCaptureApplication_initWithExtensionInfo_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _evaluateLaunchPrewarmAssertions];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(LCSCaptureApplication *)self _endObservingMetadataChanges];
  [(BSCompoundAssertion *)self->_launchPrewarmCompoundAssertion invalidate];
  launchPrewarmCompoundAssertion = self->_launchPrewarmCompoundAssertion;
  self->_launchPrewarmCompoundAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)LCSCaptureApplication;
  [(LCSCaptureApplication *)&v4 dealloc];
}

- (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  objc_super v4 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = LCSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[LCSCaptureApplication _bundleRecordForBundleIdentifier:]((uint64_t)v3, v5);
    }
  }
  return v4;
}

- (id)_captureIntentContextDirectoryURLForBundleIdentifier:(id)a3
{
  id v3 = [(LCSCaptureApplication *)self _bundleRecordForBundleIdentifier:a3];
  objc_super v4 = [v3 dataContainerURL];
  id v5 = [v4 URLByAppendingPathComponent:@"Library/com.apple.SecureCapture" isDirectory:1];

  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  id v13 = 0;
  char v8 = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = v5;
  }
  else
  {
    uint64_t v11 = LCSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[LCSCaptureApplication _captureIntentContextDirectoryURLForBundleIdentifier:](v5, v9);
    }

    id v10 = 0;
  }

  return v10;
}

- (id)_captureIntentContextFileURLForBundleIdentifier:(id)a3
{
  id v3 = [(LCSCaptureApplication *)self _captureIntentContextDirectoryURLForBundleIdentifier:a3];
  objc_super v4 = [v3 URLByAppendingPathComponent:@"AppIntentContext.data"];

  return v4;
}

- (NSData)captureIntentContext
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_bundleIdentifier)
  {
    id v2 = LCSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(LCSCaptureApplication *)v2 captureIntentContext];
    }
    goto LABEL_11;
  }
  id v2 = -[LCSCaptureApplication _captureIntentContextFileURLForBundleIdentifier:](self, "_captureIntentContextFileURLForBundleIdentifier:");
  id v3 = LCSLogCommon();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_255087000, v3, OS_LOG_TYPE_DEFAULT, "File URL can't be found for the capture intent context, this may be expected", (uint8_t *)&v15, 2u);
    }

LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if (v4)
  {
    id v5 = [v2 absoluteString];
    int v15 = 138543362;
    uint64_t v16 = v5;
    _os_log_impl(&dword_255087000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving capture intent context from: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2];
LABEL_12:

  return (NSData *)v6;
}

- (void)setCaptureIntentContext:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_bundleIdentifier)
  {
    id v5 = -[LCSCaptureApplication _captureIntentContextFileURLForBundleIdentifier:](self, "_captureIntentContextFileURLForBundleIdentifier:");
    if (v5)
    {
      v6 = LCSLogCommon();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v7)
        {
          uint64_t v8 = [v5 absoluteString];
          *(_DWORD *)buf = 138543362;
          v30 = v8;
          _os_log_impl(&dword_255087000, v6, OS_LOG_TYPE_DEFAULT, "Writing capture intent context to: %{public}@", buf, 0xCu);
        }
        [v4 writeToURL:v5 atomically:1];
        goto LABEL_18;
      }
      if (v7)
      {
        v24 = [v5 absoluteString];
        *(_DWORD *)buf = 138543362;
        v30 = v24;
        _os_log_impl(&dword_255087000, v6, OS_LOG_TYPE_DEFAULT, "Received nil context, removing capture intent context from: %{public}@", buf, 0xCu);
      }
      id v25 = [MEMORY[0x263F08850] defaultManager];
      id v28 = 0;
      char v26 = [v25 removeItemAtURL:v5 error:&v28];
      uint64_t v16 = v28;

      if ((v26 & 1) == 0)
      {
        objc_super v27 = LCSLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[LCSCaptureApplication setCaptureIntentContext:](v5, v16);
        }
      }
    }
    else
    {
      uint64_t v16 = LCSLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[LCSCaptureApplication setCaptureIntentContext:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    goto LABEL_18;
  }
  id v5 = LCSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[LCSCaptureApplication setCaptureIntentContext:](v5, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_18:
}

- (id)acquireLaunchPrewarmAssertionForReason:(id)a3
{
  if (a3)
  {
    id v4 = -[BSCompoundAssertion acquireForReason:](self->_launchPrewarmCompoundAssertion, "acquireForReason:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_evaluateLaunchPrewarmAssertions
{
  int v3 = [(BSCompoundAssertion *)self->_launchPrewarmCompoundAssertion isActive];
  cachedLinkAction = self->_cachedLinkAction;
  if (v3)
  {
    if (!cachedLinkAction)
    {
      [(LCSCaptureApplication *)self _generateCachedLinkAction];
      [(LCSCaptureApplication *)self _beginObservingMetadataChanges];
    }
  }
  else if (cachedLinkAction)
  {
    [(LCSCaptureApplication *)self _endObservingMetadataChanges];
    [(LCSCaptureApplication *)self _clearCachedLinkAction];
  }
}

- (id)_resolvedLinkAction
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = (void *)[objc_alloc(MEMORY[0x263F520A8]) initWithOptions:0];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = [MEMORY[0x263F51D30] cameraCaptureProtocol];
  v6 = [v4 setWithObject:v5];
  BOOL v7 = [v3 actionsConformingToSystemProtocols:v6 logicalType:1 bundleIdentifier:self->_bundleIdentifier error:0];

  uint64_t v8 = [v7 objectForKeyedSubscript:self->_bundleIdentifier];
  uint64_t v9 = [v8 allValues];

  uint64_t v10 = [v9 firstObject];
  if (v10)
  {
    uint64_t v11 = LCSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v7 debugDescription];
      int v17 = 138412290;
      uint64_t v18 = v12;
      _os_log_impl(&dword_255087000, v11, OS_LOG_TYPE_DEFAULT, "Action metadata found in the action map: %@. Creating a link launch action", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x263F51FB8] policyWithActionMetadata:v10];
    uint64_t v14 = [v13 actionWithParameters:MEMORY[0x263EFFA68]];
    uint64_t v15 = [v14 actionWithOpenWhenRun:0];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_generateCachedLinkAction
{
  objc_initWeak(&location, self);
  linkActionQueue = self->_linkActionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__LCSCaptureApplication__generateCachedLinkAction__block_invoke;
  v4[3] = &unk_2653BEA18;
  objc_copyWeak(&v5, &location);
  dispatch_async(linkActionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__LCSCaptureApplication__generateCachedLinkAction__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[3])
  {
    int v3 = LCSLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v2[7];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_255087000, v3, OS_LOG_TYPE_DEFAULT, "Prewarming link action for %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v5 = [v2 _resolvedLinkAction];
    v6 = (void *)v2[3];
    v2[3] = v5;
  }
}

- (void)_clearCachedLinkAction
{
  objc_initWeak(&location, self);
  linkActionQueue = self->_linkActionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__LCSCaptureApplication__clearCachedLinkAction__block_invoke;
  v4[3] = &unk_2653BEA18;
  objc_copyWeak(&v5, &location);
  dispatch_async(linkActionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__LCSCaptureApplication__clearCachedLinkAction__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = LCSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[7];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_255087000, v2, OS_LOG_TYPE_DEFAULT, "Clearing cached link action for %@", (uint8_t *)&v5, 0xCu);
    }

    uint64_t v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
  }
}

- (void)_beginObservingMetadataChanges
{
  if (!self->_metadataChangedObserverToken)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F51E08];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke;
    v7[3] = &unk_2653BEAE0;
    objc_copyWeak(&v8, &location);
    int v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];

    metadataChangedObserverToken = self->_metadataChangedObserverToken;
    self->_metadataChangedObserverToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke_2;
    block[3] = &unk_2653BED38;
    objc_copyWeak(&v11, v4);
    id v9 = v3;
    uint64_t v10 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }
}

void __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = [a1[4] userInfo];
    uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F51E10]];

    if (!v4 || [v4 containsObject:*((void *)a1[5] + 7)])
    {
      uint64_t v5 = [a1[5] _resolvedLinkAction];
      uint64_t v6 = a1[5];
      uint64_t v7 = (void *)v6[3];
      v6[3] = v5;
    }
    id WeakRetained = v8;
  }
}

- (void)_endObservingMetadataChanges
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_metadataChangedObserverToken];

  metadataChangedObserverToken = self->_metadataChangedObserverToken;
  self->_metadataChangedObserverToken = 0;
}

- (NSSet)launchActions
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__2;
  uint64_t v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  linkActionQueue = self->_linkActionQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __38__LCSCaptureApplication_launchActions__block_invoke;
  v18[3] = &unk_2653BEA90;
  v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(linkActionQueue, v18);
  if (v20[5]
    || ([(LCSCaptureApplication *)self _resolvedLinkAction],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (void *)v20[5],
        v20[5] = v5,
        v6,
        v20[5]))
  {
    uint64_t v7 = objc_opt_new();
    [v7 setOneShotForSpringBoardOnly:1];
    id v8 = objc_opt_new();
    id v9 = [(LCSCaptureApplication *)self captureIntentContext];
    if (v9) {
      [v8 setEncodedCaptureAppContext:v9];
    }
    [v7 setSystemContext:v8];
    id v10 = objc_alloc(MEMORY[0x263F520D8]);
    id v11 = objc_opt_new();
    uint64_t v12 = (void *)[v10 initWithIdentifier:v11 action:v20[5] executorOptions:v7];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F82910]) initWithAction:v12 responseHandler:&__block_literal_global_3];
    uint64_t v14 = LCSLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 debugDescription];
      *(_DWORD *)buf = 138412290;
      char v26 = v15;
      _os_log_impl(&dword_255087000, v14, OS_LOG_TYPE_DEFAULT, "Link action created: %@", buf, 0xCu);
    }
    [v3 addObject:v13];
  }
  else
  {
    uint64_t v7 = LCSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(LCSCaptureApplication *)(uint64_t)self launchActions];
    }
  }

  uint64_t v16 = (void *)[v3 copy];
  _Block_object_dispose(&v19, 8);

  return (NSSet *)v16;
}

void __38__LCSCaptureApplication_launchActions__block_invoke(uint64_t a1)
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LCSCaptureApplication *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_bundleIdentifier isEqual:v4->_bundleIdentifier]
      && [(LCSExtensionDescribing *)self->_extension isEqual:v4->_extension]
      && ([(LCSCaptureApplication *)self captureIntentContext],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          [(LCSCaptureApplication *)v4 captureIntentContext],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 isEqual:v6],
          v6,
          v5,
          v7)
      && [(NSSet *)self->_launchActions isEqual:v4->_launchActions]
      && [(LCSCaptureApplicationAttributes *)self->_attributes isEqual:v4->_attributes];
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  uint64_t v4 = [(LCSExtensionDescribing *)self->_extension hash] ^ v3;
  uint64_t v5 = [(LCSCaptureApplication *)self captureIntentContext];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = v4 ^ v6 ^ [(NSSet *)self->_launchActions hash];
  unint64_t v8 = v7 ^ [(LCSCaptureApplicationAttributes *)self->_attributes hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(LCSCaptureApplication *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(LCSCaptureApplication *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(LCSCaptureApplication *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LCSCaptureApplication *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__LCSCaptureApplication_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2653BE9F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __63__LCSCaptureApplication_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 56) withName:@"bundleIdentifier"];
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 24) != 0 withName:@"hasCachedLinkAction" ifEqualTo:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"attributes"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LCSCaptureApplicationAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_metadataChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_cachedLinkAction, 0);
  objc_storeStrong((id *)&self->_linkActionQueue, 0);
  objc_storeStrong((id *)&self->_launchPrewarmCompoundAssertion, 0);
}

- (void)_bundleRecordForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  unint64_t v8 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_1(&dword_255087000, v2, v3, "Unable to resolve bundle record for %@: %@", v4, v5, v6, v7, 2u);
}

- (void)_captureIntentContextDirectoryURLForBundleIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 absoluteString];
  id v10 = [a2 debugDescription];
  OUTLINED_FUNCTION_0_1(&dword_255087000, v4, v5, "Can't create a directory URL: %{public}@ error: %@", v6, v7, v8, v9, 2u);
}

- (void)captureIntentContext
{
}

- (void)setCaptureIntentContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setCaptureIntentContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setCaptureIntentContext:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v3 = [a1 absoluteString];
  id v10 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_1(&dword_255087000, v4, v5, "Unable to remove capture intent context from %{public}@ : %{public}@", v6, v7, v8, v9, 2u);
}

- (void)launchActions
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_255087000, a2, OS_LOG_TYPE_ERROR, "Unable to resolve link action for capture application: %@", (uint8_t *)&v3, 0xCu);
}

@end