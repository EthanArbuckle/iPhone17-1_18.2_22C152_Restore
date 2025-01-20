@interface AirDropSettingsRoot
- (_TtC15AirDropSettings19AirDropSettingsRoot)initWithCoder:(id)a3;
- (_TtC15AirDropSettings19AirDropSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
@end

@implementation AirDropSettingsRoot

- (void)viewDidLoad
{
  v2 = self;
  sub_F1CC();
}

- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_5C9C(&qword_18928);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_11018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_18938;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_18948;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_103D4((uint64_t)v9, (uint64_t)&unk_18958, (uint64_t)v14);
  swift_release();
}

- (_TtC15AirDropSettings19AirDropSettingsRoot)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_10FA8();
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter] = 0;
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState] = 0;
    id v8 = a4;
    a3 = sub_10F98();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter] = 0;
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState] = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(AirDropSettingsRoot *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC15AirDropSettings19AirDropSettingsRoot)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsListHighlighter] = 0;
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(AirDropSettingsRoot *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(void **)&self->PSViewController_opaque[OBJC_IVAR____TtC15AirDropSettings19AirDropSettingsRoot____lazy_storage___airDropSettingsState];
}

@end