@interface DOCSourceOrderObserver
- (_TtC11SaveToFiles22DOCSourceOrderObserver)init;
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
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles22DOCSourceOrderObserver_sourceObserverToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles22DOCSourceOrderObserver_sourceOrderObservation));
  swift_release();
}

- (_TtC11SaveToFiles22DOCSourceOrderObserver)init
{
  result = (_TtC11SaveToFiles22DOCSourceOrderObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end