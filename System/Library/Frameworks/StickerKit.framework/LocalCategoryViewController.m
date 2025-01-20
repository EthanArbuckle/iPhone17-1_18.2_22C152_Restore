@interface LocalCategoryViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10StickerKit27LocalCategoryViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit27LocalCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LocalCategoryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_245279E5C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_24527C574();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_24527ADD8();
}

- (void)dealloc
{
  uint64_t v2 = qword_268ECF1D8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2453FDBB8();
  __swift_project_value_buffer(v4, (uint64_t)qword_268ED17A0);
  v5 = sub_2453FDB98();
  os_log_type_t v6 = sub_2454000C8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2451E4000, v5, v6, "deinit", v7, 2u);
    MEMORY[0x2456A0410](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for LocalCategoryViewController();
  [(LocalCategoryViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit27LocalCategoryViewController__hostingController;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1888);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10StickerKit27LocalCategoryViewController__configuration;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1890);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (_TtC10StickerKit27LocalCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10StickerKit27LocalCategoryViewController *)LocalCategoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27LocalCategoryViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27LocalCategoryViewController *)LocalCategoryViewController.init(coder:)(a3);
}

@end