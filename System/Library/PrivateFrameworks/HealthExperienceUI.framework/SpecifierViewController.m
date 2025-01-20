@interface SpecifierViewController
- (_TtC18HealthExperienceUI23SpecifierViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23SpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)dismissNavigationController;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SpecifierViewController

- (_TtC18HealthExperienceUI23SpecifierViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersAfterSelection) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersOnViewWillAppear) = 1;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI23SpecifierViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpecifierViewController();
  id v2 = v8.receiver;
  [(SpecifierViewController *)&v8 viewDidLoad];
  sub_1AD1EEB90();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1AD74C350;
  uint64_t v4 = sub_1AD73CE70();
  uint64_t v5 = MEMORY[0x1E4FB0F40];
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  uint64_t v6 = sub_1AD73D540();
  uint64_t v7 = MEMORY[0x1E4FB1138];
  *(void *)(v3 + 48) = v6;
  *(void *)(v3 + 56) = v7;
  MEMORY[0x1B3E65E80](v3, sel_reloadSpecifiers);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpecifierViewController();
  id v4 = v5.receiver;
  [(SpecifierViewController *)&v5 viewWillAppear:v3];
  if (*((unsigned char *)v4
       + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_shouldReloadSpecifiersOnViewWillAppear) == 1)
  {
    sub_1AD24C880();
    objc_msgSend(v4, sel_reloadSpecifiers, v5.receiver, v5.super_class);
  }
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)dismissNavigationController
{
  objc_super v5 = self;
  id v2 = (_TtC18HealthExperienceUI23SpecifierViewController *)[(SpecifierViewController *)v5 navigationController];
  if (v2)
  {
    BOOL v3 = v2;
    [(SpecifierViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (id)specifiers
{
  id v2 = self;
  uint64_t v3 = sub_1AD24C3B8();

  if (v3)
  {
    id v4 = (void *)sub_1AD73F490();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  sub_1AD24C648((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI23SpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI23SpecifierViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_dataSource));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23SpecifierViewController_delegate;
  sub_1AD24D3D8((uint64_t)v3);
}

@end