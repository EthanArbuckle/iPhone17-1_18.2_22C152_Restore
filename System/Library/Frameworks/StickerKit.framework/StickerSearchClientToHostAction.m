@interface StickerSearchClientToHostAction
- (_TtC10StickerKit31StickerSearchClientToHostAction)init;
- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation StickerSearchClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_245280658(v4);
}

- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit31StickerSearchClientToHostAction *)sub_24528121C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for StickerSearchClientToHostAction);
}

- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit31StickerSearchClientToHostAction *)sub_245281298((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_33, (uint64_t (*)(uint64_t))type metadata accessor for StickerSearchClientToHostAction, a4);
}

- (_TtC10StickerKit31StickerSearchClientToHostAction)init
{
  return (_TtC10StickerKit31StickerSearchClientToHostAction *)sub_245281490(self, (uint64_t)a2, type metadata accessor for StickerSearchClientToHostAction);
}

- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit31StickerSearchClientToHostAction *)sub_245281514(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerSearchClientToHostAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit31StickerSearchClientToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit31StickerSearchClientToHostAction *)sub_245281514(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerSearchClientToHostAction, (SEL *)&selRef_initWithCoder_);
}

@end