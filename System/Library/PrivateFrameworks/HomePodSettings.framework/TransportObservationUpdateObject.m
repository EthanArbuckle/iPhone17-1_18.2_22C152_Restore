@interface TransportObservationUpdateObject
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings32TransportObservationUpdateObject)init;
- (_TtC15HomePodSettings32TransportObservationUpdateObject)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TransportObservationUpdateObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D23A034(v4);
}

- (_TtC15HomePodSettings32TransportObservationUpdateObject)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings32TransportObservationUpdateObject *)sub_23D23A27C(a3);
}

- (_TtC15HomePodSettings32TransportObservationUpdateObject)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings32TransportObservationUpdateObject_observationUpdate);
  swift_bridgeObjectRelease();
}

@end