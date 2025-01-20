@interface IKAppDocument
- (BOOL)_isUpdateAllowed;
- (BOOL)evaluateStyleMediaQueryList:(id)a3;
- (BOOL)isImplicitlyUpdated;
- (BOOL)isSubtreeUpdated;
- (BOOL)isUpdated;
- (BOOL)markImplicitlyUpdated;
- (IKAppContext)appContext;
- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5;
- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5 extraInfo:(id)a6;
- (IKAppDocumentDelegate)delegate;
- (IKDOMDocument)jsDocument;
- (IKHeadElement)headElement;
- (IKJSNavigationDocument)navigationDocument;
- (IKJSObject)owner;
- (IKNetworkRequestLoader)requestLoader;
- (IKViewElement)navigationBarElement;
- (IKViewElement)templateElement;
- (IKViewElement)toolbarElement;
- (IKViewElementStyleFactory)styleFactory;
- (NSDictionary)cachedSnapshotImpressionsMap;
- (NSError)error;
- (NSMutableDictionary)impressions;
- (NSString)debugDescription;
- (NSString)identifier;
- (double)impressionThreshold;
- (double)impressionViewablePercentage;
- (id)_viewElementForNodeID:(unint64_t)a3;
- (id)impressionsMatching:(id)a3 reset:(BOOL)a4;
- (id)recordedImpressions;
- (id)recordedImpressions:(BOOL)a3;
- (id)retrieveJSElementForViewElement:(id)a3 jsContext:(id)a4;
- (id)snapshotImpressions;
- (void)_resetImplicitUpdates;
- (void)_setViewElementStylesDirtyForced:(BOOL)a3;
- (void)_updateWithXML:(id)a3;
- (void)dealloc;
- (void)dispatchDocumentCallback:(id)a3 eventType:(unint64_t)a4;
- (void)onActive;
- (void)onAppear;
- (void)onDisappear;
- (void)onImpressionsChange:(id)a3;
- (void)onInactive;
- (void)onLoad;
- (void)onNeedsUpdateWithCompletion:(id)a3;
- (void)onPerformanceMetricsChange:(id)a3;
- (void)onUnload;
- (void)onUpdate;
- (void)onViewAttributesChangeWithArguments:(id)a3 completion:(id)a4;
- (void)popTrackingImplictUpdates;
- (void)pushTrackingImplictUpdates;
- (void)recordImpressionsForViewElements:(id)a3;
- (void)recordedImpressions:(BOOL)a3 completion:(id)a4;
- (void)recordedImpressionsMatching:(id)a3 reset:(BOOL)a4 completion:(id)a5;
- (void)runTestWithName:(id)a3 options:(id)a4;
- (void)scrollToTop;
- (void)setCachedSnapshotImpressionsMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setHeadElement:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressionThreshold:(double)a3;
- (void)setImpressionViewablePercentage:(double)a3;
- (void)setImpressions:(id)a3;
- (void)setNavigationBarElement:(id)a3;
- (void)setNeedsUpdateForDocument:(id)a3;
- (void)setStyleFactory:(id)a3;
- (void)setSubtreeUpdated:(BOOL)a3;
- (void)setTemplateElement:(id)a3;
- (void)setToolbarElement:(id)a3;
- (void)setUpdated:(BOOL)a3;
- (void)setViewElementStylesDirty;
- (void)snapshotImpressionsForViewElements:(id)a3;
- (void)updateForDocument:(id)a3;
@end

@implementation IKAppDocument

- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5
{
  return [(IKAppDocument *)self initWithAppContext:a3 document:a4 owner:a5 extraInfo:MEMORY[0x1E4F1CC08]];
}

- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5 extraInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IKAppDocument;
  v14 = [(IKAppDocument *)&v25 init];
  v15 = v14;
  if (v14)
  {
    v14->_isViewElementRegistryDirty = 1;
    objc_storeWeak((id *)&v14->_appContext, v10);
    objc_storeWeak((id *)&v15->_owner, v12);
    id v16 = objc_storeWeak((id *)&v15->_jsDocument, v11);
    [v11 prepareForPresentationWithExtraInfo:v13];

    id WeakRetained = objc_loadWeakRetained((id *)&v15->_jsDocument);
    [WeakRetained setAppBridge:v15];

    id v18 = objc_loadWeakRetained((id *)&v15->_jsDocument);
    [(IKAppDocument *)v15 _updateWithXML:v18];

    id v19 = objc_loadWeakRetained((id *)&v15->_appContext);
    v20 = [v19 jsContext];
    v21 = [v20 virtualMachine];
    id v22 = objc_loadWeakRetained((id *)&v15->_jsDocument);
    id v23 = objc_loadWeakRetained((id *)&v15->_owner);
    [v21 addManagedReference:v22 withOwner:v23];

    if (+[IKPreference logDocumentXML]) {
      NSLog(&cfstr_CreatedXmlDocu.isa, v11);
    }
  }

  return v15;
}

- (void)dealloc
{
  objc_copyWeak(&to, (id *)&self->_owner);
  objc_copyWeak(&from, (id *)&self->_jsDocument);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__IKAppDocument_dealloc__block_invoke;
  v5[3] = &unk_1E6DE4210;
  objc_copyWeak(&v6, &to);
  objc_copyWeak(&v7, &from);
  [WeakRetained evaluate:v5 completionBlock:0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&to);
  v4.receiver = self;
  v4.super_class = (Class)IKAppDocument;
  [(IKAppDocument *)&v4 dealloc];
}

void __24__IKAppDocument_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = (id *)(a1 + 40);
    id v7 = objc_loadWeakRetained(v6);

    if (v7)
    {
      v8 = [v11 virtualMachine];
      id v9 = objc_loadWeakRetained(v6);
      id v10 = objc_loadWeakRetained(v3);
      [v8 removeManagedReference:v9 withOwner:v10];
    }
  }
}

- (NSString)debugDescription
{
  v2 = [(IKAppDocument *)self templateElement];
  v3 = [v2 debugDescription];

  return (NSString *)v3;
}

- (IKJSNavigationDocument)navigationDocument
{
  v2 = [(IKAppDocument *)self jsDocument];
  v3 = [v2 navigationDocument];

  return (IKJSNavigationDocument *)v3;
}

- (void)dispatchDocumentCallback:(id)a3 eventType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(IKAppDocument *)self appContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__IKAppDocument_dispatchDocumentCallback_eventType___block_invoke;
    v9[3] = &unk_1E6DE4238;
    v9[4] = self;
    id v10 = v6;
    [v7 evaluate:v9 completionBlock:0];
  }
  if (a4)
  {
    v8 = [(IKAppDocument *)self templateElement];
    [v8 dispatchEventOfType:a4 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
}

void __52__IKAppDocument_dispatchDocumentCallback_eventType___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) jsDocument];
  id v2 = (id)[v3 invokeMethod:*(void *)(a1 + 40) withArguments:0];
}

- (void)onLoad
{
  [(IKAppDocument *)self dispatchDocumentCallback:@"onLoad" eventType:7];
  id v4 = [(IKAppDocument *)self appContext];
  id v3 = [v4 webInspectorController];
  [v3 appDocumentDidLoad:self];
}

- (void)onUnload
{
  [(IKAppDocument *)self dispatchDocumentCallback:@"onUnload" eventType:8];
  id v4 = [(IKAppDocument *)self appContext];
  id v3 = [v4 webInspectorController];
  [v3 appDocumentDidUnload:self];
}

- (void)onAppear
{
  [(IKAppDocument *)self dispatchDocumentCallback:@"onAppear" eventType:9];
  id v4 = [(IKAppDocument *)self appContext];
  id v3 = [v4 webInspectorController];
  [v3 appDocumentDidAppear:self];
}

- (void)onDisappear
{
  [(IKAppDocument *)self dispatchDocumentCallback:@"onDisappear" eventType:10];
  id v4 = [(IKAppDocument *)self appContext];
  id v3 = [v4 webInspectorController];
  [v3 appDocumentDidDisappear:self];
}

- (void)onActive
{
}

- (void)onInactive
{
}

- (void)onNeedsUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(IKAppDocument *)self appContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E6DE4288;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 evaluate:v7 completionBlock:0];
}

void __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F30938];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_2;
  v11[3] = &unk_1E6DE4260;
  id v12 = *(id *)(a1 + 40);
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4E65800](v11);
  id v7 = [v4 valueWithObject:v6 inContext:v5];

  id v8 = [*(id *)(a1 + 32) jsDocument];
  v13[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = (id)[v8 invokeMethod:@"onUpdate" withArguments:v9];
}

void __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_3;
  block[3] = &unk_1E6DE4260;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)onUpdate
{
  id v3 = [(IKAppDocument *)self appContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__IKAppDocument_onUpdate__block_invoke;
  v5[3] = &unk_1E6DE4108;
  void v5[4] = self;
  [v3 evaluate:v5 completionBlock:0];

  id v4 = [(IKAppDocument *)self templateElement];
  [v4 dispatchEventOfType:12 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
}

void __25__IKAppDocument_onUpdate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jsDocument];
  id v1 = (id)[v2 invokeMethod:@"onDidUpdate" withArguments:0];
}

- (void)onImpressionsChange:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v11 = @"impressions";
    v12[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v6 = [(IKAppDocument *)self appContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__IKAppDocument_onImpressionsChange___block_invoke;
    v9[3] = &unk_1E6DE4238;
    v9[4] = self;
    id v10 = v5;
    id v7 = v5;
    [v6 evaluate:v9 completionBlock:0];

    id v8 = [(IKAppDocument *)self templateElement];
    [v8 dispatchEvent:@"onImpressionsChange" eventAttribute:0 canBubble:1 isCancelable:0 extraInfo:v7 completionBlock:0];
  }
}

void __37__IKAppDocument_onImpressionsChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) jsDocument];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 invokeMethod:@"onImpressionsChange" withArguments:v3];
}

- (void)onPerformanceMetricsChange:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v10 = @"metrics";
    v11[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v6 = [(IKAppDocument *)self appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__IKAppDocument_onPerformanceMetricsChange___block_invoke;
    v8[3] = &unk_1E6DE4238;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    [v6 evaluate:v8 completionBlock:0];
  }
}

void __44__IKAppDocument_onPerformanceMetricsChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) jsDocument];
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (id)[v2 invokeMethod:@"onPerformanceMetricsChange" withArguments:v3];
}

- (void)onViewAttributesChangeWithArguments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKAppDocument *)self appContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke;
  v11[3] = &unk_1E6DE42B0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 evaluate:v11 completionBlock:0];
}

void __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) jsDocument];
  id v3 = (id)[v2 invokeMethod:@"onViewAttributesChange" withArguments:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke_2;
    block[3] = &unk_1E6DE4260;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recordImpressionsForViewElements:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppDocument *)self impressions];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(IKAppDocument *)self setImpressions:v6];
  }
  v13.tv_sec = 0;
  *(void *)&v13.tv_usec = 0;
  gettimeofday(&v13, 0);
  double v7 = (double)v13.tv_sec + (double)v13.tv_usec * 0.000001;
  [(IKAppDocument *)self impressionThreshold];
  uint64_t v9 = (uint64_t)(v8 * -1000.0 + v7 * 1000.0);
  id v10 = [(IKAppDocument *)self appContext];
  id v11 = [(IKAppDocument *)self impressions];
  id v12 = +[IKJSImpression impressionsMapForViewElements:v4 appContext:v10 timestamp:v9 existingImpressionsMap:v11];

  [(IKAppDocument *)self onImpressionsChange:v12];
}

- (void)snapshotImpressionsForViewElements:(id)a3
{
  v8.tv_sec = 0;
  *(void *)&v8.tv_usec = 0;
  id v4 = a3;
  gettimeofday(&v8, 0);
  uint64_t v5 = (uint64_t)(((double)v8.tv_sec + (double)v8.tv_usec * 0.000001) * 1000.0);
  id v6 = [(IKAppDocument *)self appContext];
  id v7 = +[IKJSImpression impressionsMapForViewElements:v4 appContext:v6 timestamp:v5];

  [(IKAppDocument *)self setCachedSnapshotImpressionsMap:v7];
}

- (void)setViewElementStylesDirty
{
}

- (id)retrieveJSElementForViewElement:(id)a3 jsContext:(id)a4
{
  id v5 = a3;
  id v6 = [(IKAppDocument *)self jsDocument];
  id v7 = NSString;
  timeval v8 = [v5 itmlID];

  uint64_t v9 = [v7 stringWithFormat:@"//*[@itmlID='%@']", v8];

  id v10 = [v6 nodesForXPath:v9 error:0];
  id v11 = [v10 firstObject];

  return v11;
}

- (void)updateForDocument:(id)a3
{
  id v4 = a3;
  -[IKAppDocument _updateWithXML:](self, "_updateWithXML:");
  if (+[IKPreference logDocumentXML]) {
    NSLog(&cfstr_UpdatedXmlDocu.isa, v4);
  }
}

- (void)setNeedsUpdateForDocument:(id)a3
{
  id v4 = [(IKAppDocument *)self appContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __43__IKAppDocument_setNeedsUpdateForDocument___block_invoke;
  v5[3] = &unk_1E6DE42D8;
  void v5[4] = self;
  [v4 evaluateDelegateBlockSync:v5];
}

void __43__IKAppDocument_setNeedsUpdateForDocument___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 documentNeedsUpdate:*(void *)(a1 + 32)];
}

- (id)snapshotImpressions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  id v22 = 0;
  objc_initWeak(&location, self);
  id v3 = [(IKAppDocument *)self appContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36__IKAppDocument_snapshotImpressions__block_invoke;
  v14[3] = &unk_1E6DE4300;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  v14[5] = &v17;
  [v3 evaluateDelegateBlockSync:v14];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = (id)v18[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "linkReferences", (void)v10);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v5);
  }

  id v8 = (id)v18[5];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __36__IKAppDocument_snapshotImpressions__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained cachedSnapshotImpressionsMap];

    if (v4)
    {
      uint64_t v5 = [v3 cachedSnapshotImpressionsMap];
      uint64_t v6 = (void *)[v5 copy];

      [v3 setCachedSnapshotImpressionsMap:0];
    }
    else
    {
      id v7 = [v3 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v8 = [v3 delegate];
        uint64_t v9 = [v8 impressionableViewElementsForDocument:*(void *)(a1 + 32)];
      }
      else
      {
        uint64_t v9 = 0;
      }

      v29.tv_sec = 0;
      *(void *)&v29.tv_usec = 0;
      gettimeofday(&v29, 0);
      uint64_t v10 = (uint64_t)(((double)v29.tv_sec + (double)v29.tv_usec * 0.000001) * 1000.0);
      long long v11 = [v3 appContext];
      uint64_t v6 = +[IKJSImpression impressionsMapForViewElements:v9 appContext:v11 timestamp:v10];
    }
    long long v12 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v13 = objc_msgSend(v6, "objectForKey:", @"data-metrics", 0);
    v14 = [v13 objectEnumerator];
    id v15 = [v14 allObjects];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v21 = [v20 parentImpression];

          if (!v21) {
            [v12 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    uint64_t v22 = [v12 copy];
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- (id)recordedImpressions
{
  return [(IKAppDocument *)self recordedImpressions:1];
}

- (id)recordedImpressions:(BOOL)a3
{
  return [(IKAppDocument *)self impressionsMatching:@"data-metrics" reset:a3];
}

- (id)impressionsMatching:(id)a3 reset:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__4;
  long long v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  id v7 = [(IKAppDocument *)self appContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__IKAppDocument_impressionsMatching_reset___block_invoke;
  v19[3] = &unk_1E6DE4328;
  v19[4] = self;
  id v8 = v6;
  BOOL v22 = a4;
  id v20 = v8;
  v21 = &v23;
  [v7 evaluateDelegateBlockSync:v19];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = (id)v24[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "linkReferences", (void)v15);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v29 count:16];
    }
    while (v10);
  }

  id v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __43__IKAppDocument_impressionsMatching_reset___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [*(id *)(a1 + 32) impressions];
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)[v4 copy];

  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = [*(id *)(a1 + 32) impressions];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v5, "objectEnumerator", 0);
  id v8 = [v7 allObjects];

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
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 parentImpression];

        if (!v14) {
          [v2 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [v2 copy];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (void)recordedImpressions:(BOOL)a3 completion:(id)a4
{
}

- (void)recordedImpressionsMatching:(id)a3 reset:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v10 = [(IKAppDocument *)self appContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke;
  v13[3] = &unk_1E6DE4350;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  BOOL v17 = a4;
  id v12 = v9;
  id v15 = v12;
  [v10 addPostEvaluateBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__4;
    uint64_t v24 = __Block_byref_object_dispose__4;
    id v25 = 0;
    id v6 = [WeakRetained appContext];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke_2;
    v16[3] = &unk_1E6DE4328;
    v16[4] = v5;
    id v7 = *(id *)(a1 + 32);
    char v19 = *(unsigned char *)(a1 + 56);
    id v17 = v7;
    long long v18 = &v20;
    [v6 evaluateDelegateBlockSync:v16];

    if (*(void *)(a1 + 40))
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v8 = (id)v21[5];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "linkReferences", (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v26 count:16];
        }
        while (v9);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    _Block_object_dispose(&v20, 8);
  }
}

void __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [*(id *)(a1 + 32) impressions];
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)[v4 copy];

  if (*(unsigned char *)(a1 + 56))
  {
    id v6 = [*(id *)(a1 + 32) impressions];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v5, "objectEnumerator", 0);
  id v8 = [v7 allObjects];

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
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = [v13 parentImpression];

        if (!v14) {
          [v2 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v15 = [v2 copy];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (void)scrollToTop
{
  id v3 = [(IKAppDocument *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__IKAppDocument_scrollToTop__block_invoke;
  v4[3] = &unk_1E6DE42D8;
  v4[4] = self;
  [v3 evaluateDelegateBlockSync:v4];
}

void __28__IKAppDocument_scrollToTop__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 documentScrollToTop:*(void *)(a1 + 32)];
  }
}

- (void)runTestWithName:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IKAppDocument *)self appContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __41__IKAppDocument_runTestWithName_options___block_invoke;
  v11[3] = &unk_1E6DE4378;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 evaluateDelegateBlockSync:v11];
}

void __41__IKAppDocument_runTestWithName_options___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 document:*(void *)(a1 + 32) runTestWithName:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
  }
}

- (BOOL)_isUpdateAllowed
{
  return !self->_parsingDOM;
}

- (BOOL)evaluateStyleMediaQueryList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IKAppDocument *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (!self->_mediaQueryCache)
    {
      id v6 = [MEMORY[0x1E4F1CA60] dictionary];
      mediaQueryCache = self->_mediaQueryCache;
      self->_mediaQueryCache = v6;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v19 = v4;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v14 = [(NSMutableDictionary *)self->_mediaQueryCache objectForKey:v13];
          if (!v14)
          {
            long long v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "document:evaluateStyleMediaQuery:", self, v13));
            [(NSMutableDictionary *)self->_mediaQueryCache setObject:v14 forKey:v13];
          }
          int v15 = [v13 isNegated];
          char v16 = [v14 BOOLValue];

          if (v15)
          {
            if ((v16 & 1) == 0) {
              goto LABEL_19;
            }
          }
          else if (v16)
          {
LABEL_19:
            BOOL v17 = 1;
            goto LABEL_20;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v17 = 0;
LABEL_20:
      id v4 = v19;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (IKNetworkRequestLoader)requestLoader
{
  id v2 = [(IKAppDocument *)self jsDocument];
  id v3 = [v2 _requestLoader];

  return (IKNetworkRequestLoader *)v3;
}

- (id)_viewElementForNodeID:(unint64_t)a3
{
  if (self->_isViewElementRegistryDirty)
  {
    viewElementRegistry = self->_viewElementRegistry;
    if (!viewElementRegistry)
    {
      id v6 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      id v7 = self->_viewElementRegistry;
      self->_viewElementRegistry = v6;

      viewElementRegistry = self->_viewElementRegistry;
    }
    [(NSMapTable *)viewElementRegistry removeAllObjects];
    id v8 = self->_viewElementRegistry;
    uint64_t v9 = [(IKAppDocument *)self templateElement];
    RegisterViewElements(v8, v9);

    uint64_t v10 = self->_viewElementRegistry;
    uint64_t v11 = [(IKAppDocument *)self headElement];
    RegisterViewElements(v10, v11);

    id v12 = self->_viewElementRegistry;
    id v13 = [(IKAppDocument *)self navigationBarElement];
    RegisterViewElements(v12, v13);

    long long v14 = self->_viewElementRegistry;
    int v15 = [(IKAppDocument *)self toolbarElement];
    RegisterViewElements(v14, v15);

    self->_isViewElementRegistryDirty = 0;
  }
  char v16 = self->_viewElementRegistry;
  BOOL v17 = +[IKDOMNode ITMLIDStringforITMLID:a3];
  long long v18 = [(NSMapTable *)v16 objectForKey:v17];

  return v18;
}

- (void)_updateWithXML:(id)a3
{
  self->_parsingDOM = 1;
  p_appContext = &self->_appContext;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_appContext);
  v58[0] = 0;
  int v7 = [WeakRetained validateDOMDocument:v5 error:v58];
  id v8 = v58[0];

  uint64_t v9 = [v5 documentElement];

  uint64_t v10 = &off_1E2B90000;
  if (v7)
  {
    uint64_t v11 = [v9 getAttribute:@"id"];
    id v12 = objc_alloc_init(IKViewElementFactoryContext);
    id v13 = [(IKAppDocument *)self styleFactory];
    [(IKViewElementFactoryContext *)v12 setStyleFactory:v13];

    long long v14 = [(IKAppDocument *)self headElement];
    [(IKViewElementFactoryContext *)v12 setHeadViewElement:v14];

    int v15 = [(IKAppDocument *)self templateElement];
    [(IKViewElementFactoryContext *)v12 setTemplateViewElement:v15];

    BOOL v16 = +[IKViewElementFactory elementsForDocumentElement:v9 context:v12];
    BOOL v17 = [(IKViewElementFactoryContext *)v12 headViewElement];
    long long v18 = [(IKViewElementFactoryContext *)v12 navigationBarViewElement];
    id v19 = [(IKViewElementFactoryContext *)v12 toolBarViewElement];
    long long v20 = [(IKViewElementFactoryContext *)v12 templateViewElement];
    if (!v16)
    {
      long long v21 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[IKAppDocument _updateWithXML:]((uint64_t)v9, v21);
      }
    }
    self->_isViewElementRegistryDirty = 1;
    uint64_t v22 = [(IKViewElementFactoryContext *)v12 updateType];
    BOOL v23 = v22 == 1;
    if (v22 == 1)
    {
      uint64_t v24 = [(IKAppDocument *)self headElement];

      if (v24)
      {
        uint64_t v25 = [(IKAppDocument *)self headElement];
        [v17 configureUpdatesWithElement:v25];
      }
      if (v20)
      {
        long long v26 = [(IKAppDocument *)self templateElement];
        [v20 configureUpdatesWithElement:v26];
      }
      uint64_t v27 = [(IKAppDocument *)self navigationBarElement];

      if (v27)
      {
        id v28 = [(IKAppDocument *)self navigationBarElement];
        [v18 configureUpdatesWithElement:v28];
      }
      timeval v29 = [(IKAppDocument *)self toolbarElement];

      if (v29)
      {
        uint64_t v30 = [(IKAppDocument *)self toolbarElement];
        [v19 configureUpdatesWithElement:v30];
      }
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __32__IKAppDocument__updateWithXML___block_invoke;
    v49[3] = &unk_1E6DE43A0;
    id v50 = v17;
    v51 = self;
    id v52 = v18;
    id v53 = v19;
    id v54 = v20;
    v55 = v12;
    id v56 = v11;
    BOOL v57 = v23;
    id v31 = v11;
    v32 = v12;
    id v33 = v20;
    id v34 = v19;
    id v35 = v18;
    id v36 = v17;
    v37 = (void *)MEMORY[0x1E4E65800](v49);

    uint64_t v10 = &off_1E2B90000;
    id v8 = v42;
  }
  else
  {
    v38 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[IKAppDocument _updateWithXML:](v8, v38);
    }

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __32__IKAppDocument__updateWithXML___block_invoke_49;
    v47[3] = &unk_1E6DE40B8;
    v47[4] = self;
    id v48 = v8;
    v37 = (void *)MEMORY[0x1E4E65800](v47);
  }
  [v9 clearUpdates];
  dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v10 + 305);
  block[2] = __32__IKAppDocument__updateWithXML___block_invoke_2;
  block[3] = &unk_1E6DE43C8;
  v45 = self;
  id v46 = v37;
  dispatch_semaphore_t v44 = v39;
  v40 = v39;
  id v41 = v37;
  dispatch_async(MEMORY[0x1E4F14428], block);
  dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
  self->_parsingDOM = 0;
}

void __32__IKAppDocument__updateWithXML___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAppDocument:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAppDocument:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) setAppDocument:*(void *)(a1 + 40)];
  [*(id *)(a1 + 64) setAppDocument:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 72) styleFactory];
  [v2 setStyleFactory:v3];

  [*(id *)(a1 + 40) setIdentifier:*(void *)(a1 + 80)];
  id v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 88))
  {
    id v5 = [*(id *)(a1 + 40) headElement];
    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) headElement];
      int v7 = [v6 applyUpdatesWithElement:*(void *)(a1 + 32)];
      [v4 setHeadElement:v7];
    }
    else
    {
      [v4 setHeadElement:*(void *)(a1 + 32)];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setHeadElement:*(void *)(a1 + 32)];
  }
  id v8 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v9 = [*(id *)(a1 + 40) navigationBarElement];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) navigationBarElement];
      uint64_t v11 = [v10 applyUpdatesWithElement:*(void *)(a1 + 48)];
      [v8 setNavigationBarElement:v11];
    }
    else
    {
      [v8 setNavigationBarElement:*(void *)(a1 + 48)];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setNavigationBarElement:*(void *)(a1 + 48)];
  }
  id v12 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 88))
  {
    id v13 = [*(id *)(a1 + 40) toolbarElement];
    if (v13)
    {
      long long v14 = [*(id *)(a1 + 40) toolbarElement];
      int v15 = [v14 applyUpdatesWithElement:*(void *)(a1 + 56)];
      [v12 setToolbarElement:v15];
    }
    else
    {
      [v12 setToolbarElement:*(void *)(a1 + 56)];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setToolbarElement:*(void *)(a1 + 56)];
  }
  BOOL v16 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 88))
  {
    BOOL v17 = [*(id *)(a1 + 40) templateElement];
    if (v17)
    {
      long long v18 = [*(id *)(a1 + 40) templateElement];
      id v19 = [v18 applyUpdatesWithElement:*(void *)(a1 + 64)];
      [v16 setTemplateElement:v19];
    }
    else
    {
      [v16 setTemplateElement:*(void *)(a1 + 64)];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setTemplateElement:*(void *)(a1 + 64)];
  }
  [*(id *)(a1 + 40) _setViewElementStylesDirtyForced:0];
  if (*(unsigned char *)(a1 + 88))
  {
    long long v20 = *(void **)(a1 + 40);
    long long v21 = [v20 headElement];
    if ([v21 updateType])
    {
      [v20 setSubtreeUpdated:1];
    }
    else
    {
      uint64_t v22 = [*(id *)(a1 + 40) navigationBarElement];
      if ([v22 updateType])
      {
        [v20 setSubtreeUpdated:1];
      }
      else
      {
        BOOL v23 = [*(id *)(a1 + 40) toolbarElement];
        if ([v23 updateType])
        {
          [v20 setSubtreeUpdated:1];
        }
        else
        {
          uint64_t v24 = [*(id *)(a1 + 40) templateElement];
          objc_msgSend(v20, "setSubtreeUpdated:", objc_msgSend(v24, "updateType") != 0);
        }
      }
    }
  }
  else if ([*(id *)(a1 + 72) updateType] == 4)
  {
    [*(id *)(a1 + 40) setUpdated:1];
  }
  uint64_t v25 = [*(id *)(a1 + 40) templateElement];
  long long v26 = [v25 attributes];
  id v36 = [v26 objectForKeyedSubscript:@"impressionsViewableThreshold"];

  uint64_t v27 = *(void **)(a1 + 40);
  double v28 = 1.0;
  if ([v36 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v36 doubleValue];
    double v28 = v29 / 1000.0;
  }
  [v27 setImpressionThreshold:v28];
  uint64_t v30 = [*(id *)(a1 + 40) templateElement];
  id v31 = [v30 attributes];
  v32 = [v31 objectForKeyedSubscript:@"impressionsViewablePercentage"];

  id v33 = *(void **)(a1 + 40);
  double v34 = 0.5;
  if ([v32 length] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v32 doubleValue];
    double v34 = v35;
  }
  [v33 setImpressionViewablePercentage:v34];
  [*(id *)(a1 + 40) setError:0];
}

uint64_t __32__IKAppDocument__updateWithXML___block_invoke_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
}

uint64_t __32__IKAppDocument__updateWithXML___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (([*(id *)(a1 + 40) isUpdated] & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 40) isSubtreeUpdated], result))
  {
    id v3 = [*(id *)(a1 + 40) delegate];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 40) delegate];
      [v4 documentDidUpdate:*(void *)(a1 + 40)];
    }
    id v5 = [*(id *)(a1 + 40) headElement];
    [v5 resetProperty:1];

    id v6 = [*(id *)(a1 + 40) navigationBarElement];
    [v6 resetProperty:1];

    int v7 = [*(id *)(a1 + 40) toolbarElement];
    [v7 resetProperty:1];

    id v8 = [*(id *)(a1 + 40) templateElement];
    [v8 resetProperty:1];

    [*(id *)(a1 + 40) setUpdated:0];
    uint64_t v9 = *(void **)(a1 + 40);
    return [v9 setSubtreeUpdated:0];
  }
  return result;
}

- (void)_setViewElementStylesDirtyForced:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3) {
    goto LABEL_10;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mediaQueryCache allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v5)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v11 = [(NSMutableDictionary *)self->_mediaQueryCache objectForKeyedSubscript:v10];
      char v12 = [v11 BOOLValue];

      id v13 = [(IKAppDocument *)self delegate];
      LOBYTE(v10) = [v13 document:self evaluateStyleMediaQuery:v10];

      v7 |= v12 ^ v10;
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v6);

  if (v7)
  {
LABEL_10:
    mediaQueryCache = self->_mediaQueryCache;
    self->_mediaQueryCache = 0;

    int v15 = [(IKAppDocument *)self styleFactory];
    [v15 setViewElementStylesDirty];

    BOOL v16 = [(IKAppDocument *)self toolbarElement];
    [v16 appDocumentDidMarkStylesDirty];

    BOOL v17 = [(IKAppDocument *)self navigationBarElement];
    [v17 appDocumentDidMarkStylesDirty];

    id v4 = [(IKAppDocument *)self templateElement];
    [v4 appDocumentDidMarkStylesDirty];
    goto LABEL_11;
  }
LABEL_12:
  long long v18 = [(IKAppDocument *)self appContext];
  id v19 = [v18 webInspectorController];
  [v19 appDocumentDidUpdate:self];
}

- (void)pushTrackingImplictUpdates
{
}

- (void)popTrackingImplictUpdates
{
  int64_t v2 = self->_implicitUpdatesStack - 1;
  self->_implicitUpdatesStack = v2;
  if (!v2) {
    [(IKAppDocument *)self _resetImplicitUpdates];
  }
}

- (BOOL)markImplicitlyUpdated
{
  if (self->_implicitUpdatesStack >= 1) {
    self->_implicitlyUpdated = 1;
  }
  return [(IKAppDocument *)self isImplicitlyUpdated];
}

- (void)_resetImplicitUpdates
{
  if (![(IKAppDocument *)self isImplicitlyUpdated]) {
    return;
  }
  id v3 = [(IKAppDocument *)self delegate];
  if (![v3 conformsToProtocol:&unk_1F3E698C8]) {
    goto LABEL_5;
  }
  id v4 = [(IKAppDocument *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v3 = [(IKAppDocument *)self delegate];
    [v3 documentDidUpdateImplicitly:self];
LABEL_5:
  }
  self->_implicitlyUpdated = 0;
  id v6 = [(IKAppDocument *)self templateElement];
  [v6 resetImplicitUpdates];
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKDOMDocument)jsDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jsDocument);
  return (IKDOMDocument *)WeakRetained;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (IKHeadElement)headElement
{
  return (IKHeadElement *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHeadElement:(id)a3
{
}

- (IKViewElement)navigationBarElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigationBarElement:(id)a3
{
}

- (IKViewElement)toolbarElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 88, 1);
}

- (void)setToolbarElement:(id)a3
{
}

- (IKViewElement)templateElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTemplateElement:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (IKAppDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IKAppDocumentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

- (BOOL)isSubtreeUpdated
{
  return self->_subtreeUpdated;
}

- (void)setSubtreeUpdated:(BOOL)a3
{
  self->_subtreeUpdated = a3;
}

- (double)impressionThreshold
{
  return self->_impressionThreshold;
}

- (void)setImpressionThreshold:(double)a3
{
  self->_impressionThreshold = a3;
}

- (double)impressionViewablePercentage
{
  return self->_impressionViewablePercentage;
}

- (void)setImpressionViewablePercentage:(double)a3
{
  self->_impressionViewablePercentage = a3;
}

- (NSDictionary)cachedSnapshotImpressionsMap
{
  return self->_cachedSnapshotImpressionsMap;
}

- (void)setCachedSnapshotImpressionsMap:(id)a3
{
}

- (NSMutableDictionary)impressions
{
  return self->_impressions;
}

- (void)setImpressions:(id)a3
{
}

- (IKJSObject)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (IKJSObject *)WeakRetained;
}

- (IKViewElementStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void)setStyleFactory:(id)a3
{
}

- (BOOL)isImplicitlyUpdated
{
  return self->_implicitlyUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImpressionsMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_toolbarElement, 0);
  objc_storeStrong((id *)&self->_navigationBarElement, 0);
  objc_storeStrong((id *)&self->_headElement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_jsDocument);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_viewElementRegistry, 0);
  objc_storeStrong((id *)&self->_mediaQueryCache, 0);
}

- (void)_updateWithXML:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unable to create elements for document %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateWithXML:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 code];
  char v5 = [a1 localizedDescription];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "XML validation error: %ld...%@", (uint8_t *)&v6, 0x16u);
}

@end