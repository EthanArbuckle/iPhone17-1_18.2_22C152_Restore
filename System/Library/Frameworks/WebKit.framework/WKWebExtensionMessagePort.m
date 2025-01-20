@interface WKWebExtensionMessagePort
+ (void)initialize;
- (BOOL)isDisconnected;
- (BOOL)isEqual:(id)a3;
- (NSString)applicationIdentifier;
- (Object)_apiObject;
- (id)disconnectHandler;
- (id)messageHandler;
- (uint64_t)sendMessage:(id *)a1 completionHandler:;
- (uint64_t)sendMessage:(uint64_t)a1 completionHandler:;
- (void)_objc_initiateDealloc;
- (void)_webExtensionMessagePort;
- (void)dealloc;
- (void)disconnect;
- (void)disconnectWithError:(id)a3;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(uint64_t)a1 completionHandler:(uint64_t)a2;
- (void)setDisconnectHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
@end

@implementation WKWebExtensionMessagePort

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionMessagePort.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionMessagePort;
  [(WKWebExtensionMessagePort *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionMessagePort *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;

      if (v6)
      {
        char v8 = WebKit::WebExtensionMessagePort::operator==((uint64_t)&self->_webExtensionMessagePort, (uint64_t)&v6->_webExtensionMessagePort, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    char v8 = 0;
    goto LABEL_8;
  }
  char v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)applicationIdentifier
{
  id v2 = *(id *)&self->_webExtensionMessagePort.data.__lx[24];
  if (v2) {
    id v2 = (id)WTF::StringImpl::operator NSString *();
  }

  return (NSString *)v2;
}

- (BOOL)isDisconnected
{
  uint64_t v2 = *(void *)&self->_webExtensionMessagePort.data.__lx[16];
  return !v2 || *(void *)(v2 + 8) == 0;
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    char v8 = v7;
  }
  else {
    char v8 = &__block_literal_global_43;
  }
  v9 = _Block_copy(v8);
  v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v10 = &unk_1EEA0F898;
  v10[1] = v9;
  v12 = v10;
  WebKit::WebExtensionMessagePort::sendMessage((uint64_t)&self->_webExtensionMessagePort, v6, (uint64_t *)&v12);
  uint64_t v11 = (uint64_t)v12;
  v12 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
}

- (void)disconnect
{
}

- (void)disconnectWithError:(id)a3
{
  WebKit::toWebExtensionMessagePortError((WebKit *)a3, (uint64_t)&v7);
  WebKit::WebExtensionMessagePort::remove((uint64_t)&self->_webExtensionMessagePort);
  if (v10) {
    BOOL v5 = v9 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = v8;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
      }
      else
      {
        *(_DWORD *)v8 -= 2;
      }
    }
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionMessagePort;
}

- (void)_webExtensionMessagePort
{
  return &self->_webExtensionMessagePort;
}

- (id)messageHandler
{
  return *(id *)&self->_webExtensionMessagePort.data.__lx[40];
}

- (void)setMessageHandler:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_messageHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);

  objc_storeStrong((id *)&self->_webExtensionMessagePort.data.__lx[40], 0);
}

- (uint64_t)sendMessage:(uint64_t)a1 completionHandler:
{
  return a1;
}

- (uint64_t)sendMessage:(id *)a1 completionHandler:
{
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)sendMessage:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  if (!*(unsigned char *)(a2 + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    return;
  }
  unsigned __int8 v3 = *(unsigned char *)a2;
  int v4 = *(unsigned __int8 *)(a2 + 16);
  if (*(unsigned char *)(a2 + 16))
  {
    BOOL v5 = *(WTF::StringImpl **)(a2 + 8);
    *(void *)(a2 + 8) = 0;
    v9[0] = v3;
    if (v5) {
      *(_DWORD *)v5 += 2;
    }
    char v10 = v5;
    char v11 = 1;
  }
  else
  {
    BOOL v5 = 0;
    v9[0] = *(unsigned char *)a2;
    LOBYTE(v10) = 0;
    char v11 = 0;
  }
  char v12 = 1;
  id v6 = WebKit::toAPI(v9);
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8));

  if (!v12 || !v11 || (char v8 = v10, v10 = 0, !v8))
  {
LABEL_13:
    if (!v4) {
      return;
    }
    goto LABEL_14;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v8, v7);
  if (!v4) {
    return;
  }
LABEL_14:
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v7);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

@end