@interface STWidgetXPCStoreServerEndpointFactory
- (_TtC32ScreenTimeWidgetIntentsExtension37STWidgetXPCStoreServerEndpointFactory)init;
- (id)newEndpoint;
@end

@implementation STWidgetXPCStoreServerEndpointFactory

- (_TtC32ScreenTimeWidgetIntentsExtension37STWidgetXPCStoreServerEndpointFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory();
  return [(STWidgetXPCStoreServerEndpointFactory *)&v3 init];
}

- (id)newEndpoint
{
  id v0 = [objc_allocWithZone((Class)STSettingsServiceClient) init];
  id v17 = 0;
  id v1 = [v0 startCoreDataServerWithError:&v17];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = qword_1000116F8;
    id v4 = v17;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100009050();
    sub_100003F6C(v5, (uint64_t)qword_100011750);
    v6 = sub_100009030();
    os_log_type_t v7 = sub_100009120();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Started coreDataServer and obtained XPC listener", v8, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    id v9 = v17;
    sub_100009000();

    swift_willThrow();
    if (qword_1000116F8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100009050();
    sub_100003F6C(v10, (uint64_t)qword_100011750);
    swift_errorRetain();
    swift_errorRetain();
    v11 = sub_100009030();
    os_log_type_t v12 = sub_100009110();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (void *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      swift_errorRetain();
      v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v17 = v15;
      sub_100009130();
      void *v14 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to start coreDataServer and get XPC listener: %@", v13, 0xCu);
      sub_100005024(&qword_1000118E8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return 0;
  }
  return v2;
}

@end