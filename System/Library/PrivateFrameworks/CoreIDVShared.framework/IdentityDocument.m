@interface IdentityDocument
+ (BOOL)supportsSecureCoding;
- (_TtC13CoreIDVShared16IdentityDocument)init;
- (_TtC13CoreIDVShared16IdentityDocument)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IdentityDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared16IdentityDocument)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared16IdentityDocument *)sub_1D78C48FC();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  IdentityDocument.encode(with:)((NSCoder)v4);
}

- (_TtC13CoreIDVShared16IdentityDocument)init
{
  result = (_TtC13CoreIDVShared16IdentityDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7871BDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_image), *(void *)&self->image[OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_image]);

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_pdf417Data);
  unint64_t v4 = *(void *)&self->image[OBJC_IVAR____TtC13CoreIDVShared16IdentityDocument_pdf417Data];
  sub_1D7871BDC(v3, v4);
}

@end