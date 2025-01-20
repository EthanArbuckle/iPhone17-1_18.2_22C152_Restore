@interface FMReverseGeocodingOperation
- (BOOL)isAsynchronous;
- (BOOL)isFinished;
- (_TtC7FMFCore27FMReverseGeocodingOperation)init;
- (void)main;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation FMReverseGeocodingOperation

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  v4 = self;
  v5 = (void *)sub_21CB882C0();
  [(FMReverseGeocodingOperation *)v4 willChangeValueForKey:v5];

  *((unsigned char *)&v4->super.super.isa + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation__isFinished) = a3;
  id v6 = (id)sub_21CB882C0();
  [(FMReverseGeocodingOperation *)v4 didChangeValueForKey:v6];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v2 = self;
  if ([(FMReverseGeocodingOperation *)v2 isCancelled])
  {
    if (qword_267C94998 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_21CB880A0();
    sub_21CA4CC18(v3, (uint64_t)qword_267CA5380);
    oslog = sub_21CB88070();
    os_log_type_t v4 = sub_21CB88880();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21CA00000, oslog, v4, "FMReverseGeocodingOperation: operation cancelled", v5, 2u);
      MEMORY[0x21D4B6B70](v5, -1, -1);
    }

    id v6 = (_TtC7FMFCore27FMReverseGeocodingOperation *)oslog;
  }
  else
  {
    id v6 = v2;
  }
}

- (void)start
{
  v2 = self;
  sub_21CA82098();
}

- (_TtC7FMFCore27FMReverseGeocodingOperation)init
{
  result = (_TtC7FMFCore27FMReverseGeocodingOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21CA82CA8((uint64_t)self + OBJC_IVAR____TtC7FMFCore27FMReverseGeocodingOperation_request);

  swift_release();
}

@end