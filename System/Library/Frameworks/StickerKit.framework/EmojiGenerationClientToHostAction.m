@interface EmojiGenerationClientToHostAction
- (_TtC10StickerKit33EmojiGenerationClientToHostAction)init;
- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation EmojiGenerationClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452C5ED0(v4);
}

- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit33EmojiGenerationClientToHostAction *)sub_2452C7914(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for EmojiGenerationClientToHostAction);
}

- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_245260384;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC10StickerKit33EmojiGenerationClientToHostAction *)sub_2452C7990((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_23, (uint64_t (*)(uint64_t))type metadata accessor for EmojiGenerationClientToHostAction, a4);
}

- (_TtC10StickerKit33EmojiGenerationClientToHostAction)init
{
  return (_TtC10StickerKit33EmojiGenerationClientToHostAction *)sub_2452C7B88(self, (uint64_t)a2, type metadata accessor for EmojiGenerationClientToHostAction);
}

- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationClientToHostAction *)sub_2452C7C0C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationClientToHostAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit33EmojiGenerationClientToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit33EmojiGenerationClientToHostAction *)sub_2452C7C0C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for EmojiGenerationClientToHostAction, (SEL *)&selRef_initWithCoder_);
}

@end