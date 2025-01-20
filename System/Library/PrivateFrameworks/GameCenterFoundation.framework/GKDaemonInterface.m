@interface GKDaemonInterface
+ (id)interface;
@end

@implementation GKDaemonInterface

+ (id)interface
{
  v2 = [a1 interfaceWithProtocol:&unk_1F1EB3520];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAuthenticatedLocalPlayersWithStatus_handler_ argumentIndex:0 ofReply:1];

  v6 = +[GKServiceInterface interface];
  [v2 setInterface:v6 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:0 ofReply:1];

  v7 = +[GKServiceInterface interface];
  [v2 setInterface:v7 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:1 ofReply:1];

  v8 = +[GKServiceInterface interface];
  [v2 setInterface:v8 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:2 ofReply:1];

  v9 = +[GKServiceInterface interface];
  [v2 setInterface:v9 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:3 ofReply:1];

  v10 = +[GKServiceInterface interface];
  [v2 setInterface:v10 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:4 ofReply:1];

  v11 = +[GKServiceInterface interface];
  [v2 setInterface:v11 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:5 ofReply:1];

  v12 = +[GKServiceInterface interface];
  [v2 setInterface:v12 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:6 ofReply:1];

  v13 = +[GKServiceInterface interface];
  [v2 setInterface:v13 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:7 ofReply:1];

  v14 = +[GKServiceInterface interface];
  [v2 setInterface:v14 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:8 ofReply:1];

  v15 = +[GKServiceInterface interface];
  [v2 setInterface:v15 forSelector:sel_getServicesForPID_localPlayer_reply_ argumentIndex:9 ofReply:1];

  v16 = +[GKServiceInterface interface];
  [v2 setInterface:v16 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:1 ofReply:1];

  v17 = +[GKServiceInterface interface];
  [v2 setInterface:v17 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:2 ofReply:1];

  v18 = +[GKServiceInterface interface];
  [v2 setInterface:v18 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:3 ofReply:1];

  v19 = +[GKServiceInterface interface];
  [v2 setInterface:v19 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:4 ofReply:1];

  v20 = +[GKServiceInterface interface];
  [v2 setInterface:v20 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:5 ofReply:1];

  v21 = +[GKServiceInterface interface];
  [v2 setInterface:v21 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:6 ofReply:1];

  v22 = +[GKServiceInterface interface];
  [v2 setInterface:v22 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:7 ofReply:1];

  v23 = +[GKServiceInterface interface];
  [v2 setInterface:v23 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:8 ofReply:1];

  v24 = +[GKServiceInterface interface];
  [v2 setInterface:v24 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:9 ofReply:1];

  v25 = +[GKServiceInterface interface];
  [v2 setInterface:v25 forSelector:sel_getPrivateServicesForPID_localPlayer_reply_ argumentIndex:10 ofReply:1];

  [v2 setClass:objc_opt_class() forSelector:sel_loadRemoteImageDataForURL_reply_ argumentIndex:0 ofReply:0];

  return v2;
}

@end