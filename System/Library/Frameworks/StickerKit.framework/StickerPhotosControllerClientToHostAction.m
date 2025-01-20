@interface StickerPhotosControllerClientToHostAction
- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)init;
- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithCoder:(id)a3;
- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation StickerPhotosControllerClientToHostAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24525F180(v4);
}

- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithInfo:(id)a3 responder:(id)a4
{
  return (_TtC10StickerKit41StickerPhotosControllerClientToHostAction *)sub_24525F784(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, type metadata accessor for StickerPhotosControllerClientToHostAction);
}

- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
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
  return (_TtC10StickerKit41StickerPhotosControllerClientToHostAction *)sub_24525F800((uint64_t)a3, a5, (uint64_t)v9, v10, (uint64_t)&block_descriptor_24, (uint64_t (*)(uint64_t))type metadata accessor for StickerPhotosControllerClientToHostAction, a4);
}

- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)init
{
  return (_TtC10StickerKit41StickerPhotosControllerClientToHostAction *)sub_24525F9F8(self, (uint64_t)a2, type metadata accessor for StickerPhotosControllerClientToHostAction);
}

- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithXPCDictionary:(id)a3
{
  return (_TtC10StickerKit41StickerPhotosControllerClientToHostAction *)sub_24525FA7C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerPhotosControllerClientToHostAction, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC10StickerKit41StickerPhotosControllerClientToHostAction)initWithCoder:(id)a3
{
  return (_TtC10StickerKit41StickerPhotosControllerClientToHostAction *)sub_24525FA7C(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StickerPhotosControllerClientToHostAction, (SEL *)&selRef_initWithCoder_);
}

@end