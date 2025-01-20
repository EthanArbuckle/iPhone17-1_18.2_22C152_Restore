@interface STKEmojiAndStickerCollectionViewController
- (BOOL)_canShowWhileLocked;
- (STKEmojiAndStickerCollectionViewConfiguration)configuration;
- (STKEmojiAndStickerCollectionViewController)initWithCoder:(id)a3;
- (STKEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (STKEmojiAndStickerCollectionViewControllerDelegate)delegate;
- (id)transitionerForConnectingHostingController:(id)a3;
- (void)dealloc;
- (void)didBeingDrag:(BOOL)a3;
- (void)didPinch:(double)a3;
- (void)didSelectCreate:(id)a3 queryString:(id)a4;
- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4;
- (void)didSelectEmoji:(id)a3;
- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4;
- (void)didSelectPresentPicker;
- (void)didSelectSticker:(id)a3;
- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4;
- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5;
- (void)emojiGenerationRemoteControllerDidCancel:(id)a3;
- (void)handleKeyEvent:(id)a3;
- (void)searchWithQuery:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation STKEmojiAndStickerCollectionViewController

- (STKEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2456A0530](v2);

  return (STKEmojiAndStickerCollectionViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (STKEmojiAndStickerCollectionViewConfiguration)configuration
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  return (STKEmojiAndStickerCollectionViewConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)viewDidLoad
{
  v2 = self;
  EmojiAndStickerCollectionViewController.viewDidLoad()();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v3 = self;
  _s10StickerKit08EmojiAndA24CollectionViewControllerC15viewIsAppearingyySbF_0();
}

- (void)searchWithQuery:(id)a3
{
  v4 = (char *)a3;
  v5 = self;
  EmojiAndStickerCollectionViewController.search(withQuery:)(v4);
}

- (void)handleKeyEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  EmojiAndStickerCollectionViewController.handleKeyEvent(_:)((UIKey)v4);
}

- (void)didSelectEmoji:(id)a3
{
  sub_2453FFB38();
  id v4 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x2456A0530](v4);
  if (v5)
  {
    id v6 = (void *)v5;
    v7 = self;
    v8 = (void *)sub_2453FFB08();
    objc_msgSend(v6, sel_didSelectEmoji_, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  uint64_t v6 = sub_2453FFB38();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  EmojiAndStickerCollectionViewController.didSelectEmoji(_:dismiss:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)didSelectSticker:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2456A0530](v5);
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_didSelectSticker_, v8);

    swift_unknownObjectRelease();
  }
}

- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  EmojiAndStickerCollectionViewController.didSelectSticker(_:dismiss:)((uint64_t)v6, a4);
}

- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = sub_2453FCCB8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCC98();
  v13 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x2456A0530](v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = self;
    v17 = (void *)sub_2453FCC78();
    objc_msgSend(v15, sel_didSelectEditWithStickerIdentifer_sourceRect_, v17, x, y, width, height);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didSelectPresentPicker
{
  v3 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2456A0530](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = self;
    objc_msgSend(v5, sel_didSelectPresentPicker);

    swift_unknownObjectRelease();
  }
}

- (void)didSelectCreate:(id)a3 queryString:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2453FCC98();
    uint64_t v10 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  if (a4)
  {
    uint64_t v12 = sub_2453FFB38();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = self;
  EmojiAndStickerCollectionViewController.didSelectCreate(_:queryString:)((uint64_t)v9, v12, (uint64_t)a4);

  swift_bridgeObjectRelease();
  sub_245203CD8((uint64_t)v9, (uint64_t *)&unk_268ECEC40);
}

- (void)didPinch:(double)a3
{
  int v5 = a3 < 1.0;
  id v6 = self;
  uint64_t v7 = self;
  if (v5 != objc_msgSend(v6, sel_isFloating)) {
    objc_msgSend(v6, sel_setFloating_positionedAtDefaultOffsetAnimated_, a3 < 1.0, 0);
  }
}

- (void)didBeingDrag:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    int v5 = self;
    id v6 = objc_msgSend(v4, sel_defaultCenter);
    id v7 = (id)sub_2453FFB08();
    objc_msgSend(v6, sel_postNotificationName_object_, v7, v5);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  v5[4] = sub_2452ADC58;
  v5[5] = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_245311E20;
  v5[3] = &block_descriptor_15;
  v3 = _Block_copy(v5);
  swift_release();

  return v3;
}

- (void)dealloc
{
  v2 = self;
  EmojiAndStickerCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController__sceneHostingController;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3D70);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_245203A28((uint64_t)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration));
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (STKEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (STKEmojiAndStickerCollectionViewController *)EmojiAndStickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (STKEmojiAndStickerCollectionViewController)initWithCoder:(id)a3
{
  return (STKEmojiAndStickerCollectionViewController *)EmojiAndStickerCollectionViewController.init(coder:)(a3);
}

- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  EmojiAndStickerCollectionViewController.emojiGenerationRemoteController(_:didGenerateEmoji:shouldInsert:)(v8, v9, a5);
}

- (void)emojiGenerationRemoteControllerDidCancel:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  objc_msgSend(v5, sel_setRestoresToEmojiInputMode);
  if (qword_268ECF2C8 != -1) {
    swift_once();
  }
  sub_24530B1E8(v6, 0, 0);
}

@end