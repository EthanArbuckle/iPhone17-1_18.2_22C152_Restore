@interface PageControl.Coordinator
- (_TtCV10ContactsUI11PageControl11Coordinator)init;
- (void)updateCurrentPageWithSender:(id)a3;
@end

@implementation PageControl.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  swift_retain();
  swift_retain();
  id v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_currentPage);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E913BD30);
  sub_18B985978();

  swift_release();
  swift_release();
}

- (_TtCV10ContactsUI11PageControl11Coordinator)init
{
  result = (_TtCV10ContactsUI11PageControl11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end