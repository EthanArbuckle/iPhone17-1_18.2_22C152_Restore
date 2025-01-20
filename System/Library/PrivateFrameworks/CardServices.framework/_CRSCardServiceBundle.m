@interface _CRSCardServiceBundle
- (BOOL)canSatisfyCardRequest:(id)a3;
- (id)underlyingService;
- (unint64_t)servicePriorityForRequest:(id)a3;
- (void)_initializeCardServiceWithClass:(Class)a3;
- (void)requestCard:(id)a3 reply:(id)a4;
@end

@implementation _CRSCardServiceBundle

- (id)underlyingService
{
  v3 = (void *)[(_CRSCardServiceBundle *)self principalClass];
  if (!self->_cardService)
  {
    v4 = v3;
    if ([v3 conformsToProtocol:&unk_26D926B30]) {
      [(_CRSCardServiceBundle *)self _initializeCardServiceWithClass:v4];
    }
  }
  cardService = self->_cardService;
  return cardService;
}

- (void)_initializeCardServiceWithClass:(Class)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = NSStringFromClass(a3);
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_225997000, v6, OS_LOG_TYPE_INFO, "Initializing a card service of class %@", (uint8_t *)&v10, 0xCu);
  }
  v8 = (CRSCardServing *)objc_alloc_init(a3);
  cardService = self->_cardService;
  self->_cardService = v8;
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CRSCardServiceBundle *)self underlyingService];
  [v8 requestCard:v7 reply:v6];
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v4 = a3;
  v5 = [(_CRSCardServiceBundle *)self underlyingService];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 canSatisfyCardRequest:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(_CRSCardServiceBundle *)self underlyingService];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 servicePriorityForRequest:v4];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end