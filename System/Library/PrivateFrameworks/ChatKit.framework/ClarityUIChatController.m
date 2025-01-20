@interface ClarityUIChatController
+ (Class)transcriptControllerClass;
- (BOOL)_clickyOrbEnabled;
- (BOOL)shouldDisplayTextEntry;
- (BOOL)shouldShowDoneButton;
- (CKComposition)composition;
- (UIEdgeInsets)navigationBarInsetsWithoutPalette;
- (_TtC7ChatKit23ClarityUIChatController)initWithCoder:(id)a3;
- (_TtC7ChatKit23ClarityUIChatController)initWithConversation:(id)a3;
- (_TtC7ChatKit23ClarityUIChatController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (void)sendCompositionWithNotification:(id)a3;
- (void)setComposition:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5;
- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ClarityUIChatController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClarityUIChatController();
  v2 = (char *)v4.receiver;
  [(CKChatController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(self, sel_defaultCenter, v4.receiver, v4.super_class);
  if (qword_1E92379F0 != -1) {
    swift_once();
  }
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v2, sel_sendCompositionWithNotification_, qword_1E9264ED8, 0);

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_synthesizer], sel_setUsesApplicationAudioSession_, 0);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_18F547F84();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_18F5480B8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIChatController();
  id v4 = v7.receiver;
  [(CKChatController *)&v7 viewDidDisappear:v3];
  id v5 = objc_msgSend(self, sel_sharedInstance, v7.receiver, v7.super_class);
  id v6 = objc_msgSend(v4, sel_conversation);
  objc_msgSend(v5, sel_removeConversation_, v6);
}

- (void)sendCompositionWithNotification:(id)a3
{
  uint64_t v4 = sub_18F7B5D30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B5CF0();
  v8 = self;
  sub_18F5482CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)shouldDisplayTextEntry
{
  return 0;
}

- (BOOL)shouldShowDoneButton
{
  return 0;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_navigationBarTopInset);
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClarityUIChatController();
  id v6 = v9.receiver;
  [(CKChatController *)&v9 setEditing:v5 animated:v4];
  id v7 = objc_msgSend(v6, sel_navigationController, v9.receiver, v9.super_class);
  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v7, sel_setToolbarHidden_animated_, 1, 0);

    id v6 = v8;
  }
}

- (CKComposition)composition
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClarityUIChatController();
  double v2 = [(CKChatController *)&v4 composition];

  return v2;
}

- (void)setComposition:(id)a3
{
  BOOL v5 = (objc_class *)type metadata accessor for ClarityUIChatController();
  v10.receiver = self;
  v10.super_class = v5;
  id v6 = a3;
  id v7 = self;
  id v8 = [(CKChatController *)&v10 composition];
  v9.receiver = v7;
  v9.super_class = v5;
  [(CKChatController *)&v9 setComposition:v6];
  sub_18F5488C8(v8);
}

- (BOOL)_clickyOrbEnabled
{
  return 0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  sub_18EF3528C(0, &qword_1E923ADB8);
  objc_super v4 = (void *)sub_18F7B99A0();

  return v4;
}

+ (Class)transcriptControllerClass
{
  type metadata accessor for ClarityUIChatController.TranscriptController();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  sub_18F548E84((uint64_t)v7, x, y);
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_18F549BDC(v10);
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5
{
  uint64_t v5 = sub_18F7B6410();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC7ChatKit23ClarityUIChatController)initWithConversation:(id)a3
{
  id v3 = a3;
  objc_super v4 = (_TtC7ChatKit23ClarityUIChatController *)sub_18F549D30((uint64_t)v3);

  return v4;
}

- (_TtC7ChatKit23ClarityUIChatController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_18F7B97E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7ChatKit23ClarityUIChatController *)sub_18F54983C(v5, v7, a4);
}

- (_TtC7ChatKit23ClarityUIChatController)initWithCoder:(id)a3
{
  return (_TtC7ChatKit23ClarityUIChatController *)sub_18F5499C4(a3);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_clarityUIDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_synthesizer));
  swift_release();

  swift_release();
}

@end