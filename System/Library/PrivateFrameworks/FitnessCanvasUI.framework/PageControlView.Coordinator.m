@interface PageControlView.Coordinator
- (_TtCV15FitnessCanvasUI15PageControlView11Coordinator)init;
- (void)updateCurrentPageWithSender:(id)a3;
@end

@implementation PageControlView.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  swift_retain();
  swift_retain();
  id v5 = a3;
  v6 = self;
  objc_msgSend(v5, sel_currentPage);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269966F70);
  sub_24EE56C70();

  swift_release();
  swift_release();
}

- (_TtCV15FitnessCanvasUI15PageControlView11Coordinator)init
{
  result = (_TtCV15FitnessCanvasUI15PageControlView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end