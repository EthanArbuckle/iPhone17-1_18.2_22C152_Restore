@interface IKJSInspectorNetworkAgent
- (IKJSInspectorController)controller;
- (IKJSInspectorNetworkAgent)initWithInspectorController:(id)a3;
- (id)registerLoaderWithIdentifier:(id)a3;
- (void)addInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6;
- (void)clearAllTrackedLoaders;
- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4;
- (void)getResponseBodyWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5;
- (void)getSerializedCertificateWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5;
- (void)interceptContinueWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5;
- (void)interceptWithResponseWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 content:(id)a6 base64Encoded:(BOOL)a7 mimeType:(id *)a8 status:(int *)a9 statusText:(id *)a10 headers:(id *)a11;
- (void)loadResourceWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6;
- (void)removeInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6;
- (void)resolveWebSocketWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 objectGroup:(id *)a6;
- (void)setExtraHTTPHeadersWithErrorCallback:(id)a3 successCallback:(id)a4 headers:(id)a5;
- (void)setInterceptionEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5;
- (void)setResourceCachingDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 disabled:(BOOL)a5;
- (void)unregisterLoaderWithIdentifier:(id)a3;
@end

@implementation IKJSInspectorNetworkAgent

- (IKJSInspectorNetworkAgent)initWithInspectorController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IKJSInspectorNetworkAgent;
  v5 = [(IKJSInspectorNetworkAgent *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    loaders = v6->_loaders;
    v6->_loaders = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->_loaders objectForKey:v4];
    if (!v5)
    {
      v6 = [(IKJSInspectorNetworkAgent *)self controller];
      uint64_t v7 = [v6 inspector];
      v8 = [v7 configuration];
      v9 = [v8 networkEventDispatcher];

      v5 = [[_IKJSInspectorNetworkLoader alloc] initWithIdentifier:v4 parentIdentifier:@"Page" agent:self dispatcher:v9];
      [(NSMutableDictionary *)self->_loaders setObject:v5 forKey:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)unregisterLoaderWithIdentifier:(id)a3
{
  if (a3) {
    -[NSMutableDictionary removeObjectForKey:](self->_loaders, "removeObjectForKey:");
  }
}

- (void)clearAllTrackedLoaders
{
}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
}

- (void)setExtraHTTPHeadersWithErrorCallback:(id)a3 successCallback:(id)a4 headers:(id)a5
{
}

- (void)getResponseBodyWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v8 = (void (**)(id, id, uint64_t))a4;
  id v9 = a5;
  objc_super v10 = (void *)[(NSMutableDictionary *)self->_loaders mutableCopy];
  v11 = [(IKJSInspectorNetworkAgent *)self controller];
  v12 = [v11 requestLoader];

  v13 = [v12 identifier];
  [v10 setObject:v12 forKey:v13];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [v14 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * v18)];
        v20 = [v19 requestRecords];
        v21 = [v20 objectForKey:v9];

        if (v21)
        {

          v23 = [v21 responseBodyData];
          if ([v21 resourceType] == 3 || !objc_msgSend(v21, "resourceType"))
          {
            uint64_t v25 = [v23 base64EncodedStringWithOptions:0];
            v26 = (void *)v25;
            v27 = &stru_1F3E09950;
            if (v25) {
              v27 = (__CFString *)v25;
            }
            v24 = v27;

            v8[2](v8, v24, 1);
          }
          else
          {
            v24 = (__CFString *)[[NSString alloc] initWithData:v23 encoding:4];
            v8[2](v8, v24, 0);
          }
          v22 = v28;

          goto LABEL_17;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v22 = v28;
  (*((void (**)(id, __CFString *))v28 + 2))(v28, @"Unknown requestId");
LABEL_17:
}

- (void)setResourceCachingDisabledWithErrorCallback:(id)a3 successCallback:(id)a4 disabled:(BOOL)a5
{
  BOOL v5 = a5;
  v6 = (void *)MEMORY[0x1E4F1CB18];
  v8 = (void (**)(void))a4;
  uint64_t v7 = [v6 standardUserDefaults];
  [v7 setBool:v5 forKey:@"IgnoreLocalHTTPCache"];

  v8[2]();
}

- (void)loadResourceWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
}

- (void)resolveWebSocketWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 objectGroup:(id *)a6
{
}

- (void)getSerializedCertificateWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
}

- (void)setInterceptionEnabledWithErrorCallback:(id)a3 successCallback:(id)a4 enabled:(BOOL)a5
{
}

- (void)addInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6
{
}

- (void)removeInterceptionWithErrorCallback:(id)a3 successCallback:(id)a4 url:(id)a5 stage:(int64_t *)a6
{
}

- (void)interceptContinueWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5
{
}

- (void)interceptWithResponseWithErrorCallback:(id)a3 successCallback:(id)a4 requestId:(id)a5 content:(id)a6 base64Encoded:(BOOL)a7 mimeType:(id *)a8 status:(int *)a9 statusText:(id *)a10 headers:(id *)a11
{
}

- (IKJSInspectorController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (IKJSInspectorController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_loaders, 0);
}

@end