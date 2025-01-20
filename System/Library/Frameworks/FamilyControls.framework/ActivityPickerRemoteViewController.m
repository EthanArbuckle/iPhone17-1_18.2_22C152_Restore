@interface ActivityPickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (ActivityPickerRemoteViewController)initWithCoder:(id)a3;
- (ActivityPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didCancel;
- (void)didSelectWithApplications:(id)a3 categories:(id)a4 webDomains:(id)a5 untokenizedApplications:(id)a6 untokenizedCategories:(id)a7 untokenizedWebDomains:(id)a8;
@end

@implementation ActivityPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return sub_20B93D5D4((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls30ActivityPickerServiceInterface_);
}

+ (id)exportedInterface
{
  return sub_20B93D5D4((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls29ActivityPickerClientInterface_);
}

- (ActivityPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_20B97A448();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
    void *v6 = 0;
    v6[1] = 0;
    v7 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
    void *v7 = 0;
    v7[1] = 0;
    id v8 = a4;
    v9 = (void *)sub_20B97A438();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
    void *v10 = 0;
    v10[1] = 0;
    v11 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
    void *v11 = 0;
    v11[1] = 0;
    id v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for ActivityPickerRemoteViewController();
  v13 = [(ActivityPickerRemoteViewController *)&v15 initWithNibName:v9 bundle:a4];

  return v13;
}

- (ActivityPickerRemoteViewController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);
  v7 = (objc_class *)type metadata accessor for ActivityPickerRemoteViewController();
  void *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(ActivityPickerRemoteViewController *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_20B93CDC4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___ActivityPickerRemoteViewController_didSelectCallback));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___ActivityPickerRemoteViewController_didCancelCallback);

  sub_20B93CDC4(v3);
}

- (void)didSelectWithApplications:(id)a3 categories:(id)a4 webDomains:(id)a5 untokenizedApplications:(id)a6 untokenizedCategories:(id)a7 untokenizedWebDomains:(id)a8
{
  uint64_t v9 = sub_20B97A4F8();
  uint64_t v10 = sub_20B97A4F8();
  uint64_t v11 = sub_20B97A4F8();
  uint64_t v12 = sub_20B97A4F8();
  uint64_t v13 = sub_20B97A4F8();
  uint64_t v14 = sub_20B97A4F8();
  objc_super v15 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v16 = self;
  v17 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v15();
  if (v17)
  {
    uint64_t v18 = (uint64_t)v17;
    v17(v9, v10, v11, v12, v13, v14);
    sub_20B93CDC4(v18);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didCancel
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa) + 0x78);
  v5 = self;
  uint64_t v3 = (void (*)(void))v2();
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    v3();
    sub_20B93CDC4(v4);
  }
}

@end