@interface TransportRequestObject
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings22TransportRequestObject)init;
- (_TtC15HomePodSettings22TransportRequestObject)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TransportRequestObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D1F79FC(v4);
}

- (_TtC15HomePodSettings22TransportRequestObject)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings22TransportRequestObject *)sub_23D1F7C38(a3);
}

- (_TtC15HomePodSettings22TransportRequestObject)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings22TransportRequestObject_request);
  swift_bridgeObjectRelease();
}

@end