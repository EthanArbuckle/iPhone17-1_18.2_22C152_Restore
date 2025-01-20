@interface VideoMessagingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate)init;
@end

@implementation VideoMessagingServiceDelegate

- (_TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate)init
{
  return (_TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate *)VideoMessagingServiceDelegate.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_24DEB0814((uint64_t)v8, v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore29VideoMessagingServiceDelegate_listener));
  swift_unknownObjectRelease();
}

@end