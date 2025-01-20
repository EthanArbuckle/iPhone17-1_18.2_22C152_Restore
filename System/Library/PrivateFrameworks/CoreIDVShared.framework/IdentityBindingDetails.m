@interface IdentityBindingDetails
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared22IdentityBindingDetails)init;
- (_TtC13CoreIDVShared22IdentityBindingDetails)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityBindingDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityBindingDetails.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared22IdentityBindingDetails)initWithCoder:(id)a3
{
  return (_TtC13CoreIDVShared22IdentityBindingDetails *)IdentityBindingDetails.init(coder:)(a3);
}

- (_TtC13CoreIDVShared22IdentityBindingDetails)init
{
  result = (_TtC13CoreIDVShared22IdentityBindingDetails *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end