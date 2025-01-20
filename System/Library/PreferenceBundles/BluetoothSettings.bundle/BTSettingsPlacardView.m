@interface BTSettingsPlacardView
- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithCoder:(id)a3;
- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation BTSettingsPlacardView

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C10000);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = self;
  id v13 = a3;
  id v9 = a3;
  v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C10008);
  sub_23EB4C6E8(&qword_268C10010, &qword_268C10008);
  sub_23EB4D7A0();
  sub_23EB4D7B0();
  v14[3] = v5;
  v14[4] = sub_23EB4C6E8(&qword_268C10018, &qword_268C10000);
  __swift_allocate_boxed_opaque_existential_1(v14);
  sub_23EB4D790();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  MEMORY[0x23ED0C260](v14);
  [(BTSettingsPlacardView *)v10 setSelectionStyle:0];
}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_23EB4D840();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17BluetoothSettings21BTSettingsPlacardView *)sub_23EB4BAB4(a3, v7, v9, a5);
}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_23EB4D840();
    a4 = (id)sub_23EB4D810();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(BTSettingsPlacardView *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(BTSettingsPlacardView *)&v5 initWithCoder:a3];
}

@end