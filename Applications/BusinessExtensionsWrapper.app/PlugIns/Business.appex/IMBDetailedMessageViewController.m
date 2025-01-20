@interface IMBDetailedMessageViewController
- (_TtC8Business32IMBDetailedMessageViewController)initWithCoder:(id)a3;
- (_TtC8Business32IMBDetailedMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation IMBDetailedMessageViewController

- (_TtC8Business32IMBDetailedMessageViewController)initWithCoder:(id)a3
{
  *(void *)&self->conversation[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC8Business32IMBDetailedMessageViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  id v2 = v6.receiver;
  [(IMBDetailedMessageViewController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self tertiarySystemBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC8Business32IMBDetailedMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Business32IMBDetailedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message));
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper);
  id v3 = (char *)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;

  sub_100010D28((uint64_t)v3);
}

@end