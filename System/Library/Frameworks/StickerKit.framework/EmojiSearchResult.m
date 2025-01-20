@interface EmojiSearchResult
- (NSString)emoji;
- (_TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult)init;
- (int64_t)index;
- (void)setEmoji:(id)a3;
- (void)setIndex:(int64_t)a3;
@end

@implementation EmojiSearchResult

- (NSString)emoji
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setEmoji:(id)a3
{
  uint64_t v4 = sub_2453FFB38();
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult_emoji);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (int64_t)index
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult_index);
}

- (void)setIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult_index) = (Class)a3;
}

- (_TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult_emoji);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_0209F597C25C7378B6F590430344EB1F17EmojiSearchResult_index) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(EmojiSearchResult *)&v6 init];
}

- (void).cxx_destruct
{
}

@end