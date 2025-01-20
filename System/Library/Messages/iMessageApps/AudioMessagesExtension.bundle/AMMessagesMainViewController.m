@interface AMMessagesMainViewController
- (AMMessagesMainViewController)initWithCoder:(id)a3;
- (AMMessagesMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didReceiveMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidLoad;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation AMMessagesMainViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2D1B8();
}

- (void)dealloc
{
  v2 = self;
  sub_2D7B0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AMMessagesMainViewController_logger;
  uint64_t v4 = sub_46730();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMMessagesMainViewController_messagesViewController));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___AMMessagesMainViewController_unavailabelViewController);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2D9E4(v4);
}

- (void)didResignActiveWithConversation:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___AMMessagesMainViewController_messagesViewController);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = v3;
    [v7 didResignActiveWithConversation:v5];
    sub_2D6FC();
  }
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_2DEFC(a3);
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  v3 = _Block_copy(a3);
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___AMMessagesMainViewController_messagesViewController);
  if (v4)
  {
    _Block_copy(v3);
    id v5 = self;
    id v6 = v4;
    sub_3130C(v6, (void (**)(void, void))v3);
    _Block_release(v3);
  }
  else
  {
    id v7 = (void (*)(void *, void))v3[2];
    v8 = self;
    v7(v3, 0);
  }
  _Block_release(v3);
}

- (AMMessagesMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_467B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (AMMessagesMainViewController *)sub_2E2A0(v5, v7, a4);
}

- (AMMessagesMainViewController)initWithCoder:(id)a3
{
  return (AMMessagesMainViewController *)sub_2E3D0(a3);
}

@end