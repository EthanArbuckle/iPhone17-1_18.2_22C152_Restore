@interface APKRemoteInspector
+ (id)computedStyleWithName:(id)a3 value:(id)a4;
+ (id)nodeWithIdentifier:(int)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6;
+ (id)resourceWithURL:(id)a3 type:(int64_t)a4 MIMEType:(id)a5;
+ (id)styleWithProperties:(id)a3;
- (APKRemoteInspector)initWithName:(id)a3;
- (APKRemoteInspectorCSSAgent)CSSAgent;
- (APKRemoteInspectorDOMAgent)DOMAgent;
- (APKRemoteInspectorNetworkAgent)networkAgent;
- (APKRemoteInspectorPageAgent)pageAgent;
- (BOOL)isConnected;
- (JSContext)context;
- (void)dealloc;
@end

@implementation APKRemoteInspector

- (APKRemoteInspector)initWithName:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)APKRemoteInspector;
  v5 = [(APKRemoteInspector *)&v28 init];
  if (v5)
  {
    JSRemoteInspectorGetInspectionEnabledByDefault();
    JSRemoteInspectorSetInspectionEnabledByDefault();
    v6 = (JSContext *)objc_alloc_init(MEMORY[0x263F10378]);
    context = v5->_context;
    v5->_context = v6;

    [(JSContext *)v5->_context setName:v4];
    [(JSContext *)v5->_context _setITMLDebuggableType];
    [(JSContext *)v5->_context _setDebuggerRunLoop:CFRunLoopGetCurrent()];
    [(JSContext *)v5->_context _setRemoteInspectionEnabled:1];
    JSRemoteInspectorSetInspectionEnabledByDefault();
    v8 = [(JSContext *)v5->_context _inspector];
    v9 = [v8 configuration];

    v26 = [v9 domEventDispatcher];
    v10 = [[APKRemoteInspectorDOMAgent alloc] initWithDispatcher:v26];
    id v27 = v4;
    DOMAgent = v5->_DOMAgent;
    v5->_DOMAgent = v10;
    v12 = v10;

    v13 = [v9 cssEventDispatcher];
    v14 = [[APKRemoteInspectorCSSAgent alloc] initWithDispatcher:v13];
    CSSAgent = v5->_CSSAgent;
    v5->_CSSAgent = v14;
    v16 = v14;

    v17 = [v9 networkEventDispatcher];
    v18 = [[APKRemoteInspectorNetworkAgent alloc] initWithDispatcher:v17];
    networkAgent = v5->_networkAgent;
    v5->_networkAgent = v18;
    v20 = v18;

    v21 = [v9 pageEventDispatcher];
    v22 = [[APKRemoteInspectorPageAgent alloc] initWithDispatcher:v21];
    pageAgent = v5->_pageAgent;
    v5->_pageAgent = v22;
    v24 = v22;

    [v9 setDOMHandler:v12];
    [v9 setCSSHandler:v16];

    [v9 setNetworkHandler:v20];
    [v9 setPageHandler:v24];

    id v4 = v27;
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(JSContext *)self->_context _inspector];
  id v4 = [v3 configuration];

  [v4 setDOMHandler:0];
  [v4 setCSSHandler:0];
  [v4 setNetworkHandler:0];
  [v4 setPageHandler:0];

  v5.receiver = self;
  v5.super_class = (Class)APKRemoteInspector;
  [(APKRemoteInspector *)&v5 dealloc];
}

- (BOOL)isConnected
{
  v2 = [(APKRemoteInspector *)self context];
  v3 = [v2 _inspector];
  char v4 = [v3 connected];

  return v4;
}

+ (id)nodeWithIdentifier:(int)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  v9 = (objc_class *)MEMORY[0x263F86218];
  id v10 = a6;
  id v11 = a4;
  v12 = (void *)[[v9 alloc] initWithNodeId:v8 nodeType:a5 nodeName:v11 localName:v11 nodeValue:v10];

  return v12;
}

+ (id)styleWithProperties:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x263F86208]);
        v12 = objc_msgSend(v5, "objectForKey:", v10, (void)v17);
        v13 = (void *)[v11 initWithName:v10 value:v12];

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_1];
  id v14 = objc_alloc(MEMORY[0x263F86210]);
  v15 = (void *)[v14 initWithCssProperties:v4 shorthandEntries:MEMORY[0x263EFFA68]];

  return v15;
}

uint64_t __42__APKRemoteInspector_styleWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)computedStyleWithName:(id)a3 value:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F86200];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithName:v7 value:v6];

  return v8;
}

+ (id)resourceWithURL:(id)a3 type:(int64_t)a4 MIMEType:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x263F86228];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[[v7 alloc] initWithUrl:v9 type:a4 mimeType:v8];

  return v10;
}

- (JSContext)context
{
  return self->_context;
}

- (APKRemoteInspectorCSSAgent)CSSAgent
{
  return self->_CSSAgent;
}

- (APKRemoteInspectorDOMAgent)DOMAgent
{
  return self->_DOMAgent;
}

- (APKRemoteInspectorNetworkAgent)networkAgent
{
  return self->_networkAgent;
}

- (APKRemoteInspectorPageAgent)pageAgent
{
  return self->_pageAgent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageAgent, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
  objc_storeStrong((id *)&self->_DOMAgent, 0);
  objc_storeStrong((id *)&self->_CSSAgent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end