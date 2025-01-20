@interface DOCSourceOrderObserver
- (_TtC14RecentsAvocado22DOCSourceOrderObserver)init;
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
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCSourceOrderObserver_sourceObserverToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCSourceOrderObserver_sourceOrderObservation));
  swift_release();
}

- (_TtC14RecentsAvocado22DOCSourceOrderObserver)init
{
  result = (_TtC14RecentsAvocado22DOCSourceOrderObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end