@interface GKMultiplayerDaemonProxyHelper
- (id)multiplayerService;
- (id)utilityService;
- (void)completeGameRecording;
- (void)completeMatchRecording:(id)a3 matchType:(id)a4;
- (void)emitMultiplayerMessage:(id)a3;
- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5;
- (void)getMultiPlayerGroups:(id)a3;
- (void)initiateRelayRequest:(id)a3 completionHandler:(id)a4;
- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8;
- (void)removeInviteSession;
- (void)revokePseudonym:(id)a3 completionHandler:(id)a4;
- (void)sendInvitationUpdate:(id)a3 handler:(id)a4;
- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8;
- (void)updateRelayRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation GKMultiplayerDaemonProxyHelper

- (id)multiplayerService
{
  v2 = +[GKDaemonProxy proxyForLocalPlayer];
  v3 = [v2 multiplayerService];

  return v3;
}

- (id)utilityService
{
  v2 = +[GKDaemonProxy proxyForLocalPlayer];
  v3 = [v2 utilityService];

  return v3;
}

- (void)fileMultiplayerTTRWithCallBackIdentifier:(id)a3 descriptionAddition:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v11 fileMultiplayerTTRWithCallBackIdentifier:v10 descriptionAddition:v9 handler:v8];
}

- (void)getMultiPlayerGroups:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v5 getMultiPlayerGroups:v4];
}

- (void)initiateRelayRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v8 initiateRelayRequest:v7 handler:v6];
}

- (void)putMultiPlayerGroup:(id)a3 participants:(id)a4 playedAt:(int64_t)a5 bundleID:(id)a6 numberOfAutomatched:(int64_t)a7 handler:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v18 putMultiPlayerGroup:v17 participants:v16 playedAt:a5 bundleID:v15 numberOfAutomatched:a7 handler:v14];
}

- (void)removeInviteSession
{
  id v2 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v2 removeInviteSession];
}

- (void)revokePseudonym:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v8 revokePseudonym:v7 withCompletionHandler:v6];
}

- (void)sendInvitationUpdate:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v8 sendInvitationUpdate:v7 handler:v6];
}

- (void)sendReconnectInvitation:(id)a3 toPlayer:(id)a4 connectionData:(id)a5 sessionToken:(id)a6 pushToken:(id)a7 handler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v20 sendReconnectInvitation:v19 toPlayer:v18 connectionData:v17 sessionToken:v16 pushToken:v15 handler:v14];
}

- (void)updateRelayRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerDaemonProxyHelper *)self multiplayerService];
  [v8 updateRelayRequest:v7 handler:v6];
}

- (void)completeGameRecording
{
  id v2 = [(GKMultiplayerDaemonProxyHelper *)self utilityService];
  [v2 completeGameRecording];
}

- (void)completeMatchRecording:(id)a3 matchType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMultiplayerDaemonProxyHelper *)self utilityService];
  [v8 completeMatchRecording:v7 matchType:v6];
}

- (void)emitMultiplayerMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(GKMultiplayerDaemonProxyHelper *)self utilityService];
  [v5 emitMultiplayerMessage:v4];
}

@end