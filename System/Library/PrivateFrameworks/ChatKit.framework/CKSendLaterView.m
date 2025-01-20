@interface CKSendLaterView
- (CKSendLaterView)initWithCoder:(id)a3;
- (CKSendLaterView)initWithFrame:(CGRect)a3;
- (CKSendLaterView)initWithPluginContext:(id)a3;
- (void)addDelegate:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation CKSendLaterView

- (CKSendLaterView)initWithPluginContext:(id)a3
{
  return (CKSendLaterView *)sub_18F787054(a3);
}

- (CKSendLaterView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSendLaterView_cancellables) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSendLaterView_hostingView) = 0;
  id v5 = a3;

  result = (CKSendLaterView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
  uint64_t v5 = MEMORY[0x192FBC390]((char *)self + OBJC_IVAR___CKSendLaterView_delegate, a2);
  if (v5)
  {
    id v6 = (id)v5;
    swift_unknownObjectRetain();
    v7 = self;
    swift_unknownObjectRelease();
    if (v6 == a3) {
      swift_unknownObjectWeakAssign();
    }
    swift_unknownObjectRelease();
  }
}

- (CKSendLaterView)initWithFrame:(CGRect)a3
{
  result = (CKSendLaterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKSendLaterView_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKSendLaterView_hostingView);
}

@end