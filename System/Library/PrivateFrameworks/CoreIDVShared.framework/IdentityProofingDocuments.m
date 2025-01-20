@interface IdentityProofingDocuments
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared25IdentityProofingDocuments)init;
- (_TtC13CoreIDVShared25IdentityProofingDocuments)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingDocuments

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingDocuments.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared25IdentityProofingDocuments)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared25IdentityProofingDocuments *)sub_1D792AE38();

  return v4;
}

- (_TtC13CoreIDVShared25IdentityProofingDocuments)init
{
  result = (_TtC13CoreIDVShared25IdentityProofingDocuments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared25IdentityProofingDocuments_liveness);
}

@end