@interface TextUnderstandingDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC18textunderstandingd23TextUnderstandingDaemon)init;
@end

@implementation TextUnderstandingDaemon

- (_TtC18textunderstandingd23TextUnderstandingDaemon)init
{
  return (_TtC18textunderstandingd23TextUnderstandingDaemon *)sub_100002F68();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_100003190((uint64_t)v8, v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_interface);
}

@end