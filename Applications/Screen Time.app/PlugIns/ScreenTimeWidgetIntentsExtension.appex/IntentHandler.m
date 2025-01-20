@interface IntentHandler
- (_TtC32ScreenTimeWidgetIntentsExtension13IntentHandler)init;
- (id)defaultUserForSelectUser:(id)a3;
- (void)provideUserOptionsCollectionForSelectUser:(id)a3 withCompletion:(id)a4;
@end

@implementation IntentHandler

- (void)provideUserOptionsCollectionForSelectUser:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100003BC0(v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (id)defaultUserForSelectUser:(id)a3
{
  id v3 = sub_100003D90();

  return v3;
}

- (_TtC32ScreenTimeWidgetIntentsExtension13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return [(IntentHandler *)&v3 init];
}

@end