@interface LegalAndRegulatorySettingsRoot
- (_TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot)initWithCoder:(id)a3;
- (_TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
@end

@implementation LegalAndRegulatorySettingsRoot

- (void)viewDidLoad
{
  v2 = self;
  sub_22EC();
}

- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4
{
  sub_2AFC(&qword_8308);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_3638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_8318;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_8328;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_309C((uint64_t)v8, (uint64_t)&unk_8338, (uint64_t)v13);
  swift_release();
}

- (_TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_35E8();
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState] = 0;
    id v8 = a4;
    a3 = sub_35D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState] = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(LegalAndRegulatorySettingsRoot *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC26LegalAndRegulatorySettings30LegalAndRegulatorySettingsRoot____lazy_storage___legalAndRegulatorySettingsListState] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(LegalAndRegulatorySettingsRoot *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end