@interface IdentityProofingImageDimensions
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)init;
- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityProofingImageDimensions

+ (BOOL)supportsSecureCoding
{
  return byte_1EA843630;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA843630 = a3;
}

- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for IdentityImageDimension();
  id v6 = a3;
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idFront) = (Class)sub_1D7A9C908();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idBack) = (Class)sub_1D7A9C908();
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_selfie) = (Class)sub_1D7A9C908();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = [(IdentityProofingImageDimensions *)&v10 init];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityProofingImageDimensions.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D78E0240(self, (uint64_t)a2, (void (*)(void))IdentityProofingImageDimensions.debugDescription.getter);
}

- (_TtC13CoreIDVShared31IdentityProofingImageDimensions)init
{
  result = (_TtC13CoreIDVShared31IdentityProofingImageDimensions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_idFront));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared31IdentityProofingImageDimensions_selfie);
}

@end