@interface StickerEffectEditorViewControllerHostToClientAction
- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)init;
- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithCoder:(id)a3;
- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithXPCDictionary:(id)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation StickerEffectEditorViewControllerHostToClientAction

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2453453B0(v4);
}

- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction *)sub_245345670(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for StickerEffectEditorViewControllerHostToClientAction);
}

- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction *)sub_2453456EC((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_29, (uint64_t (*)(uint64_t))type metadata accessor for StickerEffectEditorViewControllerHostToClientAction, a4);
}

- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)init
{
  return (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction *)sub_2453458E4(self, (uint64_t)a2, type metadata accessor for StickerEffectEditorViewControllerHostToClientAction);
}

- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction *)sub_245345968(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerEffectEditorViewControllerHostToClientAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit51StickerEffectEditorViewControllerHostToClientAction *)sub_245345968(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerEffectEditorViewControllerHostToClientAction, (SEL *)&selRef_initWithCoder_);
}

@end