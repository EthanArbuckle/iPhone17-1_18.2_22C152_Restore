@interface _WKWebsiteDataStoreBSActionHandler
+ (id)shared;
- (BOOL)handleNotificationResponse:(id)a3;
- (id).cxx_construct;
- (id)_respondToApplicationActions:(id)a3 fromTransitionContext:(id)a4;
- (void)setWebPushActionHandler:(id)a3;
@end

@implementation _WKWebsiteDataStoreBSActionHandler

+ (id)shared
{
  if (byte_1EB35983B == 1) {
    return (id)qword_1EB359868;
  }
  id result = objc_alloc_init(_WKWebsiteDataStoreBSActionHandler);
  qword_1EB359868 = (uint64_t)result;
  byte_1EB35983B = 1;
  return result;
}

- (void)setWebPushActionHandler:(id)a3
{
  if (a3)
  {
    v4 = _Block_copy(a3);
    _Block_release(self->_webPushActionHandler.m_block);
    self->_webPushActionHandler.m_block = v4;
    _Block_release(0);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)handleNotificationResponse:(id)a3
{
  id v3 = +[_WKWebPushAction _webPushActionWithNotificationResponse:a3];
  v4 = v3;
  if (v3)
  {
    CFRetain(v3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __65___WKWebsiteDataStoreBSActionHandler_handleNotificationResponse___block_invoke;
    block[3] = &__block_descriptor_40_e8_32c40_ZTSN3WTF9RetainPtrI16_WKWebPushActionEE_e5_v8__0l;
    CFTypeRef cf = v4;
    CFRetain(v4);
    dispatch_async(MEMORY[0x1E4F14428], block);
    CFTypeRef v5 = cf;
    CFTypeRef cf = 0;
    if (v5) {
      CFRelease(v5);
    }
    CFRelease(v4);
  }
  return v4 != 0;
}

- (id)_respondToApplicationActions:(id)a3 fromTransitionContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = +[_WKWebPushAction webPushActionWithDictionary:](_WKWebPushAction, "webPushActionWithDictionary:", objc_msgSend((id)objc_msgSend(v10, "info"), "objectForSetting:", 134561792));
        if (!v11)
        {
          [v6 addObject:v10];
          continue;
        }
        v12 = (void *)(*((uint64_t (**)(void))self->_webPushActionHandler.m_block + 2))();
        if (v12)
        {
          [v12 _handleWebPushAction:v11];
          if (![v10 canSendResponse]) {
            continue;
          }
          uint64_t v13 = [MEMORY[0x1E4F627D8] response];
          goto LABEL_15;
        }
        v14 = qword_1EB3583C0;
        if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1985F2000, v14, OS_LOG_TYPE_ERROR, "Unable to handle a _WKWebPushAction: Client did not return a valid WKWebsiteDataStore", buf, 2u);
        }
        if ([v10 canSendResponse])
        {
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F627D8], "responseForError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"WKErrorDomain", 1, 0));
LABEL_15:
          [v10 sendResponse:v13];
          continue;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  return (id)(id)CFMakeCollectable(v6);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end