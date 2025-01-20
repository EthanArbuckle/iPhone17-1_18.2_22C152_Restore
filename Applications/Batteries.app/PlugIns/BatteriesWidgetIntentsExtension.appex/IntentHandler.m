@interface IntentHandler
- (_TtC31BatteriesWidgetIntentsExtension13IntentHandler)init;
- (id)defaultDeviceForViewPossibleDevices:(id)a3;
- (void)provideDeviceOptionsCollectionForViewPossibleDevices:(id)a3 withCompletion:(id)a4;
@end

@implementation IntentHandler

- (_TtC31BatteriesWidgetIntentsExtension13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

- (void)provideDeviceOptionsCollectionForViewPossibleDevices:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100005998(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (id)defaultDeviceForViewPossibleDevices:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100006180(v4);

  return v6;
}

@end