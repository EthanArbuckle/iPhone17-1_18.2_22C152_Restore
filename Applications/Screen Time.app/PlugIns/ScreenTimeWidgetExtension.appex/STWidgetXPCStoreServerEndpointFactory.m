@interface STWidgetXPCStoreServerEndpointFactory
- (_TtC25ScreenTimeWidgetExtension37STWidgetXPCStoreServerEndpointFactory)init;
- (id)newEndpoint;
@end

@implementation STWidgetXPCStoreServerEndpointFactory

- (_TtC25ScreenTimeWidgetExtension37STWidgetXPCStoreServerEndpointFactory)init
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
    uint64_t v3 = qword_100069910;
    id v4 = v17;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100054EA0();
    sub_1000096F4(v5, (uint64_t)qword_10006ABF0);
    v6 = sub_100054E80();
    os_log_type_t v7 = sub_100055CB0();
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
    sub_100054AA0();

    swift_willThrow();
    if (qword_100069910 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100054EA0();
    sub_1000096F4(v10, (uint64_t)qword_10006ABF0);
    swift_errorRetain();
    swift_errorRetain();
    v11 = sub_100054E80();
    os_log_type_t v12 = sub_100055C90();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = (void *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      swift_errorRetain();
      v15 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v17 = v15;
      sub_100055D70();
      void *v14 = v15;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to start coreDataServer and get XPC listener: %@", v13, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
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