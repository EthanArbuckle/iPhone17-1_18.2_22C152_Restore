@interface CKDebugTicker
+ (_TtC7ChatKit13CKDebugTicker)sharedTicker;
- (_TtC7ChatKit13CKDebugTicker)init;
- (unint64_t)tickCounter;
- (void)installUIWithWindowScene:(id)a3 parentWindow:(id)a4;
- (void)tick;
@end

@implementation CKDebugTicker

- (_TtC7ChatKit13CKDebugTicker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_window) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_parentWindow) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKDebugTicker();
  return [(CKDebugTicker *)&v3 init];
}

+ (_TtC7ChatKit13CKDebugTicker)sharedTicker
{
  if (qword_1E922C1D0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E922C1C8;

  return (_TtC7ChatKit13CKDebugTicker *)v2;
}

- (unint64_t)tickCounter
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker__tickCounter) >> 1;
}

- (void)tick
{
  v2 = self;
  sub_18F7A14EC();
}

- (void)installUIWithWindowScene:(id)a3 parentWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_18F7A16F8((uint64_t)v6, v7);
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit13CKDebugTicker_displayLink);
}

@end