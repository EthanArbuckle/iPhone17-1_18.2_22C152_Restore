@interface CoordinationObservationUpdate
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings29CoordinationObservationUpdate)init;
- (_TtC15HomePodSettings29CoordinationObservationUpdate)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CoordinationObservationUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D23A9D8(v4);
}

- (_TtC15HomePodSettings29CoordinationObservationUpdate)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings29CoordinationObservationUpdate *)sub_23D23AAC4(a3);
}

- (_TtC15HomePodSettings29CoordinationObservationUpdate)init
{
}

- (void).cxx_destruct
{
  sub_23D192540((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate____lazy_storage___observationUpdate);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC15HomePodSettings29CoordinationObservationUpdate_observationUpdateObject);
}

@end