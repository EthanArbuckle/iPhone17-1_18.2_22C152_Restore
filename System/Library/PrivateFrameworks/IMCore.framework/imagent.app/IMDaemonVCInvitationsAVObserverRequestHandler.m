@interface IMDaemonVCInvitationsAVObserverRequestHandler
- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7;
@end

@implementation IMDaemonVCInvitationsAVObserverRequestHandler

- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = +[IMDBroadcastController sharedProvider];
  v15 = v14;
  if (v7) {
    [v14 broadcasterForAVConferenceListeners];
  }
  else {
  id v16 = [v14 broadcasterForACConferenceListeners];
  }

  [v16 account:v13 avAction:v9 withArguments:v12 toAVChat:v11 isVideo:v7];
}

@end