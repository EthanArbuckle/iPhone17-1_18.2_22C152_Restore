@interface DigitalPresentmentResponse
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV26DigitalPresentmentResponse)init;
- (_TtC7CoreIDV26DigitalPresentmentResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DigitalPresentmentResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_2148A1978();
  id v7 = (id)sub_2148A1B78();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (_TtC7CoreIDV26DigitalPresentmentResponse)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV26DigitalPresentmentResponse *)DigitalPresentmentResponse.init(coder:)(a3);
}

- (_TtC7CoreIDV26DigitalPresentmentResponse)init
{
  result = (_TtC7CoreIDV26DigitalPresentmentResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end