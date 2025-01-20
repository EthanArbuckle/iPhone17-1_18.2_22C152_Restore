@interface InterruptionMonitor
- (_TtC19ContactlessReaderUI19InterruptionMonitor)init;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)consumeDoublePressUpForButtonKind:(int64_t)a3;
- (void)dealloc;
@end

@implementation InterruptionMonitor

- (void)dealloc
{
  v2 = self;
  sub_23EDD8FF4(0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for InterruptionMonitor();
  [(InterruptionMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_23EDC4A90((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor_hardwareButtonConsumer));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor__interruption;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20BF0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtC19ContactlessReaderUI19InterruptionMonitor)init
{
  result = (_TtC19ContactlessReaderUI19InterruptionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23EDD99FC(v7);
}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
}

@end