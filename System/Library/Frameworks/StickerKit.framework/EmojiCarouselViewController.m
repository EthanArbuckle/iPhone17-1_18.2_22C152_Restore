@interface EmojiCarouselViewController
- (_TtC10StickerKit27EmojiCarouselViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit27EmojiCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EmojiCarouselViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2451EF87C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2451F0E88(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiCarouselViewController();
  id v2 = v3.receiver;
  [(EmojiCarouselViewController *)&v3 viewDidLayoutSubviews];
  sub_2451F2F80();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_245200D1C(a4);
  swift_unknownObjectRelease();
}

- (_TtC10StickerKit27EmojiCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit27EmojiCarouselViewController *)EmojiCarouselViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27EmojiCarouselViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27EmojiCarouselViewController *)EmojiCarouselViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_pageControlVC));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController__generator;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECF9A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_pageControllerVerticalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_evaluationResult));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_pageControlLayoutGuide);
}

@end