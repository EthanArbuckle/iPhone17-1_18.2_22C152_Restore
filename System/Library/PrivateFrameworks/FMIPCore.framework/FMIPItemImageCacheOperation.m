@interface FMIPItemImageCacheOperation
- (BOOL)isAsynchronous;
- (BOOL)isFinished;
- (_TtC8FMIPCore27FMIPItemImageCacheOperation)init;
- (void)main;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation FMIPItemImageCacheOperation

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  v4 = self;
  v5 = (void *)sub_1D4469B08();
  [(FMIPItemImageCacheOperation *)v4 willChangeValueForKey:v5];

  *((unsigned char *)&v4->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation__isFinished) = a3;
  id v6 = (id)sub_1D4469B08();
  [(FMIPItemImageCacheOperation *)v4 didChangeValueForKey:v6];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v2 = self;
  if ([(FMIPItemImageCacheOperation *)v2 isCancelled])
  {
    if (qword_1EBD80068 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1D4469928();
    sub_1D42D7FAC(v3, (uint64_t)qword_1EBD83228);
    oslog = sub_1D44698F8();
    os_log_type_t v4 = sub_1D446A038();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D4271000, oslog, v4, "FMItemImageCreationOperation: operation cancelled", v5, 2u);
      MEMORY[0x1D9447730](v5, -1, -1);
    }

    id v6 = (_TtC8FMIPCore27FMIPItemImageCacheOperation *)oslog;
  }
  else
  {
    id v6 = v2;
  }
}

- (void)start
{
  v2 = self;
  sub_1D4431B6C();
}

- (_TtC8FMIPCore27FMIPItemImageCacheOperation)init
{
  result = (_TtC8FMIPCore27FMIPItemImageCacheOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(NSOperationQueue **)((char *)&self->super._iop.__queue
                            + OBJC_IVAR____TtC8FMIPCore27FMIPItemImageCacheOperation_request);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end