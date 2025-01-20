@interface _WKUserInitiatedAction
- (BOOL)isConsumed;
- (NSString)description;
- (Object)_apiObject;
- (_WKUserInitiatedAction)init;
- (void)consume;
- (void)dealloc;
@end

@implementation _WKUserInitiatedAction

- (_WKUserInitiatedAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)_WKUserInitiatedAction;
  v2 = [(_WKUserInitiatedAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(_WKUserInitiatedAction *)v2 _apiObject];
    *(_OWORD *)uint64_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(void *)uint64_t v4 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(unsigned char *)(v4 + 16) = 0;
    *(unsigned char *)(v4 + 32) = 0;
    *(unsigned char *)(v4 + 48) = 0;
    *(void *)uint64_t v4 = &unk_1EE9CBCB8;
    *(void *)(v4 + 8) = v3;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKUserInitiatedAction;
    [(_WKUserInitiatedAction *)&v4 dealloc];
  }
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(_WKUserInitiatedAction *)self isConsumed];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p; consumed = %s>", v5, self, v7];
}

- (void)consume
{
  self->_userInitiatedAction.data.__lx[16] = 1;
}

- (BOOL)isConsumed
{
  return self->_userInitiatedAction.data.__lx[16];
}

- (Object)_apiObject
{
  return (Object *)&self->_userInitiatedAction;
}

@end