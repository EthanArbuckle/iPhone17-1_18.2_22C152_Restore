@interface ICloudPlusViewController
- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithCoder:(id)a3;
- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICloudPlusViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ICloudPlusViewController();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  [(ICloudPlusViewController *)&v15 viewDidAppear:v3];
  uint64_t v10 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_218CAF168();
  v11 = v9;
  uint64_t v12 = sub_218CAF158();
  v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_218A41DF4((uint64_t)v7, (uint64_t)&unk_267BF07F8, (uint64_t)v13);

  swift_release();
}

- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_218CAEE38();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
    id v6 = a4;
    v7 = (void *)sub_218CAEDF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ICloudPlusViewController();
  v9 = [(HelpfulRemoteUiHostingVC *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC14FamilyCircleUI24ICloudPlusViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI24ICloudPlusViewController_iCloudPlusFamilyFlow) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ICloudPlusViewController();
  return [(HelpfulRemoteUiHostingVC *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end