@interface AvatarEditorClientToHostAction
- (_TtC10StickerKit30AvatarEditorClientToHostAction)init;
- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation AvatarEditorClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24534087C(v4);
}

- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AvatarEditorClientToHostAction();
  return [(AvatarEditorClientToHostAction *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit30AvatarEditorClientToHostAction *)sub_245340AD8(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC10StickerKit30AvatarEditorClientToHostAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AvatarEditorClientToHostAction();
  return [(AvatarEditorClientToHostAction *)&v3 init];
}

- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit30AvatarEditorClientToHostAction *)sub_245340CF4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit30AvatarEditorClientToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit30AvatarEditorClientToHostAction *)sub_245340CF4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end