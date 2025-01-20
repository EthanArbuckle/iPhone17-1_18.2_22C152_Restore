@interface StickerPickerViewController
- (_TtC10StickerKit27StickerPickerViewController)init;
- (_TtC10StickerKit27StickerPickerViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit27StickerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation StickerPickerViewController

- (_TtC10StickerKit27StickerPickerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  id v6 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  result = (_TtC10StickerKit27StickerPickerViewController *)sub_2454009B8();
  __break(1u);
  return result;
}

- (_TtC10StickerKit27StickerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  id v7 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  id v8 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  uint64_t v9 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  result = (_TtC10StickerKit27StickerPickerViewController *)sub_2454009B8();
  __break(1u);
  return result;
}

- (_TtC10StickerKit27StickerPickerViewController)init
{
  uint64_t v3 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController;
  id v4 = objc_allocWithZone((Class)STKStickerPickerSceneViewController);
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for StickerPickerViewController();
  return [(StickerPickerViewController *)&v8 initWithNibName:0 bundle:0];
}

- (void)loadView
{
  v2 = self;
  sub_245368DA0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewController));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit27StickerPickerViewController_sceneViewControllerDelegateProxy);
}

@end