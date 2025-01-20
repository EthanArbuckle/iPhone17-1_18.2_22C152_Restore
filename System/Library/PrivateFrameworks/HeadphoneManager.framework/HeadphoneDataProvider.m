@interface HeadphoneDataProvider
- (_TtC16HeadphoneManager21HeadphoneDataProvider)init;
@end

@implementation HeadphoneDataProvider

- (_TtC16HeadphoneManager21HeadphoneDataProvider)init
{
  return (_TtC16HeadphoneManager21HeadphoneDataProvider *)HeadphoneDataProvider.init()();
}

- (void).cxx_destruct
{
  outlined destroy of DefaultsObserver??((id *)((char *)&self->super.isa
                                              + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider____lazy_storage___defaultsObserver));
  outlined destroy of Set<AnyCancellable>();
  outlined destroy of String();
  outlined destroy of (@escaping @callee_guaranteed (@guaranteed AudioAccessoryDevice) -> ())?((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_deviceFoundHandler));
  outlined destroy of (@escaping @callee_guaranteed (@guaranteed AudioAccessoryDevice) -> ())?((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_deviceLostHandler));
  outlined destroy of [String : Data]();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_hexForReplayDeviceMap));
}

@end