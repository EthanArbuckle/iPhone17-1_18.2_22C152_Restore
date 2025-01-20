@interface EventAccessoryItemModule
- (_TtC6HomeUI24EventAccessoryItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5;
- (id)buildItemProviders;
@end

@implementation EventAccessoryItemModule

- (id)buildItemProviders
{
  v2 = self;
  sub_1BE533D04();
  uint64_t v4 = v3;

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA45750);
    sub_1BE37E998((unint64_t *)&qword_1EBA45760, (uint64_t *)&unk_1EBA45750);
    v5 = (void *)sub_1BE9C4E58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_TtC6HomeUI24EventAccessoryItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5
{
  swift_getObjectType();
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();

  return (_TtC6HomeUI24EventAccessoryItemModule *)sub_1BE4457C8(v9, v10, (uint64_t)a5, (char *)self);
}

@end