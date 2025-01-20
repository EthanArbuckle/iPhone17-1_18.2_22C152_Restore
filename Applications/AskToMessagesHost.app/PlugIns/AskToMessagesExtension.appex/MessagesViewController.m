@interface MessagesViewController
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (_TtC22AskToMessagesExtension22MessagesViewController)initWithCoder:(id)a3;
- (_TtC22AskToMessagesExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22AskToMessagesExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)_didUpdateMessage:(id)a3 conversation:(id)a4;
- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4;
- (void)requestResize;
- (void)willBecomeActiveWithConversation:(id)a3;
@end

@implementation MessagesViewController

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  double v6 = sub_10001138C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100012ECC(v4);
}

- (void)_didUpdateMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_100015D28(v7);
}

- (void)generateSnapshotWithContentSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = (void (**)(void *, void *))_Block_copy(a4);
  double v9 = self;
  double v8 = (void *)sub_1000131F8(width, height);
  v7[2](v7, v8);

  _Block_release(v7);
}

- (void)requestResize
{
  v2 = (char *)self + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MessagesViewController();
  [(MessagesViewController *)&v3 requestResize];
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100021638();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_100014188(v5, v7, a4);
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_1000143B0(a3);
}

- (_TtC22AskToMessagesExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC22AskToMessagesExtension22MessagesViewController *)sub_100014564(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_selectedPayload);
}

@end