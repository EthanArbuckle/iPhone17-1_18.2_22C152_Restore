@interface StandardPlayerViewController
- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithCoder:(id)a3;
- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation StandardPlayerViewController

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithCoder:(id)a3
{
  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)sub_24925E6D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v7 = self;
  [(StandardPlayerViewController *)&v13 viewDidLoad];
  uint64_t v8 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_24925DE30();
  v9 = v7;
  uint64_t v10 = sub_24925DE20();
  v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  sub_24912E778((uint64_t)v6, (uint64_t)&unk_2696829E8, (uint64_t)v11);

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v9 = self;
  [(StandardPlayerViewController *)&v15 viewDidAppear:v3];
  uint64_t v10 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  sub_24925DE30();
  v11 = v9;
  uint64_t v12 = sub_24925DE20();
  objc_super v13 = (void *)swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_24912E778((uint64_t)v8, (uint64_t)&unk_2696829E0, (uint64_t)v13);

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  StandardPlayerViewController.viewDidDisappear(_:)(a3);
}

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end