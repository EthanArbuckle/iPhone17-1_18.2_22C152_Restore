@interface AMSUIActionContext
- (AMSUIActionContext)init;
- (AMSUIActionContext)initWithAccount:(id)a3 bag:(id)a4 presentingViewController:(id)a5 processInfo:(id)a6;
@end

@implementation AMSUIActionContext

- (AMSUIActionContext)initWithAccount:(id)a3 bag:(id)a4 presentingViewController:(id)a5 processInfo:(id)a6
{
  id v10 = a3;
  swift_unknownObjectRetain();
  id v11 = a5;
  id v12 = a6;
  return (AMSUIActionContext *)UIActionContext.init(account:bag:presentingViewController:processInfo:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

- (AMSUIActionContext)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSUIActionContext_presentingViewController);
}

@end