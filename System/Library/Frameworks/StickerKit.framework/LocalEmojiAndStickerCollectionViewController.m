@interface LocalEmojiAndStickerCollectionViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didBeginDragWithShouldDismiss:(BOOL)a3;
- (void)didChangePlaceholder:(id)a3;
- (void)didSelectEmoji:(id)a3;
- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4;
- (void)didTapToCreateNew:(id)a3;
- (void)didTapToEdit:(id)a3;
- (void)didTapToInsertSticker:(id)a3;
- (void)didTapToPresentPicker:(id)a3;
- (void)handleKeyEvent:(id)a3;
- (void)handleWithPinch:(id)a3;
- (void)stickerViewDidBeginDrag:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:;
@end

@implementation LocalEmojiAndStickerCollectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2453F5388();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v3 = self;
  sub_2453FAAF0();
}

- (void)handleKeyEvent:(id)a3
{
}

- (void)didSelectEmoji:(id)a3
{
  uint64_t v4 = sub_2453FFB38();
  uint64_t v6 = v5;
  v7 = self;
  sub_2453F6270(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  uint64_t v6 = sub_2453FFB38();
  uint64_t v8 = v7;
  v9 = self;
  sub_2453F63B8(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didBeginDragWithShouldDismiss:(BOOL)a3
{
  uint64_t v8 = self;
  id v4 = [(LocalEmojiAndStickerCollectionViewController *)v8 _hostedWindowScene];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_2453F9C0C(7, a3, 0, 0);
    objc_msgSend(v5, sel_sendAction_, v6);

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = v8;
  }
}

- (void)didTapToInsertSticker:(id)a3
{
}

- (void)didTapToEdit:(id)a3
{
}

- (void)didTapToPresentPicker:(id)a3
{
  uint64_t v4 = sub_2453FC918();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FC8D8();
  uint64_t v8 = self;
  id v9 = [(LocalEmojiAndStickerCollectionViewController *)v8 _hostedWindowScene];
  if (v9)
  {
    v10 = v9;
    v11 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_2453F9C0C(3, 1, 0, 0);
    objc_msgSend(v10, sel_sendAction_, v11);

    uint64_t v8 = v11;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapToCreateNew:(id)a3
{
}

- (void)didChangePlaceholder:(id)a3
{
}

- (void)stickerViewDidBeginDrag:(id)a3
{
}

- (void)handleWithPinch:(id)a3
{
  id v4 = a3;
  v10 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    objc_msgSend(v4, sel_scale);
    double v6 = v5;
    id v7 = [(LocalEmojiAndStickerCollectionViewController *)v10 _hostedWindowScene];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_2453FA610(v6, 6, 0, 0);
      objc_msgSend(v8, sel_sendAction_, v9);

      id v4 = v8;
      v10 = v9;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  LocalEmojiAndStickerCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController__pinchGestureRecognizer;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED68C0);
  double v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)LocalEmojiAndStickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)LocalEmojiAndStickerCollectionViewController.init(coder:)(a3);
}

- (void)viewWillDisappear:
{
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2453FDBB8();
  __swift_project_value_buffer(v0, (uint64_t)qword_268ED6740);
  v1 = sub_2453FDB98();
  os_log_type_t v2 = sub_2454000C8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2451E4000, v1, v2, "viewWillDisappear", v3, 2u);
    MEMORY[0x2456A0410](v3, -1, -1);
  }

  if (qword_268ECECA8 != -1) {
    swift_once();
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3B500]), sel_initWithMachName_, 0);
  objc_msgSend(v4, sel_writeEmojiDefaults);
}

@end