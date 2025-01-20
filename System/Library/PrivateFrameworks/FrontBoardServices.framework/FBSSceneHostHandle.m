@interface FBSSceneHostHandle
+ (FBSSceneHostHandle)handleWithAuditToken:(id)a3;
+ (id)localHandle;
- (BOOL)isLocal;
- (BSAuditToken)auditToken;
- (id)description;
@end

@implementation FBSSceneHostHandle

+ (FBSSceneHostHandle)handleWithAuditToken:(id)a3
{
  id v5 = a3;
  int v6 = [v5 pid];
  if (v6 == getpid())
  {
    v7 = [a1 localHandle];
  }
  else
  {
    v7 = objc_alloc_init(FBSSceneHostHandle);
    objc_storeStrong((id *)&v7->_auditToken, a3);
  }

  return v7;
}

+ (id)localHandle
{
  if (localHandle_onceToken != -1) {
    dispatch_once(&localHandle_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)localHandle_local;

  return v2;
}

uint64_t __33__FBSSceneHostHandle_localHandle__block_invoke()
{
  v0 = objc_alloc_init(FBSSceneHostHandle);
  v1 = (void *)localHandle_local;
  localHandle_local = (uint64_t)v0;

  *(unsigned char *)(localHandle_local + 8) = 1;
  uint64_t v2 = [off_1E58F44D8 tokenForCurrentProcess];
  uint64_t v3 = *(void *)(localHandle_local + 16);
  *(void *)(localHandle_local + 16) = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

- (id)description
{
  BOOL local = self->_local;
  v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (void *)v6;
  if (local) {
    [v4 stringWithFormat:@"<%@: %p; local>", v6, self, v10];
  }
  else {
    [v4 stringWithFormat:@"<%@: %p; pid %u>",
  }
      v6,
      self,
  v8 = [(BSAuditToken *)self->_auditToken pid]);

  return v8;
}

- (BOOL)isLocal
{
  return self->_local;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
}

@end