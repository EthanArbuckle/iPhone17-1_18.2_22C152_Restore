@interface CNIDSDeviceListService
- (CNIDSDeviceListService)init;
- (id)fetch;
@end

@implementation CNIDSDeviceListService

- (id)fetch
{
  v2 = self;
  sub_18B64BE4C();

  type metadata accessor for DeviceListServiceDeviceInfo();
  v3 = (void *)sub_18B985F78();
  swift_bridgeObjectRelease();

  return v3;
}

- (CNIDSDeviceListService)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNIDSDeviceListService____lazy_storage___services) = 0;
  v2 = self;
  id v3 = CNUILogPosters();
  sub_18B9843A8();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for IDSDeviceListService();
  return [(CNIDSDeviceListService *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR___CNIDSDeviceListService_logger;
  uint64_t v4 = sub_18B984398();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end