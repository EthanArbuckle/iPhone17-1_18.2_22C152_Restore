@interface IKJSInspectorDOMAgent
+ (id)_nodeIDsFromNodePaths:(id)a3;
+ (id)_parseAttributeString:(id)a3;
- (BOOL)hideHighlight;
- (BOOL)isInspectElementModeEnabled;
- (IKJSInspectorController)controller;
- (IKJSInspectorDOMAgent)initWithInspectorController:(id)a3;
- (int)_eventListenerIDForListener:(id)a3;
- (void)_fullfillNodePath:(id)a3;
- (void)didAddEventListenerForNodeID:(int)a3;
- (void)discardSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5;
- (void)documentDidChange;
- (void)documentDidUpdate;
- (void)getAccessibilityPropertiesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getAssociatedDataForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getDataBindingsForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getEventListenersForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)getSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5 fromIndex:(int)a6 toIndex:(int)a7;
- (void)getSupportedEventNamesWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)hideHighlightWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)highlightNodeListWithErrorCallback:(id)a3 successCallback:(id)a4 nodeIds:(id)a5 highlightConfig:(id)a6;
- (void)highlightNodeWithErrorCallback:(id)a3 successCallback:(id)a4 highlightConfig:(id)a5 nodeId:(int *)a6 objectId:(id *)a7;
- (void)inspectNodeWithID:(int64_t)a3;
- (void)moveToWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 targetNodeId:(int)a6 insertBeforeNodeId:(int *)a7;
- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6;
- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6 caseSensitive:(BOOL *)a7;
- (void)removeAttributeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6;
- (void)removeNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5;
- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6;
- (void)setAttributeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6 value:(id)a7;
- (void)setAttributesAsTextWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 text:(id)a6 name:(id *)a7;
- (void)setEventListenerDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 eventListenerId:(int)a5 disabled:(BOOL)a6;
- (void)setInspectModeEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5 highlightConfig:(id *)a6;
- (void)setNodeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 value:(id)a6;
- (void)setOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 outerHTML:(id)a6;
- (void)willRemoveEventListenerForNodeID:(int)a3;
@end

@implementation IKJSInspectorDOMAgent

- (IKJSInspectorDOMAgent)initWithInspectorController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKJSInspectorDOMAgent;
  v5 = [(IKJSInspectorDOMAgent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    searches = v5->_searches;
    v5->_searches = (NSMutableDictionary *)v6;

    objc_storeWeak((id *)&v5->_controller, v4);
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    eventListenersMap = v5->_eventListenersMap;
    v5->_eventListenersMap = (NSMapTable *)v8;
  }
  return v5;
}

- (void)documentDidUpdate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:a1];
  int v6 = 134217984;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Updating RWIDocumentTree took %fms", (uint8_t *)&v6, 0xCu);
}

- (void)documentDidChange
{
  self->_eventListenerIdSequence = 0;
  [(NSMapTable *)self->_eventListenersMap removeAllObjects];
  v3 = [(IKJSInspectorDOMAgent *)self controller];
  id v4 = [v3 inspector];
  uint64_t v5 = [v4 configuration];
  id v6 = [v5 domEventDispatcher];

  objc_msgSend(v6, "safe_documentUpdated");
}

- (void)inspectNodeWithID:(int64_t)a3
{
  uint64_t v5 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[IKJSInspectorDOMAgent inspectNodeWithID:](a3, v5);
  }

  id v6 = [(IKJSInspectorDOMAgent *)self controller];
  uint64_t v7 = [v6 nodeById:a3];

  uint64_t v8 = objc_msgSend(v7, "ik_nodePath");
  if (v8)
  {
    [(IKJSInspectorDOMAgent *)self _fullfillNodePath:v8];
    v9 = [(IKJSInspectorDOMAgent *)self controller];
    v10 = [v9 inspector];
    objc_super v11 = [v10 configuration];
    v12 = [v11 domEventDispatcher];

    objc_msgSend(v12, "safe_inspectWithNodeId:", a3);
  }
}

- (void)didAddEventListenerForNodeID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(IKJSInspectorDOMAgent *)self controller];
  uint64_t v5 = [v4 inspector];
  id v6 = [v5 configuration];
  id v7 = [v6 domEventDispatcher];

  objc_msgSend(v7, "safe_didAddEventListenerWithNodeId:", v3);
}

- (void)willRemoveEventListenerForNodeID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(IKJSInspectorDOMAgent *)self controller];
  uint64_t v5 = [v4 inspector];
  id v6 = [v5 configuration];
  id v7 = [v6 domEventDispatcher];

  objc_msgSend(v7, "safe_willRemoveEventListenerWithNodeId:", v3);
}

- (void)getDocumentWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5 = a4;
  id v6 = [(IKJSInspectorDOMAgent *)self controller];
  id v12 = [v6 activeDocument];

  if (v12)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4FB6C80], "ik_nodeFromDOMNode:depth:", v12, 3);
    [v7 setFrameId:@"Page"];
    rootNode = self->_rootNode;
    self->_rootNode = (RWIProtocolDOMNode *)v7;
    id v9 = v7;

    v10 = v9;
    objc_super v11 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4FB6C80], "safe_initWithNodeId:nodeType:nodeName:localName:nodeValue:", 0xFFFFFFFFLL, 0, &stru_1F3E09950, &stru_1F3E09950, &stru_1F3E09950);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_super v11 = v9;
  }
  (*((void (**)(id, id))v5 + 2))(v5, v9);
}

- (void)requestChildNodesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 depth:(int *)a6
{
  uint64_t v7 = *(void *)&a5;
  v22 = (void (**)(id, __CFString *))a3;
  v10 = (void (**)(void))a4;
  objc_super v11 = [(IKJSInspectorDOMAgent *)self controller];
  id v12 = [v11 inspector];
  v13 = [v12 configuration];
  v14 = [v13 domEventDispatcher];

  v15 = [(IKJSInspectorDOMAgent *)self controller];
  v16 = [v15 nodeById:(int)v7];

  if (v16)
  {
    if (a6) {
      uint64_t v17 = *a6;
    }
    else {
      uint64_t v17 = 3;
    }
    v18 = objc_msgSend(MEMORY[0x1E4FB6C80], "ik_nodeFromDOMNode:depth:", v16, v17);
    v19 = [v18 children];
    objc_msgSend(v14, "safe_setChildNodesWithParentId:nodes:", v7, v19);

    v20 = [(RWIProtocolDOMNode *)self->_rootNode ik_nodeWithNodeId:v7];
    v21 = [v18 children];
    [v20 setChildren:v21];

    v10[2](v10);
  }
  else
  {
    v22[2](v22, @"Could not find node.");
  }
}

- (void)setNodeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(IKJSInspectorDOMAgent *)self controller];
  v14 = [v13 inspector];
  v15 = [v14 configuration];
  v16 = [v15 domEventDispatcher];

  uint64_t v17 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  v18 = [v17 appContext];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__IKJSInspectorDOMAgent_setNodeValueWithErrorCallback_successCallback_nodeId_value___block_invoke;
  v24[3] = &unk_1E6DE6EA8;
  objc_copyWeak(&v30, &location);
  id v19 = v17;
  id v25 = v19;
  int v31 = a5;
  id v20 = v12;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  id v22 = v11;
  id v28 = v22;
  id v23 = v10;
  id v29 = v23;
  [v18 _evaluate:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __84__IKJSInspectorDOMAgent_setNodeValueWithErrorCallback_successCallback_nodeId_value___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v2 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 80)];
  if (!WeakRetained || !v2)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
    v8();
    goto LABEL_10;
  }
  if ([v2 nodeType] != 3)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  id v3 = v2;
  id v4 = objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 80));
  [v4 setValue:*(void *)(a1 + 40)];
  [v3 setNodeValue:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "safe_characterDataModifiedWithNodeId:characterData:", *(unsigned int *)(a1 + 80), *(void *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v5 = [v3 parentNode];
  id v6 = [v5 nodeName];
  int v7 = [v6 isEqualToString:@"style"];

  if (v7) {
    [*(id *)(a1 + 32) updateStylesheets];
  }

LABEL_10:
}

- (void)removeNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IKJSInspectorDOMAgent *)self controller];
  id v11 = [v10 inspector];
  id v12 = [v11 configuration];
  v13 = [v12 domEventDispatcher];

  v14 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  v15 = [v14 appContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__IKJSInspectorDOMAgent_removeNodeWithErrorCallback_successCallback_nodeId___block_invoke;
  v20[3] = &unk_1E6DE6ED0;
  objc_copyWeak(&v25, &location);
  id v16 = v14;
  id v21 = v16;
  int v26 = a5;
  id v17 = v13;
  id v22 = v17;
  id v18 = v9;
  id v23 = v18;
  id v19 = v8;
  id v24 = v19;
  [v15 _evaluate:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __76__IKJSInspectorDOMAgent_removeNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v2 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 72)];
  if (WeakRetained && v2)
  {
    id v3 = [v2 parentNode];
    id v4 = v3;
    if (v3)
    {
      id v5 = objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", objc_msgSend(v3, "ITMLID"));
      objc_msgSend(v5, "ik_removeChildWithId:", *(unsigned int *)(a1 + 72));
      id v6 = (id)[v4 removeChild:v2];
      objc_msgSend(*(id *)(a1 + 40), "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v4, "ITMLID"), *(unsigned int *)(a1 + 72));
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setAttributeValueWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6 value:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  id v17 = [v16 appContext];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__IKJSInspectorDOMAgent_setAttributeValueWithErrorCallback_successCallback_nodeId_name_value___block_invoke;
  v23[3] = &unk_1E6DE6EA8;
  objc_copyWeak(&v29, &location);
  id v18 = v16;
  id v24 = v18;
  int v30 = a5;
  id v19 = v15;
  id v25 = v19;
  id v20 = v14;
  id v26 = v20;
  id v21 = v13;
  id v27 = v21;
  id v22 = v12;
  id v28 = v22;
  [v17 _evaluate:v23];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __94__IKJSInspectorDOMAgent_setAttributeValueWithErrorCallback_successCallback_nodeId_name_value___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v2 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 80)];
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v2 setAttribute:*(void *)(a1 + 40) :*(void *)(a1 + 48)];
    id v3 = objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 80));
    objc_msgSend(v3, "ik_setAttributeValue:name:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)setAttributesAsTextWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 text:(id)a6 name:(id *)a7
{
  id v26 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [(id)objc_opt_class() _parseAttributeString:v13];
  id v15 = [(IKJSInspectorDOMAgent *)self controller];
  id v16 = [v15 inspector];
  id v17 = [v16 configuration];
  id v18 = [v17 domEventDispatcher];

  id v19 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  id v20 = [v19 appContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke;
  v27[3] = &unk_1E6DE6F20;
  objc_copyWeak(v34, &location);
  id v21 = v19;
  int v35 = a5;
  id v28 = v21;
  v34[1] = a7;
  id v22 = v18;
  id v29 = v22;
  id v23 = v14;
  id v30 = v23;
  int v31 = self;
  id v24 = v12;
  id v32 = v24;
  id v25 = v26;
  id v33 = v25;
  [v20 _evaluate:v27];

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 96)];
  id v4 = v3;
  if (!WeakRetained || !v3)
  {
    id v32 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_28:
    v32();
    goto LABEL_29;
  }
  if ([v3 nodeType] != 1)
  {
    id v32 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_28;
  }
  id v33 = v4;
  id v37 = v4;
  v36 = objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 96));
  int v35 = [MEMORY[0x1E4F1CA48] array];
  if (*(void *)(a1 + 88))
  {
    id v5 = +[IKDOMElement _filteredAttributes];
    char v6 = [v5 containsObject:**(void **)(a1 + 88)];

    if ((v6 & 1) == 0)
    {
      int v7 = **(void ***)(a1 + 88);
      id v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v9 = [v7 stringByTrimmingCharactersInSet:v8];

      if (([v9 isEqualToString:&stru_1F3E09950] & 1) == 0)
      {
        objc_msgSend(v36, "ik_removeAttributeNamed:", **(void **)(a1 + 88));
        [v37 removeAttribute:**(void **)(a1 + 88)];
        objc_msgSend(*(id *)(a1 + 40), "safe_attributeRemovedWithNodeId:name:", *(unsigned int *)(a1 + 96), **(void **)(a1 + 88));
      }
    }
  }
  v34 = WeakRetained;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = [*(id *)(a1 + 48) allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        id v16 = +[IKDOMElement _filteredAttributes];
        char v17 = [v16 containsObject:v15];

        if ((v17 & 1) == 0)
        {
          id v18 = [*(id *)(a1 + 48) objectForKey:v15];
          objc_msgSend(v36, "ik_setAttributeValue:name:", v18, v15);

          id v19 = [*(id *)(a1 + 48) objectForKey:v15];
          [v37 setAttribute:v15 :v19];

          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke_2;
          v42[3] = &unk_1E6DE6EF8;
          id v20 = *(id *)(a1 + 40);
          int v46 = *(_DWORD *)(a1 + 96);
          id v43 = v20;
          uint64_t v44 = v15;
          id v45 = *(id *)(a1 + 48);
          id v21 = (void *)MEMORY[0x1E4E65800](v42);
          [v35 addObject:v21];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v12);
  }

  id v22 = [*(id *)(a1 + 56) controller];
  [v22 resetStylesFromNode:v37];

  id v23 = *(void **)(a1 + 40);
  id v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  v52 = v24;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  objc_msgSend(v23, "safe_inlineStyleInvalidatedWithNodeIds:", v25);

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v26 = v35;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        int v31 = (void (**)(void))MEMORY[0x1E4E65800](*(void *)(*((void *)&v38 + 1) + 8 * j));
        v31[2]();
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v28);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  id v4 = v33;
  WeakRetained = v34;
LABEL_29:
}

void __95__IKJSInspectorDOMAgent_setAttributesAsTextWithErrorCallback_successCallback_nodeId_text_name___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 56);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) objectForKey:v3];
  objc_msgSend(v2, "safe_attributeModifiedWithNodeId:name:value:", v1, v3, v4);
}

- (void)removeAttributeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  id v14 = [v13 appContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__IKJSInspectorDOMAgent_removeAttributeWithErrorCallback_successCallback_nodeId_name___block_invoke;
  v19[3] = &unk_1E6DE6ED0;
  objc_copyWeak(&v24, &location);
  id v15 = v13;
  id v20 = v15;
  int v25 = a5;
  id v16 = v12;
  id v21 = v16;
  id v17 = v11;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  [v14 _evaluate:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __86__IKJSInspectorDOMAgent_removeAttributeWithErrorCallback_successCallback_nodeId_name___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v2 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 72)];
  if (WeakRetained && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v2 removeAttribute:*(void *)(a1 + 40)];
    uint64_t v3 = objc_msgSend(WeakRetained[2], "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 72));
    objc_msgSend(v3, "ik_removeAttributeNamed:", *(void *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (int)_eventListenerIDForListener:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = self->_eventListenerIdSequence + 1;
  self->_eventListenerIdSequence = v5;
  char v6 = [(NSMapTable *)self->_eventListenersMap dictionaryRepresentation];
  int v7 = [v6 allKeysForObject:v4];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [v8 lastObject];

  if (v9)
  {
    id v10 = [v8 lastObject];
    int v5 = [v10 intValue];

    id v11 = [v8 lastObject];
    [v8 removeObject:v11];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[NSMapTable removeObjectForKey:](self->_eventListenersMap, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  return v5;
}

- (void)getEventListenersForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IKJSInspectorDOMAgent *)self controller];
  objc_initWeak(&location, self);
  id v11 = [v10 appContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke;
  v14[3] = &unk_1E6DE6F70;
  id v12 = v10;
  id v15 = v12;
  int v19 = a5;
  objc_copyWeak(&v18, &location);
  id v16 = self;
  id v13 = v9;
  id v17 = v13;
  [v11 _evaluate:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 64)];
  int v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2;
  uint64_t v14 = &unk_1E6DE6F48;
  objc_copyWeak(&v17, (id *)(a1 + 56));
  uint64_t v15 = *(void *)(a1 + 40);
  int v18 = *(_DWORD *)(a1 + 64);
  id v6 = v5;
  id v16 = v6;
  int v7 = (void *)MEMORY[0x1E4E65800](&v11);
  objc_msgSend(v4, "enumerateEventListenersUsingBlock:", v7, v11, v12, v13, v14, v15);
  id v8 = [v4 ownerDocument];
  id v9 = [v8 documentElement];

  if (v9 == v4)
  {
    id v10 = [v4 parentNode];
    [v10 enumerateEventListenersUsingBlock:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  objc_destroyWeak(&v17);
}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _eventListenerIDForListener:v7];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB6C78], "safe_initWithEventListenerId:type:useCapture:isAttribute:", v10, v8, a4, 0);
    [v11 setNodeId:*(unsigned int *)(a1 + 56)];
    if (v11)
    {
      uint64_t v12 = ITMLKitGetLogObject(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2_cold_1(v7);
      }

      id v13 = (void *)WeakRetained[3];
      uint64_t v14 = [NSNumber numberWithInt:v10];
      [v13 setObject:v7 forKey:v14];

      objc_msgSend(v11, "setDisabled:", objc_msgSend(v7, "isEnabled") ^ 1);
      [*(id *)(a1 + 40) addObject:v11];
    }
  }
}

- (void)setEventListenerDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 eventListenerId:(int)a5 disabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  eventListenersMap = self->_eventListenersMap;
  id v9 = NSNumber;
  uint64_t v10 = (void (**)(void))a4;
  uint64_t v11 = [v9 numberWithInt:v7];
  uint64_t v12 = [(NSMapTable *)eventListenersMap objectForKey:v11];

  [v12 setEnabled:!v6];
  id v13 = ITMLKitGetLogObject(1);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[IKJSInspectorDOMAgent setEventListenerDisabledWithErrorCallback:successCallback:eventListenerId:disabled:](v12);
  }

  v10[2](v10);
}

- (void)getAccessibilityPropertiesForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(IKJSInspectorDOMAgent *)self controller];
  id v11 = [v8 nodeById:(int)v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v11 getAttribute:@"accessibilityText"];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB6C68], "safe_initWithExists:label:nodeId:role:", objc_msgSend(v9, "length") != 0, v9, v5, &stru_1F3E09950);
    v7[2](v7, v10);

    uint64_t v7 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4FB6C68], "safe_initWithExists:label:nodeId:role:", 0, &stru_1F3E09950, v5, &stru_1F3E09950);
    v7[2](v7, (uint64_t)v9);
  }
}

- (void)getOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(IKJSInspectorDOMAgent *)self controller];
  id v11 = [v10 appContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__IKJSInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke;
  v15[3] = &unk_1E6DE6F98;
  int v19 = a5;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  [v11 _evaluate:v15];
}

void __78__IKJSInspectorDOMAgent_getOuterHTMLWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 56)];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v3 = *(void *)(a1 + 40);
    if (isKindOfClass) {
      [v5 outerHTML];
    }
    else {
    id v4 = [v5 nodeValue];
    }
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)setOuterHTMLWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 outerHTML:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(IKJSInspectorDOMAgent *)self controller];
  id v14 = [v13 appContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__IKJSInspectorDOMAgent_setOuterHTMLWithErrorCallback_successCallback_nodeId_outerHTML___block_invoke;
  v19[3] = &unk_1E6DE6FC0;
  int v24 = a5;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  id v18 = v13;
  [v14 _evaluate:v19];
}

void __88__IKJSInspectorDOMAgent_setOuterHTMLWithErrorCallback_successCallback_nodeId_outerHTML___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 64)];
  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v3 = *(void *)(a1 + 40);
    if (isKindOfClass) {
      [v4 setOuterHTML:v3];
    }
    else {
      [v4 setNodeValue:v3];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6
{
}

- (void)performSearchWithErrorCallback:(id)a3 successCallback:(id)a4 query:(id)a5 nodeIds:(id *)a6 caseSensitive:(BOOL *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = (void (**)(id, void *, void))a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F29128] UUID];
  id v14 = [v13 UUIDString];

  id v15 = [(IKJSInspectorDOMAgent *)self controller];
  id v16 = [v15 activeDocument];

  if (a7)
  {
    if (*a7) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }
  id v18 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  int v19 = objc_msgSend(v16, "ik_pathsForSearchQuery:compareOptions:currentPath:", v12, v17, v18);
  id v20 = [v19 array];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        -[IKJSInspectorDOMAgent _fullfillNodePath:](self, "_fullfillNodePath:", *(void *)(*((void *)&v27 + 1) + 8 * v25++), (void)v27);
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v23);
  }

  if (v21)
  {
    [(NSMutableDictionary *)self->_searches setObject:v21 forKey:v14];
    uint64_t v26 = [v21 count] - 1;
    if (a6)
    {
      *a6 = [(id)objc_opt_class() _nodeIDsFromNodePaths:v21];
    }
  }
  else
  {
    uint64_t v26 = 0;
  }
  v11[2](v11, v14, v26);
}

- (void)getSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5 fromIndex:(int)a6 toIndex:(int)a7
{
  int v19 = (void (**)(id, __CFString *))a3;
  id v12 = (void (**)(id, void *))a4;
  id v13 = [(NSMutableDictionary *)self->_searches objectForKey:a5];
  id v14 = v13;
  if (!v13
    || (unint64_t v15 = [v13 count], a7 < 0)
    || (v15 > a7 ? (BOOL v16 = a7 < a6) : (BOOL v16 = 1), v16 || a6 < 0 || v15 <= a6))
  {
    v19[2](v19, @"Boom");
  }
  else
  {
    uint64_t v17 = objc_msgSend(v14, "subarrayWithRange:");
    id v18 = [(id)objc_opt_class() _nodeIDsFromNodePaths:v17];
    v12[2](v12, v18);
  }
}

- (void)discardSearchResultsWithErrorCallback:(id)a3 successCallback:(id)a4 searchId:(id)a5
{
  id v11 = (void (**)(id, __CFString *))a3;
  id v8 = (void (**)(void))a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_searches objectForKey:v9];
  if (v10)
  {
    [(NSMutableDictionary *)self->_searches removeObjectForKey:v9];
    v8[2](v8);
  }
  else
  {
    v11[2](v11, @"Not found");
  }
}

- (void)setInspectModeEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5 highlightConfig:(id *)a6
{
  BOOL v6 = a5;
  self->_inspectElementModeEnabled = a5;
  id v9 = (void (**)(void))a4;
  id v8 = [(IKJSInspectorDOMAgent *)self controller];
  [v8 inspectElementModeChanged:v6];

  v9[2]();
}

- (void)highlightNodeWithErrorCallback:(id)a3 successCallback:(id)a4 highlightConfig:(id)a5 nodeId:(int *)a6 objectId:(id *)a7
{
  long long v27 = (void (**)(id, __CFString *))a3;
  id v11 = (void (**)(void))a4;
  id v12 = a5;
  if (!a6) {
    goto LABEL_5;
  }
  id v13 = [(IKJSInspectorDOMAgent *)self controller];
  id v14 = [v13 nodeById:*a6];

  if (!v14) {
    goto LABEL_5;
  }
  unint64_t v15 = [(IKJSInspectorDOMAgent *)self controller];
  uint64_t v23 = [v14 ITMLID];
  uint64_t v26 = [v12 contentColor];
  BOOL v16 = objc_msgSend(v26, "ik_color");
  uint64_t v25 = [v12 paddingColor];
  uint64_t v17 = objc_msgSend(v25, "ik_color");
  id v18 = [v12 borderColor];
  int v19 = objc_msgSend(v18, "ik_color");
  id v20 = [v12 marginColor];
  objc_msgSend(v20, "ik_color");
  id v21 = v24 = v14;
  LODWORD(v23) = [v15 highlightViewForElementWithID:v23 contentColor:v16 paddingColor:v17 borderColor:v19 marginColor:v21];

  if (v23)
  {
    v11[2](v11);
  }
  else
  {
LABEL_5:
    uint64_t v22 = [(IKJSInspectorDOMAgent *)self controller];
    [v22 cancelHighlightView];

    v27[2](v27, @"unsupported");
  }
}

- (void)highlightNodeListWithErrorCallback:(id)a3 successCallback:(id)a4 nodeIds:(id)a5 highlightConfig:(id)a6
{
  long long v29 = (void (**)(id, __CFString *))a3;
  id v28 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = [(IKJSInspectorDOMAgent *)self controller];
  id v13 = [v12 nodesByIds:v11];

  uint64_t v25 = self;
  uint64_t v26 = [(IKJSInspectorDOMAgent *)self controller];
  long long v27 = v13;
  id v14 = [v13 valueForKey:@"ITMLID"];
  unint64_t v15 = [v10 contentColor];
  BOOL v16 = objc_msgSend(v15, "ik_color");
  uint64_t v17 = [v10 paddingColor];
  id v18 = objc_msgSend(v17, "ik_color");
  int v19 = [v10 borderColor];
  id v20 = objc_msgSend(v19, "ik_color");
  id v21 = [v10 marginColor];

  uint64_t v22 = objc_msgSend(v21, "ik_color");
  LODWORD(v11) = [v26 highlightViewsForElementsWithIDs:v14 contentColor:v16 paddingColor:v18 borderColor:v20 marginColor:v22];

  if (v11)
  {
    uint64_t v23 = v28;
    (*((void (**)(id))v28 + 2))(v28);
  }
  else
  {
    uint64_t v24 = [(IKJSInspectorDOMAgent *)v25 controller];
    [v24 cancelHighlightView];

    v29[2](v29, @"unsupported");
    uint64_t v23 = v28;
  }
}

- (BOOL)hideHighlight
{
  v2 = [(IKJSInspectorDOMAgent *)self controller];
  char v3 = [v2 cancelHighlightView];

  return v3;
}

- (void)hideHighlightWithErrorCallback:(id)a3 successCallback:(id)a4
{
  uint64_t v7 = (void (**)(id, __CFString *))a3;
  BOOL v6 = (void (**)(void))a4;
  if ([(IKJSInspectorDOMAgent *)self hideHighlight]) {
    v6[2](v6);
  }
  else {
    v7[2](v7, @"unsupported");
  }
}

- (void)getAttributesWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v8 = (void (**)(id, __CFString *))a3;
  id v9 = (void (**)(id, id))a4;
  id v10 = [(IKJSInspectorDOMAgent *)self controller];
  id v11 = [v10 nodeById:a5];

  if (v11 && [v11 nodeType] == 1)
  {
    id v12 = [v11 _attributes];
    id v13 = [MEMORY[0x1E4F1CA48] array];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__IKJSInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke;
    v15[3] = &unk_1E6DE58D0;
    id v16 = v13;
    id v14 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];
    v9[2](v9, v14);
  }
  else
  {
    v8[2](v8, @"Invalid Node.");
  }
}

void __79__IKJSInspectorDOMAgent_getAttributesWithErrorCallback_successCallback_nodeId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  BOOL v6 = +[IKDOMElement _filteredAttributes];
  char v7 = [v6 containsObject:v8];

  if ((v7 & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v8];
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)moveToWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5 targetNodeId:(int)a6 insertBeforeNodeId:(int *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [(IKJSInspectorDOMAgent *)self controller];
  unint64_t v15 = [v14 inspector];
  id v16 = [v15 configuration];
  uint64_t v17 = [v16 domEventDispatcher];

  id v18 = [(IKJSInspectorDOMAgent *)self controller];
  int v19 = self->_rootNode;
  id v20 = [v18 appContext];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __104__IKJSInspectorDOMAgent_moveToWithErrorCallback_successCallback_nodeId_targetNodeId_insertBeforeNodeId___block_invoke;
  v26[3] = &unk_1E6DE6FE8;
  int v33 = a5;
  int v34 = a6;
  id v27 = v18;
  id v28 = v19;
  id v29 = v17;
  id v30 = v13;
  id v31 = v12;
  uint64_t v32 = a7;
  id v21 = v12;
  id v22 = v13;
  id v23 = v17;
  uint64_t v24 = v19;
  id v25 = v18;
  [v20 _evaluate:v26];
}

void __104__IKJSInspectorDOMAgent_moveToWithErrorCallback_successCallback_nodeId_targetNodeId_insertBeforeNodeId___block_invoke(uint64_t a1)
{
  id v19 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 80)];
  v2 = [*(id *)(a1 + 32) nodeById:*(int *)(a1 + 84)];
  char v3 = *(int **)(a1 + 72);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) nodeById:*v3];
  }
  else
  {
    id v4 = 0;
  }
  if (v19) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_25;
  }
  BOOL v6 = [v19 parentNode];
  char v7 = v6;
  if (v4)
  {
    id v8 = [v4 previousSibling];
  }
  else
  {
    if (!v6)
    {
      uint64_t v10 = 0;
      id v9 = 0;
      goto LABEL_20;
    }
    id v8 = [v6 lastChild];
  }
  id v9 = v8;
  if (!v8)
  {
    uint64_t v10 = 0;
    if (!v7) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  uint64_t v10 = [v8 ITMLID];
  if (v7)
  {
LABEL_18:
    id v11 = objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", objc_msgSend(v7, "ITMLID"));
    objc_msgSend(v11, "ik_removeChildWithId:", objc_msgSend(v19, "ITMLID"));
    id v12 = (id)[v7 removeChild:v19];
    objc_msgSend(*(id *)(a1 + 48), "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v7, "ITMLID"), *(unsigned int *)(a1 + 80));
  }
LABEL_20:
  id v13 = objc_msgSend(MEMORY[0x1E4FB6C80], "ik_nodeFromDOMNode:depth:", v19, 3);
  id v14 = objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", *(unsigned int *)(a1 + 84));
  if (v4
    && (objc_msgSend(*(id *)(a1 + 40), "ik_nodeWithNodeId:", objc_msgSend(v4, "ITMLID")),
        (unint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v16 = v15;
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "nodeId"));
    objc_msgSend(v14, "ik_insertChild:before:", v13, v17);
  }
  else
  {
    objc_msgSend(v14, "ik_insertChild:before:", v13, 0);
  }
  id v18 = (id)[v2 insertBefore:v19 :v4];
  objc_msgSend(*(id *)(a1 + 48), "safe_childNodeInsertedWithParentNodeId:previousNodeId:node:", *(unsigned int *)(a1 + 84), v10, v13);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_25:
}

- (void)getSupportedEventNamesWithErrorCallback:(id)a3 successCallback:(id)a4
{
  id v5 = a4;
  id v7 = +[IKViewElement DOMEventTypeNameMap];
  BOOL v6 = [v7 allValues];
  (*((void (**)(id, void *))a4 + 2))(v5, v6);
}

- (void)getAssociatedDataForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  id v7 = (void (**)(id, id *))a4;
  id v8 = [(IKJSInspectorDOMAgent *)self controller];
  id v9 = [v8 nodeById:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[IKDOMBindingController domBindingControllerForDOMElement:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [v10 dataItem];
  id v12 = [v11 dataDictionary];

  if (!v12) {
    goto LABEL_11;
  }
  id v19 = 0;
  id v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:0 error:&v19];
  id v14 = v19;
  if (!v13)
  {
    unint64_t v15 = ITMLKitGetLogObject(1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[IKJSInspectorDOMAgent getAssociatedDataForNodeWithErrorCallback:successCallback:nodeId:]((uint64_t)v14, v15);
    }
  }
  id v16 = (void *)[[NSString alloc] initWithData:v13 encoding:4];

  if (v16)
  {
    id v18 = v16;
    v7[2](v7, &v18);
    id v17 = v18;
  }
  else
  {
LABEL_11:
    v7[2](v7, 0);
  }
}

- (void)getDataBindingsForNodeWithErrorCallback:(id)a3 successCallback:(id)a4 nodeId:(int)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void *))a4;
  long long v49 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  id v8 = [(IKJSInspectorDOMAgent *)self controller];
  id v9 = [v8 nodeById:a5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = +[IKDOMBindingController domBindingControllerForDOMElement:v9];
    if (v10)
    {
      id v11 = v10;
      long long v47 = v9;
      long long v48 = v7;
      id v12 = [v10 binding];
      id v13 = [v12 keyValues];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (!v15) {
        goto LABEL_48;
      }
      uint64_t v16 = v15;
      p_cache = IKChangeSet.cache;
      id v18 = IKChangeSet.cache;
      uint64_t v19 = *(void *)v63;
      long long v50 = v11;
      id v52 = v14;
      uint64_t v55 = *(void *)v63;
      while (1)
      {
        uint64_t v20 = 0;
        uint64_t v51 = v16;
        do
        {
          if (*(void *)v63 != v19) {
            objc_enumerationMutation(v14);
          }
          id v21 = *(void **)(*((void *)&v62 + 1) + 8 * v20);
          id v22 = [v14 objectForKeyedSubscript:v21];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v56 = v21;
            uint64_t v54 = v20;
            id v23 = [v11 dataItem];
            uint64_t v24 = [v23 dataDictionary];

            v53 = v22;
            id v25 = [v22 accessorSequence];
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v26 = v25;
            uint64_t v57 = [v26 countByEnumeratingWithState:&v58 objects:v66 count:16];
            if (v57)
            {
              uint64_t v27 = *(void *)v59;
              while (2)
              {
                uint64_t v28 = 0;
                id v29 = sel_objectForKeyedSubscript_;
                id v30 = sel_objectAtIndexedSubscript_;
                do
                {
                  if (*(void *)v59 != v27) {
                    objc_enumerationMutation(v26);
                  }
                  id v31 = *(void **)(*((void *)&v58 + 1) + 8 * v28);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
                  {
                    uint64_t v32 = [v31 property];
                    [v24 objectForKeyedSubscript:v32];
                    int v33 = v30;
                    id v34 = v26;
                    int v35 = v29;
                    v36 = v18;
                    v38 = id v37 = p_cache;

                    uint64_t v24 = (void *)v38;
                    p_cache = v37;
                    id v18 = v36;
                    id v29 = v35;
                    id v26 = v34;
                    id v30 = v33;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
                    {

                      uint64_t v24 = 0;
                      goto LABEL_27;
                    }
                    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v31, "subscriptIndex"));
                    uint64_t v24 = v32 = v24;
                  }

                  ++v28;
                }
                while (v57 != v28);
                uint64_t v57 = [v26 countByEnumeratingWithState:&v58 objects:v66 count:16];
                if (v57) {
                  continue;
                }
                break;
              }
            }
LABEL_27:

            id v11 = v50;
            uint64_t v16 = v51;
            id v14 = v52;
            id v22 = v53;
            uint64_t v20 = v54;
            if (!v24)
            {
LABEL_25:
              long long v39 = 0;
              goto LABEL_46;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              long long v39 = 0;
              uint64_t v24 = 0;
              goto LABEL_46;
            }
            v56 = v21;
            uint64_t v24 = [v22 literal];
            if (!v24) {
              goto LABEL_25;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v39 = v24;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v39 = [v24 stringValue];
              if (!v39) {
                goto LABEL_46;
              }
            }
            else
            {
              objc_opt_class();
              long long v39 = @"(Collection)";
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  long long v39 = @"(Collection)";
                }
                else {
                  long long v39 = @"(Unspecified)";
                }
              }
            }
          }
          long long v40 = v22;
          long long v41 = objc_msgSend(MEMORY[0x1E4FB6C70], "safe_initWithBinding:value:", v56, v39);
          char v42 = [v56 isEqualToString:@"textContent"];
          id v43 = @"Text Content";
          if ((v42 & 1) == 0)
          {
            char v44 = [v56 isEqualToString:@"children"];
            id v43 = @"Children";
            if ((v44 & 1) == 0)
            {
              char v45 = [v56 isEqualToString:@"items"];
              id v43 = @"Items";
              if ((v45 & 1) == 0)
              {
                char v46 = [v56 hasPrefix:@"@"];
                id v43 = @"Attribute";
                if ((v46 & 1) == 0)
                {
                  if ([v56 hasPrefix:@"#"]) {
                    id v43 = @"Style";
                  }
                  else {
                    id v43 = 0;
                  }
                }
              }
            }
          }
          [v41 setType:v43];
          [v49 addObject:v41];

          id v22 = v40;
          id v14 = v52;
LABEL_46:

          ++v20;
          uint64_t v19 = v55;
        }
        while (v20 != v16);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (!v16)
        {
LABEL_48:

          id v9 = v47;
          id v7 = v48;
          break;
        }
      }
    }
  }
  v7[2](v7, v49);
}

- (void)_fullfillNodePath:(id)a3
{
  id v17 = a3;
  if ((unint64_t)[v17 length] >= 3)
  {
    id v4 = [(IKJSInspectorDOMAgent *)self controller];
    id v5 = [v4 inspector];
    BOOL v6 = [v5 configuration];
    id v7 = [v6 domEventDispatcher];

    id v8 = self->_rootNode;
    id v9 = [(IKJSInspectorDOMAgent *)self controller];
    uint64_t v10 = [v9 activeDocument];

    if ((unint64_t)([v17 length] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v11 = 1;
      do
      {
        [(RWIProtocolDOMNode *)v8 ik_updateWithDOMNode:v10 fullfillChildren:1 dispatcher:v7];
        if ([v17 length] - 1 > v11)
        {
          uint64_t v12 = [v17 indexAtPosition:v11];
          id v13 = [(RWIProtocolDOMNode *)v8 children];
          uint64_t v14 = [v13 objectAtIndex:v12];

          uint64_t v15 = [v10 childNodesAsArray];
          uint64_t v16 = [v15 objectAtIndex:v12];

          id v8 = (RWIProtocolDOMNode *)v14;
          uint64_t v10 = (void *)v16;
        }
        ++v11;
      }
      while ([v17 length] - 1 > v11);
    }
  }
}

+ (id)_parseAttributeString:(id)a3
{
  char v3 = [@"<a " stringByAppendingString:a3];
  id v4 = [v3 stringByAppendingString:@" />"];

  id v5 = [v4 dataUsingEncoding:4];
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = v5;
  xmlDocPtr Memory = xmlReadMemory((const char *)[v7 bytes], objc_msgSend(v7, "length"), "noname.xml", 0, 0);
  if (Memory)
  {
    id v9 = Memory;
    id v17 = v4;
    children = Memory->children;
    if (children)
    {
      unint64_t v11 = (void (**)(xmlChar *))MEMORY[0x1E4FBA9D0];
      do
      {
        if (children->type == XML_ELEMENT_NODE)
        {
          for (uint64_t i = children->properties; i; uint64_t i = i->next)
          {
            Prop = xmlGetProp(children, i->name);
            uint64_t v14 = [NSString stringWithUTF8String:Prop];
            uint64_t v15 = [NSString stringWithUTF8String:i->name];
            [v6 setObject:v14 forKey:v15];

            if (Prop) {
              (*v11)(Prop);
            }
          }
        }
        children = children->next;
      }
      while (children);
    }
    xmlFreeDoc(v9);
    id v4 = v17;
  }

  return v6;
}

+ (id)_nodeIDsFromNodePaths:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "indexAtPosition:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "length", (void)v13) - 1));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  unint64_t v11 = (void *)[v4 copy];
  return v11;
}

- (IKJSInspectorController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKJSInspectorController *)WeakRetained;
}

- (BOOL)isInspectElementModeEnabled
{
  return self->_inspectElementModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_eventListenersMap, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_searches, 0);
}

- (void)inspectNodeWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "Inspecting node with id %lu", (uint8_t *)&v2, 0xCu);
}

void __90__IKJSInspectorDOMAgent_getEventListenersForNodeWithErrorCallback_successCallback_nodeId___block_invoke_2_cold_1(void *a1)
{
  [a1 isEnabled];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1E2ACE000, v1, v2, "Adding %p with ID %i and %@", v3, v4, v5, v6, v7);
}

- (void)setEventListenerDisabledWithErrorCallback:(void *)a1 successCallback:eventListenerId:disabled:.cold.1(void *a1)
{
  [a1 isEnabled];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1E2ACE000, v1, v2, "Setting %p with ID %i to %@", v3, v4, v5, v6, v7);
}

- (void)getAssociatedDataForNodeWithErrorCallback:(uint64_t)a1 successCallback:(NSObject *)a2 nodeId:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Unable to generate JSON data dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end