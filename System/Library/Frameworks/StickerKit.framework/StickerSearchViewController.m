@interface StickerSearchViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10StickerKit27StickerSearchViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit27StickerSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StickerSearchViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24528A648();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_24528B4B8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_24528BC00(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_24528D804();
}

- (void)dealloc
{
  uint64_t v2 = qword_268ECF200;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2453FDBB8();
  __swift_project_value_buffer(v4, (uint64_t)qword_268ED1B10);
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
  v8.super_class = (Class)type metadata accessor for StickerSearchViewController();
  [(StickerSearchViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController_hostingController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController____lazy_storage___availability));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController_currentQuery));
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit27StickerSearchViewController_delegate);

  swift_unknownObjectRelease();
}

- (_TtC10StickerKit27StickerSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit27StickerSearchViewController *)StickerSearchViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27StickerSearchViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27StickerSearchViewController *)StickerSearchViewController.init(coder:)(a3);
}

@end