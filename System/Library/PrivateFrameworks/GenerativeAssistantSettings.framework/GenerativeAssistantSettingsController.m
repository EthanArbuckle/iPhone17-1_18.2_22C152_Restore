@interface GenerativeAssistantSettingsController
+ (BOOL)available;
- (GenerativeAssistantSettingsController)initWithCoder:(id)a3;
- (GenerativeAssistantSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4;
- (void)viewDidLoad;
@end

@implementation GenerativeAssistantSettingsController

+ (BOOL)available
{
  uint64_t v2 = sub_24FABF3E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FABF3A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF390();
  char v10 = sub_24FABF370();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v10)
  {
    sub_24FABF3D0();
    char v11 = sub_24FABF3B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    char v12 = v11 ^ 1;
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = _Block_copy(a4);
  char v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24FAC0110();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269A4BE78;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269A4BE88;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_24FA95228((uint64_t)v9, (uint64_t)&unk_269A4BE98, (uint64_t)v14);
  swift_release();
}

- (GenerativeAssistantSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_24FABFFE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR___GenerativeAssistantSettingsController_settings;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  v9 = self;
  id v10 = a4;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)sub_24FAA0B84();

  if (v7)
  {
    char v11 = (void *)sub_24FABFFD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for GenerativeAssistantSettingsController();
  uint64_t v12 = [(GenerativeAssistantSettingsController *)&v14 initWithNibName:v11 bundle:v10];

  return v12;
}

- (GenerativeAssistantSettingsController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___GenerativeAssistantSettingsController_settings;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  id v6 = a3;
  uint64_t v7 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_24FAA0B84();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for GenerativeAssistantSettingsController();
  uint64_t v8 = [(GenerativeAssistantSettingsController *)&v10 initWithCoder:v6];

  return v8;
}

- (void).cxx_destruct
{
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  GenerativeAssistantSettingsController.viewDidLoad()();
}

@end