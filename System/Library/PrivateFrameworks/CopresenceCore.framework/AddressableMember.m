@interface AddressableMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC14CopresenceCore17AddressableMember)init;
- (_TtC14CopresenceCore17AddressableMember)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AddressableMember

- (BOOL)isEqual:(id)a3
{
  return @objc AddressableMember.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))AddressableMember.isEqual(_:));
}

- (int64_t)hash
{
  Hasher.init()();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore17AddressableMember_handle);
  v4 = self;
  Hasher._combine(_:)((Swift::UInt)objc_msgSend(v3, sel_hash));
  Swift::Int v5 = Hasher.finalize()();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CopresenceCore17AddressableMember)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore17AddressableMember *)AddressableMember.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore17AddressableMember_handle);
  id v5 = a3;
  v6 = self;
  id v7 = (id)MEMORY[0x1B3EA1B00](0x656C646E6168, 0xE600000000000000);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (_TtC14CopresenceCore17AddressableMember)init
{
  result = (_TtC14CopresenceCore17AddressableMember *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = AddressableMember.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end