@interface HelpfulRemoteUiHostingVC
- (_TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC)initWithCoder:(id)a3;
- (_TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissModalRUIController:(RUINavigationController *)a3 completion:(id)a4;
- (void)presentModalRUIController:(RUINavigationController *)a3 completion:(id)a4;
- (void)replaceModalRUIController:(RUINavigationController *)a3 byController:(RUINavigationController *)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation HelpfulRemoteUiHostingVC

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HelpfulRemoteUiHostingVC();
  id v2 = v3.receiver;
  [(HelpfulRemoteUiHostingVC *)&v3 viewDidLoad];
  sub_218C1B1A4();
}

- (void)presentModalRUIController:(RUINavigationController *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BEF2C8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF2D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BEF2D8, (uint64_t)v14);
  swift_release();
}

- (void)replaceModalRUIController:(RUINavigationController *)a3 byController:(RUINavigationController *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267BEF2A8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267BEF2B0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_218C50914((uint64_t)v11, (uint64_t)&unk_267BEF2B8, (uint64_t)v16);
  swift_release();
}

- (void)dismissModalRUIController:(RUINavigationController *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BEF288;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF290;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8C80, (uint64_t)v14);
  swift_release();
}

- (_TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_218CAEE38();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_progressView) = 0;
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_shouldAddSpinner) = 0;
    id v6 = a4;
    uint64_t v7 = (void *)sub_218CAEDF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_progressView) = 0;
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_shouldAddSpinner) = 0;
    id v8 = a4;
    uint64_t v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HelpfulRemoteUiHostingVC();
  uint64_t v9 = [(HelpfulRemoteUiHostingVC *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_progressView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_shouldAddSpinner) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HelpfulRemoteUiHostingVC();
  return [(HelpfulRemoteUiHostingVC *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI24HelpfulRemoteUiHostingVC_progressView));
}

@end