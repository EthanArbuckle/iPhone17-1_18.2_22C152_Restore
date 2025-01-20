@interface MFDResetListUnsubscribe
+ (id)exportedInterface;
- (void)resetListUnsubscribeSuggestionsWithCompletion:(id)a3;
@end

@implementation MFDResetListUnsubscribe

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDResetListUnsubscribeProtocol];
}

- (void)resetListUnsubscribeSuggestionsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v3 = objc_alloc_init((Class)EMListUnsubscribeDetector);
  [v3 removeAllPersistedCommands];
  v4[2](v4, 0);
}

@end