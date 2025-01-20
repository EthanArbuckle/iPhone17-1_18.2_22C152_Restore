@interface IMBTranscriptMessageViewController
- (_TtC8Business34IMBTranscriptMessageViewController)initWithCoder:(id)a3;
- (_TtC8Business34IMBTranscriptMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)paymentRequestDidUpdate:(id)a3;
- (void)viewDidLoad;
@end

@implementation IMBTranscriptMessageViewController

- (_TtC8Business34IMBTranscriptMessageViewController)initWithCoder:(id)a3
{
  *(void *)&self->pluginBubbleContext[OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_messagesAppProxy] = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_bubbleView);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_authvc) = 0;
  id v6 = a3;

  result = (_TtC8Business34IMBTranscriptMessageViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100041450();
}

- (_TtC8Business34IMBTranscriptMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business34IMBTranscriptMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_pluginBubbleContext));
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_messagesAppProxy);
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_featureFlagArbiter);
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_urlHelper);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_bubbleView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Business34IMBTranscriptMessageViewController_authvc);
}

- (void)paymentRequestDidUpdate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_100041CA4();
  swift_unknownObjectRelease();
}

@end