@interface RemoteUIInviteHostingController
- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithCoder:(id)a3;
- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation RemoteUIInviteHostingController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for RemoteUIInviteHostingController();
  v14.receiver = self;
  v14.super_class = v8;
  v9 = self;
  [(RemoteUIInviteHostingController *)&v14 viewDidDisappear:v3];
  uint64_t v10 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_218CAF168();
  uint64_t v11 = sub_218CAF158();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  sub_218A41DF4((uint64_t)v7, (uint64_t)&unk_267BECFC0, v12);

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for RemoteUIInviteHostingController();
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  [(RemoteUIInviteHostingController *)&v15 viewDidAppear:v3];
  uint64_t v10 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_218CAF168();
  uint64_t v11 = v9;
  uint64_t v12 = sub_218CAF158();
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_218A41DF4((uint64_t)v7, (uint64_t)&unk_267BECFB0, (uint64_t)v13);

  swift_release();
}

- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_218CAEE38();
    uint64_t v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
    *uint64_t v6 = 0;
    v6[1] = 0xE000000000000000;
    id v7 = a4;
    v8 = (void *)sub_218CAEDF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
    void *v9 = 0;
    v9[1] = 0xE000000000000000;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for RemoteUIInviteHostingController();
  uint64_t v11 = [(HelpfulRemoteUiHostingVC *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC14FamilyCircleUI31RemoteUIInviteHostingController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC14FamilyCircleUI31RemoteUIInviteHostingController_inviteCode);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteUIInviteHostingController();
  return [(HelpfulRemoteUiHostingVC *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end