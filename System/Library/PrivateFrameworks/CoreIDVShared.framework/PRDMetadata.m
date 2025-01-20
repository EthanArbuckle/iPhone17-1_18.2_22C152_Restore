@interface PRDMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared11PRDMetadata)init;
- (_TtC13CoreIDVShared11PRDMetadata)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRDMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared11PRDMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared11PRDMetadata *)sub_1D7991E74(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int v4 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared11PRDMetadata_stage2);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D7A9BF98();
  LODWORD(v8) = v4;
  objc_msgSend(v5, sel_encodeFloat_forKey_, v7, v8);

  v9 = (void *)sub_1D7A9D648();
  id v10 = (id)sub_1D7A9BF98();
  objc_msgSend(v5, sel_encodeObject_forKey_, v9, v10);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D79914A0(self, (uint64_t)a2, (void (*)(void))PRDMetadata.debugDescription.getter);
}

- (_TtC13CoreIDVShared11PRDMetadata)init
{
  result = (_TtC13CoreIDVShared11PRDMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end