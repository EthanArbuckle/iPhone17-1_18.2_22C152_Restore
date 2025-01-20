@interface AMSActionContext
- (AMSActionContext)init;
- (AMSActionContext)initWithAccount:(id)a3 bag:(id)a4 processInfo:(id)a5;
@end

@implementation AMSActionContext

- (AMSActionContext)initWithAccount:(id)a3 bag:(id)a4 processInfo:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  return (AMSActionContext *)ActionContext.init(account:bag:processInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AMSActionContext)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSActionContext_processInfo);
}

@end