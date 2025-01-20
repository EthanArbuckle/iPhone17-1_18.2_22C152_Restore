@interface IKDOMDocument
+ (_xmlDoc)_documentWithXMLStr:(id)a3 lsInput:(id)a4 error:(id *)a5;
+ (void)_resetUpdatesForNode:(id)a3;
- (BOOL)isEmbeddedScriptExecuted;
- (BOOL)markUpdated;
- (BOOL)strictErrorChecking;
- (BOOL)xmlStandalone;
- (IKDOMDocument)initWithAppContext:(id)a3;
- (IKDOMDocument)initWithAppContext:(id)a3 input:(id)a4 error:(id *)a5;
- (IKDOMDocument)initWithAppContext:(id)a3 qualifiedName:(id)a4;
- (IKDOMDocument)initWithAppContext:(id)a3 xmlStr:(id)a4 error:(id *)a5;
- (IKDOMElement)documentElement;
- (IKDOMImplementation)implementation;
- (IKJSDOMDocumentAppBridge)appBridge;
- (IKJSNavigationDocument)navigationDocument;
- (IKNetworkRequestLoader)_requestLoader;
- (NSString)_documentURI;
- (NSString)inputEncoding;
- (NSString)xmlEncoding;
- (NSString)xmlVersion;
- (id)adoptNode:(id)a3;
- (id)asPrivateIKJSDOMDocument;
- (id)createCDATASection:(id)a3;
- (id)createComment:(id)a3;
- (id)createDocumentFragment;
- (id)createElement:(id)a3;
- (id)createExpression:(id)a3 :(id)a4;
- (id)createTextNode:(id)a3;
- (id)evaluate:(id)a3 :(id)a4 :(id)a5 :(int64_t)a6 :(id)a7;
- (id)getElementById:(id)a3;
- (id)getElementsByTagName:(id)a3;
- (id)matchingImpressions:(id)a3 :(id)a4;
- (id)nodeName;
- (id)recordedImpressions:(id)a3;
- (id)snapshotImpressions;
- (int64_t)nodeType;
- (unint64_t)itmlIDSequence;
- (void)_executeEmbeddedScriptWithExtraInfo:(id)a3;
- (void)_setDocumentURI:(id)a3;
- (void)_updateITMLIDRecursivelyForNodePtr:(_xmlNode *)a3;
- (void)dealloc;
- (void)prepareForPresentationWithExtraInfo:(id)a3;
- (void)recordedImpressions:(id)a3 :(id)a4;
- (void)recordedImpressionsMatching:(id)a3 :(id)a4 :(id)a5;
- (void)replace:(id)a3;
- (void)runTest:(id)a3 :(id)a4;
- (void)scrollToTop;
- (void)setAppBridge:(id)a3;
- (void)setEmbeddedScriptExecuted:(BOOL)a3;
- (void)setITMLIDForNode:(id)a3;
- (void)setItmlIDSequence:(unint64_t)a3;
- (void)setNavigationDocument:(id)a3;
- (void)setNeedsUpdate;
- (void)swapITMLIDForNode:(id)a3 withITMLIDForNode:(id)a4;
@end

@implementation IKDOMDocument

- (id)asPrivateIKJSDOMDocument
{
  if ([(IKDOMDocument *)self conformsToProtocol:&unk_1F3E48758]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKDOMDocument)initWithAppContext:(id)a3
{
  id v4 = a3;
  v5 = [(IKDOMNode *)self initWithAppContext:v4 xmlNode:xmlNewDoc((const xmlChar *)"1.0")];

  return v5;
}

- (IKDOMDocument)initWithAppContext:(id)a3 xmlStr:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(id)objc_opt_class() _documentWithXMLStr:v9 lsInput:0 error:a5];

  if (v10)
  {
    self = [(IKDOMNode *)self initWithAppContext:v8 xmlNode:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (IKDOMDocument)initWithAppContext:(id)a3 input:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(id)objc_opt_class() _documentWithXMLStr:0 lsInput:v9 error:a5];

  if (v10)
  {
    self = [(IKDOMNode *)self initWithAppContext:v8 xmlNode:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (IKDOMDocument)initWithAppContext:(id)a3 qualifiedName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = xmlNewDoc(0);
  v15.receiver = self;
  v15.super_class = (Class)IKDOMDocument;
  id v9 = [(IKDOMNode *)&v15 initWithAppContext:v7 xmlNode:v8];

  if (v9)
  {
    uint64_t v10 = [(IKDOMDocument *)v9 createElement:v6];
    v11 = v10;
    if (v10)
    {
      v12 = (xmlNode *)[v10 nodePtr];
      xmlNodePtr v13 = xmlDocSetRootElement(v8, v12);
      if (v13) {
        +[IKDOMNode handleNodeParentDidChange:v13];
      }
      +[IKDOMNode handleNodeParentDidChange:v12];
    }
  }
  return v9;
}

- (void)dealloc
{
  if (self->__requestLoader)
  {
    v3 = [(IKJSObject *)self appContext];
    id v4 = [v3 webInspectorController];
    v5 = [(IKDOMDocument *)self _requestLoader];
    id v6 = [v5 identifier];
    [v4 unregisterLoaderWithIdentifier:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)IKDOMDocument;
  [(IKDOMNode *)&v7 dealloc];
}

- (void)setAppBridge:(id)a3
{
  v3 = self;
  p_appBridge = &self->_appBridge;
  id v5 = a3;
  objc_storeWeak((id *)p_appBridge, v5);
  p_appBridgeFlags = &v3->_appBridgeFlags;
  v3->_appBridgeFlags.hasSetNeedsUpdate = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasSnapshotImpressions = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressions = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressionsCallback = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressionsMatchingCallback = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasImpressionsMatchingTag = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasScrollToTop = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_appBridgeFlags->hasRunTest = v3 & 1;
}

- (void)prepareForPresentationWithExtraInfo:(id)a3
{
  id v4 = a3;
  if (![(IKDOMDocument *)self isEmbeddedScriptExecuted]) {
    [(IKDOMDocument *)self _executeEmbeddedScriptWithExtraInfo:v4];
  }
}

- (BOOL)markUpdated
{
  v3 = [(IKDOMDocument *)self appBridge];
  if (v3)
  {
    id v4 = [(IKDOMDocument *)self appBridge];
    if ([v4 conformsToProtocol:&unk_1F3E44338])
    {
      id v5 = [(IKDOMDocument *)self appBridge];
      int v6 = [v5 _isUpdateAllowed];

      if (!v6)
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    else
    {
    }
    objc_super v7 = [(IKDOMNode *)self jsNodeData];
    char v8 = [v7 isUpdated];

    if (v8)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v9 = [(IKDOMNode *)self jsNodeData];
      LOBYTE(v3) = 1;
      [v9 setUpdated:1];

      uint64_t v10 = [(IKJSObject *)self appContext];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __28__IKDOMDocument_markUpdated__block_invoke;
      v12[3] = &unk_1E6DE4108;
      v12[4] = self;
      [v10 addPostEvaluateBlock:v12];
    }
  }
  return (char)v3;
}

uint64_t __28__IKDOMDocument_markUpdated__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appBridge];
  [v2 updateForDocument:*(void *)(a1 + 32)];

  v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 _resetUpdatesForNode:v4];
}

- (void)setNavigationDocument:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F30938];
    id v5 = a3;
    int v6 = [(IKJSObject *)self appContext];
    objc_super v7 = [v6 jsContext];
    id v8 = [v4 valueWithObject:v5 inContext:v7];
  }
  else
  {
    id v8 = 0;
  }
  [(IKJSObject *)self setJSValue:v8 forProperty:@"navigationDocument"];
}

- (IKDOMImplementation)implementation
{
  v3 = [IKDOMImplementation alloc];
  uint64_t v4 = [(IKJSObject *)self appContext];
  id v5 = [(IKJSObject *)v3 initWithAppContext:v4];

  return v5;
}

- (IKDOMElement)documentElement
{
  v3 = [(IKDOMNode *)self nodePtr];
  if (v3 && (xmlNodePtr RootElement = xmlDocGetRootElement((const xmlDoc *)v3)) != 0)
  {
    xmlNodePtr v5 = RootElement;
    int v6 = [(IKJSObject *)self appContext];
    objc_super v7 = +[IKDOMNode nodeWithAppContext:v6 nodePtr:v5];
  }
  else
  {
    objc_super v7 = 0;
  }
  return (IKDOMElement *)v7;
}

- (NSString)inputEncoding
{
  return 0;
}

- (NSString)xmlEncoding
{
  return 0;
}

- (BOOL)xmlStandalone
{
  return 0;
}

- (NSString)xmlVersion
{
  return (NSString *)@"1.0";
}

- (BOOL)strictErrorChecking
{
  return 0;
}

- (id)createElement:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMNode *)self nodePtr];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = 0;
    if ([v4 length] && v5)
    {
      xmlNodePtr v7 = xmlNewDocNode((xmlDocPtr)v5, 0, (const xmlChar *)[v4 UTF8String], 0);
      id v8 = [(IKJSObject *)self appContext];
      int v6 = +[IKDOMNode nodeWithAppContext:v8 nodePtr:v7];
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)createDocumentFragment
{
  v3 = [(IKDOMNode *)self nodePtr];
  if (v3)
  {
    xmlNodePtr v4 = xmlNewDocFragment((xmlDocPtr)v3);
    xmlNodePtr v5 = [(IKJSObject *)self appContext];
    int v6 = +[IKDOMNode nodeWithAppContext:v5 nodePtr:v4];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)createTextNode:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMNode *)self nodePtr];
  if (v5)
  {
    int v6 = (const xmlDoc *)v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 length]) {
        xmlNodePtr v7 = v4;
      }
      else {
        xmlNodePtr v7 = 0;
      }
    }
    else
    {
      xmlNodePtr v7 = 0;
    }
    xmlNodePtr v9 = xmlNewDocText(v6, (const xmlChar *)[v7 UTF8String]);
    uint64_t v10 = [(IKJSObject *)self appContext];
    id v8 = +[IKDOMNode nodeWithAppContext:v10 nodePtr:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)createComment:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMNode *)self nodePtr];
  if (v5)
  {
    int v6 = (xmlDoc *)v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 length]) {
        xmlNodePtr v7 = v4;
      }
      else {
        xmlNodePtr v7 = 0;
      }
    }
    else
    {
      xmlNodePtr v7 = 0;
    }
    xmlNodePtr v9 = xmlNewDocComment(v6, (const xmlChar *)[v7 UTF8String]);
    uint64_t v10 = [(IKJSObject *)self appContext];
    id v8 = +[IKDOMNode nodeWithAppContext:v10 nodePtr:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)createCDATASection:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMNode *)self nodePtr];
  if (v5)
  {
    int v6 = (xmlDoc *)v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v4 length]) {
        xmlNodePtr v7 = v4;
      }
      else {
        xmlNodePtr v7 = 0;
      }
    }
    else
    {
      xmlNodePtr v7 = 0;
    }
    xmlNodePtr v9 = (const char *)[v7 UTF8String];
    uint64_t v10 = (const xmlChar *)v9;
    if (v9) {
      int v11 = strlen(v9);
    }
    else {
      int v11 = 0;
    }
    xmlNodePtr v12 = xmlNewCDataBlock(v6, v10, v11);
    xmlNodePtr v13 = [(IKJSObject *)self appContext];
    id v8 = +[IKDOMNode nodeWithAppContext:v13 nodePtr:v12];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)getElementsByTagName:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKJSObject *)self appContext];
  int v6 = [@"//" stringByAppendingString:v4];

  xmlNodePtr v7 = +[IKDOMNodeList nodeListWithAppContext:v5 contextNode:self xpath:v6];

  return v7;
}

- (id)getElementById:(id)a3
{
  id v4 = [NSString stringWithFormat:@"//*[@id='%@']", a3];
  id v10 = 0;
  xmlNodePtr v5 = [(IKDOMNode *)self nodesForXPath:v4 error:&v10];
  id v6 = v10;

  if (v6)
  {
    xmlNodePtr v7 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IKDOMDocument getElementById:]((uint64_t)v6, v7);
    }
  }
  id v8 = [v5 firstObject];

  return v8;
}

- (id)adoptNode:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMNode *)self nodePtr];
  uint64_t v6 = [v4 nodePtr];
  if (!v5 || (xmlNodePtr v7 = (xmlNode *)v6) == 0)
  {
    int v11 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[IKDOMDocument adoptNode:](v11);
    }

    goto LABEL_8;
  }
  if (*(_DWORD *)(v6 + 8) == 9)
  {
    id v8 = [(IKJSObject *)self appContext];
    xmlNodePtr v9 = [(IKJSObject *)self appContext];
    id v10 = +[IKDOMException exceptionWithAppContext:v9 code:9];
    [v8 setException:v10 withErrorMessage:@"Cannot adopt document"];

LABEL_8:
    id v12 = 0;
    goto LABEL_10;
  }
  xmlNodePtr v13 = [v4 parentNode];
  [v13 childrenUpdatedWithUpdatedChildNodes:0 notify:1];

  xmlUnlinkNode(v7);
  xmlSetTreeDoc(v7, (xmlDocPtr)v5);
  [(IKDOMDocument *)self _updateITMLIDRecursivelyForNodePtr:v7];
  +[IKDOMNode handleNodeParentDidChange:v7];
  id v12 = v4;
LABEL_10:

  return v12;
}

- (id)createExpression:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [IKDOMXPathExpression alloc];
  xmlNodePtr v9 = [(IKJSObject *)self appContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__IKDOMDocument_createExpression::__block_invoke;
  v13[3] = &unk_1E6DE4B70;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v14 = v10;
  int v11 = [(IKDOMXPathExpression *)v8 initWithAppContext:v9 evaluatingBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

id __35__IKDOMDocument_createExpression::__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  xmlNodePtr v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained evaluate:*(void *)(a1 + 32) :v6 :0 :a3 :0];

  return v8;
}

- (id)evaluate:(id)a3 :(id)a4 :(id)a5 :(int64_t)a6 :(id)a7
{
  id v12 = a3;
  xmlNodePtr v13 = (IKDOMDocument *)a4;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    uint64_t v27 = 0;
    v16 = (id *)&v27;
    v17 = &v27;
    v18 = v13;
  }
  else
  {
    uint64_t v26 = 0;
    v16 = (id *)&v26;
    v17 = &v26;
    v18 = self;
  }
  v19 = -[IKDOMNode nodesForXPath:error:](v18, "nodesForXPath:error:", v12, v17, v26, v27);
  id v20 = *v16;
  if (v20)
  {
    v21 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[IKDOMDocument getElementById:]((uint64_t)v20, v21);
    }
  }
  v22 = [IKDOMXPathResult alloc];
  v23 = [(IKJSObject *)self appContext];
  v24 = [(IKDOMXPathResult *)v22 initWithAppContext:v23 type:a6 nodes:v19];

  return v24;
}

- (void)setNeedsUpdate
{
  if (self->_appBridgeFlags.hasSetNeedsUpdate)
  {
    id v3 = [(IKDOMDocument *)self appBridge];
    [v3 setNeedsUpdateForDocument:self];
  }
}

- (void)replace:(id)a3
{
  id v4 = a3;
  xmlNodePtr v5 = [(IKDOMDocument *)self documentElement];
  id v6 = [v4 documentElement];
  if (+[IKPreference logDocumentXML])
  {
    id v7 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[IKDOMDocument replace:]((uint64_t)v4, v7);
    }
  }
  id v8 = [(IKDOMDocument *)self adoptNode:v6];

  if (v8) {
    id v9 = [(IKDOMNode *)self replaceChild:v6 :v5];
  }
}

- (IKJSNavigationDocument)navigationDocument
{
  v2 = [(IKJSObject *)self jsValueForProperty:@"navigationDocument"];
  id v3 = [v2 toObjectOfClass:objc_opt_class()];

  return (IKJSNavigationDocument *)v3;
}

- (void)runTest:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_appBridgeFlags.hasRunTest)
  {
    id v8 = [(IKJSObject *)self appContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__IKDOMDocument_runTest::__block_invoke;
    v9[3] = &unk_1E6DE4B98;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [v8 addPostEvaluateBlock:v9];
  }
}

void __26__IKDOMDocument_runTest::__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appBridge];
  [v2 runTestWithName:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (void)scrollToTop
{
  if (self->_appBridgeFlags.hasScrollToTop)
  {
    id v3 = [(IKJSObject *)self appContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __28__IKDOMDocument_scrollToTop__block_invoke;
    v4[3] = &unk_1E6DE4108;
    v4[4] = self;
    [v3 addPostEvaluateBlock:v4];
  }
}

void __28__IKDOMDocument_scrollToTop__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) appBridge];
  [v1 scrollToTop];
}

- (id)snapshotImpressions
{
  if (self->_appBridgeFlags.hasSnapshotImpressions)
  {
    id v2 = [(IKDOMDocument *)self appBridge];
    id v3 = [v2 snapshotImpressions];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)recordedImpressions:(id)a3
{
  id v4 = a3;
  if ([v4 isBoolean]) {
    uint64_t v5 = [v4 toBool];
  }
  else {
    uint64_t v5 = 1;
  }
  if (self->_appBridgeFlags.hasRecordedImpressions)
  {
    id v6 = [(IKDOMDocument *)self appBridge];
    id v7 = [v6 recordedImpressions:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)matchingImpressions:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isBoolean]) {
    uint64_t v8 = [v7 toBool];
  }
  else {
    uint64_t v8 = 1;
  }
  if (self->_appBridgeFlags.hasImpressionsMatchingTag)
  {
    id v9 = [(IKDOMDocument *)self appBridge];
    id v10 = [v9 impressionsMatching:v6 reset:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)recordedImpressions:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_appBridgeFlags.hasRecordedImpressionsCallback)
  {
    if ([v6 isBoolean]) {
      uint64_t v8 = [v6 toBool];
    }
    else {
      uint64_t v8 = 1;
    }
    id v9 = [MEMORY[0x1E4F30928] managedValueWithValue:v7];
    id v10 = [v7 context];
    id v11 = [v10 virtualMachine];

    [v11 addManagedReference:v9 withOwner:self];
    objc_initWeak(&location, self);
    id v12 = [(IKDOMDocument *)self appBridge];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__IKDOMDocument_recordedImpressions::__block_invoke;
    v15[3] = &unk_1E6DE4BC0;
    objc_copyWeak(&v18, &location);
    id v13 = v9;
    id v16 = v13;
    id v14 = v11;
    id v17 = v14;
    [v12 recordedImpressions:v8 completion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __38__IKDOMDocument_recordedImpressions::__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = [v5 value];
      v9[0] = v3;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      id v8 = (id)[v6 callWithArguments:v7];

      [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:WeakRetained];
    }
  }
}

- (void)recordedImpressionsMatching:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_appBridgeFlags.hasRecordedImpressionsMatchingCallback)
  {
    if ([v9 isBoolean]) {
      uint64_t v11 = [v9 toBool];
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = [MEMORY[0x1E4F30928] managedValueWithValue:v10];
    id v13 = [v10 context];
    id v14 = [v13 virtualMachine];

    [v14 addManagedReference:v12 withOwner:self];
    objc_initWeak(&location, self);
    id v15 = [(IKDOMDocument *)self appBridge];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__IKDOMDocument_recordedImpressionsMatching_::__block_invoke;
    v18[3] = &unk_1E6DE4BC0;
    objc_copyWeak(&v21, &location);
    id v16 = v12;
    id v19 = v16;
    id v17 = v14;
    id v20 = v17;
    [v15 recordedImpressionsMatching:v8 reset:v11 completion:v18];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __47__IKDOMDocument_recordedImpressionsMatching_::__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = [v5 value];
      v9[0] = v3;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      id v8 = (id)[v6 callWithArguments:v7];

      [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:WeakRetained];
    }
  }
}

- (id)nodeName
{
  return @"#document";
}

- (int64_t)nodeType
{
  return 9;
}

+ (void)_resetUpdatesForNode:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 jsNodeData];
  if (([v5 isUpdated] & 1) != 0
    || ([v5 isChildrenUpdated] & 1) != 0
    || [v5 isSubtreeUpdated])
  {
    [v5 setUpdated:0];
    [v5 setChildrenUpdated:0];
    [v5 setSubtreeUpdated:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 documentElement];
      id v7 = (void *)v6;
      if (v6)
      {
        v19[0] = v6;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v4 childElements];
      }
      else
      {
        id v8 = 0;
      }
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1, "_resetUpdatesForNode:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (IKNetworkRequestLoader)_requestLoader
{
  requestLoader = self->__requestLoader;
  if (!requestLoader)
  {
    id v4 = NSString;
    uint64_t v5 = [(IKDOMDocument *)self documentElement];
    uint64_t v6 = objc_msgSend(v5, "ik_templateName");
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSince1970];
    id v9 = [v4 stringWithFormat:@"%@-%f", v6, v8];

    uint64_t v10 = [(IKJSObject *)self appContext];
    uint64_t v11 = [v10 webInspectorController];
    uint64_t v12 = [v11 registerLoaderWithIdentifier:v9];
    id v13 = self->__requestLoader;
    self->__requestLoader = v12;

    requestLoader = self->__requestLoader;
  }
  return requestLoader;
}

- (void)setITMLIDForNode:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 nodePtr];
  unint64_t v5 = self->_itmlIDSequence + 1;
  self->_itmlIDSequence = v5;
  [v8 setITMLID:v5];
  if (v4 && *(_DWORD *)(v4 + 8) == 1)
  {
    id v6 = v8;
    id v7 = +[IKDOMNode ITMLIDStringforITMLID:v5];
    [v6 setAttributeValue:v7 withName:@"itmlID"];
  }
}

- (void)swapITMLIDForNode:(id)a3 withITMLIDForNode:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v8 getAttribute:@"itmlID"];
      id v7 = [v5 getAttribute:@"itmlID"];
      [v8 setAttributeValue:v7 withName:@"itmlID"];
      [v5 setAttributeValue:v6 withName:@"itmlID"];
    }
  }
}

+ (_xmlDoc)_documentWithXMLStr:(id)a3 lsInput:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    id v10 = [v8 stringData];
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v10 dataUsingEncoding:4];
  if (!v12)
  {
    uint64_t v12 = [v9 byteStream];

    if (v12)
    {
      uint64_t v12 = [v9 byteStream];
    }
  }
  xmlSetGenericErrorFunc((void *)*MEMORY[0x1E4F143C8], MEMORY[0x1E4F14830]);
  id v13 = v12;
  xmlDocPtr Memory = xmlReadMemory((const char *)[v13 bytes], objc_msgSend(v13, "length"), 0, 0, 4096);
  if (Memory)
  {
    xmlDocPtr v15 = Memory;
    xmlSetGenericErrorFunc(0, 0);
LABEL_9:
    xmlNodePtr RootElement = xmlDocGetRootElement(v15);
    IKXMLStripSpaces((uint64_t)RootElement);
    goto LABEL_20;
  }
  xmlErrorPtr LastError = xmlGetLastError();
  if (LastError->domain != 1 || !v11 || LastError->code != 9) {
    goto LABEL_17;
  }
  id v18 = objc_msgSend(v11, "ik_stringByTrimmingControlChars");
  id v19 = [v18 dataUsingEncoding:4];

  if (![v19 length])
  {
    id v13 = v19;
LABEL_17:
    xmlSetGenericErrorFunc(0, 0);
    goto LABEL_18;
  }
  id v13 = v19;
  xmlDocPtr v15 = xmlReadMemory((const char *)[v13 bytes], objc_msgSend(v13, "length"), 0, 0, 4096);
  xmlSetGenericErrorFunc(0, 0);
  if (v15) {
    goto LABEL_9;
  }
LABEL_18:
  xmlDocPtr v15 = 0;
  if (a5) {
    *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ITMLKitErrorDomain" code:200 userInfo:0];
  }
LABEL_20:

  return v15;
}

- (void)_updateITMLIDRecursivelyForNodePtr:(_xmlNode *)a3
{
  +[IKDOMNode nodeForNodePtr:](IKDOMNode, "nodeForNodePtr:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8) {
    [(IKDOMDocument *)self setITMLIDForNode:v8];
  }
  xmlElementType type = a3->type;
  if (type == XML_DOCUMENT_FRAG_NODE || type == XML_ELEMENT_NODE)
  {
    for (uint64_t i = a3->children; i; uint64_t i = i->next)
      [(IKDOMDocument *)self _updateITMLIDRecursivelyForNodePtr:i];
  }
}

- (void)_executeEmbeddedScriptWithExtraInfo:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = [(IKDOMDocument *)self documentElement];
  id v6 = [v5 childElements];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v12 = [v11 nodeName];
        int v13 = [v12 isEqualToString:@"head"];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  xmlDocPtr v15 = [v14 childElements];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v41 = self;
    id v18 = v4;
    uint64_t v19 = *(void *)v43;
LABEL_13:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v43 != v19) {
        objc_enumerationMutation(v15);
      }
      id v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
      v22 = [v21 nodeName];
      char v23 = [v22 isEqualToString:@"script"];

      if (v23) {
        break;
      }
      if (v17 == ++v20)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v17) {
          goto LABEL_13;
        }
        id v24 = v15;
        id v4 = v18;
        goto LABEL_31;
      }
    }
    id v24 = v21;

    id v4 = v18;
    if (!v24) {
      goto LABEL_32;
    }
    v25 = [v24 textContent];
    uint64_t v26 = [v24 getAttribute:@"src"];
    uint64_t v27 = [MEMORY[0x1E4F30920] currentContext];
    uint64_t v28 = [v26 length];
    if (v28)
    {
      v29 = NSString;
      v30 = __53__IKDOMDocument__executeEmbeddedScriptWithExtraInfo___block_invoke(v28, v25);
      v31 = [v29 stringWithFormat:@"script_%@", v30];

      v32 = [v27 objectForKeyedSubscript:v31];
      if (![v32 isUndefined])
      {
LABEL_30:

        v38 = [MEMORY[0x1E4F30938] valueWithObject:v41 inContext:v27];
        v50[0] = v38;
        v50[1] = v18;
        id v4 = v18;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
        id v40 = (id)[v32 invokeMethod:@"call" withArguments:v39];

        goto LABEL_31;
      }
      v33 = [NSString stringWithFormat:@"function %@(extraInfo) { \n%@\n }", v31, v25];
      if (v26)
      {
        v34 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
        id v35 = (id)[v27 evaluateScript:v33 withSourceURL:v34];
      }
      else
      {
        id v37 = (id)[v27 evaluateScript:v33 withSourceURL:0];
      }
      uint64_t v36 = [v27 objectForKeyedSubscript:v31];
    }
    else
    {
      v31 = [v27 objectForKeyedSubscript:@"Function"];
      v51[0] = @"extraInfo";
      v51[1] = v25;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
      uint64_t v36 = [v31 constructWithArguments:v33];
    }

    v32 = (void *)v36;
    goto LABEL_30;
  }
  id v24 = v15;
LABEL_31:

LABEL_32:
}

id __53__IKDOMDocument__executeEmbeddedScriptWithExtraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 length])
  {
    id v3 = [v2 dataUsingEncoding:4];
    memset(&c, 0, sizeof(c));
    CC_SHA1_Init(&c);
    id v4 = v3;
    CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
    id v5 = objc_opt_new();
    for (uint64_t i = 0; i != 20; ++i)
      objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);
    uint64_t v7 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (IKJSDOMDocumentAppBridge)appBridge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  return (IKJSDOMDocumentAppBridge *)WeakRetained;
}

- (BOOL)isEmbeddedScriptExecuted
{
  return self->_embeddedScriptExecuted;
}

- (void)setEmbeddedScriptExecuted:(BOOL)a3
{
  self->_embeddedScriptExecuted = a3;
}

- (unint64_t)itmlIDSequence
{
  return self->_itmlIDSequence;
}

- (void)setItmlIDSequence:(unint64_t)a3
{
  self->_itmlIDSequence = a3;
}

- (NSString)_documentURI
{
  return self->__documentURI;
}

- (void)_setDocumentURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documentURI, 0);
  objc_destroyWeak((id *)&self->_appBridge);
  objc_storeStrong((id *)&self->__requestLoader, 0);
}

- (void)getElementById:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)adoptNode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_ERROR, "Invalid arguments to adopt node", v1, 2u);
}

- (void)replace:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "ITML: Replacing current document with XML: %@", (uint8_t *)&v2, 0xCu);
}

@end