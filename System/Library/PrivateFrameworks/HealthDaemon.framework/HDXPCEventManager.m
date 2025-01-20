@interface HDXPCEventManager
- (HDXPCEventManager)init;
- (void)authorizationChangedForBundleIdentifier:(id)a3;
@end

@implementation HDXPCEventManager

- (HDXPCEventManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDXPCEventManager;
  v2 = [(HDXPCEventManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F65DB8]);
    uint64_t v4 = objc_msgSend(v3, "initWithStream:entitlement:", *MEMORY[0x1E4F29738], objc_msgSend((id)*MEMORY[0x1E4F29740], "UTF8String"));
    authorizationPublisher = v2->_authorizationPublisher;
    v2->_authorizationPublisher = (HDXPCEventPublisher *)v4;
  }
  return v2;
}

- (void)authorizationChangedForBundleIdentifier:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  v5 = (const char *)*MEMORY[0x1E4F29730];
  id v6 = v4;
  objc_super v7 = (const char *)[v6 UTF8String];

  xpc_dictionary_set_string(xdict, v5, v7);
  [(HDXPCEventPublisher *)self->_authorizationPublisher broadcastEvent:xdict];
}

- (void).cxx_destruct
{
}

@end