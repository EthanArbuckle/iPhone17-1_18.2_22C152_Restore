@interface GestureTimestamps
+ (BOOL)supportsSecureCoding;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared17GestureTimestamps)init;
- (_TtC13CoreIDVShared17GestureTimestamps)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GestureTimestamps

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared17GestureTimestamps)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC13CoreIDVShared17GestureTimestamps *)sub_1D7991D6C();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1D7A9C2F8();
  id v7 = (id)sub_1D7A9BF98();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (NSString)debugDescription
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CoreIDVShared17GestureTimestamps_timestamps);
  id v3 = self;
  MEMORY[0x1D947B0F0](v2, MEMORY[0x1E4FBC538]);

  id v4 = (void *)sub_1D7A9BF98();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC13CoreIDVShared17GestureTimestamps)init
{
  result = (_TtC13CoreIDVShared17GestureTimestamps *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end