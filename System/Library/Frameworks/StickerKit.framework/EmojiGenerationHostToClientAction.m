@interface EmojiGenerationHostToClientAction
- (_TtC10StickerKit33EmojiGenerationHostToClientAction)init;
- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithCoder:(id)a3;
- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithXPCDictionary:(id)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation EmojiGenerationHostToClientAction

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452C6DD8(v4);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2452C7914(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for EmojiGenerationHostToClientAction);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_245260060;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2452C7990((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_17, (uint64_t (*)(uint64_t))type metadata accessor for EmojiGenerationHostToClientAction, a4);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)init
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2452C7B88(self, (uint64_t)a2, type metadata accessor for EmojiGenerationHostToClientAction);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2452C7C0C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationHostToClientAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit33EmojiGenerationHostToClientAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationHostToClientAction *)sub_2452C7C0C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationHostToClientAction, (SEL *)&selRef_initWithCoder_);
}

@end