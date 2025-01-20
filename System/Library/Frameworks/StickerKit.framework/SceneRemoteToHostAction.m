@interface SceneRemoteToHostAction
- (_TtC10StickerKit23SceneRemoteToHostAction)init;
- (_TtC10StickerKit23SceneRemoteToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit23SceneRemoteToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit23SceneRemoteToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit23SceneRemoteToHostAction)initWithXPCDictionary:(id)a3;
@end

@implementation SceneRemoteToHostAction

- (_TtC10StickerKit23SceneRemoteToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit23SceneRemoteToHostAction *)sub_24531DBF4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for SceneRemoteToHostAction);
}

- (_TtC10StickerKit23SceneRemoteToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit23SceneRemoteToHostAction *)sub_24531DC70((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_24_0, (uint64_t (*)(uint64_t))type metadata accessor for SceneRemoteToHostAction, a4);
}

- (_TtC10StickerKit23SceneRemoteToHostAction)init
{
  return (_TtC10StickerKit23SceneRemoteToHostAction *)sub_24531DE68(self, (uint64_t)a2, type metadata accessor for SceneRemoteToHostAction);
}

- (_TtC10StickerKit23SceneRemoteToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit23SceneRemoteToHostAction *)sub_24531DEEC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SceneRemoteToHostAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit23SceneRemoteToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit23SceneRemoteToHostAction *)sub_24531DEEC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SceneRemoteToHostAction, (SEL *)&selRef_initWithCoder_);
}

@end