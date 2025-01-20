@interface WKUserContentController
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
- (NSArray)_userStyleSheets;
- (NSArray)userScripts;
- (Object)_apiObject;
- (WKUserContentController)init;
- (void)_addContentRuleList:(id)a3 extensionBaseURL:(id)a4;
- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 contentWorld:(id)a5;
- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 userContentWorld:(id)a5;
- (void)_addScriptMessageHandler:(void *)a3;
- (void)_addUserContentFilter:(id)a3;
- (void)_addUserScriptImmediately:(id)a3;
- (void)_addUserStyleSheet:(id)a3;
- (void)_removeAllScriptMessageHandlersAssociatedWithUserContentWorld:(id)a3;
- (void)_removeAllUserContentFilters;
- (void)_removeAllUserScriptsAssociatedWithContentWorld:(id)a3;
- (void)_removeAllUserStyleSheets;
- (void)_removeAllUserStyleSheetsAssociatedWithContentWorld:(id)a3;
- (void)_removeScriptMessageHandlerForName:(id)a3 userContentWorld:(id)a4;
- (void)_removeUserContentFilter:(id)a3;
- (void)_removeUserScript:(id)a3;
- (void)_removeUserStyleSheet:(id)a3;
- (void)addContentRuleList:(WKContentRuleList *)contentRuleList;
- (void)addScriptMessageHandler:(id)scriptMessageHandler contentWorld:(WKContentWorld *)world name:(NSString *)name;
- (void)addScriptMessageHandler:(id)scriptMessageHandler name:(NSString *)name;
- (void)addScriptMessageHandlerWithReply:(id)scriptMessageHandlerWithReply contentWorld:(WKContentWorld *)contentWorld name:(NSString *)name;
- (void)addUserScript:(WKUserScript *)userScript;
- (void)dealloc;
- (void)removeAllContentRuleLists;
- (void)removeAllScriptMessageHandlers;
- (void)removeAllScriptMessageHandlersFromContentWorld:(WKContentWorld *)contentWorld;
- (void)removeAllUserScripts;
- (void)removeContentRuleList:(WKContentRuleList *)contentRuleList;
- (void)removeScriptMessageHandlerForName:(NSString *)name;
- (void)removeScriptMessageHandlerForName:(NSString *)name contentWorld:(WKContentWorld *)contentWorld;
@end

@implementation WKUserContentController

- (WKUserContentController)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKUserContentController;
  v2 = [(WKUserContentController *)&v5 init];
  v3 = v2;
  if (v2) {
    *((void *)WebKit::WebUserContentControllerProxy::WebUserContentControllerProxy((WebKit::WebUserContentControllerProxy *)[(WKUserContentController *)v2 _apiObject])
  }
    + 1) = v2;
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_userContentControllerProxy;
}

- (void)removeAllContentRuleLists
{
}

- (void)addContentRuleList:(WKContentRuleList *)contentRuleList
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  p_contentRuleList = &contentRuleList->_contentRuleList;
  WTF::URL::URL((WTF::URL *)v7);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, (API::ContentRuleList *)p_contentRuleList, v7);
  v6 = v7[0];
  v7[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKUserContentController accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKUserContentController accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_userContentControllerProxy.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)WKUserContentController;
    [(WKUserContentController *)&v4 dealloc];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)userScripts
{
  return *(NSArray **)(*(void *)self[1]._userContentControllerProxy.data.__lx + 8);
}

- (void)addUserScript:(WKUserScript *)userScript
{
}

- (void)removeAllUserScripts
{
}

- (void)removeContentRuleList:(WKContentRuleList *)contentRuleList
{
}

- (void)_addScriptMessageHandler:(void *)a3
{
  if ((WebKit::WebUserContentControllerProxy::addUserScriptMessageHandler((WebKit::WebUserContentControllerProxy *)&self->_userContentControllerProxy, (WebKit::WebScriptMessageHandler *)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v5 = (WTF::StringImpl *)*((void *)a3 + 4);
    if (v5)
    {
      *(_DWORD *)v5 += 2;
      int v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else
    {
      int v6 = &stru_1EEA10550;
    }
    [v4 raise:*MEMORY[0x1E4F1C3C8], @"Attempt to add script message handler with name '%@' when one already exists.", v6 format];
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v7);
      }
      else
      {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
}

- (void)addScriptMessageHandler:(id)scriptMessageHandler name:(NSString *)name
{
  uint64_t v7 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v7, self, scriptMessageHandler, name);
  uint64_t v14 = v7;
  uint64_t v8 = (API::ContentWorld *)MEMORY[0x19972EAD0](&v13, name);
  v9 = API::ContentWorld::pageContentWorld(v8);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)v9, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  v12 = v15;
  [(WKUserContentController *)self _addScriptMessageHandler:v15];
  if (v12)
  {
    if (v12[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
    }
    else {
      --v12[2];
    }
  }
}

- (void)addScriptMessageHandler:(id)scriptMessageHandler contentWorld:(WKContentWorld *)world name:(NSString *)name
{
  uint64_t v9 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v9, self, scriptMessageHandler, name);
  uint64_t v14 = v9;
  MEMORY[0x19972EAD0](&v13, name);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)&world->_contentWorld, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  v12 = v15;
  [(WKUserContentController *)self _addScriptMessageHandler:v15];
  if (v12)
  {
    if (v12[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
    }
    else {
      --v12[2];
    }
  }
}

- (void)addScriptMessageHandlerWithReply:(id)scriptMessageHandlerWithReply contentWorld:(WKContentWorld *)contentWorld name:(NSString *)name
{
  uint64_t v9 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v9 = &unk_1EE9C4C28;
  *(void *)(v9 + 8) = self;
  if (self) {
    CFRetain(self);
  }
  *(void *)(v9 + 16) = scriptMessageHandlerWithReply;
  if (scriptMessageHandlerWithReply) {
    CFRetain(scriptMessageHandlerWithReply);
  }
  *(void *)(v9 + 24) = [(NSString *)name copy];
  *(unsigned char *)(v9 + 32) = 1;
  uint64_t v14 = v9;
  MEMORY[0x19972EAD0](&v13, name);
  WebKit::WebScriptMessageHandler::create(&v14, (_DWORD **)&v13, (uint64_t)&contentWorld->_contentWorld, (uint64_t *)&v15);
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  v12 = v15;
  [(WKUserContentController *)self _addScriptMessageHandler:v15];
  if (v12)
  {
    if (v12[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
    }
    else {
      --v12[2];
    }
  }
}

- (void)removeScriptMessageHandlerForName:(NSString *)name
{
  objc_super v4 = (API::ContentWorld *)MEMORY[0x19972EAD0](&v8, name);
  objc_super v5 = API::ContentWorld::pageContentWorld(v4);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)&self->_userContentControllerProxy, &v8, v5);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)removeScriptMessageHandlerForName:(NSString *)name contentWorld:(WKContentWorld *)contentWorld
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19972EAD0](&v8, name);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)p_userContentControllerProxy, &v8, (API::ContentWorld *)&contentWorld->_contentWorld);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)removeAllScriptMessageHandlersFromContentWorld:(WKContentWorld *)contentWorld
{
}

- (void)removeAllScriptMessageHandlers
{
}

- (void)_removeUserScript:(id)a3
{
}

- (void)_removeAllUserScriptsAssociatedWithContentWorld:(id)a3
{
}

- (void)_addUserScriptImmediately:(id)a3
{
}

- (void)_addUserContentFilter:(id)a3
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  objc_super v4 = (API::ContentRuleList *)(*((void *)a3 + 1) + 8);
  WTF::URL::URL((WTF::URL *)v7);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v4, v7);
  int v6 = v7[0];
  v7[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_addContentRuleList:(id)a3 extensionBaseURL:(id)a4
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  objc_super v5 = (API::ContentRuleList *)((char *)a3 + 8);
  MEMORY[0x19972E8A0](v8, a4);
  WebKit::WebUserContentControllerProxy::addContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v5, v8);
  uint64_t v7 = v8[0];
  v8[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)_removeUserContentFilter:(id)a3
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19972EAD0](&v7, a3);
  WebKit::WebUserContentControllerProxy::removeContentRuleList((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, &v7, v4);
  int v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_removeAllUserContentFilters
{
}

- (NSArray)_userStyleSheets
{
  return *(NSArray **)(*(void *)&self[1]._userContentControllerProxy.data.__lx[8] + 8);
}

- (void)_addUserStyleSheet:(id)a3
{
}

- (void)_removeUserStyleSheet:(id)a3
{
}

- (void)_removeAllUserStyleSheets
{
}

- (void)_removeAllUserStyleSheetsAssociatedWithContentWorld:(id)a3
{
}

- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 userContentWorld:(id)a5
{
  uint64_t v9 = WTF::fastMalloc((WTF *)0x28);
  ScriptMessageHandlerDelegate::ScriptMessageHandlerDelegate(v9, self, a3, a4);
  uint64_t v16 = v9;
  MEMORY[0x19972EAD0](&v15, a4);
  WebKit::WebScriptMessageHandler::create(&v16, (_DWORD **)&v15, *((void *)a5 + 1) + 8, (uint64_t *)&v17);
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  uint64_t v14 = v17;
  if ((WebKit::WebUserContentControllerProxy::addUserScriptMessageHandler((WebKit::WebUserContentControllerProxy *)p_userContentControllerProxy, v17, v11) & 1) == 0)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to add script message handler with name '%@' when one already exists.", a4, v15 format]; {
  if (*((_DWORD *)v14 + 2) == 1)
  }
    (*(void (**)(WebKit::WebScriptMessageHandler *))(*(void *)v14 + 8))(v14);
  else {
    --*((_DWORD *)v14 + 2);
  }
}

- (void)_addScriptMessageHandler:(id)a3 name:(id)a4 contentWorld:(id)a5
{
  uint64_t v8 = [a5 _userContentWorld];

  [(WKUserContentController *)self _addScriptMessageHandler:a3 name:a4 userContentWorld:v8];
}

- (void)_removeScriptMessageHandlerForName:(id)a3 userContentWorld:(id)a4
{
  p_userContentControllerProxy = &self->_userContentControllerProxy;
  MEMORY[0x19972EAD0](&v8, a3);
  WebKit::WebUserContentControllerProxy::removeUserMessageHandlerForName((uint64_t)p_userContentControllerProxy, &v8, (API::ContentWorld *)(*((void *)a4 + 1) + 8));
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)_removeAllScriptMessageHandlersAssociatedWithUserContentWorld:(id)a3
{
}

@end