@interface CardReaderErrorInternal
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC15ProximityReader23CardReaderErrorInternal)init;
- (_TtC15ProximityReader23CardReaderErrorInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CardReaderErrorInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15ProximityReader23CardReaderErrorInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader23CardReaderErrorInternal *)CardReaderErrorInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22886CEA0(v4);
}

- (NSString)description
{
  v2 = self;
  sub_22886D080();

  v3 = (void *)sub_228915C40();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC15ProximityReader23CardReaderErrorInternal)init
{
  result = (_TtC15ProximityReader23CardReaderErrorInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end