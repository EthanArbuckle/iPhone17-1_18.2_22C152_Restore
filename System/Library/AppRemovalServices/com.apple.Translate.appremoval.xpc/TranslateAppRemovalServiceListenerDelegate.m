@interface TranslateAppRemovalServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC30com_apple_Translate_appremoval42TranslateAppRemovalServiceListenerDelegate)init;
@end

@implementation TranslateAppRemovalServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (id)_LSAppRemovalServiceXPCInterface();
  [v7 setExportedInterface:v9];

  id v10 = [objc_allocWithZone((Class)type metadata accessor for TranslateAppDeletionService()) init];
  [v7 setExportedObject:v10];

  [v7 resume];
  return 1;
}

- (_TtC30com_apple_Translate_appremoval42TranslateAppRemovalServiceListenerDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslateAppRemovalServiceListenerDelegate();
  return [(TranslateAppRemovalServiceListenerDelegate *)&v3 init];
}

@end