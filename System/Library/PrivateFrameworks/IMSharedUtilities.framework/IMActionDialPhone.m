@interface IMActionDialPhone
- (IMActionDialPhone)init;
- (IMActionDialPhone)initWithDictionary:(id)a3;
- (IMActionDialPhone)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4;
- (NSString)fallbackUrl;
- (NSString)phoneNumber;
- (id)dictionaryRepresentation;
@end

@implementation IMActionDialPhone

- (NSString)phoneNumber
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)fallbackUrl
{
  if (*(void *)&self->phoneNumber[OBJC_IVAR___IMActionDialPhone_fallbackUrl])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A09F3DE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (IMActionDialPhone)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4
{
  uint64_t v6 = sub_1A09F3E18();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1A09F3E18();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialPhone_phoneNumber);
  uint64_t *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialPhone_fallbackUrl);
  uint64_t *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)IMActionDialPhone;
  return [(IMActionDialPhone *)&v14 init];
}

- (IMActionDialPhone)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionDialPhone *)IMActionDialPhone.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08B1B78();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionDialPhone)init
{
  result = (IMActionDialPhone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end