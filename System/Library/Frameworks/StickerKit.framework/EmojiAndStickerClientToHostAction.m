@interface EmojiAndStickerClientToHostAction
- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)init;
- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation EmojiAndStickerClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2453F45EC(v4);
}

- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmojiAndStickerClientToHostAction();
  return [(EmojiAndStickerClientToHostAction *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_245277EFC;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC10StickerKit33EmojiAndStickerClientToHostAction *)sub_2453F4DA0(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiAndStickerClientToHostAction();
  return [(EmojiAndStickerClientToHostAction *)&v3 init];
}

- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit33EmojiAndStickerClientToHostAction *)sub_2453F4FBC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit33EmojiAndStickerClientToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit33EmojiAndStickerClientToHostAction *)sub_2453F4FBC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end