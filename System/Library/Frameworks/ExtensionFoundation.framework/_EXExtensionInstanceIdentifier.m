@interface _EXExtensionInstanceIdentifier
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)identifier;
- (_EXExtensionInstanceIdentifier)init;
- (_EXExtensionInstanceIdentifier)initWithCoder:(id)a3;
- (_EXExtensionInstanceIdentifier)initWithIdentifier:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EXExtensionInstanceIdentifier

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_191FB9C48();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_191FB9C08();
  id v7 = (id)sub_191FB9DA8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____EXExtensionInstanceIdentifier_identifier;
  uint64_t v3 = sub_191FB9C68();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (_EXExtensionInstanceIdentifier)initWithIdentifier:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB27BE40);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_191FB9C28();
    uint64_t v7 = sub_191FB9C68();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_191FB9C68();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_EXExtensionInstanceIdentifier *)_EXExtensionInstanceIdentifier.init(instanceIdentifier:)((uint64_t)v6);
}

- (_EXExtensionInstanceIdentifier)initWithCoder:(id)a3
{
  uint64_t v5 = sub_191FB9C68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191F442A4(0, (unint64_t *)&unk_1E92FC6B0);
  id v9 = a3;
  uint64_t v10 = self;
  result = (_EXExtensionInstanceIdentifier *)sub_191FBA128();
  if (result)
  {
    v12 = result;
    sub_191FB9C28();

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR____EXExtensionInstanceIdentifier_identifier, v8, v5);
    v13 = (objc_class *)type metadata accessor for _EXExtensionInstanceIdentifier();
    v15.receiver = v10;
    v15.super_class = v13;
    v14 = [(_EXExtensionInstanceIdentifier *)&v15 init];

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_191F49778();

  uint64_t v3 = (void *)sub_191FB9DA8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92FD9B8;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92FD9B8 = a3;
}

- (_EXExtensionInstanceIdentifier)init
{
  uint64_t v3 = sub_191FB9C68();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191FB9C58();
  uint64_t v7 = (void *)sub_191FB9C08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v8 = [(_EXExtensionInstanceIdentifier *)self initWithIdentifier:v7];

  return v8;
}

- (NSUUID)identifier
{
  v2 = (void *)sub_191FB9C08();

  return (NSUUID *)v2;
}

- (BOOL)isDefault
{
  sub_191F442A4(0, (unint64_t *)&unk_1EB27BCF0);
  uint64_t v3 = qword_1E92FD1D8;
  uint64_t v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  char v5 = sub_191FBA168();

  return v5 & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_191FBA1E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    char v5 = self;
  }
  char v6 = sub_191F98F38((uint64_t)v8);

  sub_191F4CB7C((uint64_t)v8, &qword_1EB27BDE0);
  return v6 & 1;
}

@end