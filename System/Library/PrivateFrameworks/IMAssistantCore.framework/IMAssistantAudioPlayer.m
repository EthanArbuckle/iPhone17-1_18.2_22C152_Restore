@interface IMAssistantAudioPlayer
- (BOOL)setupAudioSession;
- (BOOL)startPlayingAudioURL:(id)a3;
- (IMAssistantAudioPlayer)initWithDelegate:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (int64_t)playerState;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)cleanupAudioSession;
- (void)stopPlaying;
@end

@implementation IMAssistantAudioPlayer

- (IMAssistantAudioPlayer)initWithDelegate:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantAudioPlayer;
  v8 = [(IMAssistantAudioPlayer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;
  }
  return v9;
}

- (BOOL)startPlayingAudioURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  player = self->_player;
  if (player)
  {
    [(AVAudioPlayer *)player setDelegate:0];
    id v6 = self->_player;
    self->_player = 0;
  }
  if (![(IMAssistantAudioPlayer *)self setupAudioSession]) {
    goto LABEL_13;
  }
  id v15 = 0;
  id v7 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v4 error:&v15];
  id v8 = v15;
  v9 = self->_player;
  self->_player = v7;

  uint64_t v10 = self->_player;
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Failed to initialize AVAudioPlayer: %@", buf, 0xCu);
      }
    }
    goto LABEL_12;
  }
  [(AVAudioPlayer *)v10 setDelegate:self];
  if (![(AVAudioPlayer *)self->_player prepareToPlay])
  {
LABEL_12:

    goto LABEL_13;
  }
  BOOL v11 = [(AVAudioPlayer *)self->_player play];

  if (!v11)
  {
LABEL_13:
    [(IMAssistantAudioPlayer *)self cleanupAudioSession];
    BOOL v12 = 0;
    goto LABEL_14;
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (void)stopPlaying
{
}

- (int64_t)playerState
{
  if ([(AVAudioPlayer *)self->_player isPlaying]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)setupAudioSession
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v3 = *MEMORY[0x263EF9060];
  id v13 = 0;
  char v4 = [v2 setCategory:v3 withOptions:19 error:&v13];
  id v5 = v13;

  if (v4)
  {
    id v6 = [MEMORY[0x263EF93E0] sharedInstance];
    id v12 = 0;
    char v7 = [v6 setActive:1 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0 && IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Failed to setup AVAudioSession: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Failed to set category and options on AVAudioSession: %@", buf, 0xCu);
      }
    }
    char v7 = 0;
  }

  return v7;
}

- (void)cleanupAudioSession
{
  id v2 = [MEMORY[0x263EF93E0] sharedInstance];
  [v2 setActive:0 error:0];
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  [(IMAssistantAudioPlayer *)self cleanupAudioSession];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 imAssistantAudioPlayer:self didUpdateState:1];
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end