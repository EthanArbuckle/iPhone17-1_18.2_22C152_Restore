@interface FMReverseGeocodingOperation
- (BOOL)isAsynchronous;
- (BOOL)isFinished;
- (_TtC8FMIPCore27FMReverseGeocodingOperation)init;
- (void)main;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation FMReverseGeocodingOperation

- (void)main
{
  v2 = self;
  if ([(FMReverseGeocodingOperation *)v2 isCancelled])
  {
    if (qword_1EA6C8F58 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1D4469928();
    sub_1D42D7FAC(v3, (uint64_t)qword_1EA6E46D0);
    oslog = sub_1D44698F8();
    os_log_type_t v4 = sub_1D446A038();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D4271000, oslog, v4, "FMReverseGeocodingOperation: operation cancelled", v5, 2u);
      MEMORY[0x1D9447730](v5, -1, -1);
    }

    v6 = (_TtC8FMIPCore27FMReverseGeocodingOperation *)oslog;
  }
  else
  {
    v6 = v2;
  }
}

- (void)start
{
  v2 = self;
  sub_1D429488C();
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMReverseGeocodingOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  os_log_type_t v4 = self;
  v5 = (void *)sub_1D4469B08();
  [(FMReverseGeocodingOperation *)v4 willChangeValueForKey:v5];

  *((unsigned char *)&v4->super.super.isa + OBJC_IVAR____TtC8FMIPCore27FMReverseGeocodingOperation__isFinished) = a3;
  id v6 = (id)sub_1D4469B08();
  [(FMReverseGeocodingOperation *)v4 didChangeValueForKey:v6];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (_TtC8FMIPCore27FMReverseGeocodingOperation)init
{
  result = (_TtC8FMIPCore27FMReverseGeocodingOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D43C0B9C((uint64_t)self + OBJC_IVAR____TtC8FMIPCore27FMReverseGeocodingOperation_request);
  swift_release();
}

@end