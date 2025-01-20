@interface StickerPickerSceneViewControllerDelegateProxy
- (_TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy)init;
- (void)stickerPickerSceneDidRequestDismissal:(id)a3;
@end

@implementation StickerPickerSceneViewControllerDelegateProxy

- (void)stickerPickerSceneDidRequestDismissal:(id)a3
{
  uint64_t v5 = MEMORY[0x2456A0530]((char *)self+ OBJC_IVAR____TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy_stickerPickerViewController, a2);
  if (v5)
  {
    id v8 = (id)v5;
    id v6 = a3;
    v7 = self;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

- (_TtC10StickerKitP33_FA83C3E8A3D22FA88BB215AEFD764D8A45StickerPickerSceneViewControllerDelegateProxy)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StickerPickerSceneViewControllerDelegateProxy();
  return [(StickerPickerSceneViewControllerDelegateProxy *)&v4 init];
}

- (void).cxx_destruct
{
}

@end