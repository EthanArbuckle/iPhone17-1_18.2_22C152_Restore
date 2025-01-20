@interface IMActionComposeText
- (IMActionComposeText)init;
- (IMActionComposeText)initWithDictionary:(id)a3;
- (IMActionComposeText)initWithPhoneNumber:(id)a3 text:(id)a4;
- (NSString)phoneNumber;
- (NSString)text;
- (id)dictionaryRepresentation;
@end

@implementation IMActionComposeText

- (NSString)phoneNumber
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)text
{
  return (NSString *)sub_1A088C3D4();
}

- (IMActionComposeText)initWithPhoneNumber:(id)a3 text:(id)a4
{
  uint64_t v5 = sub_1A09F3E18();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1A09F3E18();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeText_phoneNumber);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeText_text);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)IMActionComposeText;
  return [(IMActionComposeText *)&v13 init];
}

- (IMActionComposeText)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionComposeText *)IMActionComposeText.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A088C73C();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionComposeText)init
{
  result = (IMActionComposeText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end