@interface AddOrderButtonView.Coordinator
- (_TtCV12FinanceKitUI18AddOrderButtonView11Coordinator)init;
- (void)callback;
@end

@implementation AddOrderButtonView.Coordinator

- (void)callback
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV12FinanceKitUI18AddOrderButtonView11Coordinator_action);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtCV12FinanceKitUI18AddOrderButtonView11Coordinator)init
{
  result = (_TtCV12FinanceKitUI18AddOrderButtonView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end