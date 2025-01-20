@interface AggregateInputStream
- (BOOL)getBuffer:(char *)a3 length:(int64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSError)streamError;
- (NSStreamDelegate)delegate;
- (_TtC15CTLazuliSupport20AggregateInputStream)initWithData:(id)a3;
- (_TtC15CTLazuliSupport20AggregateInputStream)initWithURL:(id)a3;
- (id)propertyForKey:(id)a3;
- (int64_t)read:(char *)a3 maxLength:(int64_t)a4;
- (unint64_t)streamStatus;
- (void)close;
- (void)open;
@end

@implementation AggregateInputStream

- (int64_t)read:(char *)a3 maxLength:(int64_t)a4
{
  v6 = self;
  int64_t v7 = sub_24961B4F8((uint64_t)a3, a4);

  return v7;
}

- (BOOL)hasBytesAvailable
{
  return *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status) == (Class)2;
}

- (unint64_t)streamStatus
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_status);
}

- (void)open
{
  v2 = self;
  sub_24961BEF4();
}

- (void)close
{
  v2 = self;
  sub_24961C128();
}

- (NSError)streamError
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError);
  if (v2)
  {
    id v3 = v2;
    v4 = (void *)sub_24962BC70();
  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (BOOL)getBuffer:(char *)a3 length:(int64_t *)a4
{
  return 0;
}

- (NSStreamDelegate)delegate
{
  return (NSStreamDelegate *)0;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    v6 = self;
    swift_unknownObjectRetain();
    sub_24962C4C0();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_24961C50C((uint64_t)v8);
  return 0;
}

- (_TtC15CTLazuliSupport20AggregateInputStream)initWithData:(id)a3
{
  id v3 = a3;
  sub_24962BDD0();

  result = (_TtC15CTLazuliSupport20AggregateInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15CTLazuliSupport20AggregateInputStream)initWithURL:(id)a3
{
  uint64_t v3 = sub_24962BD40();
  MEMORY[0x270FA5388](v3 - 8, v4);
  sub_24962BCD0();
  result = (_TtC15CTLazuliSupport20AggregateInputStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_currentStream));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CTLazuliSupport20AggregateInputStream_underlyingStreamError);
}

@end