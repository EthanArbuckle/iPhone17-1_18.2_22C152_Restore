@interface IMBTranscriptEmptyMessageViewController
- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithCoder:(id)a3;
- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation IMBTranscriptEmptyMessageViewController

- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithCoder:(id)a3
{
  *(void *)&self->conversation[OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_messagesAppProxy] = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_bubbleView);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC8Business39IMBTranscriptEmptyMessageViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100034498();
}

- (_TtC8Business39IMBTranscriptEmptyMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business39IMBTranscriptEmptyMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_conversation));
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_messagesAppProxy);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Business39IMBTranscriptEmptyMessageViewController_bubbleView);
}

@end