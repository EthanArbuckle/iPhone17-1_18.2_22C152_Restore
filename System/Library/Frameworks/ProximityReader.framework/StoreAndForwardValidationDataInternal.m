@interface StoreAndForwardValidationDataInternal
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)init;
- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StoreAndForwardValidationDataInternal

+ (BOOL)supportsSecureCoding
{
  return byte_268268230;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268268230 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  StoreAndForwardValidationDataInternal.encode(with:)((NSCoder)v4);
}

- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader37StoreAndForwardValidationDataInternal *)StoreAndForwardValidationDataInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader37StoreAndForwardValidationDataInternal)init
{
  result = (_TtC15ProximityReader37StoreAndForwardValidationDataInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end