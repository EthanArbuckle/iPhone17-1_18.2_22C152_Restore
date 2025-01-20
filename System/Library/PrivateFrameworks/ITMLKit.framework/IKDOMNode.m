@interface IKDOMNode
+ (IKDOMNode)nodeWithAppContext:(id)a3 nodePtr:(_xmlNode *)a4;
+ (id)ITMLIDStringforITMLID:(unint64_t)a3;
+ (id)_eventListenerMapKeyForType:(id)a3 useCapture:(BOOL)a4;
+ (id)activeDOMNodePtrs;
+ (id)nodeForNodePtr:(_xmlNode *)a3;
+ (int64_t)ITMLIDForITMLIDString:(id)a3;
+ (void)handleNodeParentDidChange:(_xmlNode *)a3;
+ (void)setup;
- (BOOL)_enumerateNodesWithBlock:(id)a3;
- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5;
- (BOOL)_validateDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5;
- (BOOL)clearUpdates;
- (BOOL)contains:(id)a3;
- (BOOL)dispatchEvent:(id)a3;
- (BOOL)hasChildNodes;
- (BOOL)isSameNode:(id)a3;
- (IKDOMDocument)managedOwnerDocument;
- (IKDOMDocument)ownerDocument;
- (IKDOMNode)firstChild;
- (IKDOMNode)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4;
- (IKDOMNode)lastChild;
- (IKDOMNode)nextSibling;
- (IKDOMNode)parentNode;
- (IKDOMNode)previousSibling;
- (IKDOMNodeData)jsNodeData;
- (IKDOMNodeList)childNodes;
- (JSManagedValue)managedChildNodeList;
- (JSManagedValue)managedParent;
- (JSManagedValue)managedSelf;
- (JSValue)dataItem;
- (NSHashTable)domObservers;
- (NSMutableDictionary)eventListenersMap;
- (NSString)description;
- (NSString)identifier;
- (NSString)nodeName;
- (NSString)nodeValue;
- (NSString)textContent;
- (_xmlNode)_appendNode:(_xmlNode *)a3;
- (_xmlNode)_insertNode:(_xmlNode *)a3 refNode:(_xmlNode *)a4 operation:(unint64_t)a5;
- (_xmlNode)nodePtr;
- (id)appendChild:(id)a3;
- (id)asPrivateIKJSDOMNode;
- (id)childNodesAsArray;
- (id)children;
- (id)cloneNode:(BOOL)a3;
- (id)firstElementChild;
- (id)getFeature:(id)a3 :(id)a4;
- (id)ik_nodePath;
- (id)ik_nodeWithId:(int64_t)a3;
- (id)ik_nodesWithIds:(id)a3;
- (id)ik_pathsForSearchQuery:(id)a3 compareOptions:(unint64_t)a4 currentPath:(id)a5;
- (id)insertBefore:(id)a3 :(id)a4;
- (id)lastElementChild;
- (id)nodesForXPath:(id)a3 error:(id *)a4;
- (id)performDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5;
- (id)removeChild:(id)a3;
- (id)replaceChild:(id)a3 :(id)a4;
- (id)toStringWithError:(id *)a3;
- (int64_t)ITMLID;
- (int64_t)nodeType;
- (unint64_t)childElementCount;
- (void)_childrenUpdatedWithUpdatedChildNodes:(id)a3 withDocument:(id)a4;
- (void)_linkManagedObjects;
- (void)_markSubtreeUpdatesForAncestorsOfNode:(id)a3;
- (void)_notifyUpdatesToDOMObservers;
- (void)_updatedAndMark:(BOOL)a3 withDocument:(id)a4;
- (void)addDOMObserver:(id)a3;
- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5;
- (void)adoptFeatureWithName:(id)a3 fromDOMNode:(id)a4;
- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4;
- (void)dealloc;
- (void)enumerateEventListenersUsingBlock:(id)a3;
- (void)enumerateEventListernersForType:(id)a3 xmlAttribute:(id)a4 phase:(int64_t)a5 usingBlock:(id)a6;
- (void)removeDOMObserver:(id)a3;
- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5;
- (void)setDataItem:(id)a3;
- (void)setDomObservers:(id)a3;
- (void)setEventListenersMap:(id)a3;
- (void)setITMLID:(int64_t)a3;
- (void)setManagedChildNodeList:(id)a3;
- (void)setManagedOwnerDocument:(id)a3;
- (void)setManagedParent:(id)a3;
- (void)setNodeValue:(id)a3;
- (void)setTextContent:(id)a3;
- (void)updatedAndMark:(BOOL)a3 notify:(BOOL)a4;
@end

@implementation IKDOMNode

- (id)ik_nodePath
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(IKDOMNode *)self nodeType] == 9)
  {
    v3 = 0;
  }
  else
  {
    v4 = self;
    v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", -[IKDOMNode ITMLID](v4, "ITMLID"));
    if (v4)
    {
      unint64_t v7 = 0x1E6DE2000uLL;
      *(void *)&long long v6 = 138412546;
      long long v22 = v6;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        v8 = [(IKDOMNode *)v4 parentNode];
        v9 = [(IKDOMNode *)v8 childNodesAsArray];
        uint64_t v10 = [v9 indexOfObject:v4];

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {

          v3 = 0;
          goto LABEL_19;
        }
        v11 = ITMLKitGetLogObject(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v13 = v7;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(IKDOMNode *)v4 tagName];
          }
          else
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
          v15 = };
          *(_DWORD *)buf = v22;
          v24 = v15;
          __int16 v25 = 2048;
          uint64_t v26 = v10;
          _os_log_debug_impl(&dword_1E2ACE000, v11, OS_LOG_TYPE_DEBUG, "%@ is %lu", buf, 0x16u);

          unint64_t v7 = v13;
        }

        uint64_t v12 = [v5 indexPathByAddingIndex:v10];

        v4 = v8;
        v5 = (void *)v12;
        if (!v8)
        {
          v5 = (void *)v12;
          break;
        }
      }
    }
    v16 = v5;
    v5 = objc_msgSend(v5, "indexPathByAddingIndex:", 0, v22);

    v17 = &buf[-((8 * [v5 length] + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
    if ([v5 length])
    {
      unint64_t v18 = 0;
      uint64_t v19 = -1;
      do
      {
        uint64_t v20 = [v5 indexAtPosition:v18];
        *(void *)&v17[8 * [v5 length] + 8 * v19] = v20;
        ++v18;
        --v19;
      }
      while ([v5 length] > v18);
    }
    v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndexes:length:", v17, objc_msgSend(v5, "length"));
LABEL_19:
  }
  return v3;
}

- (id)ik_nodeWithId:(int64_t)a3
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  uint64_t v10 = __Block_byref_object_dispose__19;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__IKDOMNode_IKJSInspector__ik_nodeWithId___block_invoke;
  v5[3] = &unk_1E6DE5DC0;
  v5[4] = &v6;
  v5[5] = a3;
  [(IKDOMNode *)self _enumerateNodesWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

BOOL __42__IKDOMNode_IKJSInspector__ik_nodeWithId___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 ITMLID];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5 == v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }

  return v5 == v6;
}

- (id)ik_nodesWithIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__IKDOMNode_IKJSInspector__ik_nodesWithIds___block_invoke;
  v11[3] = &unk_1E6DE5DE8;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(IKDOMNode *)self _enumerateNodesWithBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

uint64_t __44__IKDOMNode_IKJSInspector__ik_nodesWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "ITMLID"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return 0;
}

- (id)ik_pathsForSearchQuery:(id)a3 compareOptions:(unint64_t)a4 currentPath:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:0];
  id v11 = [(IKDOMNode *)self nodeName];
  uint64_t v12 = [v11 rangeOfString:v8 options:a4];

  id v13 = [(IKDOMNode *)self nodeValue];
  if (v13)
  {
    v14 = [(IKDOMNode *)self nodeValue];
    BOOL v34 = [v14 rangeOfString:v8 options:a4] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v34 = 0;
  }

  objc_opt_class();
  v35 = (void *)v10;
  if (objc_opt_isKindOfClass())
  {
    [(IKDOMNode *)self _attributes];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v37)
    {
      v33 = self;
      uint64_t v36 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v39 != v36) {
            objc_enumerationMutation(v15);
          }
          id v17 = v9;
          unint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v18, "rangeOfString:options:", v8, a4, v33);
          uint64_t v20 = [v15 objectForKey:v18];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [v15 objectForKey:v18];
            BOOL v22 = [v21 rangeOfString:v8 options:a4] == 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            BOOL v22 = 1;
          }

          if (v19 != 0x7FFFFFFFFFFFFFFFLL || !v22)
          {
            int v24 = 1;
            id v9 = v17;
            goto LABEL_22;
          }
          id v9 = v17;
        }
        uint64_t v37 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v37) {
          continue;
        }
        break;
      }
      int v24 = 0;
LABEL_22:
      self = v33;
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    int v24 = 0;
  }
  char v25 = v12 != 0x7FFFFFFFFFFFFFFFLL || v34;
  if ((v25 & 1) != 0 || v24)
  {
    uint64_t v26 = objc_msgSend(v9, "indexPathByAddingIndex:", -[IKDOMNode ITMLID](self, "ITMLID"));
    [v35 addObject:v26];
  }
  uint64_t v27 = [(IKDOMNode *)self childNodesAsArray];
  if ([v27 count])
  {
    unint64_t v28 = 0;
    do
    {
      v29 = [v27 objectAtIndex:v28];
      v30 = [v9 indexPathByAddingIndex:v28];
      v31 = objc_msgSend(v29, "ik_pathsForSearchQuery:compareOptions:currentPath:", v8, a4, v30);
      [v35 unionOrderedSet:v31];

      ++v28;
    }
    while ([v27 count] > v28);
  }

  return v35;
}

- (id)asPrivateIKJSDOMNode
{
  if ([(IKDOMNode *)self conformsToProtocol:&unk_1F3E47200]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

+ (id)activeDOMNodePtrs
{
  if (activeDOMNodePtrs_onceToken != -1) {
    dispatch_once(&activeDOMNodePtrs_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)activeDOMNodePtrs_activeDOMNodePtrs;
  return v2;
}

void __30__IKDOMNode_activeDOMNodePtrs__block_invoke()
{
  if (!activeDOMNodePtrs_activeDOMNodePtrs)
  {
    uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v1 = activeDOMNodePtrs_activeDOMNodePtrs;
    activeDOMNodePtrs_activeDOMNodePtrs = v0;
    MEMORY[0x1F41817F8](v0, v1);
  }
}

+ (void)setup
{
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, &__block_literal_global_88);
  }
}

+ (IKDOMNode)nodeWithAppContext:(id)a3 nodePtr:(_xmlNode *)a4
{
  id v6 = a3;
  if (!a4) {
    goto LABEL_5;
  }
  id v7 = [a1 nodeForNodePtr:a4];
  if (v7) {
    goto LABEL_6;
  }
  unsigned __int32 v8 = a4->type - 1;
  if (v8 <= 0xA && ((0x58Fu >> v8) & 1) != 0) {
    id v7 = (void *)[objc_alloc(*off_1E6DE6E48[v8]) initWithAppContext:v6 xmlNode:a4];
  }
  else {
LABEL_5:
  }
    id v7 = 0;
LABEL_6:

  return (IKDOMNode *)v7;
}

+ (id)nodeForNodePtr:(_xmlNode *)a3
{
  if (a3)
  {
    id v3 = a3->_private;
    id v4 = [a1 activeDOMNodePtrs];
    objc_sync_enter(v4);
    uint64_t v5 = [NSNumber numberWithInt:v3];
    if ([v4 containsObject:v5]) {
      id v6 = v3;
    }
    else {
      id v6 = 0;
    }

    objc_sync_exit(v4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (IKDOMNode)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IKDOMNode;
  id v7 = [(IKJSObject *)&v23 initWithAppContext:v6];
  if (v7)
  {
    id v8 = [(id)objc_opt_class() activeDOMNodePtrs];
    objc_sync_enter(v8);
    id v9 = [NSNumber numberWithInt:v7];
    [v8 addObject:v9];

    objc_sync_exit(v8);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_nodePtr = a4;
    a4->_private = v7;
    uint64_t v13 = +[IKDOMNodeData jsNodeDataForNode:v7];
    jsNodeData = v7->_jsNodeData;
    v7->_jsNodeData = (IKDOMNodeData *)v13;

    id v15 = (void *)MEMORY[0x1E4F30928];
    v16 = (void *)MEMORY[0x1E4F30938];
    id v17 = [v6 jsContext];
    unint64_t v18 = [v16 valueWithObject:v7 inContext:v17];
    uint64_t v19 = [v15 managedValueWithValue:v18];
    managedSelf = v7->_managedSelf;
    v7->_managedSelf = (JSManagedValue *)v19;

    [(IKDOMNode *)v7 _linkManagedObjects];
    v21 = [(IKDOMNode *)v7 ownerDocument];
    [v21 setITMLIDForNode:v7];
  }
  return v7;
}

- (void)dealloc
{
  id v3 = [(id)objc_opt_class() activeDOMNodePtrs];
  objc_sync_enter(v3);
  id v4 = [NSNumber numberWithInt:self];
  [v3 removeObject:v4];

  objc_sync_exit(v3);
  uint64_t v5 = [(IKDOMNode *)self nodePtr];
  id v6 = [(IKDOMNode *)self managedParent];

  if (!v6 && v5)
  {
    if (v5->type == XML_DOCUMENT_NODE)
    {
      xmlFreeDoc((xmlDocPtr)v5);
    }
    else
    {
      xmlSetTreeDoc(v5, 0);
      xmlFreeNode(v5);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)IKDOMNode;
  [(IKDOMNode *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = xmlBufferCreate();
    if (v5)
    {
      id v6 = v5;
      if (xmlNodeDump(v5, 0, v4, 0, 0))
      {
        id v7 = [NSString alloc];
        id v8 = xmlBufferContent(v6);
        id v9 = (void *)[v7 initWithBytes:v8 length:xmlBufferLength(v6) encoding:4];
        if ([v9 length])
        {
          uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          uint64_t v11 = [v9 stringByTrimmingCharactersInSet:v10];

          id v9 = (void *)v11;
        }
      }
      else
      {
        id v9 = 0;
      }
      xmlBufferFree(v6);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"%@ %p nodeptr is destroyed", objc_opt_class(), self];
  }
  return (NSString *)v9;
}

- (id)childNodesAsArray
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    children = v3->children;
  }
  else {
    children = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  while (children)
  {
    id v6 = objc_opt_class();
    id v7 = [(IKJSObject *)self appContext];
    id v8 = [v6 nodeWithAppContext:v7 nodePtr:children];

    if (v8) {
      [v5 addObject:v8];
    }
    children = children->next;
  }
  if (![v5 count])
  {

    uint64_t v5 = 0;
  }
  id v9 = (void *)[v5 copy];

  return v9;
}

- (NSString)nodeName
{
  return 0;
}

- (NSString)nodeValue
{
  return 0;
}

- (void)setNodeValue:(id)a3
{
  id v6 = [(IKJSObject *)self appContext];
  id v4 = [(IKJSObject *)self appContext];
  uint64_t v5 = +[IKDOMException exceptionWithAppContext:v4 code:7];
  [v6 setException:v5 withErrorMessage:@"Node value can't be set on base node."];
}

- (int64_t)nodeType
{
  return 0;
}

- (IKDOMNode)parentNode
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    parent = v3->parent;
  }
  else {
    parent = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:parent];

  return (IKDOMNode *)v6;
}

- (IKDOMNodeList)childNodes
{
  id v3 = [(IKDOMNode *)self managedChildNodeList];
  id v4 = [v3 value];
  uint64_t v5 = [v4 toObjectOfClass:objc_opt_class()];

  if (!v5)
  {
    id v6 = [IKDOMNodeList alloc];
    id v7 = [(IKJSObject *)self appContext];
    uint64_t v5 = [(IKDOMNodeList *)v6 initWithAppContext:v7 contextNode:self evaluationBlock:&__block_literal_global_117];

    id v8 = [(IKJSObject *)self appContext];
    id v9 = [v8 jsContext];

    uint64_t v10 = (void *)MEMORY[0x1E4F30928];
    uint64_t v11 = [MEMORY[0x1E4F30938] valueWithObject:v5 inContext:v9];
    uint64_t v12 = [v10 managedValueWithValue:v11];

    uint64_t v13 = [v9 virtualMachine];
    [v13 addManagedReference:v12 withOwner:self];

    [(IKDOMNode *)self setManagedChildNodeList:v12];
  }
  return v5;
}

uint64_t __23__IKDOMNode_childNodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 childNodesAsArray];
}

- (IKDOMNode)firstChild
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    children = v3->children;
  }
  else {
    children = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:children];

  return (IKDOMNode *)v6;
}

- (IKDOMNode)lastChild
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    last = v3->last;
  }
  else {
    last = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:last];

  return (IKDOMNode *)v6;
}

- (IKDOMNode)previousSibling
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    prev = v3->prev;
  }
  else {
    prev = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:prev];

  return (IKDOMNode *)v6;
}

- (IKDOMNode)nextSibling
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    next = v3->next;
  }
  else {
    next = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:next];

  return (IKDOMNode *)v6;
}

- (IKDOMDocument)ownerDocument
{
  id v3 = [(IKDOMNode *)self nodePtr];
  if (v3) {
    doc = v3->doc;
  }
  else {
    doc = 0;
  }
  uint64_t v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:doc];

  return (IKDOMDocument *)v6;
}

- (NSString)textContent
{
  return 0;
}

- (void)setTextContent:(id)a3
{
  id v6 = [(IKJSObject *)self appContext];
  id v4 = [(IKJSObject *)self appContext];
  uint64_t v5 = +[IKDOMException exceptionWithAppContext:v4 code:7];
  [v6 setException:v5 withErrorMessage:@"Text conent can't be set on base node."];
}

- (id)insertBefore:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IKDOMNode *)self _validateDOMOperation:1 newNode:v6 refNode:v7])
  {
    if ([v6 nodeType] == 11)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v6 parentNode];
    }
    uint64_t v10 = v8;
    uint64_t v11 = [(IKDOMNode *)self performDOMOperation:1 newNode:v6 refNode:v7];
    [v10 childrenUpdatedWithUpdatedChildNodes:0 notify:1];
    [(IKDOMNode *)self childrenUpdatedWithUpdatedChildNodes:v11 notify:1];
    id v9 = [v11 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)replaceChild:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IKDOMNode *)self _validateDOMOperation:2 newNode:v6 refNode:v7])
  {
    if ([v6 nodeType] == 11)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v6 parentNode];
    }
    uint64_t v10 = v8;
    uint64_t v11 = [(IKDOMNode *)self performDOMOperation:2 newNode:v6 refNode:v7];
    [v10 childrenUpdatedWithUpdatedChildNodes:0 notify:1];
    [(IKDOMNode *)self childrenUpdatedWithUpdatedChildNodes:v11 notify:1];
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)removeChild:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  if ([(IKDOMNode *)self _validateDOMOperation:2 newNode:0 refNode:v4])
  {
    id v6 = [(IKDOMNode *)self performDOMOperation:2 newNode:0 refNode:v4];
    [(IKDOMNode *)self childrenUpdatedWithUpdatedChildNodes:0 notify:1];
    id v5 = v4;
  }

  return v5;
}

- (id)appendChild:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  if ([(IKDOMNode *)self _validateDOMOperation:0 newNode:v4 refNode:0])
  {
    if ([v4 nodeType] == 11)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v4 parentNode];
    }
    id v7 = v6;
    id v8 = [(IKDOMNode *)self performDOMOperation:1 newNode:v4 refNode:0];
    [v7 childrenUpdatedWithUpdatedChildNodes:0 notify:1];
    [(IKDOMNode *)self childrenUpdatedWithUpdatedChildNodes:v8 notify:1];
    id v5 = [v8 firstObject];
  }
  return v5;
}

- (BOOL)hasChildNodes
{
  v2 = [(IKDOMNode *)self nodePtr];
  if (v2) {
    LOBYTE(v2) = v2->children != 0;
  }
  return (char)v2;
}

- (id)cloneNode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IKDOMNode *)self nodePtr];
  if (v5 && (id v6 = v5, (v7 = xmlCopyNode(v5, v3)) != 0))
  {
    id v8 = v7;
    xmlSetTreeDoc(v7, v6->doc);
    id v9 = objc_opt_class();
    uint64_t v10 = [(IKJSObject *)self appContext];
    uint64_t v11 = [v9 nodeWithAppContext:v10 nodePtr:v8];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (BOOL)isSameNode:(id)a3
{
  id v4 = (IKDOMNode *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(IKDOMNode *)self nodePtr];
      uint64_t v6 = [(IKDOMNode *)v4 nodePtr];
      if (v5) {
        BOOL v7 = v5 == (_xmlNode *)v6;
      }
      else {
        BOOL v7 = 0;
      }
      BOOL v8 = v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)getFeature:(id)a3 :(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F30938];
  BOOL v7 = [(IKJSObject *)self appContext];
  BOOL v8 = [v7 jsContext];
  id v9 = [v6 valueWithObject:self inContext:v8];

  uint64_t v10 = [v9 objectForKeyedSubscript:v5];
  uint64_t v11 = [v10 toObjectOfClass:objc_opt_class()];

  uint64_t v12 = [(IKDOMNode *)self jsNodeData];
  uint64_t v13 = v12;
  if (!v11)
  {
    v14 = [v12 featureForName:v5];
    if (!v14)
    {
      v14 = [(IKDOMNode *)self nodeName];
      uint64_t v11 = +[IKViewElementFactory elementClassByTagName:v14];
      if (!v11) {
        goto LABEL_4;
      }
      v16 = [(IKDOMNode *)self nodeName];
      id v17 = [(objc_class *)v11 supportedFeaturesForElementName:v16];
      int v18 = [v17 containsObject:v5];

      if (!v18
        || (+[IKDOMFeatureFactory featureForName:v5 withDOMNode:self], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v11 = 0;
        goto LABEL_4;
      }
      uint64_t v20 = (void *)v19;
      [v13 setFeature:v19 forName:v5];

      v14 = v20;
    }
    uint64_t v11 = [(id)objc_opt_class() makeFeatureJSObjectForFeature:v14];
    [v9 setObject:v11 forKeyedSubscript:v5];
LABEL_4:
  }
  return v11;
}

- (void)adoptFeatureWithName:(id)a3 fromDOMNode:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30938];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 appContext];
  uint64_t v10 = [v9 jsContext];
  id v19 = [v6 valueWithObject:v7 inContext:v10];

  uint64_t v11 = [v7 jsNodeData];

  uint64_t v12 = (void *)MEMORY[0x1E4F30938];
  uint64_t v13 = [(IKJSObject *)self appContext];
  v14 = [v13 jsContext];
  id v15 = [v12 valueWithObject:self inContext:v14];

  v16 = [(IKDOMNode *)self jsNodeData];
  id v17 = [v19 objectForKeyedSubscript:v8];
  [v15 setObject:v17 forKeyedSubscript:v8];

  int v18 = [v11 featureForName:v8];
  [v16 setFeature:v18 forName:v8];
}

- (BOOL)contains:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(IKDOMNode *)self childNodesAsArray];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (JSValue)dataItem
{
  return [(JSManagedValue *)self->_managedDataItem value];
}

- (void)setDataItem:(id)a3
{
  id v8 = a3;
  if (([v8 isNull] & 1) != 0 || objc_msgSend(v8, "isUndefined"))
  {

LABEL_4:
    id v8 = 0;
    id v4 = 0;
    char v5 = 1;
    goto LABEL_5;
  }
  if (!v8) {
    goto LABEL_4;
  }
  if (!objc_msgSend(v8, "ikdt_isObject") || objc_msgSend(v8, "ikdt_isArray"))
  {
    uint64_t v7 = [(IKJSObject *)self appContext];
    [v7 setException:0 withErrorMessage:@"data item must be an non-array object"];
  }
  id v4 = [MEMORY[0x1E4F30928] managedValueWithValue:v8 andOwner:self];
  char v5 = 0;
LABEL_5:
  objc_storeStrong((id *)&self->_managedDataItem, v4);
  if ((v5 & 1) == 0) {

  }
  uint64_t v6 = [(IKDOMNode *)self jsNodeData];
  [v6 setDataResolved:0];

  [(IKDOMNode *)self updatedAndMark:1 notify:0];
}

- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = [v16 length];
  if (v8 && v9)
  {
    long long v10 = [(id)objc_opt_class() _eventListenerMapKeyForType:v16 useCapture:v5];
    if (![(IKDOMNode *)self _searchEventListener:v8 key:v10 destroy:0])
    {
      long long v11 = [(IKDOMNode *)self eventListenersMap];
      if (!v11)
      {
        long long v11 = [MEMORY[0x1E4F1CA60] dictionary];
        [(IKDOMNode *)self setEventListenersMap:v11];
      }
      long long v12 = [v11 objectForKey:v10];
      if (!v12)
      {
        long long v12 = [MEMORY[0x1E4F1CA48] array];
        [v11 setObject:v12 forKey:v10];
      }
      long long v13 = [[_IKDOMNodeEventListener alloc] initWithListener:v8 forNode:self];
      [v12 addObject:v13];
      v14 = [(IKJSObject *)self appContext];
      uint64_t v15 = [v14 webInspectorController];
      [v15 didAddEventListenerForDOMNode:self];
    }
  }
}

- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  uint64_t v9 = [v13 length];
  if (v8 && v9)
  {
    long long v10 = [(IKJSObject *)self appContext];
    long long v11 = [v10 webInspectorController];
    [v11 willRemoveEventListenerForDOMNode:self];

    long long v12 = [(id)objc_opt_class() _eventListenerMapKeyForType:v13 useCapture:v5];
    [(IKDOMNode *)self _searchEventListener:v8 key:v12 destroy:1];
  }
}

- (BOOL)dispatchEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 target];

  if (!v5) {
    [v4 setTarget:self];
  }
  uint64_t v6 = +[IKDOMEventDispatcher sharedInstance];
  char v7 = [v6 dispatchEvent:v4];

  return v7;
}

+ (id)ITMLIDStringforITMLID:(unint64_t)a3
{
  return (id)objc_msgSend(@"id_", "stringByAppendingFormat:", @"%lu", a3);
}

+ (int64_t)ITMLIDForITMLIDString:(id)a3
{
  uint64_t v3 = ITMLIDForITMLIDString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&ITMLIDForITMLIDString__onceToken, &__block_literal_global_137);
  }
  BOOL v5 = (void *)ITMLIDForITMLIDString__numberFormatter;
  uint64_t v6 = [v4 substringFromIndex:3];

  char v7 = [v5 numberFromString:v6];
  int64_t v8 = [v7 integerValue];

  return v8;
}

uint64_t __35__IKDOMNode_ITMLIDForITMLIDString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)ITMLIDForITMLIDString__numberFormatter;
  ITMLIDForITMLIDString__numberFormatter = (uint64_t)v0;

  v2 = (void *)ITMLIDForITMLIDString__numberFormatter;
  return [v2 setNumberStyle:1];
}

+ (void)handleNodeParentDidChange:(_xmlNode *)a3
{
  uint64_t v3 = +[IKDOMNode nodeForNodePtr:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 _linkManagedObjects];
    uint64_t v3 = v4;
  }
}

- (_xmlNode)nodePtr
{
  return self->_nodePtr;
}

- (void)enumerateEventListenersUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IKDOMNode *)self eventListenersMap];
  uint64_t v6 = (void *)[v5 copy];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke;
  v9[3] = &unk_1E6DE6DB0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v9];
}

void __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  int v7 = [v6 hasSuffix:@"_capture"];
  char v8 = v7;
  if (v7) {
    uint64_t v9 = @"_capture";
  }
  else {
    uint64_t v9 = @"_targetAndBubble";
  }
  id v10 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:", v9));
  id v11 = [*(id *)(a1 + 32) objectForKey:v6];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke_2;
  v14[3] = &unk_1E6DE6D88;
  id v12 = *(id *)(a1 + 40);
  id v15 = v10;
  id v16 = v12;
  char v18 = v8;
  uint64_t v17 = a4;
  id v13 = v10;
  [v11 enumerateObjectsUsingBlock:v14];
}

uint64_t __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*a4) {
    **(unsigned char **)(a1 + 48) = 1;
  }
  return result;
}

- (void)enumerateEventListernersForType:(id)a3 xmlAttribute:(id)a4 phase:(int64_t)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, _IKDOMNodeEventListener *, unsigned char *))a6;
  char v28 = 0;
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [(IKDOMNode *)self getAttribute:v11];
  }
  else
  {
    id v13 = 0;
  }
  if ([v13 length])
  {
    v14 = (void *)MEMORY[0x1E4F30938];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke;
    v26[3] = &unk_1E6DE6DD8;
    v26[4] = self;
    id v27 = v13;
    id v15 = (void *)MEMORY[0x1E4E65800](v26);
    id v16 = [(IKJSObject *)self appContext];
    uint64_t v17 = [v16 jsContext];
    char v18 = [v14 valueWithObject:v15 inContext:v17];

    id v19 = [[_IKDOMNodeEventListener alloc] initWithListener:v18 forNode:0];
    v12[2](v12, v19, &v28);
  }
  if (!v28)
  {
LABEL_8:
    uint64_t v20 = [(id)objc_opt_class() _eventListenerMapKeyForType:v10 useCapture:a5 == 1];
    v21 = [(IKDOMNode *)self eventListenersMap];
    BOOL v22 = [v21 objectForKey:v20];
    objc_super v23 = (void *)[v22 copy];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke_2;
    v24[3] = &unk_1E6DE6E00;
    char v25 = v12;
    [v23 enumerateObjectsUsingBlock:v24];
  }
}

void __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F30920];
  id v4 = a2;
  BOOL v5 = [v3 currentContext];
  id v6 = [MEMORY[0x1E4F30938] valueWithObject:*(void *)(a1 + 32) inContext:v5];
  int v7 = [v5 objectForKeyedSubscript:@"Function"];
  uint64_t v8 = *(void *)(a1 + 40);
  v14[0] = @"event";
  v14[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v10 = [v7 constructWithArguments:v9];

  v13[0] = v6;
  v13[1] = v4;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  id v12 = (id)[v10 invokeMethod:@"call" withArguments:v11];
}

uint64_t __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)updatedAndMark:(BOOL)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a4) {
    [(IKDOMNode *)self _notifyUpdatesToDOMObservers];
  }
  int v7 = self;
  uint64_t v8 = [(IKDOMNode *)v7 parentNode];

  id v11 = v7;
  if (v8)
  {
    id v11 = v7;
    do
    {
      uint64_t v9 = v11;
      id v11 = [v11 parentNode];

      if (v4) {
        [v11 _notifyUpdatesToDOMObservers];
      }
      id v10 = [v11 parentNode];
    }
    while (v10);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(IKDOMNode *)v7 _updatedAndMark:v5 withDocument:v11];
  }
}

- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if (v4)
  {
    [v11 makeObjectsPerformSelector:sel__notifyUpdatesToDOMObservers];
    [(IKDOMNode *)self _notifyUpdatesToDOMObservers];
  }
  id v6 = self;
  int v7 = [(IKDOMNode *)v6 parentNode];

  uint64_t v8 = v6;
  if (v7)
  {
    uint64_t v8 = v6;
    do
    {
      uint64_t v9 = v8;
      uint64_t v8 = [v8 parentNode];

      if (v4) {
        [v8 _notifyUpdatesToDOMObservers];
      }
      id v10 = [v8 parentNode];
    }
    while (v10);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(IKDOMNode *)v6 _childrenUpdatedWithUpdatedChildNodes:v11 withDocument:v8];
  }
}

- (BOOL)clearUpdates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IKDOMNode *)self jsNodeData];
  int v4 = [v3 containsUpdates];
  if (v4)
  {
    [v3 setUpdated:0];
    [v3 setSubtreeUpdated:0];
    [v3 setChildrenUpdated:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v5 = [(IKDOMNode *)self childNodesAsArray];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v9++) clearUpdates];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)performDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  long long v11 = (xmlNode *)[v9 nodePtr];
  uint64_t v12 = [v8 nodePtr];
  uint64_t v13 = v12;
  if (a3 == 2 && !v8)
  {
    xmlUnlinkNode(v11);
    +[IKDOMNode handleNodeParentDidChange:v11];
    goto LABEL_18;
  }
  int v14 = *(_DWORD *)(v12 + 8);
  if (a3 <= 1 && !v11)
  {
    if (v14 == 11)
    {
      if (*(void *)(v12 + 24))
      {
        do
        {
          id v15 = -[IKDOMNode _appendNode:](self, "_appendNode:");
          uint64_t v16 = [(IKJSObject *)self appContext];
          uint64_t v17 = +[IKDOMNode nodeWithAppContext:v16 nodePtr:v15];
          [v10 addObject:v17];
        }
        while (*(void *)(v13 + 24));
      }
      goto LABEL_18;
    }
    objc_super v23 = [(IKDOMNode *)self _appendNode:v12];
LABEL_17:
    int v24 = v23;
    char v25 = [(IKJSObject *)self appContext];
    uint64_t v26 = +[IKDOMNode nodeWithAppContext:v25 nodePtr:v24];
    [v10 addObject:v26];

    goto LABEL_18;
  }
  if (v14 != 11)
  {
    objc_super v23 = [(IKDOMNode *)self _insertNode:v12 refNode:v11 operation:a3];
    goto LABEL_17;
  }
  uint64_t v18 = *(void *)(v12 + 24);
  if (v18)
  {
    for (uint64_t i = [(IKDOMNode *)self _insertNode:v18 refNode:v11 operation:a3];
          ;
          uint64_t i = [(IKDOMNode *)self _insertNode:v22 refNode:i operation:0])
    {
      uint64_t v20 = [(IKJSObject *)self appContext];
      v21 = +[IKDOMNode nodeWithAppContext:v20 nodePtr:i];
      [v10 addObject:v21];

      uint64_t v22 = *(void *)(v13 + 24);
      if (!v22) {
        break;
      }
    }
  }
LABEL_18:
  id v27 = (void *)[v10 copy];

  return v27;
}

- (void)addDOMObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IKDOMNode *)self domObservers];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(IKDOMNode *)self setDomObservers:v6];
  }
  id v7 = [(IKDOMNode *)self domObservers];
  [v7 addObject:v4];
}

- (void)removeDOMObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IKDOMNode *)self domObservers];
  [v5 removeObject:v4];

  uint64_t v6 = [(IKDOMNode *)self domObservers];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(IKDOMNode *)self setDomObservers:0];
  }
}

- (id)nodesForXPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(IKDOMNode *)self nodePtr];
  if (v7 && (v8 = v7, (doc = v7->doc) != 0) && (xmlXPathContextPtr v10 = xmlXPathNewContext(doc)) != 0)
  {
    long long v11 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    v11->userData = v12;
    v11->error = (xmlStructuredErrorFunc)IKXPathErrorCallback;
    v11->node = v8;
    xmlXPathObjectPtr v13 = xmlXPathEval((const xmlChar *)[v6 UTF8String], v11);
    if (v13)
    {
      xmlNodeSetPtr nodesetval = v13->nodesetval;
      if (nodesetval)
      {
        objc_super v23 = v13;
        int v24 = v12;
        a4 = [MEMORY[0x1E4F1CA48] array];
        int nodeNr = nodesetval->nodeNr;
        if (nodesetval->nodeNr >= 1)
        {
          uint64_t v16 = 0;
          do
          {
            xmlNodePtr v17 = nodesetval->nodeTab[v16];
            if (v17)
            {
              uint64_t v18 = [(IKJSObject *)self appContext];
              id v19 = +[IKDOMNode nodeWithAppContext:v18 nodePtr:v17];

              if (v19) {
                [a4 addObject:v19];
              }

              int nodeNr = nodesetval->nodeNr;
            }
            ++v16;
          }
          while (v16 < nodeNr);
        }
        if (![a4 count])
        {

          a4 = 0;
        }
        xmlXPathObjectPtr v13 = v23;
        uint64_t v12 = v24;
      }
      else
      {
        a4 = 0;
      }
      xmlXPathFreeObject(v13);
    }
    else if (a4)
    {
      uint64_t v20 = [v12 componentsJoinedByString:@"\n"];
      v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x1E4F28568], 0);
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ITMLKitErrorDomain" code:202 userInfo:v21];

      a4 = 0;
    }
    xmlXPathFreeContext(v11);
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (id)toStringWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(IKDOMNode *)self nodePtr];
  if (v4)
  {
    xmlBufferPtr v5 = xmlBufferCreate();
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = xmlCopyNode(v4, 1);
      v12[0] = @"itmlID";
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      _SantizedAttributesFromXmlNode(v7, v8);

      if (xmlNodeDump(v6, v4->doc, v7, 0, 1) < 1)
      {
        id v4 = 0;
      }
      else
      {
        id v9 = [NSString alloc];
        xmlXPathContextPtr v10 = xmlBufferContent(v6);
        id v4 = (_xmlNode *)[v9 initWithBytes:v10 length:xmlBufferLength(v6) encoding:4];
      }
      xmlBufferFree(v6);
      xmlFreeNode(v7);
    }
    else
    {
      id v4 = 0;
      if (a3) {
        *a3 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ITMLKitErrorDomain" code:204 userInfo:0];
      }
    }
  }
  return v4;
}

- (id)children
{
  uint64_t v3 = [IKDOMHTMLCollection alloc];
  id v4 = [(IKJSObject *)self appContext];
  xmlBufferPtr v5 = [(IKDOMHTMLCollection *)v3 initWithAppContext:v4 node:self];

  return v5;
}

- (id)firstElementChild
{
  uint64_t v3 = [(IKDOMNode *)self nodePtr];
  if (v3)
  {
    for (uint64_t i = v3->children; i; uint64_t i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = 0;
  }
  xmlBufferPtr v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:i];

  return v6;
}

- (id)lastElementChild
{
  uint64_t v3 = [(IKDOMNode *)self nodePtr];
  if (v3)
  {
    for (uint64_t i = v3->last; i; uint64_t i = i->prev)
    {
      if (i->type == XML_ELEMENT_NODE) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = 0;
  }
  xmlBufferPtr v5 = [(IKJSObject *)self appContext];
  id v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:i];

  return v6;
}

- (unint64_t)childElementCount
{
  unint64_t result = [(IKDOMNode *)self nodePtr];
  if (result)
  {
    uint64_t v3 = *(void *)(result + 24);
    if (v3)
    {
      unint64_t result = 0;
      do
      {
        if (*(_DWORD *)(v3 + 8) == 1) {
          ++result;
        }
        uint64_t v3 = *(void *)(v3 + 48);
      }
      while (v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)_eventListenerMapKeyForType:(id)a3 useCapture:(BOOL)a4
{
  if (a4) {
    xmlBufferPtr v5 = @"_capture";
  }
  else {
    xmlBufferPtr v5 = @"_targetAndBubble";
  }
  return (id)[a3 stringByAppendingString:v5];
}

- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  xmlXPathContextPtr v10 = [(IKDOMNode *)self eventListenersMap];
  long long v11 = [v10 objectForKey:v9];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __46__IKDOMNode__searchEventListener_key_destroy___block_invoke;
  uint64_t v20 = &unk_1E6DE6E28;
  id v12 = v8;
  id v21 = v12;
  uint64_t v22 = &v23;
  [v11 enumerateObjectsUsingBlock:&v17];
  uint64_t v13 = v24[3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    objc_msgSend(v11, "removeObjectAtIndex:", v17, v18, v19, v20);
    uint64_t v13 = v24[3];
  }
  BOOL v15 = v13 != 0x7FFFFFFFFFFFFFFFLL;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __46__IKDOMNode__searchEventListener_key_destroy___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 value];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_linkManagedObjects
{
  uint64_t v3 = [(IKJSObject *)self appContext];
  id v25 = [v3 jsContext];

  id v4 = [v25 virtualMachine];
  BOOL v5 = [(IKDOMNode *)self parentNode];
  if (v5)
  {
    id v6 = [(IKDOMNode *)self managedSelf];
    [v4 addManagedReference:v6 withOwner:v5];

    uint64_t v7 = [v5 managedSelf];
    [v4 addManagedReference:v7 withOwner:self];

    int v8 = [(IKDOMNode *)self managedParent];

    if (v8)
    {
      id v9 = [(IKDOMNode *)self managedSelf];
      xmlXPathContextPtr v10 = [(IKDOMNode *)self managedParent];
      long long v11 = [v10 value];
      [v4 removeManagedReference:v9 withOwner:v11];

      id v12 = [(IKDOMNode *)self managedParent];
      [v4 removeManagedReference:v12 withOwner:self];
    }
    uint64_t v13 = [v5 managedSelf];
    [(IKDOMNode *)self setManagedParent:v13];

    int v14 = [(IKDOMNode *)self managedOwnerDocument];

    if (v14)
    {
      BOOL v15 = [(IKDOMNode *)self managedOwnerDocument];
      [v4 removeManagedReference:v15 withOwner:self];

      [(IKDOMNode *)self setManagedOwnerDocument:0];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v16 = [(IKDOMNode *)self managedOwnerDocument];

      if (v16)
      {
        uint64_t v17 = [(IKDOMNode *)self managedOwnerDocument];
        [v4 removeManagedReference:v17 withOwner:self];
      }
      uint64_t v18 = [(IKDOMNode *)self ownerDocument];
      [(IKDOMNode *)self setManagedOwnerDocument:v18];

      id v19 = [(IKDOMNode *)self managedOwnerDocument];
      [v4 addManagedReference:v19 withOwner:self];

      uint64_t v20 = [(IKDOMNode *)self managedParent];

      if (v20)
      {
        id v21 = [(IKDOMNode *)self managedSelf];
        uint64_t v22 = [(IKDOMNode *)self managedParent];
        uint64_t v23 = [v22 value];
        [v4 removeManagedReference:v21 withOwner:v23];

        int v24 = [(IKDOMNode *)self managedParent];
        [v4 removeManagedReference:v24 withOwner:self];
      }
      [(IKDOMNode *)self setManagedParent:0];
    }
  }
}

- (BOOL)_validateDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  xmlXPathContextPtr v10 = [(IKDOMNode *)self nodePtr];
  uint64_t v11 = [v8 nodePtr];

  uint64_t v12 = [v9 nodePtr];
  if (a3 == 2 && !v9)
  {
    if (v11 && v10)
    {
      if (*(_xmlNode **)(v11 + 40) != v10)
      {
        uint64_t v13 = @"Node to be removed is not one of the children.";
LABEL_20:
        uint64_t v22 = 8;
        goto LABEL_26;
      }
      goto LABEL_31;
    }
    int v14 = ITMLKitGetLogObject(0);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (a3 > 1 || v11)
  {
    if (v11 && v12 && v10)
    {
      if (*(_xmlNode **)(v11 + 40) != v10)
      {
        uint64_t v13 = @"Reference node is not one of the children.";
        goto LABEL_20;
      }
      if (*(_xmlDoc **)(v12 + 64) == v10->doc)
      {
LABEL_31:
        LOBYTE(v23) = 1;
        return v23;
      }
      uint64_t v13 = @"Node to be added doesn't belong to the same document.";
      goto LABEL_30;
    }
    int v14 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
LABEL_24:
    }
      -[IKDOMNode _validateDOMOperation:newNode:refNode:](v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_25:

    uint64_t v13 = 0;
    uint64_t v22 = 0;
    goto LABEL_26;
  }
  if (!v12 || !v10)
  {
    int v14 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (*(_xmlDoc **)(v12 + 64) == v10->doc) {
    goto LABEL_31;
  }
  uint64_t v13 = @"Node to be appended doesn't belong to the same document.";
LABEL_30:
  uint64_t v22 = 4;
LABEL_26:
  uint64_t v23 = [(__CFString *)v13 length];
  if (v23)
  {
    int v24 = [(IKJSObject *)self appContext];
    id v25 = [(IKJSObject *)self appContext];
    uint64_t v26 = +[IKDOMException exceptionWithAppContext:v25 code:v22];
    [v24 setException:v26 withErrorMessage:v13];

    LOBYTE(v23) = 0;
  }
  return v23;
}

- (_xmlNode)_insertNode:(_xmlNode *)a3 refNode:(_xmlNode *)a4 operation:(unint64_t)a5
{
  id v6 = a3;
  parent = a3->parent;
  if (a5 != 2)
  {
    if (parent) {
      xmlUnlinkNode(a3);
    }
    if (a5 == 1)
    {
      xmlNodePtr Sibling = xmlAddPrevSibling(a4, v6);
    }
    else
    {
      if (a5) {
        goto LABEL_12;
      }
      xmlNodePtr Sibling = xmlAddNextSibling(a4, v6);
    }
    id v6 = Sibling;
    goto LABEL_12;
  }
  if (parent) {
    xmlUnlinkNode(a3);
  }
  id v8 = xmlReplaceNode(a4, v6);
  xmlUnlinkNode(v8);
  +[IKDOMNode handleNodeParentDidChange:v8];
LABEL_12:
  +[IKDOMNode handleNodeParentDidChange:v6];
  return v6;
}

- (_xmlNode)_appendNode:(_xmlNode *)a3
{
  xmlUnlinkNode(a3);
  BOOL v5 = xmlAddChild([(IKDOMNode *)self nodePtr], a3);
  +[IKDOMNode handleNodeParentDidChange:v5];
  return v5;
}

- (void)_notifyUpdatesToDOMObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(IKDOMNode *)self domObservers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) domDidUpdateForContextNode:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updatedAndMark:(BOOL)a3 withDocument:(id)a4
{
  BOOL v4 = a3;
  if ([a4 markUpdated])
  {
    uint64_t v6 = [(IKDOMNode *)self jsNodeData];
    uint64_t v7 = v6;
    if (v4) {
      [v6 setUpdated:1];
    }
    else {
      [v6 setSubtreeUpdated:1];
    }

    [(IKDOMNode *)self _markSubtreeUpdatesForAncestorsOfNode:self];
  }
}

- (void)_childrenUpdatedWithUpdatedChildNodes:(id)a3 withDocument:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 markUpdated])
  {
    uint64_t v7 = [(IKDOMNode *)self jsNodeData];
    [v7 setChildrenUpdated:1];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "jsNodeData", (void)v14);
          [v13 setUpdated:1];
          [v13 setDataResolved:0];
          [v13 setPrototypesResolved:0];
          [v13 setRulesParsed:0];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [(IKDOMNode *)self _markSubtreeUpdatesForAncestorsOfNode:self];
  }
}

- (void)_markSubtreeUpdatesForAncestorsOfNode:(id)a3
{
  uint64_t v3 = [(IKDOMNode *)self parentNode];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    do
    {
      uint64_t v5 = [v3 jsNodeData];
      [v5 setSubtreeUpdated:1];

      uint64_t v7 = [v3 parentNode];

      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v6 = v7;
      uint64_t v3 = (void *)v7;
    }
    while ((isKindOfClass & 1) != 0);
  }
  else
  {
    uint64_t v6 = (uint64_t)v3;
  }
  MEMORY[0x1F41817F8](isKindOfClass, v6);
}

- (BOOL)_enumerateNodesWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (uint64_t (**)(id, IKDOMNode *))a3;
  if (v4[2](v4, self))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [(IKDOMNode *)self childNodesAsArray];
    uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) _enumerateNodesWithBlock:v4])
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (IKDOMDocument)managedOwnerDocument
{
  return self->_managedOwnerDocument;
}

- (void)setManagedOwnerDocument:(id)a3
{
}

- (JSManagedValue)managedParent
{
  return self->_managedParent;
}

- (void)setManagedParent:(id)a3
{
}

- (JSManagedValue)managedChildNodeList
{
  return self->_managedChildNodeList;
}

- (void)setManagedChildNodeList:(id)a3
{
}

- (NSMutableDictionary)eventListenersMap
{
  return self->_eventListenersMap;
}

- (void)setEventListenersMap:(id)a3
{
}

- (NSHashTable)domObservers
{
  return self->_domObservers;
}

- (void)setDomObservers:(id)a3
{
}

- (int64_t)ITMLID
{
  return self->_ITMLID;
}

- (void)setITMLID:(int64_t)a3
{
  self->_ITMLID = a3;
}

- (IKDOMNodeData)jsNodeData
{
  return self->_jsNodeData;
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_jsNodeData, 0);
  objc_storeStrong((id *)&self->_domObservers, 0);
  objc_storeStrong((id *)&self->_eventListenersMap, 0);
  objc_storeStrong((id *)&self->_managedChildNodeList, 0);
  objc_storeStrong((id *)&self->_managedParent, 0);
  objc_storeStrong((id *)&self->_managedOwnerDocument, 0);
  objc_storeStrong((id *)&self->_managedDataItem, 0);
}

- (void)_validateDOMOperation:(uint64_t)a3 newNode:(uint64_t)a4 refNode:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end