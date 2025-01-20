@interface IKJSInspectorPageAgent
- (IKJSInspectorController)controller;
- (IKJSInspectorPageAgent)initWithInspectorController:(id)a3;
- (NSString)currentFrameIdentifier;
- (RWIProtocolPageFrameResourceTree)resourceTree;
- (void)_dispatchEventWithBlock:(id)a3;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)documentDidChange;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6;
- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)reloadWithErrorCallback:(id)a3 successCallback:(id)a4 ignoreCache:(BOOL *)a5 revalidateAllResources:(BOOL *)a6;
- (void)setCurrentFrameIdentifier:(id)a3;
@end

@implementation IKJSInspectorPageAgent

- (IKJSInspectorPageAgent)initWithInspectorController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKJSInspectorPageAgent;
  v5 = [(IKJSInspectorPageAgent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

- (RWIProtocolPageFrameResourceTree)resourceTree
{
  v19[1] = *MEMORY[0x1E4F143B8];
  resourceTree = self->_resourceTree;
  if (!resourceTree)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB6CF8], "ik_globalFrame");
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
    objc_msgSend(v4, "ik_resourceTreeWithResources:", MEMORY[0x1E4F1CBF0]);
    v6 = (RWIProtocolPageFrameResourceTree *)objc_claimAutoreleasedReturnValue();
    v7 = self->_resourceTree;
    self->_resourceTree = v6;

    objc_super v8 = (void *)MEMORY[0x1E4FB6CF8];
    v9 = [(IKJSInspectorPageAgent *)self controller];
    v10 = [v9 activeDocument];
    v11 = objc_msgSend(v8, "ik_pageFrameFromDOMDocument:", v10);

    v12 = [(RWIProtocolPageFrameResourceTree *)self->_resourceTree frame];
    v13 = [v12 identifier];
    [v11 setParentId:v13];

    v14 = [v11 identifier];
    [(IKJSInspectorPageAgent *)self setCurrentFrameIdentifier:v14];

    v15 = objc_msgSend(v11, "ik_resourceTreeWithResources:", v5);
    v16 = self->_resourceTree;
    v19[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(RWIProtocolPageFrameResourceTree *)v16 setChildFrames:v17];

    resourceTree = self->_resourceTree;
  }
  return resourceTree;
}

- (void)_dispatchEventWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(IKJSInspectorPageAgent *)self controller];
  v6 = [v5 inspector];
  v7 = [v6 configuration];
  objc_super v8 = [v7 pageEventDispatcher];

  v9 = [(IKJSInspectorPageAgent *)self controller];
  v10 = [v9 appContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__IKJSInspectorPageAgent__dispatchEventWithBlock___block_invoke;
  v13[3] = &unk_1E6DE6CF0;
  objc_copyWeak(&v16, &location);
  id v11 = v4;
  id v15 = v11;
  id v12 = v8;
  id v14 = v12;
  [v10 evaluate:v13 completionBlock:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __50__IKJSInspectorPageAgent__dispatchEventWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = v5;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)documentDidChange
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(IKJSInspectorPageAgent *)self currentFrameIdentifier];

  if (v3)
  {
    id v4 = [(IKJSInspectorPageAgent *)self controller];
    id v5 = [v4 activeDocument];

    v6 = [v5 _requestLoader];
    v7 = objc_msgSend(MEMORY[0x1E4FB6CF8], "ik_pageFrameFromDOMDocument:", v5);
    objc_super v8 = [(IKJSInspectorPageAgent *)self resourceTree];
    v9 = [v8 frame];
    v10 = [v9 identifier];
    [v7 setParentId:v10];

    id v11 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = [v7 url];
    v13 = [v11 URLWithString:v12];

    [(IKJSInspectorPageAgent *)self setCurrentFrameIdentifier:@"Page"];
    id v14 = [(IKJSInspectorPageAgent *)self controller];
    id v15 = [v14 inspector];
    id v16 = [v15 configuration];
    v17 = [v16 pageEventDispatcher];

    v18 = [(IKJSInspectorPageAgent *)self currentFrameIdentifier];
    objc_msgSend(v17, "safe_frameStartedLoadingWithFrameId:", v18);

    objc_msgSend(v17, "safe_frameNavigatedWithFrame:", v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [v6 _recordForResource:2 withInitiator:1 synchronousOperation:1];
      v27 = [MEMORY[0x1E4F290D0] requestWithURL:v13];
      id v19 = objc_alloc(MEMORY[0x1E4F28D20]);
      v34 = @"Content-Type";
      v35[0] = @"text/xml";
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      v26 = (void *)[v19 initWithURL:v13 statusCode:200 HTTPVersion:@"1.0" headerFields:v20];

      id v33 = 0;
      v21 = [v5 toStringWithError:&v33];
      id v22 = v33;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __43__IKJSInspectorPageAgent_documentDidChange__block_invoke;
      v29[3] = &unk_1E6DE6D18;
      id v30 = v21;
      v31 = @"text/xml";
      id v32 = v22;
      id v23 = v22;
      id v24 = v21;
      [v28 didCompleteLoadingFromMemoryWithRequest:v27 response:v26 withResponseBodyBlock:v29];
    }
    v25 = [(IKJSInspectorPageAgent *)self currentFrameIdentifier];
    objc_msgSend(v17, "safe_frameStoppedLoadingWithFrameId:", v25);
  }
}

void __43__IKJSInspectorPageAgent_documentDidChange__block_invoke(void *a1, void (**a2)(void, void, void, void))
{
  id v4 = (void *)a1[4];
  id v5 = a2;
  id v6 = [v4 dataUsingEncoding:4];
  ((void (**)(void, id, void, void))a2)[2](v5, v6, a1[5], a1[6]);
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)reloadWithErrorCallback:(id)a3 successCallback:(id)a4 ignoreCache:(BOOL *)a5 revalidateAllResources:(BOOL *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (a5) {
    LODWORD(a5) = *a5;
  }
  id v11 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[IKJSInspectorPageAgent reloadWithErrorCallback:successCallback:ignoreCache:revalidateAllResources:]((int)a5, v11);
  }

  id v12 = [(IKJSInspectorPageAgent *)self controller];
  v13 = [v12 appContext];
  objc_initWeak(&location, v13);

  id v14 = [(IKJSInspectorPageAgent *)self controller];
  id v15 = [v14 appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__IKJSInspectorPageAgent_reloadWithErrorCallback_successCallback_ignoreCache_revalidateAllResources___block_invoke;
  v18[3] = &unk_1E6DE6D40;
  objc_copyWeak(&v21, &location);
  id v16 = v10;
  id v19 = v16;
  id v17 = v9;
  id v20 = v17;
  [v15 evaluate:v18 completionBlock:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __101__IKJSInspectorPageAgent_reloadWithErrorCallback_successCallback_ignoreCache_revalidateAllResources___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [v6 objectForKeyedSubscript:@"App"];
    id v5 = [v4 toObjectOfClass:objc_opt_class()];

    if (v5) {
      [v5 reload:&unk_1F3E3E0C8 :0];
    }
    else {
      [WeakRetained reload];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4FB6CF8];
  id v6 = (void (**)(id, void *))a4;
  v7 = [(IKJSInspectorPageAgent *)self controller];
  objc_super v8 = [v7 activeDocument];
  id v9 = objc_msgSend(v5, "ik_pageFrameFromDOMDocument:", v8);

  id v10 = [(IKJSInspectorPageAgent *)self resourceTree];
  id v11 = [v10 frame];
  id v12 = [v11 identifier];
  [v9 setParentId:v12];

  v13 = [v9 identifier];
  [(IKJSInspectorPageAgent *)self setCurrentFrameIdentifier:v13];

  id v14 = objc_msgSend(v9, "ik_resourceTreeWithResources:", MEMORY[0x1E4F1CBF0]);
  id v15 = [(IKJSInspectorPageAgent *)self resourceTree];
  v18[0] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v15 setChildFrames:v16];

  id v17 = [(IKJSInspectorPageAgent *)self resourceTree];
  v6[2](v6, v17);
}

- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
  id v10 = (void (**)(id, void *))a3;
  id v11 = (void (**)(id, void *, void))a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(IKJSInspectorPageAgent *)self resourceTree];
  id v15 = [v14 frame];
  id v16 = [v15 identifier];
  char v17 = [v13 isEqualToString:v16];

  if (v17)
  {
    v18 = [(IKJSInspectorPageAgent *)self resourceTree];
    id v19 = [v18 frame];
    [v19 url];
    id v20 = v11;
    id v22 = v21 = v10;
    int v29 = [v12 isEqualToString:v22];

    id v10 = v21;
    id v11 = v20;

    if (v29)
    {
      v20[2](v20, &stru_1F3E09950, 0);
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v23 = [(IKJSInspectorPageAgent *)self controller];
  id v24 = [v23 activeDocument];

  id v30 = 0;
  v25 = [v24 toStringWithError:&v30];
  id v26 = v30;
  v27 = v26;
  if (v25)
  {
    v11[2](v11, v25, 0);
  }
  else
  {
    v28 = [v26 localizedDescription];
    v10[2](v10, v28);
  }
LABEL_9:
}

- (IKJSInspectorController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKJSInspectorController *)WeakRetained;
}

- (NSString)currentFrameIdentifier
{
  return self->_currentFrameIdentifier;
}

- (void)setCurrentFrameIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrameIdentifier, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_resourceTree, 0);
}

- (void)reloadWithErrorCallback:(int)a1 successCallback:(NSObject *)a2 ignoreCache:revalidateAllResources:.cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = @"held";
  if (!a1) {
    v2 = @"not held";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Reload requested with shift %@ down", (uint8_t *)&v3, 0xCu);
}

@end