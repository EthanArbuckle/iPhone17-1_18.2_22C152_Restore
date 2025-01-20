@interface EmojiGenerationController
- (_TtC10StickerKit25EmojiGenerationController)initWithCoder:(id)a3;
- (_TtC10StickerKit25EmojiGenerationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addCaptionFromCarousel;
- (void)appearanceDidChange;
- (void)closeButtonPressed:(id)a3;
- (void)dealloc;
- (void)didTapCancelButton:(id)a3;
- (void)didTapInsertButton:(id)a3;
- (void)imageDescriptionViewControllerDidCancel:(id)a3;
- (void)imageDescriptionViewControllerDidSave:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)textInputResponderDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginRotation:(id)a3;
@end

@implementation EmojiGenerationController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for EmojiGenerationController();
  [(EmojiGenerationBaseController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageLayoutGuideDebugView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_promptEntryViewTopLockingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageDescriptionVC));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_ttrButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_onboardingViewController));

  swift_bridgeObjectRelease();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_2452DA7B8((uint64_t)a3, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2452DA930(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2452DAC24(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiGenerationController();
  v4 = (char *)v5.receiver;
  [(EmojiGenerationBaseController *)&v5 viewDidDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_promptEntryView], sel_resignFirstResponder, v5.receiver, v5.super_class);
}

- (void)textInputResponderDidChange:(id)a3
{
}

- (void)didTapCancelButton:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_2452E6FC8();
}

- (void)didTapInsertButton:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_2452DD2E8();
}

- (void)closeButtonPressed:(id)a3
{
  uint64_t v4 = qword_268ECF2A0;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2453FDBB8();
  __swift_project_value_buffer(v6, (uint64_t)qword_268ED3020);
  id v7 = sub_2453FDB98();
  os_log_type_t v8 = sub_2454000F8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2451E4000, v7, v8, "Emoji Gen: Close button pressed", v9, 2u);
    MEMORY[0x2456A0410](v9, -1, -1);
  }

  [(EmojiGenerationController *)v10 dismissViewControllerAnimated:1 completion:0];
}

- (void)appearanceDidChange
{
  v2 = self;
  sub_2452DD668();
}

- (void)willBeginRotation:(id)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  os_log_type_t v8 = self;
  sub_2452DDEA8(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC10StickerKit25EmojiGenerationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10StickerKit25EmojiGenerationController *)EmojiGenerationController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit25EmojiGenerationController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit25EmojiGenerationController *)EmojiGenerationController.init(coder:)(a3);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_2452E7DA0(&qword_268ECFBE8, type metadata accessor for InfoKey);
  uint64_t v6 = sub_2453FFA68();
  uint64_t v7 = (UIImagePickerController *)a3;
  id v8 = self;
  EmojiGenerationController.imagePickerController(_:didFinishPickingMediaWithInfo:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageDescriptionVC);
  if (v3) {
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  EmojiGenerationController.imageDescriptionViewControllerDidSave(_:)(v4);
}

- (void)addCaptionFromCarousel
{
  v2 = self;
  sub_2452E567C();
}

@end