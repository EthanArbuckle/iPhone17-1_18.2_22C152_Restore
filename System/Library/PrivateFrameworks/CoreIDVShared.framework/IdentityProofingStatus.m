@interface IdentityProofingStatus
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared22IdentityProofingStatus)init;
- (_TtC13CoreIDVShared22IdentityProofingStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared22IdentityProofingStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared22IdentityProofingStatus *)sub_1D78E3E24(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingStatus.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared22IdentityProofingStatus)init
{
  result = (_TtC13CoreIDVShared22IdentityProofingStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end