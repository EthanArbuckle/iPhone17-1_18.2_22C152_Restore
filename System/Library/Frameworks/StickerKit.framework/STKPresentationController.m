@interface STKPresentationController
- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController)init;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation STKPresentationController

- (void)presentationControllerDidDismiss:(id)a3
{
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_presentingWindow);
  if (v5)
  {
    id v6 = a3;
    self;
    if ((objc_msgSend(v5, sel_isHidden) & 1) == 0) {
      sub_245309BBC();
    }
  }
  else
  {
    id v7 = a3;
    v8 = self;
  }
  id v9 = objc_msgSend(a3, sel_presentedViewController);
  sub_245309CFC((unint64_t)v9);
}

- (_TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_presentingViewControllers;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_245261C88(MEMORY[0x263F8EE78]);
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_presentingWindow) = 0;
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_responderToRestore) = 0;

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(STKPresentationController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_presentingWindow));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10StickerKitP33_EA33ED8DB99C4DEC95D72ADC49E80F3125STKPresentationController_responderToRestore);
}

@end