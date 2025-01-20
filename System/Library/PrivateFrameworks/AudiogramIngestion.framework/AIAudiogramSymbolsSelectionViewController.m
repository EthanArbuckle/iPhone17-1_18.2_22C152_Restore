@interface AIAudiogramSymbolsSelectionViewController
- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 delegate:(id)a4 selectedSymbols:(id)a5;
- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelTapped:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)leftEarXButtonTapped:(void *)a3;
- (void)selectFrequencies:(id)a3;
- (void)viewDidLoad;
@end

@implementation AIAudiogramSymbolsSelectionViewController

- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 delegate:(id)a4 selectedSymbols:(id)a5
{
  uint64_t v6 = sub_23F120DC0();
  uint64_t v8 = v7;
  sub_23F11656C(0, (unint64_t *)&qword_268C353C0);
  uint64_t v9 = sub_23F120E60();
  swift_unknownObjectRetain();
  return (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController *)AIAudiogramSymbolsSelectionViewController.init(title:delegate:selectedSymbols:)(v6, v8, (uint64_t)a4, v9);
}

- (void)selectFrequencies:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_23F120F80();
  swift_unknownObjectRelease();
  v5 = (void *)MEMORY[0x2455C57F0]((char *)v4 + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_delegate);
  if (v5)
  {
    objc_msgSend(v5, sel_showFrequencySelectionViewController);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

- (void)cancelTapped:(id)a3
{
  uint64_t v5 = MEMORY[0x2455C57F0]((char *)self + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_delegate, a2);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = a3;
    uint64_t v8 = self;
    objc_msgSend(v6, sel_cancelButtonTapped);

    swift_unknownObjectRelease();
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23F119FA8();
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4 = sub_23F120C60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F120C50();
  uint64_t v8 = self;
  sub_23F11AAAC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)leftEarXButtonTapped:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  id v6 = objc_msgSend(v4, sel_view);
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for AIAudiogramSymbolChoiceButton();
    id v7 = (char *)swift_dynamicCastClass();
    if (v7) {
      sub_23F11B640(v7);
    }

    id v4 = v5;
  }
  else
  {
    id v8 = v5;
  }
}

- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23F10E1E4((uint64_t)self + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_firstRowButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController_secondRowButtons));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarXButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarCircleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___leftEarSquareButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController____lazy_storage___rightEarTriangleButton);
}

@end