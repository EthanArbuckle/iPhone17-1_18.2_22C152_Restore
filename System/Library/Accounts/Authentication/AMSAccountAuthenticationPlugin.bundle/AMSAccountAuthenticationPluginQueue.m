@interface AMSAccountAuthenticationPluginQueue
- (AMSAccountAuthenticationPluginQueue)init;
- (id)enqueuePromiseBlock:(id)a3;
@end

@implementation AMSAccountAuthenticationPluginQueue

- (id)enqueuePromiseBlock:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  v6 = (void *)sub_C0F4();

  swift_release();
  return v6;
}

- (AMSAccountAuthenticationPluginQueue)init
{
  return (AMSAccountAuthenticationPluginQueue *)sub_C1B8();
}

- (void).cxx_destruct
{
}

@end