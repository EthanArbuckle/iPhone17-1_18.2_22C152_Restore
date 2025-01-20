@interface StickerSearchHostToClientAction
- (_TtC10StickerKit31StickerSearchHostToClientAction)init;
- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithCoder:(id)a3;
- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithXPCDictionary:(id)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation StickerSearchHostToClientAction

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_245280CAC(v4);
}

- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit31StickerSearchHostToClientAction *)sub_24528121C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for StickerSearchHostToClientAction);
}

- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit31StickerSearchHostToClientAction *)sub_245281298((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_12, (uint64_t (*)(uint64_t))type metadata accessor for StickerSearchHostToClientAction, a4);
}

- (_TtC10StickerKit31StickerSearchHostToClientAction)init
{
  return (_TtC10StickerKit31StickerSearchHostToClientAction *)sub_245281490(self, (uint64_t)a2, type metadata accessor for StickerSearchHostToClientAction);
}

- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit31StickerSearchHostToClientAction *)sub_245281514(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerSearchHostToClientAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit31StickerSearchHostToClientAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit31StickerSearchHostToClientAction *)sub_245281514(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerSearchHostToClientAction, (SEL *)&selRef_initWithCoder_);
}

@end