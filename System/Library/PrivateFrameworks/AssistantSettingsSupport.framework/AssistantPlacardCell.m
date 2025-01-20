@interface AssistantPlacardCell
- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithCoder:(id)a3;
- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AssistantPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BBB0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = a3;
  v10 = self;
  [(AssistantPlacardCell *)v10 setSelectionStyle:0];
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2BBB8);
  sub_220C54E00(&qword_267F2BBC0, &qword_267F2BBB8);
  sub_220C74B90();
  sub_220C74BC0();
  v13[3] = v5;
  v13[4] = sub_220C54E00(&qword_267F2BBC8, &qword_267F2BBB0);
  __swift_allocate_boxed_opaque_existential_1(v13);
  sub_220C74B80();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  MEMORY[0x223C714E0](v13);
}

- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_220C74E00();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC24AssistantSettingsSupport20AssistantPlacardCell *)sub_220C53F4C(a3, v7, v9, a5);
}

- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_220C74E00();
    a4 = (id)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(AssistantPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC24AssistantSettingsSupport20AssistantPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AssistantPlacardCell *)&v5 initWithCoder:a3];
}

@end