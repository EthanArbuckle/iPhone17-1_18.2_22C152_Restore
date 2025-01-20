@interface DBThemeController
- (BOOL)requiresDarkAppearanceInEnvironment:(id)a3;
- (BOOL)validateThemeDataOnVehicle:(id)a3;
- (NSArray)displays;
- (NSURL)extraAssetsURL;
- (NSURL)layoutURL;
- (_TtC9DashBoard17DBThemeController)init;
- (_TtC9DashBoard17DBThemeController)initWithThemeAssetDocument:(id)a3;
- (_TtC9DashBoard20DBThemeAssetDocument)themeAssetDocument;
- (id)secureURLFor:(id)a3 displayID:(id)a4;
- (id)urlFor:(id)a3 displayID:(id)a4;
- (int64_t)defaultAppearanceModePreferenceForThemeData:(id)a3;
- (unint64_t)assetVersion;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)willUpdateThemeData:(id)a3 withDuration:(double)a4 delay:(double)a5;
@end

@implementation DBThemeController

- (_TtC9DashBoard20DBThemeAssetDocument)themeAssetDocument
{
  return (_TtC9DashBoard20DBThemeAssetDocument *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC9DashBoard17DBThemeController_themeAssetDocument));
}

- (_TtC9DashBoard17DBThemeController)initWithThemeAssetDocument:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard17DBThemeController_themeAssetDocument) = (Class)a3;
  id v5 = objc_allocWithZone(MEMORY[0x263F30E18]);
  id v6 = a3;
  v7 = self;
  result = (_TtC9DashBoard17DBThemeController *)objc_msgSend(v5, sel_initWithProtocol_, &unk_26E1A67A8);
  if (result)
  {
    *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC9DashBoard17DBThemeController_observers) = (Class)result;

    v10.receiver = v7;
    v10.super_class = (Class)type metadata accessor for DBThemeController();
    v9 = [(DBThemeController *)&v10 init];

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSURL)layoutURL
{
  v2 = (void *)sub_22D85CC58();
  return (NSURL *)v2;
}

- (NSURL)extraAssetsURL
{
  uint64_t v3 = sub_22D85CC38();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22D85CCB8();
  uint64_t v7 = *(void *)(v20 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v20);
  objc_super v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v19 - v11;
  v13 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0x68);
  v14 = self;
  v13();
  uint64_t v21 = 0x736172747845;
  unint64_t v22 = 0xE600000000000000;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  sub_22D820114();
  sub_22D85CCA8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v16 = v20;
  v15(v10, v20);

  v17 = (void *)sub_22D85CC58();
  v15(v12, v16);
  return (NSURL *)v17;
}

- (unint64_t)assetVersion
{
  uint64_t v3 = sub_22D85CE18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_22D85CF28();
  unint64_t v8 = sub_22D85CDF8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (NSArray)displays
{
  uint64_t v3 = sub_22D85CE18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_22D85CF28();
  uint64_t v8 = sub_22D85CE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v9 = v7;
  sub_22D835D04(v8, (uint64_t)v9);
  swift_bridgeObjectRelease();

  sub_22D7E9754(0, &qword_26858B2C0);
  uint64_t v10 = (void *)sub_22D85E5A8();
  swift_bridgeObjectRelease();
  return (NSArray *)v10;
}

- (id)secureURLFor:(id)a3 displayID:(id)a4
{
  uint64_t v5 = sub_22D85E4C8();
  uint64_t v7 = v6;
  uint64_t v8 = sub_22D85E4C8();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  id v12 = sub_22D820768(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)urlFor:(id)a3 displayID:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26858B6C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22D85E4C8();
  uint64_t v10 = v9;
  uint64_t v11 = (void (*)(char *, uint64_t))sub_22D85E4C8();
  uint64_t v13 = v12;
  v14 = self;
  DBThemeController.url(for:displayID:)(v8, v10, v11, v13, (uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_22D85CCB8();
  uint64_t v16 = *(void *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) != 1)
  {
    v17 = (void *)sub_22D85CC58();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v15);
  }
  return v17;
}

- (BOOL)validateThemeDataOnVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = DBThemeController.validateThemeData(on:)(v4);

  return self & 1;
}

- (int64_t)defaultAppearanceModePreferenceForThemeData:(id)a3
{
  sub_22D7E9754(0, &qword_26858A300);
  uint64_t v4 = sub_22D85E458();
  uint64_t v5 = self;
  int64_t v6 = DBThemeController.defaultAppearanceModePreference(for:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)requiresDarkAppearanceInEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = DBThemeController.requiresDarkAppearance(in:)(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)willUpdateThemeData:(id)a3 withDuration:(double)a4 delay:(double)a5
{
  sub_22D7E9754(0, &qword_26858A300);
  sub_22D85E458();
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard17DBThemeController_observers);
  uint64_t v9 = self;
  id v10 = (id)sub_22D85E448();
  objc_msgSend(v8, sel_willUpdateThemeData_withDuration_delay_, v10, a4, a5);

  swift_bridgeObjectRelease();
}

- (_TtC9DashBoard17DBThemeController)init
{
  result = (_TtC9DashBoard17DBThemeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard17DBThemeController_observers);
}

@end