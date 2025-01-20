@interface DOCSourceOrderObserver
- (_TtC18DocumentAppIntents22DOCSourceOrderObserver)init;
- (void)dealloc;
@end

@implementation DOCSourceOrderObserver

- (void)dealloc
{
  v2 = self;
  DOCSourceOrderObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCSourceOrderObserver_sourceObserver));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCSourceOrderObserver_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCSourceOrderObserver_sourceObserverToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCSourceOrderObserver_sourceOrderObservation));

  swift_release();
}

- (_TtC18DocumentAppIntents22DOCSourceOrderObserver)init
{
  result = (_TtC18DocumentAppIntents22DOCSourceOrderObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end