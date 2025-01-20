@interface AvatarEditorViewController
- (_TtC10StickerKit26AvatarEditorViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit26AvatarEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AvatarEditorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2452470FC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_245247298(a3);
}

- (_TtC10StickerKit26AvatarEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit26AvatarEditorViewController *)AvatarEditorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit26AvatarEditorViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit26AvatarEditorViewController *)AvatarEditorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit26AvatarEditorViewController_delegate);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit26AvatarEditorViewController_coordinator);
}

@end