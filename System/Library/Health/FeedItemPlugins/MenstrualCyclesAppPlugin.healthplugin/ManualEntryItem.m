@interface ManualEntryItem
- (_TtC24MenstrualCyclesAppPlugin15ManualEntryItem)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation ManualEntryItem

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  int64_t result = MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4);
  if (result)
  {
    uint64_t v8 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void *)(v8 + 8);
    v11 = *(uint64_t (**)(id, uint64_t, uint64_t))(v10 + 16);
    id v12 = a3;
    v13 = self;
    int64_t v14 = v11(v12, ObjectType, v10);

    swift_unknownObjectRelease();
    return v14;
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  if (MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4, a5))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(void (**)(int64_t, uint64_t, uint64_t))(v9 + 24);
    id v12 = a3;
    v13 = self;
    v11(a4, ObjectType, v9);

    swift_unknownObjectRelease();
    int64_t v14 = (void *)sub_241631CC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  if (MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4, a5))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(void (**)(id, int64_t, uint64_t, uint64_t))(v9 + 16);
    id v12 = a3;
    v13 = self;
    v11(v12, a4, ObjectType, v9);

    swift_unknownObjectRelease();
  }
}

- (_TtC24MenstrualCyclesAppPlugin15ManualEntryItem)init
{
  *(void *)&self->dataSource[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ManualEntryItem();
  return [(ManualEntryItem *)&v4 init];
}

- (void).cxx_destruct
{
}

@end