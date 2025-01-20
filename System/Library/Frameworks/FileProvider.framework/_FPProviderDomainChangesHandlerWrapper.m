@interface _FPProviderDomainChangesHandlerWrapper
+ (id)wrapperWithHandler:(id)a3;
- (BOOL)isUnregistered;
- (void)callHandlerWithProvidersByID:(id)a3 error:(id)a4;
- (void)setUnregistered:(BOOL)a3;
@end

@implementation _FPProviderDomainChangesHandlerWrapper

- (void)setUnregistered:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (!a3)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:obj file:@"FPProviderDomainChangesReceiver.m" lineNumber:60 description:@"trying to re-register an handler"];
  }
  id handler = obj->_handler;
  obj->_id handler = 0;

  objc_sync_exit(obj);
}

+ (id)wrapperWithHandler:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = MEMORY[0x1A6248B00](v3);

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)callHandlerWithProvidersByID:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  id handler = (void (**)(id, id, id))v7->_handler;
  if (handler)
  {
    id v9 = v10;
    if (v6) {
      id v9 = 0;
    }
    handler[2](handler, v9, v6);
  }
  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
}

- (BOOL)isUnregistered
{
  return self->_handler == 0;
}

@end