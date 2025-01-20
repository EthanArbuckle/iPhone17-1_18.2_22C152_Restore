@interface BLTSettingsGateway
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)surrogateWithQueue:(id)a3;
- (BLTSettingsGateway)initWithQueue:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation BLTSettingsGateway

- (BLTSettingsGateway)initWithQueue:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLTSettingsGateway;
  v5 = [(BLTSettingsGateway *)&v18 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    actualSettingsGatewayLock = v5->_actualSettingsGatewayLock;
    v5->_actualSettingsGatewayLock = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v4];
    actualSettingsGateway = v5->_actualSettingsGateway;
    v5->_actualSettingsGateway = (BBSettingsGateway *)v8;

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    char v17 = BBServerListeningForConnections();
    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__BLTSettingsGateway_initWithQueue___block_invoke;
    v11[3] = &unk_2646844F0;
    v13 = v16;
    objc_copyWeak(&v14, &location);
    v12 = v4;
    notify_register_dispatch("com.apple.bulletinboard.listeningForConnections", &v5->_token, v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(v16, 8);
  }

  return v5;
}

void __36__BLTSettingsGateway_initWithQueue___block_invoke(uint64_t a1, int token)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t state64 = 0;
    notify_get_state(token, &state64);
    if (state64 == 1)
    {
      WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained)
      {
        v5 = blt_general_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_222F4C000, v5, OS_LOG_TYPE_INFO, "Re-creating settings gateway", v9, 2u);
        }

        [WeakRetained[2] lock];
        [WeakRetained[1] invalidate];
        uint64_t v6 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:*(void *)(a1 + 32)];
        id v7 = WeakRetained[1];
        WeakRetained[1] = (id)v6;

        [WeakRetained[2] unlock];
        uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
        [v8 postNotificationName:@"BLTSettingsGatewayReconnected" object:WeakRetained];
      }
    }
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 1;
  }
}

+ (id)surrogateWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = [[BLTSettingsGateway alloc] initWithQueue:v3];

  return v4;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  [(BBSettingsGateway *)self->_actualSettingsGateway invalidate];
  actualSettingsGateway = self->_actualSettingsGateway;
  self->_actualSettingsGateway = 0;

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingsGateway;
  [(BLTSettingsGateway *)&v4 dealloc];
}

- (void)forwardInvocation:(id)a3
{
  actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
  id v5 = a3;
  [(NSLock *)actualSettingsGatewayLock lock];
  uint64_t v6 = self->_actualSettingsGatewayLock;
  id v7 = self->_actualSettingsGateway;
  [(NSLock *)v6 unlock];
  [v5 selector];
  if (objc_opt_respondsToSelector())
  {
    [v5 invokeWithTarget:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BLTSettingsGateway;
    [(BLTSettingsGateway *)&v8 forwardInvocation:v5];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BLTSettingsGateway;
  if (-[BLTSettingsGateway respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    [(NSLock *)self->_actualSettingsGatewayLock lock];
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    id v7 = actualSettingsGateway;
    [(NSLock *)actualSettingsGatewayLock unlock];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    [(NSLock *)self->_actualSettingsGatewayLock lock];
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    uint64_t v6 = actualSettingsGateway;
    [(NSLock *)actualSettingsGatewayLock unlock];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___BLTSettingsGateway;
  if (objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x263F2BCC0] instancesRespondToSelector:a3];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BLTSettingsGateway;
  objc_super v5 = -[BLTSettingsGateway methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  if (!v5)
  {
    [(NSLock *)self->_actualSettingsGatewayLock lock];
    actualSettingsGateway = self->_actualSettingsGateway;
    actualSettingsGatewayLock = self->_actualSettingsGatewayLock;
    objc_super v8 = actualSettingsGateway;
    [(NSLock *)actualSettingsGatewayLock unlock];
    objc_super v5 = [(BBSettingsGateway *)v8 methodSignatureForSelector:a3];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualSettingsGatewayLock, 0);
  objc_storeStrong((id *)&self->_actualSettingsGateway, 0);
}

@end