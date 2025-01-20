@interface GKViceroyVoiceChat
- (BOOL)isActive;
- (GKConnection)connection;
- (GKViceroyVoiceChat)initWithName:(id)a3 connection:(id)a4 gkSession:(id)a5;
- (GKViceroyVoiceChatStateUpdateDelegate)stateUpdateDelegate;
- (GKVoiceChatSession)voiceChatSession;
- (NSString)name;
- (float)volume;
- (void)dealloc;
- (void)gkVoiceChatSession:(id)a3 stateUpdate:(unint64_t)a4 forPeer:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setMuted:(BOOL)a3 forPlayerID:(id)a4;
- (void)setStateUpdateDelegate:(id)a3;
- (void)setVoiceChatSession:(id)a3;
- (void)setVolume:(float)a3;
- (void)start;
- (void)stop;
@end

@implementation GKViceroyVoiceChat

- (GKViceroyVoiceChat)initWithName:(id)a3 connection:(id)a4 gkSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GKViceroyVoiceChat;
  v11 = [(GKViceroyVoiceChat *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F63B60]) initWithGKSession:v10 sessionName:v8];
    voiceChatSession = v12->_voiceChatSession;
    v12->_voiceChatSession = (GKVoiceChatSession *)v13;

    [(GKVoiceChatSession *)v12->_voiceChatSession setDelegate:v12];
  }

  return v12;
}

- (void)dealloc
{
  v3 = [(GKViceroyVoiceChat *)self voiceChatSession];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)GKViceroyVoiceChat;
  [(GKViceroyVoiceChat *)&v4 dealloc];
}

- (NSString)name
{
  v2 = [(GKViceroyVoiceChat *)self voiceChatSession];
  v3 = [v2 sessionName];

  return (NSString *)v3;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKViceroyVoiceChat *)self voiceChatSession];
  [v4 setActiveSession:v3];
}

- (BOOL)isActive
{
  v2 = [(GKViceroyVoiceChat *)self voiceChatSession];
  char v3 = [v2 isActiveSession];

  return v3;
}

- (void)setVolume:(float)a3
{
  id v5 = [(GKViceroyVoiceChat *)self voiceChatSession];
  *(float *)&double v4 = a3;
  [v5 setSessionVolume:v4];
}

- (float)volume
{
  v2 = [(GKViceroyVoiceChat *)self voiceChatSession];
  [v2 sessionVolume];
  float v4 = v3;

  return v4;
}

- (void)setMuted:(BOOL)a3 forPlayerID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(GKViceroyVoiceChat *)self connection];
  id v11 = 0;
  int v8 = [v7 convertParticipantID:v6 toPeerID:&v11];

  id v9 = v11;
  if (v8)
  {
    id v10 = [(GKViceroyVoiceChat *)self voiceChatSession];
    [v10 setMute:v4 forPeer:v9];
  }
}

- (void)setStateUpdateDelegate:(id)a3
{
}

- (void)start
{
  id v2 = [(GKViceroyVoiceChat *)self voiceChatSession];
  [v2 startSession];
}

- (void)stop
{
  id v2 = [(GKViceroyVoiceChat *)self voiceChatSession];
  [v2 stopSession];
}

- (void)gkVoiceChatSession:(id)a3 stateUpdate:(unint64_t)a4 forPeer:(id)a5
{
  id v7 = a5;
  int v8 = [(GKViceroyVoiceChat *)self stateUpdateDelegate];

  if (v8)
  {
    id v9 = [(GKViceroyVoiceChat *)self connection];
    id v13 = 0;
    int v10 = [v9 convertPeerID:v7 toParticipantID:&v13];
    id v11 = v13;

    if (v10)
    {
      v12 = [(GKViceroyVoiceChat *)self stateUpdateDelegate];
      [v12 stateUpdate:a4 forPlayerID:v11];
    }
  }
}

- (GKConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (GKVoiceChatSession)voiceChatSession
{
  return self->_voiceChatSession;
}

- (void)setVoiceChatSession:(id)a3
{
}

- (GKViceroyVoiceChatStateUpdateDelegate)stateUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakStateUpdateDelegate);

  return (GKViceroyVoiceChatStateUpdateDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakStateUpdateDelegate);
  objc_storeStrong((id *)&self->_voiceChatSession, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end