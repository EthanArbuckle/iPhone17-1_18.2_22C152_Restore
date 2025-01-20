@interface PageControl.Coordinator
- (_TtCV15CarPlaySettings11PageControl11Coordinator)init;
- (void)valueChanged:(id)a3;
@end

@implementation PageControl.Coordinator

- (void)valueChanged:(id)a3
{
  id v4 = a3;
  v6 = self;
  id v5 = [v4 currentPage];
  (*(void (**)(id))((swift_isaMask & (uint64_t)v6->super.isa) + 0x60))(v5);
}

- (_TtCV15CarPlaySettings11PageControl11Coordinator)init
{
  result = (_TtCV15CarPlaySettings11PageControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end