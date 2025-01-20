@interface NSXPCInterface(MapsPushDaemonFromGeod)
+ (id)geo_MapsNotificationDaemonFromGeodInterface;
@end

@implementation NSXPCInterface(MapsPushDaemonFromGeod)

+ (id)geo_MapsNotificationDaemonFromGeodInterface
{
  v1 = [a1 interfaceWithProtocol:&unk_1ED836170];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  [v1 setClasses:v4 forSelector:sel_expiredOfflineSubscriptions_withDisplayNames_forReason_ argumentIndex:0 ofReply:0];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v1 setClasses:v7 forSelector:sel_expiredOfflineSubscriptions_withDisplayNames_forReason_ argumentIndex:1 ofReply:0];

  return v1;
}

@end