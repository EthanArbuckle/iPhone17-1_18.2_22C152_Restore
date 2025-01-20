@interface CoordinationRequest
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings19CoordinationRequest)init;
- (_TtC15HomePodSettings19CoordinationRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CoordinationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D1918F8(v4);
}

- (_TtC15HomePodSettings19CoordinationRequest)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings19CoordinationRequest *)sub_23D1919DC(a3);
}

- (_TtC15HomePodSettings19CoordinationRequest)init
{
}

- (void).cxx_destruct
{
  sub_23D191C28((uint64_t)self + OBJC_IVAR____TtC15HomePodSettings19CoordinationRequest____lazy_storage___request);
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15HomePodSettings19CoordinationRequest_requestObject);
}

@end