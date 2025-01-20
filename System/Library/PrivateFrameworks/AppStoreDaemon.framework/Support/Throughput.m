@interface Throughput
- (_TtC9appstored10Throughput)init;
- (void)update:(double)a3;
@end

@implementation Throughput

- (void)update:(double)a3
{
}

- (_TtC9appstored10Throughput)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9appstored10Throughput_isValid) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored10Throughput_minValue) = (Class)0x7FEFFFFFFFFFFFFFLL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored10Throughput_maxValue) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored10Throughput_avgValue) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored10Throughput_avgCount) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Throughput();
  return [(Throughput *)&v3 init];
}

@end