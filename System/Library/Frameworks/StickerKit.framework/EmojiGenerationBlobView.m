@interface EmojiGenerationBlobView
- (_TtC10StickerKit23EmojiGenerationBlobView)initWithCoder:(id)a3;
- (_TtC10StickerKit23EmojiGenerationBlobView)initWithFrame:(CGRect)a3;
- (double)alpha;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)addCaption;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)copyAction;
- (void)handleTap;
- (void)reportConcern;
- (void)saveToStickers;
- (void)setAlpha:(double)a3;
- (void)shareAction;
@end

@implementation EmojiGenerationBlobView

- (_TtC10StickerKit23EmojiGenerationBlobView)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit23EmojiGenerationBlobView *)EmojiGenerationBlobView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)alpha
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiGenerationBlobView();
  [(EmojiGenerationBlobView *)&v3 alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  v4 = self;
  sub_245315ACC(a3);
}

- (_TtC10StickerKit23EmojiGenerationBlobView)initWithCoder:(id)a3
{
  return (_TtC10StickerKit23EmojiGenerationBlobView *)EmojiGenerationBlobView.init(coder:)(a3);
}

- (void)handleTap
{
  v2 = self;
  sub_245318B48();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_gpController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_imageView));
  swift_release();
  swift_release();
  sub_24531B248((uint64_t)self + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_generationResult);
  sub_24531B4C0((uint64_t)self + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_pageControlDot, type metadata accessor for EmojiPageControlDot);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_contextMenuInteraction));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_delegate;

  sub_245203A28((uint64_t)v3);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  id v10 = _s10StickerKit23EmojiGenerationBlobViewC22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0(v7);

  swift_unknownObjectRelease();

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit23EmojiGenerationBlobView_delegate, a2))
  {
    id v8 = a3;
    id v9 = a4;
    swift_unknownObjectRetain();
    id v10 = self;
    sub_2451FDE40(v10);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = _s10StickerKit23EmojiGenerationBlobViewC22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_24531AD08(a5);

  swift_unknownObjectRelease();
}

- (void)addCaption
{
  v2 = self;
  sub_2453190D8();
}

- (void)saveToStickers
{
  v2 = self;
  sub_2453191D4();
}

- (void)copyAction
{
  v2 = self;
  sub_245319418();
}

- (void)shareAction
{
  v2 = self;
  sub_24531965C();
}

- (void)reportConcern
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_2453FFE28();
  id v7 = self;
  uint64_t v8 = sub_2453FFE18();
  id v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_245262328((uint64_t)v5, (uint64_t)&unk_268ED3C78, (uint64_t)v9);

  swift_release();
}

@end