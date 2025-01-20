@interface AMSUIMessagingActionContext
- (AMSUIMessagingActionContext)init;
- (AMSUIMessagingActionContext)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5;
@end

@implementation AMSUIMessagingActionContext

- (AMSUIMessagingActionContext)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  return (AMSUIMessagingActionContext *)ActionContext.init(bag:account:clientInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (AMSUIMessagingActionContext)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSUIMessagingActionContext_clientInfo);
}

@end