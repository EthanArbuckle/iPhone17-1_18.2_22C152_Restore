@interface IMActionDialEnriched
- (IMActionDialEnriched)init;
- (IMActionDialEnriched)initWithDictionary:(id)a3;
- (IMActionDialEnriched)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4 subject:(id)a5;
- (NSString)fallbackUrl;
- (NSString)phoneNumber;
- (NSString)subject;
- (id)dictionaryRepresentation;
@end

@implementation IMActionDialEnriched

- (NSString)phoneNumber
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)fallbackUrl
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionDialEnriched_fallbackUrl);
}

- (NSString)subject
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionDialEnriched_subject);
}

- (IMActionDialEnriched)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4 subject:(id)a5
{
  uint64_t v8 = sub_1A09F3E18();
  uint64_t v10 = v9;
  if (!a4)
  {
    v12 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_1A09F3E18();
  v12 = v11;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_1A09F3E18();
LABEL_6:
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialEnriched_phoneNumber);
  uint64_t *v15 = v8;
  v15[1] = v10;
  v16 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMActionDialEnriched_fallbackUrl);
  id *v16 = a4;
  v16[1] = v12;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialEnriched_subject);
  uint64_t *v17 = v13;
  v17[1] = v14;
  v19.receiver = self;
  v19.super_class = (Class)IMActionDialEnriched;
  return [(IMActionDialEnriched *)&v19 init];
}

- (IMActionDialEnriched)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMActionDialEnriched *)IMActionDialEnriched.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A0955C54();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (IMActionDialEnriched)init
{
  result = (IMActionDialEnriched *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end