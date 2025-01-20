@interface MessagesViewController
- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (MessagesViewController)initWithCoder:(id)a3;
- (MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)viewDidLoad;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation MessagesViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MessagesViewController();
  id v2 = v3.receiver;
  [(MessagesViewController *)&v3 viewDidLoad];
  sub_6198();
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  sub_153F8();
  sub_15498();
  v5 = self;
  char v6 = sub_2E00();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  if (a5) {
    sub_15498();
  }
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_110C0(v11, v12, &v13->super.super.super.super, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_D964(v4);
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_DD14(v4);
}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_EE28(v4);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  objc_super v3 = self;
  sub_AE08();
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  objc_super v3 = self;
  sub_12CB8();
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_FA34(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_15498();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MessagesViewController *)sub_FE48(v5, v7, a4);
}

- (MessagesViewController)initWithCoder:(id)a3
{
  return (MessagesViewController *)sub_100C4(a3);
}

- (MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (MessagesViewController *)sub_102CC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  sub_13D54((uint64_t)self + OBJC_IVAR___MessagesViewController_transactionID, &qword_1C768);
  sub_13D54((uint64_t)self + OBJC_IVAR___MessagesViewController_messageURL, &qword_1C760);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MessagesViewController_safetyCacheViewModel));
  sub_13D54((uint64_t)self + OBJC_IVAR___MessagesViewController_userType, &qword_1C7A0);

  swift_bridgeObjectRelease();
}

@end