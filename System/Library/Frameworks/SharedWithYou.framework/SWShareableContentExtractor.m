@interface SWShareableContentExtractor
+ (OS_dispatch_queue)contentExtractorQueue;
+ (id)_buildStartCollaborationURLForContentSceneIdentifier:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6;
- (NSMutableArray)pendingContentExtractionRequests;
- (SLDServiceProxy)serviceProxy;
- (SWShareableContentExtractor)init;
- (id)remoteService;
- (void)_addContentExtractionRequest:(id)a3;
- (void)_processPendingContentExtractionRequests;
- (void)initiateBackgroundCollaborationForContent:(id)a3 faceTimeConversation:(id)a4;
- (void)initiateBackgroundCollaborationForContent:(id)a3 recipients:(id)a4 faceTimeConversationUUID:(id)a5;
- (void)initiateBackgroundCollaborationForContent:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6;
- (void)loadRepresentationForContent:(id)a3 typeIdentifier:(id)a4 itemProviderIndex:(int64_t)a5 completionHandler:(id)a6;
- (void)presentMessageComposeSheetForContent:(id)a3 completion:(id)a4;
- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)retrieveAsynchronousLPMetadataForSceneIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)retrieveAsynchronousLPMetadataWithCompletion:(id)a3;
- (void)retrieveShareableContentForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveShareableContentForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)retrieveShareableContentForSceneIdentifier:(id)a3 completion:(id)a4;
- (void)retrieveShareableContentMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5;
- (void)retrieveShareableContentWithCompletion:(id)a3;
- (void)serviceProxyDidConnect:(id)a3;
- (void)serviceProxyDidDisconnect:(id)a3;
- (void)setPendingContentExtractionRequests:(id)a3;
- (void)setServiceProxy:(id)a3;
@end

@implementation SWShareableContentExtractor

+ (OS_dispatch_queue)contentExtractorQueue
{
  if (contentExtractorQueue_onceToken != -1) {
    dispatch_once(&contentExtractorQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)contentExtractorQueue_contentExtractorQueue;

  return (OS_dispatch_queue *)v2;
}

void __52__SWShareableContentExtractor_contentExtractorQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.SharedWithYou.SWShareableContentExtractor", v2);
  v1 = (void *)contentExtractorQueue_contentExtractorQueue;
  contentExtractorQueue_contentExtractorQueue = (uint64_t)v0;
}

- (SWShareableContentExtractor)init
{
  v8.receiver = self;
  v8.super_class = (Class)SWShareableContentExtractor;
  v2 = [(SWShareableContentExtractor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    pendingContentExtractionRequests = v2->_pendingContentExtractionRequests;
    v2->_pendingContentExtractionRequests = (NSMutableArray *)v3;

    v5 = SWShareableContentLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Initialized SWShareableContentExtractor", v7, 2u);
    }
  }
  return v2;
}

- (void)retrieveShareableContentForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __102__SWShareableContentExtractor_retrieveShareableContentForBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v10[3] = &unk_1E56658F8;
  id v11 = v8;
  id v9 = v8;
  [(SWShareableContentExtractor *)self retrieveShareableContentMatchingBundleIdentifier:a3 sceneIdentifier:a4 completion:v10];
}

void __102__SWShareableContentExtractor_retrieveShareableContentForBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)retrieveShareableContentForSceneIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__SWShareableContentExtractor_retrieveShareableContentForSceneIdentifier_completion___block_invoke;
  v8[3] = &unk_1E56658F8;
  id v9 = v6;
  id v7 = v6;
  [(SWShareableContentExtractor *)self retrieveShareableContentMatchingBundleIdentifier:0 sceneIdentifier:a3 completion:v8];
}

void __85__SWShareableContentExtractor_retrieveShareableContentForSceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)retrieveShareableContentForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)retrieveShareableContentWithCompletion:(id)a3
{
}

- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for bundle identifier and scene identifier %@, %@.", (uint8_t *)&v12, 0x16u);
  }

  [(SWShareableContentExtractor *)self retrieveAsynchronousLPMetadataMatchingBundleIdentifier:v8 sceneIdentifier:v9 completion:v10];
}

- (void)retrieveAsynchronousLPMetadataForSceneIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for scene identifier %@.", (uint8_t *)&v9, 0xCu);
  }

  [(SWShareableContentExtractor *)self retrieveAsynchronousLPMetadataMatchingBundleIdentifier:0 sceneIdentifier:v6 completion:v7];
}

- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for bundle identifier %@.", (uint8_t *)&v9, 0xCu);
  }

  [(SWShareableContentExtractor *)self retrieveAsynchronousLPMetadataMatchingBundleIdentifier:v6 sceneIdentifier:0 completion:v7];
}

- (void)retrieveAsynchronousLPMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "SWY Retrieving metadata for the on screen content.", v6, 2u);
  }

  [(SWShareableContentExtractor *)self retrieveAsynchronousLPMetadataMatchingBundleIdentifier:0 sceneIdentifier:0 completion:v4];
}

- (void)retrieveShareableContentMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v18 = &unk_1E5665890;
  v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  __int16 v14 = _Block_copy(&v15);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v14, v15, v16, v17, v18, v19);
}

void __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1)
{
  v2 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving metadata for the on screen content.", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) remoteService];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_49;
  v6[3] = &unk_1E5665920;
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v3 retrieveShareableContentMetadataMatchingBundleIdentifier:v4 sceneIdentifier:v5 completion:v6];
}

void __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
        id v7 = [SWShareableContent alloc];
        id v8 = [v6 sceneIdentifier];
        id v9 = [v6 bundleIdentifier];
        id v10 = [v6 metadata];
        id v11 = [v6 representations];
        id v12 = [v6 highlightURL];
        id v13 = [v6 initiatorHandle];
        __int16 v14 = [v6 initiatorNameComponents];
        uint64_t v15 = [(SWShareableContent *)v7 initWithSourceSceneIdentifier:v8 sourceBundleIdentifier:v9 metadata:v10 representations:v11 highlightURL:v12 initiatorHandle:v13 initiatorNameComponents:v14];

        [(SWShareableContent *)v15 setRepresentationProvider:*(void *)(a1 + 32)];
        [v20 addObject:v15];

        ++v5;
      }
      while (v4 != v5);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v4);
  }

  uint64_t v16 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_log_impl(&dword_18FB18000, v16, OS_LOG_TYPE_DEFAULT, "Retrieved shareable content metadata: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  uint64_t v18 = &unk_1E5665890;
  v19 = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  __int16 v14 = _Block_copy(&v15);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v14, v15, v16, v17, v18, v19);
}

void __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving asynchronous metadata for the on screen content.", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) remoteService];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_51;
  v6[3] = &unk_1E5665948;
  id v7 = *(id *)(a1 + 56);
  [v3 retrieveAsynchronousLPMetadataMatchingBundleIdentifier:v4 sceneIdentifier:v5 completion:v6];
}

void __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "Retrieved asynchronous LP metadata: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentMessageComposeSheetForContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SWShareableContentExtractor_presentMessageComposeSheetForContent_completion___block_invoke;
  aBlock[3] = &unk_1E5665970;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = _Block_copy(aBlock);
  [(SWShareableContentExtractor *)self _addContentExtractionRequest:v10];
}

void __79__SWShareableContentExtractor_presentMessageComposeSheetForContent_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) sourceSceneIdentifier];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Presenting message compose sheet to share on screen content from source identifier: %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 40) remoteService];
  int v5 = [*(id *)(a1 + 32) sourceSceneIdentifier];
  [v4 presentMessageComposeSheetForSceneIdentifier:v5 completion:*(void *)(a1 + 48)];
}

- (void)initiateBackgroundCollaborationForContent:(id)a3 faceTimeConversation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v6 remoteMembers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) handle];
        id v14 = [v13 normalizedValue];
        if (v14)
        {
          [v7 addObject:v14];
        }
        else
        {
          uint64_t v15 = [v13 value];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [v6 UUID];
  [(SWShareableContentExtractor *)self initiateBackgroundCollaborationForContent:v5 shareOptions:0 recipients:v7 faceTimeConversationUUID:v16];
}

- (void)initiateBackgroundCollaborationForContent:(id)a3 recipients:(id)a4 faceTimeConversationUUID:(id)a5
{
}

- (void)initiateBackgroundCollaborationForContent:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count])
  {
    id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:0 error:0];
    id v14 = [v13 base64EncodedStringWithOptions:0];
    uint64_t v15 = [v9 sourceSceneIdentifier];
    uint64_t v16 = +[SWShareableContentExtractor _buildStartCollaborationURLForContentSceneIdentifier:v15 shareOptions:v14 recipients:v11 faceTimeConversationUUID:v12];

    if (v16)
    {
      uint64_t v17 = *MEMORY[0x1E4F625F8];
      v31[0] = *MEMORY[0x1E4F62678];
      v31[1] = v17;
      v32[0] = v16;
      v32[1] = MEMORY[0x1E4F1CC38];
      long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
      long long v19 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
      long long v20 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v18];
      uint64_t v28 = v13;
      id v21 = v11;
      id v22 = v14;
      id v23 = v9;
      id v24 = v12;
      id v25 = v10;
      uint64_t v26 = *MEMORY[0x1E4F3BE50];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __122__SWShareableContentExtractor_initiateBackgroundCollaborationForContent_shareOptions_recipients_faceTimeConversationUUID___block_invoke;
      v29[3] = &unk_1E5665998;
      id v30 = v16;
      uint64_t v27 = v26;
      id v10 = v25;
      id v12 = v24;
      id v9 = v23;
      id v14 = v22;
      id v11 = v21;
      id v13 = v28;
      [v19 openApplication:v27 withOptions:v20 completion:v29];
    }
    else
    {
      long long v18 = SWShareableContentLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v9;
        _os_log_impl(&dword_18FB18000, v18, OS_LOG_TYPE_DEFAULT, "Start collaboration URL could not be constructed when trying to start collaboration for shareable content: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v13 = SWShareableContentLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v9;
      _os_log_impl(&dword_18FB18000, v13, OS_LOG_TYPE_DEFAULT, "No recipients were specified when trying to start collaboration for shareable content: %@", buf, 0xCu);
    }
  }
}

void __122__SWShareableContentExtractor_initiateBackgroundCollaborationForContent_shareOptions_recipients_faceTimeConversationUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SWShareableContentLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2 || v5)
  {
    if (v7)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v5;
      id v9 = "Failed to background launch mobile SMS for startCollaborationURL %@ with error %@";
      id v10 = v6;
      uint32_t v11 = 22;
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v8;
    id v9 = "Successfully background launched application MobileSMS for startCollaborationURL %@";
    id v10 = v6;
    uint32_t v11 = 12;
LABEL_7:
    _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
  }
}

+ (id)_buildStartCollaborationURLForContentSceneIdentifier:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6
{
  v32[6] = *MEMORY[0x1E4F143B8];
  id v30 = a6;
  id v9 = (void *)MEMORY[0x1E4F29088];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v31 = [v9 componentsWithString:@"sms://open"];
  v29 = (void *)MEMORY[0x1E4F1CA48];
  int v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"service" value:@"iMessage"];
  v32[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"compose" value:@"false"];
  v32[1] = v14;
  __int16 v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"collaboration-initiate-send" value:@"true"];
  void v32[2] = v15;
  id v16 = (void *)MEMORY[0x1E4F290C8];
  if ([v10 count] == 1) {
    uint64_t v17 = @"recipient";
  }
  else {
    uint64_t v17 = @"recipients";
  }
  long long v18 = [v10 componentsJoinedByString:@","];

  long long v19 = [v16 queryItemWithName:v17 value:v18];
  v32[3] = v19;
  long long v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"collaboration-scene-identifier" value:v12];

  v32[4] = v20;
  id v21 = [MEMORY[0x1E4F290C8] queryItemWithName:@"collaboration-share-options" value:v11];

  v32[5] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:6];
  id v23 = [v29 arrayWithArray:v22];

  if (v30)
  {
    id v24 = (void *)MEMORY[0x1E4F290C8];
    id v25 = [v30 UUIDString];
    uint64_t v26 = [v24 queryItemWithName:@"facetime-conversation" value:v25];
    [v23 addObject:v26];
  }
  [v31 setQueryItems:v23];
  uint64_t v27 = [v31 URL];

  return v27;
}

- (void)_addContentExtractionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() contentExtractorQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SWShareableContentExtractor__addContentExtractionRequest___block_invoke;
  v7[3] = &unk_1E5665840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__SWShareableContentExtractor__addContentExtractionRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceProxy];
  int v3 = [v2 connectionActive];

  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    id v5 = SWShareableContentLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Not currently connected to shareable content service. We'll wait for the connection before servicing this request.", v9, 2u);
    }

    id v6 = [*(id *)(a1 + 32) pendingContentExtractionRequests];
    BOOL v7 = _Block_copy(*(const void **)(a1 + 40));
    [v6 addObject:v7];

    id v8 = [*(id *)(a1 + 32) serviceProxy];
    [v8 connect];
  }
}

- (void)_processPendingContentExtractionRequests
{
  int v3 = [(id)objc_opt_class() contentExtractorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SWShareableContentExtractor__processPendingContentExtractionRequests__block_invoke;
  block[3] = &unk_1E5665868;
  block[4] = self;
  dispatch_async(v3, block);
}

void __71__SWShareableContentExtractor__processPendingContentExtractionRequests__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pendingContentExtractionRequests", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  BOOL v7 = [*(id *)(a1 + 32) pendingContentExtractionRequests];
  [v7 removeAllObjects];
}

- (void)loadRepresentationForContent:(id)a3 typeIdentifier:(id)a4 itemProviderIndex:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__SWShareableContentExtractor_loadRepresentationForContent_typeIdentifier_itemProviderIndex_completionHandler___block_invoke;
  aBlock[3] = &unk_1E56659C0;
  id v18 = v11;
  id v19 = v10;
  id v21 = v12;
  int64_t v22 = a5;
  long long v20 = self;
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  id v16 = _Block_copy(aBlock);
  [(SWShareableContentExtractor *)self _addContentExtractionRequest:v16];
}

void __111__SWShareableContentExtractor_loadRepresentationForContent_typeIdentifier_itemProviderIndex_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) sourceSceneIdentifier];
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving representation with type identifier: %@ from on screen content with source identifier: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 48) remoteService];
  uint64_t v6 = [*(id *)(a1 + 40) sourceBundleIdentifier];
  BOOL v7 = [*(id *)(a1 + 40) sourceSceneIdentifier];
  [v5 loadRepresentationFromBundleIdentifier:v6 sceneIdentifier:v7 requestedTypeIdentifier:*(void *)(a1 + 32) requestedItemProviderIndex:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (SLDServiceProxy)serviceProxy
{
  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FA5640];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(id)objc_opt_class() contentExtractorQueue];
    BOOL v7 = [v4 proxyForServiceClass:v5 targetSerialQueue:v6 delegate:self];
    int v8 = self->_serviceProxy;
    self->_serviceProxy = v7;

    serviceProxy = self->_serviceProxy;
  }

  return serviceProxy;
}

- (id)remoteService
{
  id v2 = [(SWShareableContentExtractor *)self serviceProxy];
  uint64_t v3 = [v2 remoteService];

  return v3;
}

- (void)serviceProxyDidConnect:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(SWShareableContentExtractor *)self pendingContentExtractionRequests];
    int v6 = 138412546;
    BOOL v7 = self;
    __int16 v8 = 2048;
    uint64_t v9 = [v5 count];
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_INFO, "Service proxy connected for shareable content extractor: %@. Servicing pending extraction requests: %tu", (uint8_t *)&v6, 0x16u);
  }
  [(SWShareableContentExtractor *)self _processPendingContentExtractionRequests];
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = SWShareableContentLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_INFO, "Service proxy disconnected for shareable content extractor: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setServiceProxy:(id)a3
{
}

- (NSMutableArray)pendingContentExtractionRequests
{
  return self->_pendingContentExtractionRequests;
}

- (void)setPendingContentExtractionRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingContentExtractionRequests, 0);

  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end