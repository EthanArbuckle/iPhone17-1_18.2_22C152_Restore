@interface HeadphonesMotionProvider
- (_TtC18AXMotionCuesServer24HeadphonesMotionProvider)init;
- (void)dealloc;
- (void)headphoneMotionManagerDidConnect:(id)a3;
- (void)headphoneMotionManagerDidDisconnect:(id)a3;
@end

@implementation HeadphonesMotionProvider

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1E520();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(HeadphonesMotionProvider *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

- (void)headphoneMotionManagerDidConnect:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1E8B0(1, "Headphones are connected");
}

- (void)headphoneMotionManagerDidDisconnect:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1E8B0(0, "Headphones are disconnected");
}

- (_TtC18AXMotionCuesServer24HeadphonesMotionProvider)init
{
  result = (_TtC18AXMotionCuesServer24HeadphonesMotionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end