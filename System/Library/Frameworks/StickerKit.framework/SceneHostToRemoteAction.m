@interface SceneHostToRemoteAction
- (_TtC10StickerKit23SceneHostToRemoteAction)init;
- (_TtC10StickerKit23SceneHostToRemoteAction)initWithCoder:(id)a3;
- (_TtC10StickerKit23SceneHostToRemoteAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit23SceneHostToRemoteAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit23SceneHostToRemoteAction)initWithXPCDictionary:(id)a3;
@end

@implementation SceneHostToRemoteAction

- (_TtC10StickerKit23SceneHostToRemoteAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit23SceneHostToRemoteAction *)sub_24531DBF4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for SceneHostToRemoteAction);
}

- (_TtC10StickerKit23SceneHostToRemoteAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit23SceneHostToRemoteAction *)sub_24531DC70((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_24, (uint64_t (*)(uint64_t))type metadata accessor for SceneHostToRemoteAction, a4);
}

- (_TtC10StickerKit23SceneHostToRemoteAction)init
{
  return (_TtC10StickerKit23SceneHostToRemoteAction *)sub_24531DE68(self, (uint64_t)a2, type metadata accessor for SceneHostToRemoteAction);
}

- (_TtC10StickerKit23SceneHostToRemoteAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit23SceneHostToRemoteAction *)sub_24531DEEC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SceneHostToRemoteAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit23SceneHostToRemoteAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit23SceneHostToRemoteAction *)sub_24531DEEC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SceneHostToRemoteAction, (SEL *)&selRef_initWithCoder_);
}

@end