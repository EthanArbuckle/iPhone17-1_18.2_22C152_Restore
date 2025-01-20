@interface _MPCPlaybackEnginePlayerIDInitializationParameters
- (AVAudioSession)audioSession;
- (MPNowPlayingInfoCenter)nowPlayingInfoCenter;
- (MPRemoteCommandCenter)remoteCommandCenter;
- (NSString)playerID;
- (_MPCPlaybackEnginePlayerIDInitializationParameters)initWithPlayerID:(id)a3;
@end

@implementation _MPCPlaybackEnginePlayerIDInitializationParameters

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (MPRemoteCommandCenter)remoteCommandCenter
{
  return self->_remoteCommandCenter;
}

- (MPNowPlayingInfoCenter)nowPlayingInfoCenter
{
  return self->_nowPlayingInfoCenter;
}

- (_MPCPlaybackEnginePlayerIDInitializationParameters)initWithPlayerID:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCPlaybackEnginePlayerIDInitializationParameters;
  v5 = [(_MPCPlaybackEnginePlayerIDInitializationParameters *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F121B0]) initWithPlayerID:v4];
    remoteCommandCenter = v5->_remoteCommandCenter;
    v5->_remoteCommandCenter = (MPRemoteCommandCenter *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F12118]) initWithPlayerID:v4];
    nowPlayingInfoCenter = v5->_nowPlayingInfoCenter;
    v5->_nowPlayingInfoCenter = (MPNowPlayingInfoCenter *)v10;

    audioSession = v5->_audioSession;
    v5->_audioSession = 0;
  }
  return v5;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_remoteCommandCenter, 0);

  objc_storeStrong((id *)&self->_nowPlayingInfoCenter, 0);
}

@end