@interface AddSecureElementPassViewControllerWrapper.Coordinator
- (_TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator)init;
- (void)addSecureElementPassViewController:(id)a3 didFinishAddingSecureElementPasses:(id)a4 error:(id)a5;
@end

@implementation AddSecureElementPassViewControllerWrapper.Coordinator

- (void)addSecureElementPassViewController:(id)a3 didFinishAddingSecureElementPasses:(id)a4 error:(id)a5
{
  v6 = a4;
  if (a4)
  {
    sub_23CA2551C();
    v6 = (void *)sub_23CA46E40();
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_23CA25404(v6, a5);

  swift_bridgeObjectRelease();
}

- (_TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator)init
{
  result = (_TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23CA25258(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion));
}

@end