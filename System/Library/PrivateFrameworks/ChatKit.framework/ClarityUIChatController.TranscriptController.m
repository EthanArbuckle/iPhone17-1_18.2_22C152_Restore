@interface ClarityUIChatController.TranscriptController
- (BOOL)wantsDrawerLayout;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithCoder:(id)a3;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6 collectionViewSize:(CGSize)a7;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8;
- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation ClarityUIChatController.TranscriptController

- (BOOL)wantsDrawerLayout
{
  return 0;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  id v2 = v4.receiver;
  [(CKTranscriptCollectionViewController *)&v4 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_collectionView, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setShowsVerticalScrollIndicator_, 0);
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:](&v14, sel_initWithConversation_delegate_balloonMaxWidth_marginInsets_, a3, a4, a5, top, left, bottom, right);
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6 collectionViewSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:collectionViewSize:](&v17, sel_initWithConversation_delegate_balloonMaxWidth_marginInsets_collectionViewSize_, a3, a4, a5, top, left, bottom, right, width, height);
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7
{
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  sub_18EF3528C(0, &qword_1E923ADA0);
  sub_18F7B99C0();
  id v15 = a3;
  swift_unknownObjectRetain();
  v16 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  objc_super v17 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:](&v19, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_, v15, a4, v16, a6, top, left, bottom, right);

  swift_unknownObjectRelease();
  return v17;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  sub_18EF3528C(0, &qword_1E923ADA0);
  sub_18F7B99C0();
  id v18 = a3;
  swift_unknownObjectRetain();
  objc_super v19 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v20 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](&v22, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_collectionViewSize_, v18, a4, v19, a6, top, left, bottom, right, width, height);

  swift_unknownObjectRelease();
  return v20;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_18F7B97E0();
    id v6 = a4;
    v7 = (void *)sub_18F7B97A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v9 = [(ClarityUIChatController.TranscriptController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return [(ClarityUIChatController.TranscriptController *)&v5 initWithCoder:a3];
}

@end