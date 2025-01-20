@interface IKJSInspectorController
- (BOOL)cancelHighlightView;
- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7;
- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7;
- (BOOL)isInspectElementModeEnabled;
- (IKAppContext)appContext;
- (IKDOMDocument)activeDocument;
- (IKJSInspectorCSSAgent)cssAgent;
- (IKJSInspectorController)initWithAppContext:(id)a3;
- (IKJSInspectorControllerDelegate)delegate;
- (IKJSInspectorDOMAgent)domAgent;
- (IKJSInspectorNetworkAgent)networkAgent;
- (IKJSInspectorPageAgent)pageAgent;
- (IKJSInspectorStorageAgent)storageAgent;
- (IKNetworkRequestLoader)requestLoader;
- (NSDate)inspectorConnectDate;
- (RWIProtocolInspector)inspector;
- (id)inspectorConnectedToken;
- (id)inspectorDisconnectedToken;
- (id)nodeById:(int64_t)a3;
- (id)nodesByIds:(id)a3;
- (id)registerLoaderWithIdentifier:(id)a3;
- (id)styleFromComposer:(id)a3;
- (void)_updateCurrentActiveDocument;
- (void)appDocumentDidAppear:(id)a3;
- (void)appDocumentDidDisappear:(id)a3;
- (void)appDocumentDidLoad:(id)a3;
- (void)appDocumentDidUnload:(id)a3;
- (void)appDocumentDidUpdate:(id)a3;
- (void)dealloc;
- (void)didAddEventListenerForDOMNode:(id)a3;
- (void)evaluateMediaQuery:(id)a3;
- (void)inspectElementModeChanged:(BOOL)a3;
- (void)inspectNodeWithID:(int64_t)a3;
- (void)resetStylesFromNode:(id)a3;
- (void)setActiveDocument:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterLoaderWithIdentifier:(id)a3;
- (void)updateStylesheets;
- (void)willRemoveEventListenerForDOMNode:(id)a3;
@end

@implementation IKJSInspectorController

- (IKJSInspectorController)initWithAppContext:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)IKJSInspectorController;
  v5 = [(IKJSInspectorController *)&v45 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_appContext, v4);
    v8 = [v4 app];
    v6->_appFlags.respondsToActiveDocument = objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_appContext);
    v10 = [WeakRetained jsContext];
    v11 = [v10 _inspector];

    v12 = [v11 configuration];
    v13 = [[IKJSInspectorDOMAgent alloc] initWithInspectorController:v6];
    [v12 setDOMHandler:v13];

    v14 = [[IKJSInspectorNetworkAgent alloc] initWithInspectorController:v6];
    [v12 setNetworkHandler:v14];

    v15 = [[IKJSInspectorPageAgent alloc] initWithInspectorController:v6];
    [v12 setPageHandler:v15];

    v16 = [[IKJSInspectorCSSAgent alloc] initWithInspectorController:v6];
    [v12 setCSSHandler:v16];

    v17 = [[IKJSInspectorStorageAgent alloc] initWithInspectorController:v6];
    [v12 setDOMStorageHandler:v17];

    v18 = [v12 domHandler];
    objc_storeWeak((id *)&v6->_domAgent, v18);

    v19 = [v12 networkHandler];
    objc_storeWeak((id *)&v6->_networkAgent, v19);

    v20 = [v12 pageHandler];
    objc_storeWeak((id *)&v6->_pageAgent, v20);

    v21 = [v12 cssHandler];
    objc_storeWeak((id *)&v6->_cssAgent, v21);

    v22 = [v12 domStorageHandler];
    objc_storeWeak((id *)&v6->_storageAgent, v22);

    objc_storeStrong((id *)&v6->_inspector, v11);
    v23 = [_IKJSInspectorNetworkLoader alloc];
    id v24 = objc_loadWeakRetained((id *)&v6->_networkAgent);
    v25 = [v12 networkEventDispatcher];
    uint64_t v26 = [(_IKJSInspectorNetworkLoader *)v23 initWithIdentifier:@"Inspector" parentIdentifier:@"Inspector" agent:v24 dispatcher:v25];
    requestLoader = v6->_requestLoader;
    v6->_requestLoader = (IKNetworkRequestLoader *)v26;

    if ([(RWIProtocolInspector *)v6->_inspector connected])
    {
      uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
      inspectorConnectDate = v6->_inspectorConnectDate;
      v6->_inspectorConnectDate = (NSDate *)v28;

      id v30 = objc_loadWeakRetained((id *)&v6->_storageAgent);
      [v30 startListeningForStorageNotifications];

      v31 = ITMLKitGetLogObject(1);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        v40 = v6->_inspectorConnectDate;
        *(_DWORD *)location = 138413058;
        *(void *)&location[4] = v39;
        __int16 v47 = 2048;
        v48 = v6;
        __int16 v49 = 2112;
        id v50 = v4;
        __int16 v51 = 2112;
        v52 = v40;
        _os_log_debug_impl(&dword_1E2ACE000, v31, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> connected on %@", location, 0x2Au);
      }
    }
    objc_initWeak((id *)location, v6);
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke;
    v43[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v44, (id *)location);
    uint64_t v33 = [v32 addObserverForName:*MEMORY[0x1E4FB6D18] object:v11 queue:0 usingBlock:v43];
    id inspectorConnectedToken = v6->_inspectorConnectedToken;
    v6->_id inspectorConnectedToken = (id)v33;

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_13;
    v41[3] = &unk_1E6DE48C0;
    objc_copyWeak(&v42, (id *)location);
    uint64_t v35 = [v32 addObserverForName:*MEMORY[0x1E4FB6D20] object:v11 queue:0 usingBlock:v41];
    id inspectorDisconnectedToken = v6->_inspectorDisconnectedToken;
    v6->_id inspectorDisconnectedToken = (id)v35;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak((id *)location);
  }

  return v6;
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [MEMORY[0x1E4F29090] _setCollectsTimingData:1];
  [MEMORY[0x1E4F29090] _collectTimingDataWithOptions:1];
  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained appContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_2;
  v9[3] = &unk_1E6DE48E8;
  objc_copyWeak(&v11, v5);
  id v8 = v4;
  id v10 = v8;
  [v7 evaluate:v9 completionBlock:0];

  objc_destroyWeak(&v11);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained storageAgent];
    [v6 startListeningForStorageNotifications];

    objc_storeStrong(v5 + 5, *(id *)(a1 + 32));
    if (*((unsigned char *)v5 + 12))
    {
      id v7 = [v5 appContext];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_3;
      v12[3] = &unk_1E6DE42D8;
      v13 = v5;
      [v7 evaluateDelegateBlockSync:v12];
    }
    id v8 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = v5;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_debug_impl(&dword_1E2ACE000, v8, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> connected on %@", buf, 0x2Au);
    }
  }
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appContext];
  id v3 = [v2 app];
  id v5 = [v3 activeDocument];

  id v4 = [v5 jsDocument];
  [*(id *)(a1 + 32) setActiveDocument:v4];
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14;
  v7[3] = &unk_1E6DE3DE0;
  objc_copyWeak(&v8, v4);
  [v6 evaluate:v7 completionBlock:0];

  objc_destroyWeak(&v8);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 7, 0);
    v6 = [v5 networkAgent];
    [v6 clearAllTrackedLoaders];

    id v7 = [v5 storageAgent];
    [v7 stopListeningForStorageNotifications];

    id v8 = [v5 domAgent];
    [v8 hideHighlight];

    v9 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14_cold_1(v5, (uint64_t)v3, v9);
    }
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(IKJSInspectorController *)self inspectorConnectedToken];
  [v3 removeObserver:v4];

  id v5 = [(IKJSInspectorController *)self inspectorDisconnectedToken];
  [v3 removeObserver:v5];

  v6.receiver = self;
  v6.super_class = (Class)IKJSInspectorController;
  [(IKJSInspectorController *)&v6 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToInspectElementModeChanged = objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToHighlightViewForElementWithOneID = objc_opt_respondsToSelector() & 1;

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToHighlightViewForElementWithManyIDs = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToCancelHighlightView = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setActiveDocument:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDocument);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_activeDocument, obj);
    id v6 = [(IKJSInspectorController *)self cssAgent];
    [v6 updateStylesheets];

    id v7 = [(IKJSInspectorController *)self domAgent];
    [v7 documentDidChange];

    id v8 = [(IKJSInspectorController *)self pageAgent];
    [v8 documentDidChange];

    id v5 = obj;
  }
}

- (void)_updateCurrentActiveDocument
{
  if (self->_appFlags.respondsToActiveDocument)
  {
    id v3 = [(IKJSInspectorController *)self appContext];
    id v4 = [v3 app];
    id v5 = [v4 activeDocument];
  }
  else
  {
    id v5 = 0;
  }
  objc_initWeak(&location, self);
  id v6 = [(IKJSInspectorController *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__IKJSInspectorController__updateCurrentActiveDocument__block_invoke;
  v8[3] = &unk_1E6DE48E8;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 evaluate:v8 completionBlock:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__IKJSInspectorController__updateCurrentActiveDocument__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained inspector];
    int v4 = [v3 connected];

    id WeakRetained = v6;
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) jsDocument];
      [v6 setActiveDocument:v5];

      id WeakRetained = v6;
    }
  }
}

- (id)nodeById:(int64_t)a3
{
  int v4 = [(IKJSInspectorController *)self activeDocument];
  id v5 = [v4 documentElement];
  id v6 = objc_msgSend(v5, "ik_nodeWithId:", a3);

  return v6;
}

- (id)nodesByIds:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSInspectorController *)self activeDocument];
  id v6 = [v5 documentElement];
  id v7 = objc_msgSend(v6, "ik_nodesWithIds:", v4);

  return v7;
}

- (id)styleFromComposer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__IKJSInspectorController_styleFromComposer___block_invoke;
  v8[3] = &unk_1E6DE5B10;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(IKJSInspectorController *)self evaluateMediaQuery:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __45__IKJSInspectorController_styleFromComposer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) composedStyleWithMediaQueryEvaluator:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (void)evaluateMediaQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSInspectorController *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__IKJSInspectorController_evaluateMediaQuery___block_invoke;
  v7[3] = &unk_1E6DE5B38;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluateDelegateBlockSync:v7];
}

void __46__IKJSInspectorController_evaluateMediaQuery___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeDocument];
  id v3 = [v2 appBridge];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateStylesheets
{
  id v2 = [(IKJSInspectorController *)self cssAgent];
  [v2 updateStylesheets];
}

- (void)resetStylesFromNode:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSInspectorController *)self cssAgent];
  [v5 resetStylesFromNode:v4];
}

- (void)inspectElementModeChanged:(BOOL)a3
{
  if (self->_delegateFlags.respondsToInspectElementModeChanged)
  {
    BOOL v3 = a3;
    id v4 = [(IKJSInspectorController *)self delegate];
    [v4 inspectElementModeChanged:v3];
  }
}

- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  if (!self->_delegateFlags.respondsToHighlightViewForElementWithOneID) {
    return 0;
  }
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(IKJSInspectorController *)self delegate];
  LOBYTE(a3) = [v16 highlightViewForElementWithID:a3 contentColor:v15 paddingColor:v14 borderColor:v13 marginColor:v12];

  return a3;
}

- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  if (!self->_delegateFlags.respondsToHighlightViewForElementWithManyIDs) {
    return 0;
  }
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(IKJSInspectorController *)self delegate];
  char v18 = [v17 highlightViewsForElementsWithIDs:v16 contentColor:v15 paddingColor:v14 borderColor:v13 marginColor:v12];

  return v18;
}

- (BOOL)cancelHighlightView
{
  if (!self->_delegateFlags.respondsToCancelHighlightView) {
    return 0;
  }
  id v2 = [(IKJSInspectorController *)self delegate];
  char v3 = [v2 cancelHighlightView];

  return v3;
}

- (void)didAddEventListenerForDOMNode:(id)a3
{
  id v7 = a3;
  id v4 = [(IKJSInspectorController *)self inspector];
  int v5 = [v4 connected];

  if (v7 && v5)
  {
    id v6 = [(IKJSInspectorController *)self domAgent];
    objc_msgSend(v6, "didAddEventListenerForNodeID:", objc_msgSend(v7, "ITMLID"));
  }
}

- (void)willRemoveEventListenerForDOMNode:(id)a3
{
  id v7 = a3;
  id v4 = [(IKJSInspectorController *)self inspector];
  int v5 = [v4 connected];

  if (v7 && v5)
  {
    id v6 = [(IKJSInspectorController *)self domAgent];
    objc_msgSend(v6, "willRemoveEventListenerForNodeID:", objc_msgSend(v7, "ITMLID"));
  }
}

- (void)appDocumentDidAppear:(id)a3
{
  id v4 = [(IKJSInspectorController *)self inspector];
  int v5 = [v4 connected];

  if (v5)
  {
    [(IKJSInspectorController *)self _updateCurrentActiveDocument];
  }
}

- (void)appDocumentDidDisappear:(id)a3
{
  id v3 = [(IKJSInspectorController *)self inspector];
  [v3 connected];
}

- (void)appDocumentDidLoad:(id)a3
{
  id v4 = [(IKJSInspectorController *)self inspector];
  int v5 = [v4 connected];

  if (v5)
  {
    [(IKJSInspectorController *)self _updateCurrentActiveDocument];
  }
}

- (void)appDocumentDidUnload:(id)a3
{
  id v4 = [(IKJSInspectorController *)self inspector];
  int v5 = [v4 connected];

  if (v5)
  {
    [(IKJSInspectorController *)self _updateCurrentActiveDocument];
  }
}

- (void)appDocumentDidUpdate:(id)a3
{
  id v4 = a3;
  int v5 = [(IKJSInspectorController *)self inspector];
  if ([v5 connected])
  {
    id v6 = [v4 jsDocument];
    id v7 = [(IKJSInspectorController *)self activeDocument];

    if (v6 == v7)
    {
      objc_initWeak(&location, self);
      id v8 = [(IKJSInspectorController *)self appContext];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __48__IKJSInspectorController_appDocumentDidUpdate___block_invoke;
      v9[3] = &unk_1E6DE48E8;
      objc_copyWeak(&v11, &location);
      id v10 = v4;
      [v8 evaluate:v9 completionBlock:0];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __48__IKJSInspectorController_appDocumentDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [WeakRetained inspector];
    int v4 = [v3 connected];

    id WeakRetained = v9;
    if (v4)
    {
      int v5 = [v9 activeDocument];
      id v6 = [*(id *)(a1 + 32) jsDocument];

      id WeakRetained = v9;
      if (v5 == v6)
      {
        id v7 = [v9 domAgent];
        [v7 documentDidUpdate];

        id v8 = [v9 cssAgent];
        [v8 mediaQueryResultDidChange];

        id WeakRetained = v9;
      }
    }
  }
}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(IKJSInspectorController *)self networkAgent];
  id v6 = [v5 registerLoaderWithIdentifier:v4];

  return v6;
}

- (void)unregisterLoaderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSInspectorController *)self networkAgent];
  [v5 unregisterLoaderWithIdentifier:v4];
}

- (BOOL)isInspectElementModeEnabled
{
  id v2 = [(IKJSInspectorController *)self domAgent];
  char v3 = [v2 isInspectElementModeEnabled];

  return v3;
}

- (void)inspectNodeWithID:(int64_t)a3
{
  id v5 = [(IKJSInspectorController *)self inspector];
  int v6 = [v5 connected];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v7 = [(IKJSInspectorController *)self appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__IKJSInspectorController_inspectNodeWithID___block_invoke;
    v8[3] = &unk_1E6DE5B60;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a3;
    [v7 evaluate:v8 completionBlock:0];

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __45__IKJSInspectorController_inspectNodeWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    char v3 = [WeakRetained domAgent];
    [v3 inspectNodeWithID:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKJSInspectorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKJSInspectorControllerDelegate *)WeakRetained;
}

- (RWIProtocolInspector)inspector
{
  return self->_inspector;
}

- (NSDate)inspectorConnectDate
{
  return self->_inspectorConnectDate;
}

- (IKNetworkRequestLoader)requestLoader
{
  return self->_requestLoader;
}

- (IKDOMDocument)activeDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDocument);
  return (IKDOMDocument *)WeakRetained;
}

- (IKJSInspectorDOMAgent)domAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domAgent);
  return (IKJSInspectorDOMAgent *)WeakRetained;
}

- (IKJSInspectorNetworkAgent)networkAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkAgent);
  return (IKJSInspectorNetworkAgent *)WeakRetained;
}

- (IKJSInspectorPageAgent)pageAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageAgent);
  return (IKJSInspectorPageAgent *)WeakRetained;
}

- (IKJSInspectorCSSAgent)cssAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cssAgent);
  return (IKJSInspectorCSSAgent *)WeakRetained;
}

- (IKJSInspectorStorageAgent)storageAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageAgent);
  return (IKJSInspectorStorageAgent *)WeakRetained;
}

- (id)inspectorConnectedToken
{
  return self->_inspectorConnectedToken;
}

- (id)inspectorDisconnectedToken
{
  return self->_inspectorDisconnectedToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inspectorDisconnectedToken, 0);
  objc_storeStrong(&self->_inspectorConnectedToken, 0);
  objc_destroyWeak((id *)&self->_storageAgent);
  objc_destroyWeak((id *)&self->_cssAgent);
  objc_destroyWeak((id *)&self->_pageAgent);
  objc_destroyWeak((id *)&self->_networkAgent);
  objc_destroyWeak((id *)&self->_domAgent);
  objc_destroyWeak((id *)&self->_activeDocument);
  objc_storeStrong((id *)&self->_requestLoader, 0);
  objc_storeStrong((id *)&self->_inspectorConnectDate, 0);
  objc_storeStrong((id *)&self->_inspector, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [a1 inspectorConnectDate];
  [v8 timeIntervalSinceDate:v9];
  int v11 = 138413058;
  id v12 = v7;
  __int16 v13 = 2048;
  id v14 = a1;
  __int16 v15 = 2112;
  uint64_t v16 = a2;
  __int16 v17 = 2048;
  uint64_t v18 = v10;
  _os_log_debug_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> disconnected. Connected for %fs.", (uint8_t *)&v11, 0x2Au);
}

@end