@interface IdentityProofingLivenessVideoURL
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)init;
- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingLivenessVideoURL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingLivenessVideoURL.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)sub_1D7A6B060();

  return v4;
}

- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)init
{
  result = (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7891060((uint64_t)self + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle));
  sub_1D7891060((uint64_t)self + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle);
}

@end