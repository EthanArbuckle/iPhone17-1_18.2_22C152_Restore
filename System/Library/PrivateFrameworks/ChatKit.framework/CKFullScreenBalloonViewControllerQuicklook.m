@interface CKFullScreenBalloonViewControllerQuicklook
- (BOOL)constrainToPresentingVCBounds;
- (BOOL)forceWindowedPresentation;
- (BOOL)hideBalloonView;
- (BOOL)preserveModalPresentationStyle;
- (BOOL)wantsWindowedPresentation;
- (CKFullScreenBalloonViewControllerQuicklook)initWithChatItem:(id)a3 delegate:(id)a4;
- (CKFullScreenBalloonViewControllerQuicklook)initWithCoder:(id)a3;
- (CKFullScreenBalloonViewControllerQuicklook)initWithNibName:(id)a3 bundle:(id)a4;
- (void)keyboardWillShow:(id)a3;
- (void)showTapbackPicker;
@end

@implementation CKFullScreenBalloonViewControllerQuicklook

- (void)showTapbackPicker
{
  v2 = self;
  sub_18F575EA4();
}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9240060);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_18F7B5CF0();
    uint64_t v8 = sub_18F7B5D30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_18F7B5D30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_18F576500((uint64_t)v7);

  sub_18EF27FE8((uint64_t)v7, &qword_1E9240060);
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithChatItem:(id)a3 delegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  return [(CKFullScreenBalloonViewController *)&v7 initWithChatItem:a3 delegate:a4];
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_18F7B97E0();
    id v6 = a4;
    objc_super v7 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    objc_super v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  uint64_t v9 = [(CKFullScreenBalloonViewControllerQuicklook *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  return [(CKFullScreenBalloonViewControllerQuicklook *)&v5 initWithCoder:a3];
}

- (BOOL)hideBalloonView
{
  return 1;
}

- (BOOL)wantsWindowedPresentation
{
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

@end