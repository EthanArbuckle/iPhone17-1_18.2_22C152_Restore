@interface AppDelegate
- (_TtC18ActivityProgressUI11AppDelegate)init;
@end

@implementation AppDelegate

- (_TtC18ActivityProgressUI11AppDelegate)init
{
  uint64_t v2 = OBJC_IVAR____TtC18ActivityProgressUI11AppDelegate_backgroundActivitySessionsController;
  uint64_t v3 = qword_100056D28;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_100058B58;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_100058B58;
  id v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v8 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI11AppDelegate_backgroundActivitySessionsController));
}

@end