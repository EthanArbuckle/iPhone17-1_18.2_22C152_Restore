@interface AFUIAudioPlayer
+ (id)audioMessagePlayer;
+ (id)voicemailPlayer;
- (AFUIAudioPlayerDelegate)delegate;
- (AVAudioPlayer)_player;
- (AceObject)playbackCommand;
- (BOOL)deactivateAudioSessionOnPlaybackFinished;
- (NSUUID)conversationItemIdentifier;
- (id)_audioCategory;
- (id)_audioURL;
- (unint64_t)_audioOptions;
- (void)_setPlayer:(id)a3;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)setConversationItemIdentifier:(id)a3;
- (void)setDeactivateAudioSessionOnPlaybackFinished:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaybackCommand:(id)a3;
- (void)startPlaying;
- (void)stopPlaying;
@end

@implementation AFUIAudioPlayer

+ (id)voicemailPlayer
{
  v2 = objc_alloc_init(AFUIVoicemailPlayer);

  return v2;
}

+ (id)audioMessagePlayer
{
  v2 = objc_alloc_init(AFUIAudioMessagePlayer);

  return v2;
}

- (void)startPlaying
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Failed to set audio active: %@", v2, v3, v4, v5, 2u);
}

- (void)stopPlaying
{
  id v2 = [(AFUIAudioPlayer *)self _player];
  [v2 stop];
}

- (void)_setPlayer:(id)a3
{
  uint64_t v4 = (AVAudioPlayer *)a3;
  [(AVAudioPlayer *)self->_player setDelegate:0];
  player = self->_player;
  self->_player = v4;
  v6 = v4;

  [(AVAudioPlayer *)self->_player setDelegate:self];
}

- (id)_audioCategory
{
  return (id)*MEMORY[0x263EF9060];
}

- (unint64_t)_audioOptions
{
  return 0;
}

- (id)_audioURL
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"AFUIAudioPlayer.m" lineNumber:86 description:@"This method should be overwritten by child class!"];

  return 0;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (os_log_t *)MEMORY[0x263F28348];
  v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = [(AFUIAudioPlayer *)self description];
    v10 = [(AFUIAudioPlayer *)self _audioURL];
    *(_DWORD *)buf = 136315650;
    v17 = "-[AFUIAudioPlayer audioPlayerDidFinishPlaying:successfully:]";
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ did finish playing %@", buf, 0x20u);
  }
  if ([(AFUIAudioPlayer *)self deactivateAudioSessionOnPlaybackFinished])
  {
    v11 = [MEMORY[0x263EF93E0] sharedInstance];
    id v15 = 0;
    [v11 setActive:0 withOptions:1 error:&v15];
    id v12 = v15;

    if (v12 && os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      -[AFUIAudioPlayer audioPlayerDidFinishPlaying:successfully:]();
    }
  }
  v13 = [(AFUIAudioPlayer *)self delegate];
  v14 = [(AFUIAudioPlayer *)self playbackCommand];
  [v13 audioPlayer:self didFinishPlayback:v14];
}

- (AFUIAudioPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUIAudioPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AceObject)playbackCommand
{
  return self->_playbackCommand;
}

- (void)setPlaybackCommand:(id)a3
{
}

- (BOOL)deactivateAudioSessionOnPlaybackFinished
{
  return self->_deactivateAudioSessionOnPlaybackFinished;
}

- (void)setDeactivateAudioSessionOnPlaybackFinished:(BOOL)a3
{
  self->_deactivateAudioSessionOnPlaybackFinished = a3;
}

- (NSUUID)conversationItemIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversationItemIdentifier);

  return (NSUUID *)WeakRetained;
}

- (void)setConversationItemIdentifier:(id)a3
{
}

- (AVAudioPlayer)_player
{
  return self->_player;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_conversationItemIdentifier);
  objc_storeStrong((id *)&self->_playbackCommand, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Error setting the AVAudioSession to inactive: %@", v2, v3, v4, v5, 2u);
}

@end