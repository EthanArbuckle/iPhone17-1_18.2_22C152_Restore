@interface QLHostPlaceholderUIView
- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithCoder:(id)a3;
- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithFrame:(CGRect)a3;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation QLHostPlaceholderUIView

- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithFrame:(CGRect)a3
{
  return (_TtC9QuickLook23QLHostPlaceholderUIView *)sub_217FF7FA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9QuickLook23QLHostPlaceholderUIView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9QuickLook23QLHostPlaceholderUIView_hostingState;
  type metadata accessor for HostingState();
  v6 = (objc_class *)swift_allocObject();
  *((unsigned char *)v6 + 16) = 0;
  id v7 = a3;
  sub_218037E54();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;

  result = (_TtC9QuickLook23QLHostPlaceholderUIView *)sub_218038B14();
  __break(1u);
  return result;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  swift_getKeyPath();
  sub_217FF88F4();
  id v5 = a3;
  v6 = self;
  swift_retain();
  sub_218037E14();

  swift_release();
  swift_release();
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_217FF87D4();
}

- (void).cxx_destruct
{
}

@end