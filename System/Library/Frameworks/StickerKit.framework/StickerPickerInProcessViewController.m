@interface StickerPickerInProcessViewController
- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleCloseButton;
- (void)loadView;
@end

@implementation StickerPickerInProcessViewController

- (void)loadView
{
  v2 = self;
  sub_2453B1338();
}

- (void)handleCloseButton
{
  v6 = self;
  id v2 = [(StickerPickerInProcessViewController *)v6 _hostedWindowScene];
  if (v2)
  {
    v3 = v2;
    v4 = (_TtC10StickerKit36StickerPickerInProcessViewController *)objc_msgSend(self, sel_actionForStickerPickerSceneDidRequestDismissal);
    objc_msgSend(v3, sel_sendAction_, v4);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }
}

- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav;
  id v9 = objc_allocWithZone(MEMORY[0x263F829C0]);
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  if (v7)
  {
    v12 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for StickerPickerInProcessViewController();
  v13 = [(StickerPickerInProcessViewController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav;
  id v6 = objc_allocWithZone(MEMORY[0x263F829C0]);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for StickerPickerInProcessViewController();
  id v9 = [(StickerPickerInProcessViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav));
}

@end