@interface EmojiGenerationBaseController
- (_TtC10StickerKit29EmojiGenerationBaseController)initWithCoder:(id)a3;
- (_TtC10StickerKit29EmojiGenerationBaseController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EmojiGenerationBaseController

- (void)dealloc
{
  v2 = self;
  EmojiGenerationBaseController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_pillVC));
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController__pillViewModel;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED5108);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_pillContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_promptEntryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_carouselVC));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_pillLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_contextMenuButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_macPersonPopupButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_macEditButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_imageDescriptionVC));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController__blobStatusHostingController;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED5110);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController__blobStatusView;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED5118);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_skinColorSelectionVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_skinColorSelectionView));
  swift_bridgeObjectRelease();
  v9 = (char *)self + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_promptCharacterSet;
  uint64_t v10 = sub_2453FC8B8();
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);

  v11(v9, v10);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_245377264();
}

- (_TtC10StickerKit29EmojiGenerationBaseController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit29EmojiGenerationBaseController *)EmojiGenerationBaseController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit29EmojiGenerationBaseController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit29EmojiGenerationBaseController *)EmojiGenerationBaseController.init(coder:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  EmojiGenerationBaseController.viewDidDisappear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
}

@end